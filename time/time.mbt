///|
/// Errors are explicit; invalid values never enter RationalTime.
pub(all) enum TimeError {
  InvalidValue
  InvalidRate
  NumericOverflow
  UnsafeInteger
} derive(Debug, Eq)

///|
/// Frame rounding is opt-in. Nearest ties are rounded away from zero.
pub(all) enum Rounding {
  Floor
  Ceil
  TowardZero
  NearestAway
} derive(Debug, Eq)

///|
/// Immutable OTIO-style value/rate time, not an integer millisecond count.
pub struct RationalTime {
  priv value : Double
  priv rate : Double
} derive(Debug)

///|
fn finite(value : Double) -> Bool {
  !value.is_nan() && !value.is_inf()
}

///|
/// Accept fractional and negative values, but only finite positive rates.
pub fn RationalTime::new(
  value : Double,
  rate : Double,
) -> Result[RationalTime, TimeError] {
  if !finite(value) {
    Err(InvalidValue)
  } else if !finite(rate) || rate <= 0.0 {
    Err(InvalidRate)
  } else {
    Ok({ value, rate, })
  }
}

///|
pub fn RationalTime::value(self : RationalTime) -> Double {
  self.value
}

///|
pub fn RationalTime::rate(self : RationalTime) -> Double {
  self.rate
}

///|
/// Return elapsed seconds; report overflow rather than leaking infinity.
pub fn RationalTime::to_seconds(
  self : RationalTime,
) -> Result[Double, TimeError] {
  let seconds = self.value / self.rate
  if finite(seconds) {
    Ok(seconds)
  } else {
    Err(NumericOverflow)
  }
}

///|
/// Convert frame rate without rounding. Operation order matches OTIO 0.18.1.
pub fn RationalTime::rescaled_to(
  self : RationalTime,
  rate : Double,
) -> Result[RationalTime, TimeError] {
  if !finite(rate) || rate <= 0.0 {
    return Err(InvalidRate)
  }
  if rate == self.rate {
    return Ok(self)
  }
  let value = self.value * rate / self.rate
  if finite(value) {
    Ok({ value, rate, })
  } else {
    Err(NumericOverflow)
  }
}

///|
/// Round at the requested rate. Return an integral Double, bounded to 2^53-1
/// to keep every adjacent integer representable on JS and Native alike.
/// This explicit policy is MoonTimeline's API, not OTIO's to_frames policy.
pub fn RationalTime::rounded_frames(
  self : RationalTime,
  rate : Double,
  mode : Rounding,
) -> Result[Double, TimeError] {
  let converted = match self.rescaled_to(rate) {
    Ok(time) => time.value
    Err(error) => return Err(error)
  }
  if converted.abs() > 9007199254740991.0 {
    return Err(UnsafeInteger)
  }
  let result = match mode {
    Floor => @double.floor(converted)
    Ceil => @double.ceil(converted)
    TowardZero => @double.trunc(converted)
    NearestAway => {
      let base = @double.trunc(converted)
      if (converted - base).abs() < 0.5 {
        base
      } else if converted < 0.0 {
        base - 1.0
      } else {
        base + 1.0
      }
    }
  }
  Ok(result)
}

///|
pub extend TimeError with Eq::{equal, not_equal}

///|
pub extend Rounding with Eq::{equal, not_equal}

///|
pub extend TimeError with @debug.Debug::{to_repr}

///|
pub extend Rounding with @debug.Debug::{to_repr}

///|
pub extend RationalTime with @debug.Debug::{to_repr}
