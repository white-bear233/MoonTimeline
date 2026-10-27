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
