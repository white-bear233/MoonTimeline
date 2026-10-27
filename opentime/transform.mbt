///|
pub(all) struct TimeTransform {
  offset : RationalTime
  scale : Double
  rate : Double
}

///|
pub fn TimeTransform::new(
  offset~ : RationalTime = RationalTime::new(),
  scale~ : Double = 1.0,
  rate~ : Double = -1.0,
) -> TimeTransform {
  { offset, scale, rate, }
}

///|
pub fn TimeTransform::apply_time(
  self : TimeTransform,
  time : RationalTime,
) -> RationalTime {
  let scaled = { value: time.value * self.scale, rate: time.rate, }
  let result = scaled.add(self.offset)
  let rate = if self.rate > 0.0 { self.rate } else { time.rate }
  if rate > 0.0 {
    result.rescaled_to(rate)
  } else {
    result
  }
}

///|
pub fn TimeTransform::apply_range(
  self : TimeTransform,
  range : TimeRange,
) -> TimeRange {
  from_start_end(
    self.apply_time(range.start_time),
    self.apply_time(range.end_time_exclusive()),
  )
}

///|
pub fn TimeTransform::apply_transform(
  self : TimeTransform,
  other : TimeTransform,
) -> TimeTransform {
  {
    offset: self.offset.add(other.offset),
    scale: self.scale * other.scale,
    rate: if self.rate > 0.0 {
      self.rate
    } else {
      other.rate
    },
  }
}

///|
pub fn TimeTransform::equals(
  self : TimeTransform,
  other : TimeTransform,
) -> Bool {
  self.offset.equals(other.offset) &&
  self.scale == other.scale &&
  self.rate == other.rate
}

///|
pub fn TimeTransform::to_json(self : TimeTransform) -> Json {
  Json::object({
    "OTIO_SCHEMA": Json::string("TimeTransform.1"),
    "offset": self.offset.to_json(),
    "scale": Json::number(self.scale),
    "rate": Json::number(self.rate),
  })
}
