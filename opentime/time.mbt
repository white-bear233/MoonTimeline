///|
/// OTIO-compatible value domain, including invalid sentinels and infinities.
/// Convert explicitly to the checked editing type before playback/editing.
pub(all) struct RationalTime {
  value : Double
  rate : Double
}

///|
pub fn RationalTime::new(
  value~ : Double = 0.0,
  rate~ : Double = 1.0,
) -> RationalTime {
  { value, rate, }
}

///|
pub fn RationalTime::is_valid_time(self : RationalTime) -> Bool {
  !self.value.is_nan() && !self.rate.is_nan() && self.rate > 0.0
}

///|
pub fn RationalTime::is_invalid_time(self : RationalTime) -> Bool {
  !self.is_valid_time()
}

///|
pub fn RationalTime::checked(
  self : RationalTime,
) -> Result[@time.RationalTime, @time.TimeError] {
  @time.RationalTime::new(self.value, self.rate)
}

///|
pub fn RationalTime::value_rescaled_to(
  self : RationalTime,
  rate : Double,
) -> Double {
  if rate == self.rate {
    self.value
  } else {
    self.value * rate / self.rate
  }
}

///|
pub fn RationalTime::rescaled_to(
  self : RationalTime,
  rate : Double,
) -> RationalTime {
  { value: self.value_rescaled_to(rate), rate, }
}

///|
pub fn RationalTime::to_seconds(self : RationalTime) -> Double {
  self.value_rescaled_to(1.0)
}

///|
pub fn RationalTime::almost_equal(
  self : RationalTime,
  other : RationalTime,
  delta~ : Double = 0.0,
) -> Bool {
  (self.value_rescaled_to(other.rate) - other.value).abs() <= delta
}

///|
pub fn RationalTime::strictly_equal(
  self : RationalTime,
  other : RationalTime,
) -> Bool {
  self.value == other.value && self.rate == other.rate
}

///|
pub fn RationalTime::equals(self : RationalTime, other : RationalTime) -> Bool {
  self.value_rescaled_to(other.rate) == other.value
}

///|
pub fn RationalTime::greater(self : RationalTime, other : RationalTime) -> Bool {
  self.value / self.rate > other.value / other.rate
}

///|
pub fn RationalTime::greater_equal(
  self : RationalTime,
  other : RationalTime,
) -> Bool {
  self.value / self.rate >= other.value / other.rate
}

///|
pub fn RationalTime::less(self : RationalTime, other : RationalTime) -> Bool {
  !self.greater_equal(other)
}

///|
pub fn RationalTime::less_equal(
  self : RationalTime,
  other : RationalTime,
) -> Bool {
  !self.greater(other)
}

///|
pub fn RationalTime::add(
  self : RationalTime,
  other : RationalTime,
) -> RationalTime {
  if self.rate < other.rate {
    {
      value: self.value_rescaled_to(other.rate) + other.value,
      rate: other.rate,
    }
  } else {
    { value: other.value_rescaled_to(self.rate) + self.value, rate: self.rate, }
  }
}

///|
pub fn RationalTime::subtract(
  self : RationalTime,
  other : RationalTime,
) -> RationalTime {
  if self.rate < other.rate {
    {
      value: self.value_rescaled_to(other.rate) - other.value,
      rate: other.rate,
    }
  } else {
    { value: self.value - other.value_rescaled_to(self.rate), rate: self.rate, }
  }
}

///|
pub fn RationalTime::negated(self : RationalTime) -> RationalTime {
  { value: -self.value, rate: self.rate, }
}

///|
pub fn RationalTime::floor(self : RationalTime) -> RationalTime {
  { value: @double.floor(self.value), rate: self.rate, }
}

///|
pub fn RationalTime::ceil(self : RationalTime) -> RationalTime {
  { value: @double.ceil(self.value), rate: self.rate, }
}

///|
pub fn RationalTime::round(self : RationalTime) -> RationalTime {
  {
    value: if self.value < 0.0 {
      -@double.round(-self.value)
    } else {
      @double.round(self.value)
    },
    rate: self.rate,
  }
}

///|
pub fn from_seconds(seconds : Double, rate~ : Double = 1.0) -> RationalTime {
  RationalTime::new(value=seconds).rescaled_to(rate)
}

///|
/// Out-of-Int32 float-to-int conversions are undefined in the C++ upstream;
/// return an explicit error rather than relying on a platform-specific cast.
pub fn from_frames(
  frames : Double,
  rate : Double,
) -> Result[RationalTime, String] {
  if frames.is_nan() ||
    frames.is_inf() ||
    frames < -2147483648.0 ||
    frames >= 2147483648.0 {
    return Err("undefined_frame_conversion")
  }
  Ok({ value: frames.to_int().to_double(), rate, })
}

///|
pub fn RationalTime::to_frames(
  self : RationalTime,
  rate~ : Double = self.rate,
) -> Result[Int32, String] {
  let n = self.value_rescaled_to(rate)
  if n.is_nan() || n.is_inf() || n < -2147483648.0 || n >= 2147483648.0 {
    return Err("undefined_frame_conversion")
  }
  Ok(n.to_int())
}

///|
pub fn duration_from_start_end_time(
  start : RationalTime,
  end : RationalTime,
  inclusive~ : Bool = false,
) -> RationalTime {
  {
    value: end.value_rescaled_to(start.rate) -
    start.value +
    (if inclusive { 1.0 } else { 0.0 }),
    rate: start.rate,
  }
}

///|
pub fn is_smpte_timecode_rate(rate : Double) -> Bool {
  rate == 0.0 || @time.is_smpte_timecode_rate(rate)
}

///|
pub fn nearest_smpte_timecode_rate(rate : Double) -> Double {
  let mut nearest = 0.0
  let mut distance = 1.7976931348623157e308
  let rates = @time.smpte_rates()
  rates.push(0.0)
  for r in rates {
    if r == rate {
      return r
    }
    if (r - rate).abs() < distance {
      distance = (r - rate).abs()
      nearest = r
    }
  }
  nearest
}

///|
pub fn RationalTime::to_json(self : RationalTime) -> Json {
  Json::object({
    "OTIO_SCHEMA": Json::string("RationalTime.1"),
    "value": Json::number(self.value),
    "rate": Json::number(self.rate),
  })
}

///|
pub fn RationalTime::from_json(j : Json) -> Result[RationalTime, String] {
  match j {
    Object(o) =>
      match (o.get("OTIO_SCHEMA"), o.get("value"), o.get("rate")) {
        (
          Some(String("RationalTime.1")),
          Some(Number(value, ..)),
          Some(Number(rate, ..)),
        ) => Ok({ value, rate, })
        _ => Err("invalid_rational_time")
      }
    _ => Err("invalid_rational_time")
  }
}

///|
pub fn RationalTime::to_timecode(
  self : RationalTime,
  rate~ : Double = self.rate,
  drop_frame~ : Bool? = None,
) -> Result[String, @time.TimeError] {
  let checked = match self.checked() {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  checked.to_timecode(rate~, drop_frame~)
}

///|
pub fn RationalTime::to_nearest_timecode(
  self : RationalTime,
  rate~ : Double = self.rate,
  drop_frame~ : Bool? = None,
) -> Result[String, @time.TimeError] {
  self.to_timecode(rate=nearest_smpte_timecode_rate(rate), drop_frame~)
}

///|
pub fn RationalTime::to_time_string(
  self : RationalTime,
) -> Result[String, @time.TimeError] {
  match self.checked() {
    Ok(v) => v.to_time_string()
    Err(e) => Err(e)
  }
}

///|
pub fn from_timecode(
  text : String,
  rate : Double,
) -> Result[RationalTime, @time.TimeError] {
  if !is_smpte_timecode_rate(rate) {
    return Err(@time.InvalidRate)
  }
  let drop = if rate == 30000.0 / 1001.0 {
    2
  } else if rate == 60000.0 / 1001.0 {
    4
  } else {
    0
  }
  let chars = text.to_array()
  let df = chars.contains(';')
  if df && drop == 0 {
    return Err(@time.InvalidRate)
  }
  let values : Array[Int32] = []
  for start in [0, 3, 6, 9] {
    if start >= chars.length() {
      return Err(@time.InvalidValue)
    }
    let end = if start + 2 < chars.length() {
      start + 2
    } else {
      chars.length()
    }
    let mut p = start
    while p < end && [' ', '\t', '\n', '\r'].contains(chars[p]) {
      p += 1
    }
    let mut sign = 1
    if p < end && (chars[p] == '+' || chars[p] == '-') {
      if chars[p] == '-' {
        sign = -1
      }
      p += 1
    }
    let first = p
    let mut n = 0
    while p < end && chars[p] >= '0' && chars[p] <= '9' {
      n = n * 10 + chars[p].to_int() - 48
      p += 1
    }
    if p == first {
      return Err(@time.InvalidValue)
    }
    values.push(sign * n)
  }
  let fps = @double.ceil(rate).to_int()
  if values[3] >= fps {
    return Err(@time.InvalidValue)
  }
  let minutes = values[0] * 60 + values[1]
  let n = (minutes * 60 + values[2]) * fps +
    values[3] -
    (if df { drop * (minutes - minutes / 10) } else { 0 })
  Ok({ value: n.to_double(), rate, })
}

///|
pub fn from_time_string(
  text : String,
  rate : Double,
) -> Result[RationalTime, @time.TimeError] {
  if !is_smpte_timecode_rate(rate) {
    return Err(@time.InvalidRate)
  }
  let parts = text.split(":").to_array()
  if parts.length() > 3 {
    return Err(@time.InvalidValue)
  }
  for c in text {
    if (c < '0' || c > '9') && c != '.' && c != ':' {
      return Err(@time.InvalidValue)
    }
  }
  let mut total = 0.0
  let powers = [1.0, 60.0, 3600.0]
  for i = parts.length() - 1; i >= 0; i = i - 1 {
    let chars = parts[i].to_array()
    let mut p = 0
    let mut whole : UInt64 = 0UL
    while p < chars.length() && chars[p] >= '0' && chars[p] <= '9' {
      let next = whole * 10UL + (chars[p].to_int() - 48).to_uint64()
      if next < whole {
        return Err(@time.InvalidValue)
      }
      whole = next
      p += 1
    }
    let mut value = whole.to_double()
    if value.to_uint64() != whole {
      return Err(@time.InvalidValue)
    }
    if p < chars.length() && chars[p] == '.' {
      p += 1
      let mut scale = 0.1
      while p < chars.length() && chars[p] >= '0' && chars[p] <= '9' {
        value += (chars[p].to_int() - 48).to_double() * scale
        scale *= 0.1
        p += 1
      }
    }
    if i > 0 && value >= 60.0 {
      return Err(@time.InvalidValue)
    }
    total += value * powers[parts.length() - 1 - i]
  }
  Ok(from_seconds(total, rate~))
}
