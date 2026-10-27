///|
pub fn from_start_end(
  start : @time.RationalTime,
  end : @time.RationalTime,
  inclusive~ : Bool = false,
) -> Result[TimeRange, String] {
  let d = match @time.duration_from_start_end_time(start, end, inclusive~) {
    Ok(v) => v
    Err(_) => return Err("time_overflow")
  }
  TimeRange::new(start, d)
}

///|
pub fn TimeRange::end_time_exclusive(
  self : TimeRange,
) -> Result[@time.RationalTime, String] {
  let s = match self.start().rescaled_to(self.duration().rate()) {
    Ok(v) => v
    Err(_) => return Err("time_overflow")
  }
  match s.add(self.duration()) {
    Ok(v) => Ok(v)
    Err(_) => Err("time_overflow")
  }
}

///|
pub fn TimeRange::end_time_inclusive(
  self : TimeRange,
) -> Result[@time.RationalTime, String] {
  if self.duration().value() <= 1.0 {
    return Ok(self.start())
  }
  let e = match self.end_time_exclusive() {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  if self.duration().value() != self.duration().floor().value() {
    return Ok(e.floor())
  }
  match @time.RationalTime::new(e.value() - 1.0, e.rate()) {
    Ok(v) => Ok(v)
    Err(_) => Err("time_overflow")
  }
}

///|
pub fn TimeRange::extended_by(
  self : TimeRange,
  other : TimeRange,
) -> Result[TimeRange, String] {
  let start = if self.start().to_seconds().unwrap() <
    other.start().to_seconds().unwrap() {
    self.start()
  } else {
    other.start()
  }
  let ending = if self.end_seconds() > other.end_seconds() {
    self.end_time_exclusive()
  } else {
    other.end_time_exclusive()
  }
  match ending {
    Ok(e) => from_start_end(start, e)
    Err(e) => Err(e)
  }
}

///|
pub fn TimeRange::duration_extended_by(
  self : TimeRange,
  duration : @time.RationalTime,
) -> Result[TimeRange, String] {
  match self.duration().add(duration) {
    Ok(d) => TimeRange::new(self.start(), d)
    Err(_) => Err("time_overflow")
  }
}

///|
pub fn TimeRange::clamp_time(
  self : TimeRange,
  time : @time.RationalTime,
) -> Result[@time.RationalTime, String] {
  let e = match self.end_time_inclusive() {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let n = match time.to_seconds() {
    Ok(v) => v
    Err(_) => return Err("time_overflow")
  }
  Ok(
    if n < self.start().to_seconds().unwrap() {
      self.start()
    } else if n > e.to_seconds().unwrap() {
      e
    } else {
      time
    },
  )
}

///|
pub(all) enum Relation {
  Contains
  Overlaps
  Before
  Meets
  Begins
  Finishes
  Intersects
  Equal
} derive(Eq)

///|
/// OTIO/Allen predicates. Contains and Overlaps are strict interval relations;
/// use Intersects for any shared interior, and reverse operands for converses.
pub fn TimeRange::relates(
  self : TimeRange,
  other : TimeRange,
  relation : Relation,
  epsilon~ : Double = 1.0 / 384000.0,
) -> Bool {
  if epsilon.is_nan() || epsilon.is_inf() || epsilon < 0.0 {
    return false
  }
  let a = self.start().to_seconds().unwrap()
  let b = self.end_seconds()
  let c = other.start().to_seconds().unwrap()
  let d = other.end_seconds()
  match relation {
    Contains => c - a >= epsilon && b - d >= epsilon
    Overlaps => c - a >= epsilon && b - c >= epsilon && d - b >= epsilon
    Before => c - b >= epsilon
    Meets => c - b >= 0.0 && c - b <= epsilon
    Begins => (a - c).abs() <= epsilon && d - b >= epsilon
    Finishes => (b - d).abs() <= epsilon && a - c >= epsilon
    Intersects => d - a >= epsilon && b - c >= epsilon
    Equal => (a - c).abs() < epsilon && (b - a - (d - c)).abs() < epsilon
  }
}

///|
pub extend Relation with Eq::{equal, not_equal}
