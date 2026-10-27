///|
priv struct Parser {
  chars : Array[Char]
  mut pos : Int32
  mut remaining : Int32
}

///|
priv suberror Parse {
  Parse(String)
}

///|
fn Parser::space(self : Parser) -> Unit {
  while self.pos < self.chars.length() &&
        [' ', '\r', '\n', '\t'].contains(self.chars[self.pos]) {
    self.pos += 1
  }
}

///|
fn Parser::expect(self : Parser, c : Char) -> Unit raise Parse {
  self.space()
  if self.pos >= self.chars.length() || self.chars[self.pos] != c {
    raise Parse("expected delimiter at " + self.pos.to_string())
  }
  self.pos += 1
}

///|
fn Parser::quoted(self : Parser) -> String raise Parse {
  self.space()
  let out = StringBuilder()
  self.expect('"')
  out.write_char('"')
  let mut escaped = false
  while self.pos < self.chars.length() {
    let c = self.chars[self.pos]
    self.pos += 1
    out.write_char(c)
    if c == '"' && !escaped {
      let j = @json.parse(out.to_string()) catch {
        _ => raise Parse("invalid string")
      }
      match j {
        String(s) => return s
        _ => raise Parse("invalid string")
      }
    }
    if c == '\\' && !escaped {
      escaped = true
    } else {
      escaped = false
    }
  }
  raise Parse("unterminated string")
}

///|
fn Parser::value(self : Parser, depth : Int32) -> Json raise Parse {
  self.space()
  self.remaining -= 1
  if depth > 64 || self.remaining < 0 {
    raise Parse("input_limit")
  }
  if self.pos >= self.chars.length() {
    raise Parse("unexpected end")
  }
  match self.chars[self.pos] {
    '"' => Json::string(self.quoted())
    '{' => {
      self.pos += 1
      self.space()
      let o : Map[String, Json] = Map([])
      if self.pos < self.chars.length() && self.chars[self.pos] == '}' {
        self.pos += 1
        return Json::object(o)
      }
      while true {
        let key = self.quoted()
        if o.contains(key) {
          raise Parse("duplicate key: " + key)
        }
        self.expect(':')
        o[key] = self.value(depth + 1)
        self.space()
        if self.pos < self.chars.length() && self.chars[self.pos] == '}' {
          self.pos += 1
          break
        }
        self.expect(',')
      }
      Json::object(o)
    }
    '[' => {
      self.pos += 1
      self.space()
      let a : Array[Json] = []
      if self.pos < self.chars.length() && self.chars[self.pos] == ']' {
        self.pos += 1
        return Json::array(a)
      }
      while true {
        a.push(self.value(depth + 1))
        self.space()
        if self.pos < self.chars.length() && self.chars[self.pos] == ']' {
          self.pos += 1
          break
        }
        self.expect(',')
      }
      Json::array(a)
    }
    _ => {
      let token = StringBuilder()
      while self.pos < self.chars.length() &&
            ![',', '}', ']', ' ', '\n', '\r', '\t'].contains(
              self.chars[self.pos],
            ) {
        token.write_char(self.chars[self.pos])
        self.pos += 1
      }
      let s = token.to_string()
      match s {
        "Inf" | "Infinity" => Json::number(1.0 / 0.0)
        "-Inf" | "-Infinity" => Json::number(-1.0 / 0.0)
        "NaN" => Json::number(0.0 / 0.0)
        _ =>
          @json.parse(s, preserve_number_repr=true) catch {
            _ => raise Parse("invalid value: " + s)
          }
      }
    }
  }
}

///|
/// OTIO's JSON dialect: exact numeric lexemes and nonfinite values are retained.
pub fn parse(text : String) -> Result[Json, String] {
  if text.length() > 16000000 {
    return Err("input_limit")
  }
  let p : Parser = { chars: text.to_array(), pos: 0, remaining: 2000000, }
  let result = p.value(0) catch { Parse(e) => return Err(e) }
  p.space()
  if p.pos != p.chars.length() {
    Err("trailing input")
  } else {
    Ok(result)
  }
}

///|
fn emit(
  j : Json,
  out : StringBuilder,
  depth : Int32,
  remaining : Ref[Int32],
) -> Unit raise Parse {
  remaining.val -= 1
  if depth > 64 || remaining.val < 0 {
    raise Parse("input_limit_or_cycle")
  }
  match j {
    Number(n, ..) =>
      if n.is_nan() {
        out.write_string("NaN")
      } else if n.is_inf() {
        out.write_string(if n < 0.0 { "-Inf" } else { "Inf" })
      } else {
        out.write_string(j.stringify())
      }
    Array(a) => {
      out.write_char('[')
      for i = 0; i < a.length(); i = i + 1 {
        if i > 0 {
          out.write_char(',')
        }
        emit(a[i], out, depth + 1, remaining)
      }
      out.write_char(']')
    }
    Object(o) => {
      out.write_char('{')
      let mut first = true
      for k, v in o {
        if !first {
          out.write_char(',')
        }
        first = false
        out.write_string(Json::string(k).stringify())
        out.write_char(':')
        emit(v, out, depth + 1, remaining)
      }
      out.write_char('}')
    }
    _ => out.write_string(j.stringify())
  }
}

///|
pub fn stringify(value : Json) -> Result[String, String] {
  let out = StringBuilder()
  emit(value, out, 0, Ref(2000000)) catch {
    Parse(e) => return Err(e)
  }
  let text = out.to_string()
  if text.length() > 16000000 {
    Err("input_limit")
  } else {
    Ok(text)
  }
}

///|
pub fn clone(value : Json) -> Result[Json, String] {
  match stringify(value) {
    Ok(s) => parse(s)
    Err(e) => Err(e)
  }
}

///|
pub fn equivalent(a : Json, b : Json) -> Bool {
  fn compare(a : Json, b : Json, depth : Int32) -> Bool {
    if depth > 64 {
      return false
    }
    match (a, b) {
      (Object(x), Object(y)) =>
        x.length() == y.length() &&
        x
        .iter()
        .all(fn(pair) {
          match y.get(pair.0) {
            Some(v) => compare(pair.1, v, depth + 1)
            None => false
          }
        })
      (Array(x), Array(y)) => {
        if x.length() != y.length() {
          return false
        }
        for i = 0; i < x.length(); i = i + 1 {
          if !compare(x[i], y[i], depth + 1) {
            return false
          }
        }
        true
      }
      (Number(x, ..), Number(y, ..)) =>
        if x.is_nan() {
          y.is_nan()
        } else if x.abs() > 9007199254740991.0 {
          a.stringify() == b.stringify()
        } else {
          x == y
        }
      _ => a.stringify() == b.stringify()
    }
  }
  compare(a, b, 0)
}
