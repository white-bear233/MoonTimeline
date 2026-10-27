///|
pub fn RationalTime::round(self : RationalTime) -> RationalTime {
  RationalTime::new(
    if self.value() < 0.0 {
      -@double.round(-self.value())
    } else {
      @double.round(self.value())
    },
    self.rate(),
  ).unwrap()
}

///|
pub fn RationalTime::strictly_equal(
  self : RationalTime,
  other : RationalTime,
) -> Bool {
  self.value() == other.value() && self.rate() == other.rate()
}

///|
pub fn RationalTime::value_rescaled_to(
  self : RationalTime,
  rate : Double,
) -> Result[Double, TimeError] {
  match self.rescaled_to(rate) {
    Ok(v) => Ok(v.value())
    Err(e) => Err(e)
  }
}

///|
pub fn RationalTime::to_nearest_timecode(
  self : RationalTime,
  rate~ : Double = self.rate(),
  drop_frame~ : Bool? = None,
) -> Result[String, TimeError] {
  match nearest_smpte_timecode_rate(rate) {
    Ok(nearest) => self.to_timecode(rate=nearest, drop_frame~)
    Err(e) => Err(e)
  }
}
