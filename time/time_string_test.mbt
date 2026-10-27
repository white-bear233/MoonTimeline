///|
test "official time string formatting and parsing boundaries" {
  for
    (seconds, text) in [
      (0.0, "00:00:00.0"),
      (0.5, "00:00:00.5"),
      (1.0 / 24.0, "00:00:00.041666"),
      (0.123456789, "00:00:00.123456"),
      (0.000001, "00:00:00e-06"),
      (-1.5, "-00:00:01.5"),
      (86401.0, "00:00:01.0"),
    ] {
    assert_eq(
      @time.RationalTime::new(seconds, 1.0).unwrap().to_time_string().unwrap(),
      text,
    )
  }
  assert_eq(
    @time.from_time_string("01:02:03.5", 24.0).unwrap().value(),
    89364.0,
  )
  for text in ["-1.5", "1:60", "1:", "::", "1e2", "a"] {
    assert_true(@time.from_time_string(text, 24.0) is Err(_))
  }
}

///|
test "time convenience preserves representation and nearest rate formatting" {
  let a = @time.RationalTime::new(24.0, 24.0).unwrap()
  let b = @time.RationalTime::new(30.0, 30.0).unwrap()
  assert_false(a.strictly_equal(b))
  assert_true(a.almost_equal(b))
  assert_eq(a.value_rescaled_to(48.0).unwrap(), 48.0)
  assert_eq(@time.RationalTime::new(-1.5, 24.0).unwrap().round().value(), -2.0)
  assert_eq(
    a.to_nearest_timecode(rate=23.98, drop_frame=Some(false)).unwrap(),
    a.to_timecode(rate=24000.0 / 1001.0, drop_frame=Some(false)).unwrap(),
  )
}
