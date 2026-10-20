///|
fn span(start : Double, duration : Double, rate : Double) -> @range.TimeRange {
  @range.TimeRange::new(
    @time.RationalTime::new(start, rate).unwrap(),
    @time.RationalTime::new(duration, rate).unwrap(),
  ).unwrap()
}

///|
test "half open boundaries and negative starts" {
  let r = span(-24.0, 48.0, 24.0)
  assert_true(r.contains(@time.RationalTime::new(-1.0, 1.0).unwrap()).unwrap())
  assert_true(!r.contains(@time.RationalTime::new(1.0, 1.0).unwrap()).unwrap())
  assert_true(!r.contains(@time.RationalTime::new(-2.0, 1.0).unwrap()).unwrap())
}

///|
test "intersection converts mixed rates and preserves originals" {
  let a = span(240.0, 120.0, 24.0)
  let b = span(360.0, 180.0, 30.0)
  let hit = a.intersection(b).unwrap().unwrap()
  assert_eq(hit.start().value(), 288.0)
  assert_eq(hit.duration().value(), 72.0)
  assert_eq(hit.end_seconds(), 15.0)
  assert_eq(a.start().value(), 240.0)
  let reverse = b.trimmed_to(a).unwrap().unwrap()
  assert_eq(reverse.start().to_seconds().unwrap(), 12.0)
  assert_eq(reverse.end_seconds(), 15.0)
}

///|
test "empty touching disjoint and full containment" {
  let a = span(0.0, 24.0, 24.0)
  assert_true(a.intersection(span(24.0, 24.0, 24.0)).unwrap() is None)
  assert_true(a.intersection(span(48.0, 24.0, 24.0)).unwrap() is None)
  assert_true(a.intersection(span(12.0, 0.0, 24.0)).unwrap() is None)
  assert_eq(
    a.trimmed_to(span(-24.0, 72.0, 24.0)).unwrap().unwrap().duration().value(),
    24.0,
  )
}

///|
test "negative duration and overflow are rejected" {
  let zero = @time.RationalTime::new(0.0, 1.0).unwrap()
  assert_true(
    @range.TimeRange::new(zero, @time.RationalTime::new(-1.0, 1.0).unwrap())
    is Err(_),
  )
  let huge = @time.RationalTime::new(1.0e308, 1.0).unwrap()
  assert_true(@range.TimeRange::new(huge, huge) is Err(_))
  assert_true(
    @range.TimeRange::new(huge, @time.RationalTime::new(1.0, 1.0).unwrap())
    is Err(_),
  )
}
