///|
pub(all) struct TimeTransform {
  offset : @time.RationalTime
  scale : Double
  rate : Double
}

///|
pub fn TimeTransform::new(
  offset~ : @time.RationalTime = @time.RationalTime::new(0.0, 1.0).unwrap(),
  scale~ : Double = 1.0,
  rate~ : Double = -1.0,
) -> Result[TimeTransform, String] {
  if scale.is_nan() ||
    scale.is_inf() ||
    rate.is_nan() ||
    rate.is_inf() ||
    (rate != -1.0 && rate <= 0.0) {
    return Err("invalid_transform")
  }
  Ok({ offset, scale, rate, })
}

///|
pub fn TimeTransform::apply_time(
  self : TimeTransform,
  input : @time.RationalTime,
) -> Result[@time.RationalTime, String] {
  let scaled = match input.multiply(self.scale) {
    Ok(v) => v
    Err(_) => return Err("time_overflow")
  }
  let moved = match scaled.add(self.offset) {
    Ok(v) => v
    Err(_) => return Err("time_overflow")
  }
  match
    moved.rescaled_to(if self.rate > 0.0 { self.rate } else { input.rate() }) {
    Ok(v) => Ok(v)
    Err(_) => Err("time_overflow")
  }
}

///|
pub fn TimeTransform::apply_range(
  self : TimeTransform,
  input : @range.TimeRange,
) -> Result[@range.TimeRange, String] {
  let a = match self.apply_time(input.start()) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let end = match input.end_time_exclusive() {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let b = match self.apply_time(end) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  @range.from_start_end(a, b)
}

///|
/// Mirrors OTIO applied_to(TimeTransform), whose offsets are added without scaling.
pub fn TimeTransform::apply_transform(
  self : TimeTransform,
  other : TimeTransform,
) -> Result[TimeTransform, String] {
  let offset = match self.offset.add(other.offset) {
    Ok(v) => v
    Err(_) => return Err("time_overflow")
  }
  TimeTransform::new(
    offset~,
    scale=self.scale * other.scale,
    rate=if self.rate > 0.0 { self.rate } else { other.rate },
  )
}

///|
/// Mathematical function composition, separate from the OTIO overload above.
pub fn TimeTransform::compose(
  self : TimeTransform,
  other : TimeTransform,
) -> Result[TimeTransform, String] {
  let offset = match self.apply_time(other.offset) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  TimeTransform::new(
    offset~,
    scale=self.scale * other.scale,
    rate=if self.rate > 0.0 { self.rate } else { other.rate },
  )
}

///|
pub fn TimeTransform::inverse(
  self : TimeTransform,
) -> Result[TimeTransform, String] {
  if self.scale == 0.0 {
    return Err("singular_transform")
  }
  let offset = match self.offset.multiply(-1.0 / self.scale) {
    Ok(v) => v
    Err(_) => return Err("time_overflow")
  }
  TimeTransform::new(offset~, scale=1.0 / self.scale, rate=self.offset.rate())
}
