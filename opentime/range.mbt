///|
pub(all) struct TimeRange {
  start_time : RationalTime
  duration : RationalTime
}

///|
pub fn TimeRange::new(
  start_time~ : RationalTime = RationalTime::new(),
  duration~ : RationalTime = RationalTime::new(rate=start_time.rate),
) -> TimeRange {
  { start_time, duration, }
}

///|
pub fn TimeRange::is_valid_range(self : TimeRange) -> Bool {
  self.start_time.is_valid_time() &&
  self.duration.is_valid_time() &&
  self.duration.value >= 0.0
}

///|
pub fn TimeRange::is_invalid_range(self : TimeRange) -> Bool {
  !self.is_valid_range()
}

///|
pub fn TimeRange::end_time_exclusive(self : TimeRange) -> RationalTime {
  self.duration.add(self.start_time.rescaled_to(self.duration.rate))
}

///|
pub fn TimeRange::end_time_inclusive(self : TimeRange) -> RationalTime {
  let end = self.end_time_exclusive()
  if end.subtract(self.start_time.rescaled_to(self.duration.rate)).value > 1.0 {
    if self.duration.value != @double.floor(self.duration.value) {
      end.floor()
    } else {
      end.subtract(RationalTime::new(value=1.0, rate=self.duration.rate))
    }
  } else {
    self.start_time
  }
}

///|
pub fn from_start_end(
  start : RationalTime,
  end : RationalTime,
  inclusive~ : Bool = false,
) -> TimeRange {
  {
    start_time: start,
    duration: duration_from_start_end_time(start, end, inclusive~),
  }
}

///|
pub fn TimeRange::duration_extended_by(
  self : TimeRange,
  other : RationalTime,
) -> TimeRange {
  { ..self, duration: self.duration.add(other), }
}

///|
fn min_time(a : RationalTime, b : RationalTime) -> RationalTime {
  if b.less(a) {
    b
  } else {
    a
  }
}

///|
fn max_time(a : RationalTime, b : RationalTime) -> RationalTime {
  if a.less(b) {
    b
  } else {
    a
  }
}

///|
pub fn TimeRange::extended_by(self : TimeRange, other : TimeRange) -> TimeRange {
  from_start_end(
    min_time(self.start_time, other.start_time),
    max_time(self.end_time_exclusive(), other.end_time_exclusive()),
  )
}

///|
pub fn TimeRange::clamp_time(
  self : TimeRange,
  other : RationalTime,
) -> RationalTime {
  min_time(max_time(other, self.start_time), self.end_time_inclusive())
}

///|
/// OTIO clamped(TimeRange) is not mathematical intersection: it retains the
/// other duration after clamping the start, and may return negative duration.
pub fn TimeRange::clamp_range(self : TimeRange, other : TimeRange) -> TimeRange {
  let r = {
    start_time: max_time(other.start_time, self.start_time),
    duration: other.duration,
  }
  {
    ..r,
    duration: min_time(r.end_time_exclusive(), self.end_time_exclusive()).subtract(
      r.start_time,
    ),
  }
}

///|
pub fn TimeRange::contains(self : TimeRange, time : RationalTime) -> Bool {
  self.start_time.less_equal(time) && time.less(self.end_time_exclusive())
}

///|
pub fn TimeRange::relates(
  self : TimeRange,
  other : TimeRange,
  relation : @range.Relation,
  epsilon~ : Double = 1.0 / 384000.0,
) -> Bool {
  let a = self.start_time.to_seconds()
  let b = self.end_time_exclusive().to_seconds()
  let c = other.start_time.to_seconds()
  let d = other.end_time_exclusive().to_seconds()
  match relation {
    @range.Contains => c - a >= epsilon && b - d >= epsilon
    @range.Overlaps => c - a >= epsilon && b - c >= epsilon && d - b >= epsilon
    @range.Before => c - b >= epsilon
    @range.Meets => c - b >= 0.0 && c - b <= epsilon
    @range.Begins => (a - c).abs() <= epsilon && d - b >= epsilon
    @range.Finishes => (b - d).abs() <= epsilon && a - c >= epsilon
    @range.Intersects => d - a >= epsilon && b - c >= epsilon
    @range.Equal =>
      self.start_time.subtract(other.start_time).to_seconds().abs() <
      1.0 / 384000.0 &&
      self.duration.subtract(other.duration).to_seconds().abs() < 1.0 / 384000.0
  }
}

///|
pub fn TimeRange::relates_time(
  self : TimeRange,
  other : RationalTime,
  relation : @range.Relation,
  epsilon~ : Double = 1.0 / 384000.0,
) -> Result[Bool, String] {
  let t = other.to_seconds()
  match relation {
    @range.Contains | @range.Overlaps => Ok(self.contains(other))
    @range.Before => Ok(t - self.end_time_exclusive().to_seconds() >= epsilon)
    @range.Begins => Ok((t - self.start_time.to_seconds()).abs() <= epsilon)
    @range.Finishes =>
      Ok((t - self.end_time_exclusive().to_seconds()).abs() <= epsilon)
    _ => Err("unsupported_time_relation")
  }
}

///|
pub fn TimeRange::to_json(self : TimeRange) -> Json {
  Json::object({
    "OTIO_SCHEMA": Json::string("TimeRange.1"),
    "start_time": self.start_time.to_json(),
    "duration": self.duration.to_json(),
  })
}
