///|
pub fn RationalTime::add(
  self : RationalTime,
  other : RationalTime,
) -> Result[RationalTime, TimeError] {
  let rate = if self.rate() > other.rate() { self.rate() } else { other.rate() }
  let a = match self.rescaled_to(rate) {
    Ok(t) => t
    Err(e) => return Err(e)
  }
  let b = match other.rescaled_to(rate) {
    Ok(t) => t
    Err(e) => return Err(e)
  }
  RationalTime::new(a.value() + b.value(), rate)
}

///|
pub fn RationalTime::subtract(
  self : RationalTime,
  other : RationalTime,
) -> Result[RationalTime, TimeError] {
  self.add(RationalTime::new(-other.value(), other.rate()).unwrap())
}

///|
pub fn RationalTime::multiply(
  self : RationalTime,
  scalar : Double,
) -> Result[RationalTime, TimeError] {
  RationalTime::new(self.value() * scalar, self.rate())
}

///|
pub fn RationalTime::almost_equal(
  self : RationalTime,
  other : RationalTime,
  delta~ : Double = 0.0,
) -> Bool {
  match other.rescaled_to(self.rate()) {
    Ok(t) => (self.value() - t.value()).abs() <= delta
    Err(_) => false
  }
}

///|
pub fn RationalTime::compare(
  self : RationalTime,
  other : RationalTime,
) -> Result[Int32, TimeError] {
  let v = match other.rescaled_to(self.rate()) {
    Ok(t) => t.value()
    Err(e) => return Err(e)
  }
  Ok(if self.value() < v { -1 } else if self.value() > v { 1 } else { 0 })
}

///|
pub fn RationalTime::floor(self : RationalTime) -> RationalTime {
  RationalTime::new(@double.floor(self.value()), self.rate()).unwrap()
}

///|
pub fn RationalTime::ceil(self : RationalTime) -> RationalTime {
  RationalTime::new(@double.ceil(self.value()), self.rate()).unwrap()
}

///|
pub fn RationalTime::to_frames(
  self : RationalTime,
  rate~ : Double = self.rate(),
) -> Result[Double, TimeError] {
  match self.rescaled_to(rate) {
    Ok(t) => Ok(@double.trunc(t.value()))
    Err(e) => Err(e)
  }
}

///|
pub fn from_seconds(
  seconds : Double,
  rate~ : Double = 1.0,
) -> Result[RationalTime, TimeError] {
  RationalTime::new(seconds * rate, rate)
}

///|
pub fn duration_from_start_end_time(
  start : RationalTime,
  end : RationalTime,
  inclusive~ : Bool = false,
) -> Result[RationalTime, TimeError] {
  let e = match end.rescaled_to(start.rate()) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  RationalTime::new(
    e.value() - start.value() + (if inclusive { 1.0 } else { 0.0 }),
    start.rate(),
  )
}
