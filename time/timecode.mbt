///|
pub fn smpte_rates() -> Array[Double] {
  [
    24000.0 / 1001.0,
    24.0,
    25.0,
    30000.0 / 1001.0,
    30.0,
    48000.0 / 1001.0,
    48.0,
    50.0,
    60000.0 / 1001.0,
    60.0,
  ]
}

///|
pub fn is_smpte_timecode_rate(rate : Double) -> Bool {
  smpte_rates().contains(rate)
}

///|
pub fn nearest_smpte_timecode_rate(rate : Double) -> Result[Double, TimeError] {
  if rate.is_nan() || rate.is_inf() || rate <= 0.0 {
    return Err(InvalidRate)
  }
  let mut closest = 24.0
  let mut diff = 1.0 / 0.0
  for r in smpte_rates() {
    if (r - rate).abs() < diff {
      closest = r
      diff = (r - rate).abs()
    }
  }
  Ok(closest)
}

///|
fn drop_count(rate : Double) -> Int32 {
  if rate == 30000.0 / 1001.0 {
    2
  } else if rate == 60000.0 / 1001.0 {
    4
  } else {
    0
  }
}

///|
pub fn from_timecode(
  text : String,
  rate : Double,
) -> Result[RationalTime, TimeError] {
  if !is_smpte_timecode_rate(rate) {
    return Err(InvalidRate)
  }
  let c = text.to_array()
  if c.length() != 11 ||
    c[2] != ':' ||
    c[5] != ':' ||
    (c[8] != ':' && c[8] != ';') {
    return Err(InvalidValue)
  }
  let values : Array[Int32] = []
  for p in [0, 3, 6, 9] {
    if c[p] < '0' || c[p] > '9' || c[p + 1] < '0' || c[p + 1] > '9' {
      return Err(InvalidValue)
    }
    values.push((c[p].to_int() - 48) * 10 + c[p + 1].to_int() - 48)
  }
  let fps = @double.ceil(rate).to_int()
  if values[3] >= fps {
    return Err(InvalidValue)
  }
  let drop = if c[8] == ';' { drop_count(rate) } else { 0 }
  if c[8] == ';' && drop == 0 {
    return Err(InvalidRate)
  }
  let minutes = values[0] * 60 + values[1]
  let frames = (minutes * 60 + values[2]) * fps +
    values[3] -
    drop * (minutes - minutes / 10)
  RationalTime::new(frames.to_double(), rate)
}

///|
fn pad2(n : Int32) -> String {
  if n < 10 {
    "0" + n.to_string()
  } else {
    n.to_string()
  }
}

///|
pub fn RationalTime::to_timecode(
  self : RationalTime,
  rate~ : Double = self.rate(),
  drop_frame~ : Bool? = None,
) -> Result[String, TimeError] {
  let value = match self.rescaled_to(rate) {
    Ok(v) => v.value()
    Err(e) => return Err(e)
  }
  if value < 0.0 {
    return Err(InvalidValue)
  }
  if value > 9007199254740991.0 {
    return Err(UnsafeInteger)
  }
  let snapped = match nearest_smpte_timecode_rate(rate) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  if (snapped - rate).abs() > 0.1 {
    return Err(InvalidRate)
  }
  let use_drop = drop_frame.unwrap_or(drop_count(snapped) > 0)
  if use_drop && drop_count(snapped) == 0 {
    return Err(InvalidRate)
  }
  let effective = if !use_drop && @double.round(snapped) == 24.0 {
    24.0
  } else {
    snapped
  }
  let day = @double.round(effective * 3600.0) * 24.0
  let mut frames = (value - @double.floor(value / day) * day).to_int()
  let fps = @double.ceil(effective).to_int()
  if use_drop {
    let drop = drop_count(effective)
    let ten = @double.round(effective * 600.0).to_int()
    let minute = @double.round(effective).to_int() * 60 - drop
    let chunks = frames / ten
    let remainder = frames % ten
    frames = frames +
      drop * 9 * chunks +
      (if remainder > drop { drop * ((remainder - drop) / minute) } else { 0 })
  }
  let seconds = frames / fps
  Ok(
    pad2(seconds / 3600) +
    ":" +
    pad2(seconds / 60 % 60) +
    ":" +
    pad2(seconds % 60) +
    (if use_drop { ";" } else { ":" }) +
    pad2(frames % fps),
  )
}
