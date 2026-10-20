///|
/// A finite half-open interval [start, end). No implicit frame rounding.
pub struct TimeRange {
  priv start : @time.RationalTime
  priv duration : @time.RationalTime
  priv end_seconds : Double
}

///|
pub fn TimeRange::new(
  start : @time.RationalTime,
  duration : @time.RationalTime,
) -> Result[TimeRange, String] {
  let s = match start.to_seconds() {
    Ok(v) => v
    Err(_) => return Err("start_overflow")
  }
  let d = match duration.to_seconds() {
    Ok(v) => v
    Err(_) => return Err("duration_overflow")
  }
  if d < 0.0 {
    return Err("negative_duration")
  }
  let e = s + d
  if e.is_inf() || e.is_nan() {
    return Err("end_overflow")
  }
  if d > 0.0 && e == s {
    return Err("duration_below_precision")
  }
  Ok({ start, duration, end_seconds: e, })
}

///|
pub fn TimeRange::start(self : TimeRange) -> @time.RationalTime {
  self.start
}

///|
pub fn TimeRange::duration(self : TimeRange) -> @time.RationalTime {
  self.duration
}

///|
pub fn TimeRange::end_seconds(self : TimeRange) -> Double {
  self.end_seconds
}

///|
pub fn TimeRange::contains(
  self : TimeRange,
  point : @time.RationalTime,
) -> Result[Bool, String] {
  let p = match point.to_seconds() {
    Ok(v) => v
    Err(_) => return Err("point_overflow")
  }
  Ok(p >= self.start.to_seconds().unwrap() && p < self.end_seconds)
}

///|
/// Empty/touching intervals have no intersection. Output uses this range's rate.
pub fn TimeRange::intersection(
  self : TimeRange,
  other : TimeRange,
) -> Result[TimeRange?, String] {
  let a = self.start.to_seconds().unwrap()
  let b = other.start.to_seconds().unwrap()
  let s = if a > b { a } else { b }
  let e = if self.end_seconds < other.end_seconds {
    self.end_seconds
  } else {
    other.end_seconds
  }
  if e <= s {
    return Ok(None)
  }
  let rate = self.start.rate()
  let start = match @time.RationalTime::new(s * rate, rate) {
    Ok(v) => v
    Err(_) => return Err("intersection_overflow")
  }
  let duration = match @time.RationalTime::new((e - s) * rate, rate) {
    Ok(v) => v
    Err(_) => return Err("intersection_overflow")
  }
  match TimeRange::new(start, duration) {
    Ok(v) => Ok(Some(v))
    Err(e) => Err(e)
  }
}

///|
/// Trim to absolute bounds, without modifying either input.
pub fn TimeRange::trimmed_to(
  self : TimeRange,
  bounds : TimeRange,
) -> Result[TimeRange?, String] {
  self.intersection(bounds)
}
