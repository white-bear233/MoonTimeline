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
pub fn V2d::length_squared(self : V2d) -> Double {
  self.dot(self)
}

///|
pub fn V2d::length(self : V2d) -> Double {
  @math.hypot(self.x, self.y)
}

///|
pub fn V2d::normalized(
  self : V2d,
  reject_zero~ : Bool = false,
) -> Result[V2d, String] {
  let length = self.length()
  if length.is_inf() || length.is_nan() {
    return Err("invalid_vector")
  }
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
  for n in channels {
    if n.is_inf() || n.is_nan() {
      return Err("invalid_color")
    }
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
) -> Result[Color, String] {
  Color::from_float_list(channels.map(fn(n) { n.to_double() / 255.0 }), name~)
}

///|
pub fn Color::to_float_list(self : Color) -> Array[Double] {
  [self.r, self.g, self.b, self.a]
}

///|
pub fn Color::to_int_list(self : Color) -> Result[Array[Int32], String] {
  let out : Array[Int32] = []
  for n in self.to_float_list() {
    if n.is_nan() ||
      n.is_inf() ||
      n * 255.0 < -2147483648.0 ||
      n * 255.0 > 2147483647.0 {
      return Err("color_channel_overflow")
    }
    out.push((n * 255.0).to_int())
  }
  Ok(out)
}

///|
pub fn Color::from_hex(value : String) -> Result[Color, String] {
  let text = if value.has_prefix("#") { value[1:].to_owned() } else { value }
  let chars = text.to_array()
  if ![3, 4, 6, 8].contains(chars.length()) {
    return Err("invalid_color_hex")
  }
  let digits : Array[Int32] = []
  for c in chars {
    let n = if c >= '0' && c <= '9' {
      c.to_int() - 48
    } else if c >= 'a' && c <= 'f' {
      c.to_int() - 87
    } else if c >= 'A' && c <= 'F' {
      c.to_int() - 55
    } else {
      -1
    }
    if n < 0 {
      return Err("invalid_color_hex")
    }
    digits.push(n)
  }
  let channels : Array[Int32] = []
  if digits.length() <= 4 {
    for n in digits {
      channels.push(n * 17)
    }
  } else {
    for i = 0; i < digits.length(); i = i + 2 {
      channels.push(digits[i] * 16 + digits[i + 1])
    }
  }
  Color::from_int_list(channels)
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
    ((n >> 8) & 255U).reinterpret_as_int(),
    ((n >> 16) & 255U).reinterpret_as_int(),
    ((n >> 24) & 255U).reinterpret_as_int(),
  ]).unwrap()
}
