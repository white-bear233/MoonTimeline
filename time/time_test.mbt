///|
test "conversion preserves seconds and does not round frames" {
  let original = @time.RationalTime::new(1.0, 24.0).unwrap()
  let converted = original.rescaled_to(30.0).unwrap()
  assert_eq(converted.value(), 1.25)
  assert_eq(converted.rate(), 30.0)
  assert_eq(converted.to_seconds().unwrap(), original.to_seconds().unwrap())
  assert_eq(original.value(), 1.0)
}

///|
test "explicit positive and negative rounding" {
  let positive = @time.RationalTime::new(1.5, 24.0).unwrap()
  let negative = @time.RationalTime::new(-1.5, 24.0).unwrap()
  assert_eq(positive.rounded_frames(24.0, Floor).unwrap(), 1.0)
  assert_eq(positive.rounded_frames(24.0, Ceil).unwrap(), 2.0)
  assert_eq(positive.rounded_frames(24.0, TowardZero).unwrap(), 1.0)
  assert_eq(positive.rounded_frames(24.0, NearestAway).unwrap(), 2.0)
  assert_eq(negative.rounded_frames(24.0, Floor).unwrap(), -2.0)
  assert_eq(negative.rounded_frames(24.0, Ceil).unwrap(), -1.0)
  assert_eq(negative.rounded_frames(24.0, TowardZero).unwrap(), -1.0)
  assert_eq(negative.rounded_frames(24.0, NearestAway).unwrap(), -2.0)
  let below = @time.RationalTime::new(-1.49, 24.0).unwrap()
  assert_eq(below.rounded_frames(24.0, NearestAway).unwrap(), -1.0)
}

///|
test "invalid values and rates are rejected" {
  assert_true(@time.RationalTime::new(0.0 / 0.0, 24.0) is Err(InvalidValue))
  assert_true(@time.RationalTime::new(1.0 / 0.0, 24.0) is Err(InvalidValue))
  for rate in [0.0, -24.0, 0.0 / 0.0, 1.0 / 0.0] {
    assert_true(@time.RationalTime::new(1.0, rate) is Err(InvalidRate))
    let time = @time.RationalTime::new(1.0, 24.0).unwrap()
    assert_true(time.rescaled_to(rate) is Err(InvalidRate))
    assert_true(time.rounded_frames(rate, Floor) is Err(InvalidRate))
  }
}

///|
test "overflow and unsafe integral frames are reported" {
  let huge = @time.RationalTime::new(1.0e308, 1.0).unwrap()
  assert_true(huge.rescaled_to(100.0) is Err(NumericOverflow))
  let tiny_rate = @time.RationalTime::new(1.0e308, 1.0e-308).unwrap()
  assert_true(tiny_rate.to_seconds() is Err(NumericOverflow))
  assert_eq(huge.rescaled_to(1.0).unwrap().value(), 1.0e308)
  assert_true(huge.rounded_frames(1.0, Floor) is Err(UnsafeInteger))
  let edge = @time.RationalTime::new(9007199254740991.0, 24.0).unwrap()
  assert_eq(edge.rounded_frames(24.0, NearestAway).unwrap(), 9007199254740991.0)
}

///|
test "zero and negative timestamps remain valid" {
  let zero = @time.RationalTime::new(0.0, 24.0).unwrap()
  assert_eq(zero.rescaled_to(60.0).unwrap().value(), 0.0)
  let negative = @time.RationalTime::new(-48.0, 24.0).unwrap()
  assert_eq(negative.to_seconds().unwrap(), -2.0)
  assert_eq(negative.rescaled_to(30.0).unwrap().value(), -60.0)
}

///|
test "rounding takes place after rate conversion" {
  let time = @time.RationalTime::new(1.0, 24.0).unwrap()
  assert_eq(time.rounded_frames(60.0, Floor).unwrap(), 2.0)
  assert_eq(time.rounded_frames(60.0, Ceil).unwrap(), 3.0)
  assert_eq(time.rounded_frames(60.0, NearestAway).unwrap(), 3.0)
  let negative = @time.RationalTime::new(-1.0, 24.0).unwrap()
  assert_eq(negative.rounded_frames(60.0, NearestAway).unwrap(), -3.0)
}

///|
test "nearest rounding around zero and exact integers" {
  for value in [0.0, 1.0, -1.0, 4503599627370495.0] {
    let time = @time.RationalTime::new(value, 24.0).unwrap()
    assert_eq(time.rounded_frames(24.0, NearestAway).unwrap(), value)
  }
  for value in [0.499999, -0.499999] {
    let time = @time.RationalTime::new(value, 24.0).unwrap()
    assert_eq(time.rounded_frames(24.0, NearestAway).unwrap(), 0.0)
  }
  let edge = @time.RationalTime::new(-9007199254740992.0, 24.0).unwrap()
  assert_true(edge.rounded_frames(24.0, NearestAway) is Err(UnsafeInteger))
}
