///|
pub fn from_time_string(
  text : String,
  rate : Double,
) -> Result[RationalTime, TimeError] {
  if !is_smpte_timecode_rate(rate) {
    return Err(InvalidRate)
  }
  let parts = text.split(":").to_array()
  if parts.length() == 0 || parts.length() > 3 {
    return Err(InvalidValue)
  }
  for c in text {
    if (c < '0' || c > '9') && c != ':' && c != '.' {
      return Err(InvalidValue)
    }
  }
  let mut seconds = 0.0
  for i = 0; i < parts.length(); i = i + 1 {
    let value = @string.parse_double(parts[i]) catch {
      _ => return Err(InvalidValue)
    }
    if !finite(value) || value < 0.0 || (i > 0 && value >= 60.0) {
      return Err(InvalidValue)
    }
    seconds = seconds * 60.0 + value.abs()
  }
  from_seconds(seconds, rate~)
}

///|
pub fn RationalTime::to_time_string(
  self : RationalTime,
) -> Result[String, TimeError] {
  let seconds = match self.to_seconds() {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  if seconds.abs() > 9007199254740991.0 {
    return Err(UnsafeInteger)
  }
  let day = seconds.abs() - @double.floor(seconds.abs() / 86400.0) * 86400.0
  let hours = @double.floor(day / 3600.0).to_int()
  let minutes = @double.floor((day - hours.to_double() * 3600.0) / 60.0).to_int()
  let rest = day - hours.to_double() * 3600.0 - minutes.to_double() * 60.0
  let whole = @double.floor(rest).to_int()
  let fraction = rest - whole.to_double()
  let out = StringBuilder()
  if seconds < 0.0 {
    out.write_char('-')
  }
  out.write_string(pad2(hours) + ":" + pad2(minutes) + ":" + pad2(whole))
  if fraction == 0.0 {
    out.write_string(".0")
  } else {
    // Match the upstream %.7g followed by leading-character removal and
    // truncation to seven characters, including its tiny-value notation.
    let mut scaled = fraction
    let mut exponent = 0
    while scaled < 1.0 {
      scaled *= 10.0
      exponent -= 1
    }
    let mut digits = @double.round(scaled * 1000000.0).to_int()
    if digits == 10000000 {
      digits = 1000000
      exponent += 1
    }
    let mut significant = digits.to_string()
    while significant.has_suffix("0") {
      significant = significant[:significant.length() - 1].to_owned()
    }
    let value = StringBuilder()
    if exponent < -4 {
      value.write_char(significant.to_array()[0])
      if significant.length() > 1 {
        value.write_char('.')
        value.write_string(significant[1:].to_owned())
      }
      value.write_string("e-" + pad2(-exponent))
    } else if exponent >= 0 {
      value.write_string("1")
    } else {
      value.write_string("0.")
      for i = 1; i < -exponent; i = i + 1 {
        value.write_char('0')
      }
      value.write_string(significant)
    }
    let text = value.to_string()
    if text.length() <= 1 {
      out.write_string(".0")
    } else {
      out.write_string(
        text[1:if text.length() > 8 { 8 } else { text.length() }].to_owned(),
      )
    }
  }
  Ok(out.to_string())
}
