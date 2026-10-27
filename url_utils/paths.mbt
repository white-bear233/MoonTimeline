///|
fn decode(text : String) -> String {
  fn hex(c : Char) -> Int32 {
    if c >= '0' && c <= '9' {
      c.to_int() - 48
    } else if c >= 'a' && c <= 'f' {
      c.to_int() - 87
    } else if c >= 'A' && c <= 'F' {
      c.to_int() - 55
    } else {
      -1
    }
  }
  let chars = text.to_array()
  let output = @buffer.Buffer()
  let mut i = 0
  while i < chars.length() {
    if chars[i] == '%' &&
      i + 2 < chars.length() &&
      hex(chars[i + 1]) >= 0 &&
      hex(chars[i + 2]) >= 0 {
      output.write_byte((hex(chars[i + 1]) * 16 + hex(chars[i + 2])).to_byte())
      i += 3
    } else {
      output.write_char_utf8(chars[i])
      i += 1
    }
  }
  @utf8.decode_lossy(output.to_bytes(), ignore_bom=true)
}

///|
fn normalize(path : String) -> String {
  let parts : Array[String] = []
  for part in path.split("/") {
    if part != "" && part != "." {
      parts.push(part.to_owned())
    }
  }
  let prefix = if path.has_prefix("//") && !path.has_prefix("///") {
    "//"
  } else if path.has_prefix("/") {
    "/"
  } else {
    ""
  }
  let out = prefix + parts.join("/")
  if out == "" {
    "."
  } else {
    out
  }
}

///|
fn drive(text : String) -> Bool {
  let a = text.to_array()
  a.length() >= 2 &&
  a[1] == ':' &&
  ((a[0] >= 'a' && a[0] <= 'z') || (a[0] >= 'A' && a[0] <= 'Z'))
}

///|
/// Explicit platform selection keeps fixtures and Wasm hosts deterministic.
pub fn url_from_filepath(path : String, windows~ : Bool = false) -> String {
  let native = if windows { path.split("\\").join("/") } else { path }
  if windows &&
    drive(native) &&
    native.to_array().length() >= 3 &&
    native.to_array()[2] == '/' {
    return "file:///" + normalize(native)
  }
  if windows && native.has_prefix("//") {
    return "file:" + normalize(native)
  }
  if native.has_prefix("/") {
    return "file://" + (if windows { path } else { normalize(path) })
  }
  path
}

///|
/// This follows OTIO's URL utility, not the stricter archive extraction policy.
pub fn filepath_from_url(
  url : String,
  windows~ : Bool = false,
) -> Result[String, String] {
  let clean = url.split("\t").join("").split("\n").join("").split("\r").join("")
  let clean = clean.trim_start().to_owned()
  let mut path = clean.split("#").to_array()[0].to_owned().split("?").to_array()[0].to_owned()
  let mut scheme = ""
  let colon = path.split(":").to_array()
  if colon.length() > 1 {
    let candidate = colon[0].to_owned()
    let chars = candidate.to_array()
    let mut valid = chars.length() > 0
    for i, c in chars {
      if !((c >= 'a' && c <= 'z') ||
        (c >= 'A' && c <= 'Z') ||
        (i > 0 && ((c >= '0' && c <= '9') || c == '+' || c == '-' || c == '.'))) {
        valid = false
      }
    }
    if valid {
      scheme = candidate.to_lower()
      path = colon[1:].map(fn(s) { s.to_owned() }).join(":")
    }
  }
  let mut authority = ""
  if path.has_prefix("//") {
    let parts = path.split("/").to_array()
    authority = parts[2].to_owned()
    path = if parts.length() > 3 {
      "/" + parts[3:].map(fn(s) { s.to_owned() }).join("/")
    } else {
      ""
    }
    if authority.contains("[") != authority.contains("]") {
      return Err("ValueError:invalid_ipv6_url")
    }
  }
  if [
      "", "ftp", "http", "https", "gopher", "rtsp", "rtsps", "rtspu", "sftp", "sip",
      "sips", "mms", "shttp", "tel",
    ].contains(scheme) {
    let parts = path.split("/").to_array().map(fn(s) { s.to_owned() })
    if parts.length() > 0 {
      parts[parts.length() - 1] = parts[parts.length() - 1]
      .split(";")
      .to_array()[0].to_owned()
      path = parts.join("/")
    }
  }
  let decoded = decode(path)
  path = decode(decoded)
  if windows {
    let legacy = decoded.split(":").join("|").split("|").to_array()
    if legacy.length() > 1 {
      let prefix = legacy[0].to_owned().to_array()
      if legacy.length() != 2 || prefix.length() == 0 {
        return Err("OSError:bad_drive_url")
      }
      let letter = prefix[prefix.length() - 1]
      if !((letter >= 'a' && letter <= 'z') || (letter >= 'A' && letter <= 'Z')) {
        return Err("OSError:bad_drive_url")
      }
      let drive_name = StringBuilder()
      drive_name.write_char(letter)
      let rest = legacy[1]
        .to_owned()
        .split("/")
        .to_array()
        .filter(fn(s) { s != "" })
        .map(fn(s) { decode(s.to_owned()) })
        .join("/")
      path = drive_name.to_string().to_upper() +
        ":" +
        (if rest != "" || decoded.has_suffix("/") { "/" + rest } else { "" })
    }
    path = path.split("\\").join("/")
  }
  if drive(authority) {
    return Ok(normalize(authority + decoded))
  }
  let normalized = normalize(path)
  if normalized == "." {
    return Err("IndexError:empty_path")
  }
  let parts = normalized.split("/").to_array()
  if drive(parts[0].to_owned()) {
    if windows {
      return Ok(normalized)
    }
    return Ok(
      if parts.length() > 1 {
        parts[1:].map(fn(s) { s.to_owned() }).join("/")
      } else {
        "."
      },
    )
  }
  if parts.length() > 1 && drive(parts[1].to_owned()) {
    return Ok(parts[1:].map(fn(s) { s.to_owned() }).join("/"))
  }
  if authority != "" && authority != "localhost" {
    return Ok(normalize("//" + authority + decoded))
  }
  Ok(normalized)
}
