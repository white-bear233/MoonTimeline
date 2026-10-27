///|
pub fn V2d::add(self : V2d, other : V2d) -> V2d {
  { x: self.x + other.x, y: self.y + other.y, }
}

///|
pub fn V2d::subtract(self : V2d, other : V2d) -> V2d {
  { x: self.x - other.x, y: self.y - other.y, }
}

///|
pub fn V2d::multiply(self : V2d, scale : Double) -> V2d {
  { x: self.x * scale, y: self.y * scale, }
}

///|
pub fn V2d::dot(self : V2d, other : V2d) -> Double {
  self.x * other.x + self.y * other.y
}

///|
pub fn V2d::cross(self : V2d, other : V2d) -> Double {
  self.x * other.y - self.y * other.x
}

///|
pub fn V2d::multiply_components(self : V2d, other : V2d) -> V2d {
  { x: self.x * other.x, y: self.y * other.y, }
}

///|
pub fn V2d::divide_components(self : V2d, other : V2d) -> V2d {
  { x: self.x / other.x, y: self.y / other.y, }
}

///|
pub fn V2d::normalized_non_null(self : V2d) -> V2d {
  let length = self.length()
  { x: self.x / length, y: self.y / length, }
}

///|
pub fn vector_limits() -> (Double, Double, Double, Double, Int32) {
  (
    -1.7976931348623157e308, 1.7976931348623157e308, 2.2250738585072014e-308, 2.220446049250313e-16,
    2,
  )
}

///|
pub fn V2d::length_squared(self : V2d) -> Double {
  self.dot(self)
}

///|
pub fn V2d::length(self : V2d) -> Double {
  let square = self.length_squared()
  if square >= 2.2250738585072014e-308 || square.is_nan() {
    return square.sqrt()
  }
  let scale = if self.x.abs() > self.y.abs() {
    self.x.abs()
  } else {
    self.y.abs()
  }
  if scale == 0.0 {
    return 0.0
  }
  let x = self.x / scale
  let y = self.y / scale
  (x * x + y * y).sqrt() * scale
}

///|
pub fn V2d::normalized(
  self : V2d,
  reject_zero~ : Bool = false,
) -> Result[V2d, String] {
  let length = self.length()
  if length == 0.0 {
    if reject_zero {
      Err("zero_vector")
    } else {
      Ok(self)
    }
  } else {
    Ok({ x: self.x / length, y: self.y / length, })
  }
}

///|
pub fn V2d::equal_with_error(
  self : V2d,
  other : V2d,
  epsilon : Double,
  relative~ : Bool = false,
) -> Bool {
  let ex = if relative { epsilon * self.x.abs() } else { epsilon }
  let ey = if relative { epsilon * self.y.abs() } else { epsilon }
  (self.x - other.x).abs() <= ex && (self.y - other.y).abs() <= ey
}

///|
pub fn Box2d::center(self : Box2d) -> V2d {
  self.min.add(self.max).multiply(0.5)
}

///|
pub fn Box2d::intersects(self : Box2d, other : Box2d) -> Bool {
  self.min.x <= other.max.x &&
  self.max.x >= other.min.x &&
  self.min.y <= other.max.y &&
  self.max.y >= other.min.y
}

///|
pub fn Box2d::extended_by_point(self : Box2d, point : V2d) -> Box2d {
  self.extended_by({ min: point, max: point, })
}

///|
pub fn Color::from_float_list(
  channels : Array[Double],
  name~ : String = "",
) -> Result[Color, String] {
  if channels.length() != 3 && channels.length() != 4 {
    return Err("color_requires_3_or_4_channels")
  }
  Ok({
    r: channels[0],
    g: channels[1],
    b: channels[2],
    a: if channels.length() == 4 {
      channels[3]
    } else {
      1.0
    },
    name,
  })
}

///|
pub fn Color::from_int_list(
  channels : Array[Int32],
  name~ : String = "",
  bit_depth~ : Int32 = 8,
) -> Result[Color, String] {
  let divisor = @math.pow(2.0, bit_depth.to_double()) - 1.0
  Color::from_float_list(channels.map(fn(n) { n.to_double() / divisor }), name~)
}

///|
pub fn Color::to_float_list(self : Color) -> Array[Double] {
  [self.r, self.g, self.b, self.a]
}

///|
pub fn Color::to_int_list(
  self : Color,
  bit_depth~ : Int32 = 8,
) -> Result[Array[Int32], String] {
  let divisor = @math.pow(2.0, bit_depth.to_double()) - 1.0
  let out : Array[Int32] = []
  for n in self.to_float_list() {
    if n.is_nan() ||
      n.is_inf() ||
      n * divisor < -2147483648.0 ||
      n * divisor > 2147483647.0 {
      return Err("color_channel_overflow")
    }
    out.push((n * divisor).to_int())
  }
  Ok(out)
}

///|
pub fn Color::from_hex(value : String) -> Result[Color, String] {
  let text = if value.has_prefix("#") {
    value[1:].to_owned()
  } else if value.has_prefix("0x") || value.has_prefix("0X") {
    value[2:].to_owned()
  } else {
    value
  }
  let chars = text.to_array()
  if ![3, 4, 6, 8].contains(chars.length()) {
    return Err("invalid_color_hex")
  }
  let width = if chars.length() <= 4 { 1 } else { 2 }
  let channels : Array[Double] = []
  for i = 0; i < chars.length(); i = i + width {
    let mut j = i
    while j < i + width &&
          [' ', '\t', '\r', '\n', '\u000b', '\u000c'].contains(chars[j]) {
      j += 1
    }
    let mut sign = 1
    if j < i + width && (chars[j] == '+' || chars[j] == '-') {
      if chars[j] == '-' {
        sign = -1
      }
      j += 1
    }
    let start = j
    let mut n = 0
    while j < i + width {
      let c = chars[j]
      let d = if c >= '0' && c <= '9' {
        c.to_int() - 48
      } else if c >= 'a' && c <= 'f' {
        c.to_int() - 87
      } else if c >= 'A' && c <= 'F' {
        c.to_int() - 55
      } else {
        -1
      }
      if d < 0 {
        break
      }
      n = n * 16 + d
      j += 1
    }
    if j == start {
      return Err("invalid_color_hex")
    }
    channels.push(
      (n * sign).to_double() / (if width == 1 { 15.0 } else { 255.0 }),
    )
  }
  Color::from_float_list(channels)
}

///|
pub fn Color::to_hex(self : Color) -> Result[String, String] {
  let channels = match self.to_int_list() {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let out = StringBuilder()
  out.write_char('#')
  for n in channels {
    let text = n.reinterpret_as_uint().to_string(radix=16)
    if text.length() < 2 {
      out.write_char('0')
    }
    out.write_string(text)
  }
  Ok(out.to_string())
}

///|
pub fn Color::to_agbr_integer(self : Color) -> Result[UInt32, String] {
  let c = match self.to_int_list() {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  Ok(
    c[0].reinterpret_as_uint() |
    (c[1].reinterpret_as_uint() << 8) |
    (c[2].reinterpret_as_uint() << 16) |
    (c[3].reinterpret_as_uint() << 24),
  )
}

///|
pub fn Color::from_agbr_integer(n : UInt32) -> Color {
  Color::from_int_list([
    (n & 255U).reinterpret_as_int(),
    ((n >> 16) & 255U).reinterpret_as_int(),
    ((n >> 8) & 255U).reinterpret_as_int(),
    ((n >> 24) & 255U).reinterpret_as_int(),
  ]).unwrap()
}
