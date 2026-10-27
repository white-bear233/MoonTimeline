// Generated from official OTIO 0.18.1 by tools/generate_api_tests.py.

///|
test "range:0" {
  let a = @opentime.TimeRange::new(
    start_time=@opentime.RationalTime::new(value=0.0, rate=24.0),
    duration=@opentime.RationalTime::new(value=0.0, rate=24.0),
  )
  assert_eq(a.is_valid_range(), true)
  assert_eq(a.is_invalid_range(), false)
  let actual = a.end_time_exclusive()
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual = a.end_time_inclusive()
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual_range = a.duration_extended_by(
    @opentime.RationalTime::new(value=-50.0, rate=30.0),
  )
  let actual = actual_range.start_time
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, -50.0)
  api_number(actual.rate, 30.0)
  let actual_range = a.duration_extended_by(
    @opentime.RationalTime::new(value=24.0, rate=24.0),
  )
  let actual = actual_range.start_time
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 24.0)
  api_number(actual.rate, 24.0)
  let b = @opentime.TimeRange::new(
    start_time=@opentime.RationalTime::new(value=0.0, rate=24.0),
    duration=@opentime.RationalTime::new(value=0.0, rate=24.0),
  )
  let actual_range = a.extended_by(b)
  let actual = actual_range.start_time
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual_range = a.clamp_range(b)
  let actual = actual_range.start_time
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  assert_eq(a.relates(b, @range.Contains, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Before, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Meets, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Contains, epsilon=0.0), true)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.0), true)
  assert_eq(a.relates(b, @range.Before, epsilon=0.0), true)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.0), true)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.0), true)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.0), true)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.0), true)
  assert_eq(
    a.relates(b, @range.Contains, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(
    a.relates(b, @range.Overlaps, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(a.relates(b, @range.Before, epsilon=2.6041666666666666e-06), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=2.6041666666666666e-06), true)
  assert_eq(a.relates(b, @range.Begins, epsilon=2.6041666666666666e-06), false)
  assert_eq(
    a.relates(b, @range.Finishes, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(
    a.relates(b, @range.Intersects, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(a.relates(b, @range.Contains, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.1), true)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Contains, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.0 / 0.0), false)
  let actual = a.clamp_time(@opentime.RationalTime::new(value=0.0, rate=24.0))
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=0.0, rate=24.0),
      @range.Contains,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=0.0, rate=24.0),
      @range.Overlaps,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=0.0, rate=24.0),
      @range.Before,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=0.0, rate=24.0),
      @range.Begins,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=0.0, rate=24.0),
      @range.Finishes,
    )
    .unwrap(),
    true,
  )
  let actual = a.clamp_time(@opentime.RationalTime::new(value=0.0, rate=24.0))
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=0.0, rate=24.0),
      @range.Contains,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=0.0, rate=24.0),
      @range.Overlaps,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=0.0, rate=24.0),
      @range.Before,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=0.0, rate=24.0),
      @range.Begins,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=0.0, rate=24.0),
      @range.Finishes,
    )
    .unwrap(),
    true,
  )
  let actual_range = @opentime.from_start_end(a.start_time, b.start_time)
  let actual = actual_range.start_time
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual_range = @opentime.from_start_end(
    a.start_time,
    b.start_time,
    inclusive=true,
  )
  let actual = actual_range.start_time
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 1.0)
  api_number(actual.rate, 24.0)
  let b = @opentime.TimeRange::new(
    start_time=@opentime.RationalTime::new(value=10.0, rate=24.0),
    duration=@opentime.RationalTime::new(value=1.0, rate=24.0),
  )
  let actual_range = a.extended_by(b)
  let actual = actual_range.start_time
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 11.0)
  api_number(actual.rate, 24.0)
  let actual_range = a.clamp_range(b)
  let actual = actual_range.start_time
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, -10.0)
  api_number(actual.rate, 24.0)
  assert_eq(a.relates(b, @range.Contains, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Before, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Meets, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Contains, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.0), true)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.0), false)
  assert_eq(
    a.relates(b, @range.Contains, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(
    a.relates(b, @range.Overlaps, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(a.relates(b, @range.Before, epsilon=2.6041666666666666e-06), true)
  assert_eq(a.relates(b, @range.Meets, epsilon=2.6041666666666666e-06), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=2.6041666666666666e-06), false)
  assert_eq(
    a.relates(b, @range.Finishes, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(
    a.relates(b, @range.Intersects, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(a.relates(b, @range.Contains, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.1), true)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Contains, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.0 / 0.0), false)
  let actual = a.clamp_time(@opentime.RationalTime::new(value=10.0, rate=24.0))
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Contains,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Overlaps,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Before,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Begins,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Finishes,
    )
    .unwrap(),
    false,
  )
  let actual = a.clamp_time(@opentime.RationalTime::new(value=11.0, rate=24.0))
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=11.0, rate=24.0),
      @range.Contains,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=11.0, rate=24.0),
      @range.Overlaps,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=11.0, rate=24.0),
      @range.Before,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=11.0, rate=24.0),
      @range.Begins,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=11.0, rate=24.0),
      @range.Finishes,
    )
    .unwrap(),
    false,
  )
  let actual_range = @opentime.from_start_end(a.start_time, b.start_time)
  let actual = actual_range.start_time
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual_range = @opentime.from_start_end(
    a.start_time,
    b.start_time,
    inclusive=true,
  )
  let actual = actual_range.start_time
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 11.0)
  api_number(actual.rate, 24.0)
  let b = @opentime.TimeRange::new(
    start_time=@opentime.RationalTime::new(value=10.0, rate=24.0),
    duration=@opentime.RationalTime::new(value=1.5, rate=24.0),
  )
  let actual_range = a.extended_by(b)
  let actual = actual_range.start_time
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 11.5)
  api_number(actual.rate, 24.0)
  let actual_range = a.clamp_range(b)
  let actual = actual_range.start_time
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, -10.0)
  api_number(actual.rate, 24.0)
  assert_eq(a.relates(b, @range.Contains, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Before, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Meets, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Contains, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.0), true)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.0), false)
  assert_eq(
    a.relates(b, @range.Contains, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(
    a.relates(b, @range.Overlaps, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(a.relates(b, @range.Before, epsilon=2.6041666666666666e-06), true)
  assert_eq(a.relates(b, @range.Meets, epsilon=2.6041666666666666e-06), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=2.6041666666666666e-06), false)
  assert_eq(
    a.relates(b, @range.Finishes, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(
    a.relates(b, @range.Intersects, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(a.relates(b, @range.Contains, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.1), true)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Contains, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.0 / 0.0), false)
  let actual = a.clamp_time(@opentime.RationalTime::new(value=10.0, rate=24.0))
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Contains,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Overlaps,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Before,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Begins,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Finishes,
    )
    .unwrap(),
    false,
  )
  let actual = a.clamp_time(@opentime.RationalTime::new(value=11.5, rate=24.0))
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=11.5, rate=24.0),
      @range.Contains,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=11.5, rate=24.0),
      @range.Overlaps,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=11.5, rate=24.0),
      @range.Before,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=11.5, rate=24.0),
      @range.Begins,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=11.5, rate=24.0),
      @range.Finishes,
    )
    .unwrap(),
    false,
  )
  let actual_range = @opentime.from_start_end(a.start_time, b.start_time)
  let actual = actual_range.start_time
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual_range = @opentime.from_start_end(
    a.start_time,
    b.start_time,
    inclusive=true,
  )
  let actual = actual_range.start_time
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 11.0)
  api_number(actual.rate, 24.0)
  let b = @opentime.TimeRange::new(
    start_time=@opentime.RationalTime::new(value=10.0, rate=24.0),
    duration=@opentime.RationalTime::new(value=25.0, rate=30.0),
  )
  let actual_range = a.extended_by(b)
  let actual = actual_range.start_time
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 30.0)
  api_number(actual.rate, 24.0)
  let actual_range = a.clamp_range(b)
  let actual = actual_range.start_time
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, -10.0)
  api_number(actual.rate, 24.0)
  assert_eq(a.relates(b, @range.Contains, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Before, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Meets, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Contains, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.0), true)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.0), false)
  assert_eq(
    a.relates(b, @range.Contains, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(
    a.relates(b, @range.Overlaps, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(a.relates(b, @range.Before, epsilon=2.6041666666666666e-06), true)
  assert_eq(a.relates(b, @range.Meets, epsilon=2.6041666666666666e-06), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=2.6041666666666666e-06), false)
  assert_eq(
    a.relates(b, @range.Finishes, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(
    a.relates(b, @range.Intersects, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(a.relates(b, @range.Contains, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.1), true)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Contains, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.0 / 0.0), false)
  let actual = a.clamp_time(@opentime.RationalTime::new(value=10.0, rate=24.0))
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Contains,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Overlaps,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Before,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Begins,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Finishes,
    )
    .unwrap(),
    false,
  )
  let actual = a.clamp_time(@opentime.RationalTime::new(value=37.5, rate=30.0))
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=37.5, rate=30.0),
      @range.Contains,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=37.5, rate=30.0),
      @range.Overlaps,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=37.5, rate=30.0),
      @range.Before,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=37.5, rate=30.0),
      @range.Begins,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=37.5, rate=30.0),
      @range.Finishes,
    )
    .unwrap(),
    false,
  )
  let actual_range = @opentime.from_start_end(a.start_time, b.start_time)
  let actual = actual_range.start_time
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual_range = @opentime.from_start_end(
    a.start_time,
    b.start_time,
    inclusive=true,
  )
  let actual = actual_range.start_time
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 11.0)
  api_number(actual.rate, 24.0)
  let b = @opentime.TimeRange::new(
    start_time=@opentime.RationalTime::new(value=-10.0, rate=24.0),
    duration=@opentime.RationalTime::new(value=48.0, rate=48.0),
  )
  let actual_range = a.extended_by(b)
  let actual = actual_range.start_time
  api_number(actual.value, -10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 24.0)
  api_number(actual.rate, 24.0)
  let actual_range = a.clamp_range(b)
  let actual = actual_range.start_time
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  assert_eq(a.relates(b, @range.Contains, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Before, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Meets, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Contains, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.0), true)
  assert_eq(
    a.relates(b, @range.Contains, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(
    a.relates(b, @range.Overlaps, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(a.relates(b, @range.Before, epsilon=2.6041666666666666e-06), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=2.6041666666666666e-06), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=2.6041666666666666e-06), false)
  assert_eq(
    a.relates(b, @range.Finishes, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(
    a.relates(b, @range.Intersects, epsilon=2.6041666666666666e-06),
    true,
  )
  assert_eq(a.relates(b, @range.Contains, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.1), true)
  assert_eq(a.relates(b, @range.Contains, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.0 / 0.0), false)
  let actual = a.clamp_time(@opentime.RationalTime::new(value=-10.0, rate=24.0))
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=-10.0, rate=24.0),
      @range.Contains,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=-10.0, rate=24.0),
      @range.Overlaps,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=-10.0, rate=24.0),
      @range.Before,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=-10.0, rate=24.0),
      @range.Begins,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=-10.0, rate=24.0),
      @range.Finishes,
    )
    .unwrap(),
    false,
  )
  let actual = a.clamp_time(@opentime.RationalTime::new(value=28.0, rate=48.0))
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=28.0, rate=48.0),
      @range.Contains,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=28.0, rate=48.0),
      @range.Overlaps,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=28.0, rate=48.0),
      @range.Before,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=28.0, rate=48.0),
      @range.Begins,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=28.0, rate=48.0),
      @range.Finishes,
    )
    .unwrap(),
    false,
  )
  let actual_range = @opentime.from_start_end(a.start_time, b.start_time)
  let actual = actual_range.start_time
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, -10.0)
  api_number(actual.rate, 24.0)
  let actual_range = @opentime.from_start_end(
    a.start_time,
    b.start_time,
    inclusive=true,
  )
  let actual = actual_range.start_time
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, -9.0)
  api_number(actual.rate, 24.0)
}

///|
test "range:1" {
  let a = @opentime.TimeRange::new(
    start_time=@opentime.RationalTime::new(value=10.0, rate=24.0),
    duration=@opentime.RationalTime::new(value=1.0, rate=24.0),
  )
  assert_eq(a.is_valid_range(), true)
  assert_eq(a.is_invalid_range(), false)
  let actual = a.end_time_exclusive()
  api_number(actual.value, 11.0)
  api_number(actual.rate, 24.0)
  let actual = a.end_time_inclusive()
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual_range = a.duration_extended_by(
    @opentime.RationalTime::new(value=-50.0, rate=30.0),
  )
  let actual = actual_range.start_time
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, -48.75)
  api_number(actual.rate, 30.0)
  let actual_range = a.duration_extended_by(
    @opentime.RationalTime::new(value=24.0, rate=24.0),
  )
  let actual = actual_range.start_time
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 25.0)
  api_number(actual.rate, 24.0)
  let b = @opentime.TimeRange::new(
    start_time=@opentime.RationalTime::new(value=0.0, rate=24.0),
    duration=@opentime.RationalTime::new(value=0.0, rate=24.0),
  )
  let actual_range = a.extended_by(b)
  let actual = actual_range.start_time
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 11.0)
  api_number(actual.rate, 24.0)
  let actual_range = a.clamp_range(b)
  let actual = actual_range.start_time
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  assert_eq(a.relates(b, @range.Contains, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Before, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Meets, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Contains, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.0), false)
  assert_eq(
    a.relates(b, @range.Contains, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(
    a.relates(b, @range.Overlaps, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(a.relates(b, @range.Before, epsilon=2.6041666666666666e-06), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=2.6041666666666666e-06), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=2.6041666666666666e-06), false)
  assert_eq(
    a.relates(b, @range.Finishes, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(
    a.relates(b, @range.Intersects, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(a.relates(b, @range.Contains, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Contains, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.0 / 0.0), false)
  let actual = a.clamp_time(@opentime.RationalTime::new(value=0.0, rate=24.0))
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=0.0, rate=24.0),
      @range.Contains,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=0.0, rate=24.0),
      @range.Overlaps,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=0.0, rate=24.0),
      @range.Before,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=0.0, rate=24.0),
      @range.Begins,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=0.0, rate=24.0),
      @range.Finishes,
    )
    .unwrap(),
    false,
  )
  let actual = a.clamp_time(@opentime.RationalTime::new(value=0.0, rate=24.0))
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=0.0, rate=24.0),
      @range.Contains,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=0.0, rate=24.0),
      @range.Overlaps,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=0.0, rate=24.0),
      @range.Before,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=0.0, rate=24.0),
      @range.Begins,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=0.0, rate=24.0),
      @range.Finishes,
    )
    .unwrap(),
    false,
  )
  let actual_range = @opentime.from_start_end(a.start_time, b.start_time)
  let actual = actual_range.start_time
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, -10.0)
  api_number(actual.rate, 24.0)
  let actual_range = @opentime.from_start_end(
    a.start_time,
    b.start_time,
    inclusive=true,
  )
  let actual = actual_range.start_time
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, -9.0)
  api_number(actual.rate, 24.0)
  let b = @opentime.TimeRange::new(
    start_time=@opentime.RationalTime::new(value=10.0, rate=24.0),
    duration=@opentime.RationalTime::new(value=1.0, rate=24.0),
  )
  let actual_range = a.extended_by(b)
  let actual = actual_range.start_time
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 1.0)
  api_number(actual.rate, 24.0)
  let actual_range = a.clamp_range(b)
  let actual = actual_range.start_time
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 1.0)
  api_number(actual.rate, 24.0)
  assert_eq(a.relates(b, @range.Contains, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Before, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Meets, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Contains, epsilon=0.0), true)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.0), true)
  assert_eq(a.relates(b, @range.Before, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.0), true)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.0), true)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.0), true)
  assert_eq(
    a.relates(b, @range.Contains, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(
    a.relates(b, @range.Overlaps, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(a.relates(b, @range.Before, epsilon=2.6041666666666666e-06), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=2.6041666666666666e-06), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=2.6041666666666666e-06), false)
  assert_eq(
    a.relates(b, @range.Finishes, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(
    a.relates(b, @range.Intersects, epsilon=2.6041666666666666e-06),
    true,
  )
  assert_eq(a.relates(b, @range.Contains, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Contains, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.0 / 0.0), false)
  let actual = a.clamp_time(@opentime.RationalTime::new(value=10.0, rate=24.0))
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Contains,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Overlaps,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Before,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Begins,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Finishes,
    )
    .unwrap(),
    false,
  )
  let actual = a.clamp_time(@opentime.RationalTime::new(value=11.0, rate=24.0))
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=11.0, rate=24.0),
      @range.Contains,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=11.0, rate=24.0),
      @range.Overlaps,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=11.0, rate=24.0),
      @range.Before,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=11.0, rate=24.0),
      @range.Begins,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=11.0, rate=24.0),
      @range.Finishes,
    )
    .unwrap(),
    true,
  )
  let actual_range = @opentime.from_start_end(a.start_time, b.start_time)
  let actual = actual_range.start_time
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual_range = @opentime.from_start_end(
    a.start_time,
    b.start_time,
    inclusive=true,
  )
  let actual = actual_range.start_time
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 1.0)
  api_number(actual.rate, 24.0)
  let b = @opentime.TimeRange::new(
    start_time=@opentime.RationalTime::new(value=10.0, rate=24.0),
    duration=@opentime.RationalTime::new(value=1.5, rate=24.0),
  )
  let actual_range = a.extended_by(b)
  let actual = actual_range.start_time
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 1.5)
  api_number(actual.rate, 24.0)
  let actual_range = a.clamp_range(b)
  let actual = actual_range.start_time
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 1.0)
  api_number(actual.rate, 24.0)
  assert_eq(a.relates(b, @range.Contains, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Before, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Meets, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Contains, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.0), true)
  assert_eq(a.relates(b, @range.Before, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.0), true)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.0), true)
  assert_eq(
    a.relates(b, @range.Contains, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(
    a.relates(b, @range.Overlaps, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(a.relates(b, @range.Before, epsilon=2.6041666666666666e-06), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=2.6041666666666666e-06), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=2.6041666666666666e-06), true)
  assert_eq(
    a.relates(b, @range.Finishes, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(
    a.relates(b, @range.Intersects, epsilon=2.6041666666666666e-06),
    true,
  )
  assert_eq(a.relates(b, @range.Contains, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Contains, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.0 / 0.0), false)
  let actual = a.clamp_time(@opentime.RationalTime::new(value=10.0, rate=24.0))
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Contains,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Overlaps,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Before,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Begins,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Finishes,
    )
    .unwrap(),
    false,
  )
  let actual = a.clamp_time(@opentime.RationalTime::new(value=11.5, rate=24.0))
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=11.5, rate=24.0),
      @range.Contains,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=11.5, rate=24.0),
      @range.Overlaps,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=11.5, rate=24.0),
      @range.Before,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=11.5, rate=24.0),
      @range.Begins,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=11.5, rate=24.0),
      @range.Finishes,
    )
    .unwrap(),
    false,
  )
  let actual_range = @opentime.from_start_end(a.start_time, b.start_time)
  let actual = actual_range.start_time
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual_range = @opentime.from_start_end(
    a.start_time,
    b.start_time,
    inclusive=true,
  )
  let actual = actual_range.start_time
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 1.0)
  api_number(actual.rate, 24.0)
  let b = @opentime.TimeRange::new(
    start_time=@opentime.RationalTime::new(value=10.0, rate=24.0),
    duration=@opentime.RationalTime::new(value=25.0, rate=30.0),
  )
  let actual_range = a.extended_by(b)
  let actual = actual_range.start_time
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 20.0)
  api_number(actual.rate, 24.0)
  let actual_range = a.clamp_range(b)
  let actual = actual_range.start_time
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 1.0)
  api_number(actual.rate, 24.0)
  assert_eq(a.relates(b, @range.Contains, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Before, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Meets, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Contains, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.0), true)
  assert_eq(a.relates(b, @range.Before, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.0), true)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.0), true)
  assert_eq(
    a.relates(b, @range.Contains, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(
    a.relates(b, @range.Overlaps, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(a.relates(b, @range.Before, epsilon=2.6041666666666666e-06), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=2.6041666666666666e-06), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=2.6041666666666666e-06), true)
  assert_eq(
    a.relates(b, @range.Finishes, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(
    a.relates(b, @range.Intersects, epsilon=2.6041666666666666e-06),
    true,
  )
  assert_eq(a.relates(b, @range.Contains, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.1), true)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Contains, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.0 / 0.0), false)
  let actual = a.clamp_time(@opentime.RationalTime::new(value=10.0, rate=24.0))
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Contains,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Overlaps,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Before,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Begins,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Finishes,
    )
    .unwrap(),
    false,
  )
  let actual = a.clamp_time(@opentime.RationalTime::new(value=37.5, rate=30.0))
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=37.5, rate=30.0),
      @range.Contains,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=37.5, rate=30.0),
      @range.Overlaps,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=37.5, rate=30.0),
      @range.Before,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=37.5, rate=30.0),
      @range.Begins,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=37.5, rate=30.0),
      @range.Finishes,
    )
    .unwrap(),
    false,
  )
  let actual_range = @opentime.from_start_end(a.start_time, b.start_time)
  let actual = actual_range.start_time
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual_range = @opentime.from_start_end(
    a.start_time,
    b.start_time,
    inclusive=true,
  )
  let actual = actual_range.start_time
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 1.0)
  api_number(actual.rate, 24.0)
  let b = @opentime.TimeRange::new(
    start_time=@opentime.RationalTime::new(value=-10.0, rate=24.0),
    duration=@opentime.RationalTime::new(value=48.0, rate=48.0),
  )
  let actual_range = a.extended_by(b)
  let actual = actual_range.start_time
  api_number(actual.value, -10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 24.0)
  api_number(actual.rate, 24.0)
  let actual_range = a.clamp_range(b)
  let actual = actual_range.start_time
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 1.0)
  api_number(actual.rate, 24.0)
  assert_eq(a.relates(b, @range.Contains, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Before, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Meets, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Contains, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.0), true)
  assert_eq(
    a.relates(b, @range.Contains, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(
    a.relates(b, @range.Overlaps, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(a.relates(b, @range.Before, epsilon=2.6041666666666666e-06), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=2.6041666666666666e-06), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=2.6041666666666666e-06), false)
  assert_eq(
    a.relates(b, @range.Finishes, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(
    a.relates(b, @range.Intersects, epsilon=2.6041666666666666e-06),
    true,
  )
  assert_eq(a.relates(b, @range.Contains, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.1), true)
  assert_eq(a.relates(b, @range.Contains, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.0 / 0.0), false)
  let actual = a.clamp_time(@opentime.RationalTime::new(value=-10.0, rate=24.0))
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=-10.0, rate=24.0),
      @range.Contains,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=-10.0, rate=24.0),
      @range.Overlaps,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=-10.0, rate=24.0),
      @range.Before,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=-10.0, rate=24.0),
      @range.Begins,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=-10.0, rate=24.0),
      @range.Finishes,
    )
    .unwrap(),
    false,
  )
  let actual = a.clamp_time(@opentime.RationalTime::new(value=28.0, rate=48.0))
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=28.0, rate=48.0),
      @range.Contains,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=28.0, rate=48.0),
      @range.Overlaps,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=28.0, rate=48.0),
      @range.Before,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=28.0, rate=48.0),
      @range.Begins,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=28.0, rate=48.0),
      @range.Finishes,
    )
    .unwrap(),
    false,
  )
  let actual_range = @opentime.from_start_end(a.start_time, b.start_time)
  let actual = actual_range.start_time
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, -20.0)
  api_number(actual.rate, 24.0)
  let actual_range = @opentime.from_start_end(
    a.start_time,
    b.start_time,
    inclusive=true,
  )
  let actual = actual_range.start_time
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, -19.0)
  api_number(actual.rate, 24.0)
}

///|
test "range:2" {
  let a = @opentime.TimeRange::new(
    start_time=@opentime.RationalTime::new(value=10.0, rate=24.0),
    duration=@opentime.RationalTime::new(value=1.5, rate=24.0),
  )
  assert_eq(a.is_valid_range(), true)
  assert_eq(a.is_invalid_range(), false)
  let actual = a.end_time_exclusive()
  api_number(actual.value, 11.5)
  api_number(actual.rate, 24.0)
  let actual = a.end_time_inclusive()
  api_number(actual.value, 11.0)
  api_number(actual.rate, 24.0)
  let actual_range = a.duration_extended_by(
    @opentime.RationalTime::new(value=-50.0, rate=30.0),
  )
  let actual = actual_range.start_time
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, -48.125)
  api_number(actual.rate, 30.0)
  let actual_range = a.duration_extended_by(
    @opentime.RationalTime::new(value=24.0, rate=24.0),
  )
  let actual = actual_range.start_time
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 25.5)
  api_number(actual.rate, 24.0)
  let b = @opentime.TimeRange::new(
    start_time=@opentime.RationalTime::new(value=0.0, rate=24.0),
    duration=@opentime.RationalTime::new(value=0.0, rate=24.0),
  )
  let actual_range = a.extended_by(b)
  let actual = actual_range.start_time
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 11.5)
  api_number(actual.rate, 24.0)
  let actual_range = a.clamp_range(b)
  let actual = actual_range.start_time
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  assert_eq(a.relates(b, @range.Contains, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Before, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Meets, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Contains, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.0), false)
  assert_eq(
    a.relates(b, @range.Contains, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(
    a.relates(b, @range.Overlaps, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(a.relates(b, @range.Before, epsilon=2.6041666666666666e-06), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=2.6041666666666666e-06), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=2.6041666666666666e-06), false)
  assert_eq(
    a.relates(b, @range.Finishes, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(
    a.relates(b, @range.Intersects, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(a.relates(b, @range.Contains, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Contains, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.0 / 0.0), false)
  let actual = a.clamp_time(@opentime.RationalTime::new(value=0.0, rate=24.0))
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=0.0, rate=24.0),
      @range.Contains,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=0.0, rate=24.0),
      @range.Overlaps,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=0.0, rate=24.0),
      @range.Before,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=0.0, rate=24.0),
      @range.Begins,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=0.0, rate=24.0),
      @range.Finishes,
    )
    .unwrap(),
    false,
  )
  let actual = a.clamp_time(@opentime.RationalTime::new(value=0.0, rate=24.0))
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=0.0, rate=24.0),
      @range.Contains,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=0.0, rate=24.0),
      @range.Overlaps,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=0.0, rate=24.0),
      @range.Before,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=0.0, rate=24.0),
      @range.Begins,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=0.0, rate=24.0),
      @range.Finishes,
    )
    .unwrap(),
    false,
  )
  let actual_range = @opentime.from_start_end(a.start_time, b.start_time)
  let actual = actual_range.start_time
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, -10.0)
  api_number(actual.rate, 24.0)
  let actual_range = @opentime.from_start_end(
    a.start_time,
    b.start_time,
    inclusive=true,
  )
  let actual = actual_range.start_time
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, -9.0)
  api_number(actual.rate, 24.0)
  let b = @opentime.TimeRange::new(
    start_time=@opentime.RationalTime::new(value=10.0, rate=24.0),
    duration=@opentime.RationalTime::new(value=1.0, rate=24.0),
  )
  let actual_range = a.extended_by(b)
  let actual = actual_range.start_time
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 1.5)
  api_number(actual.rate, 24.0)
  let actual_range = a.clamp_range(b)
  let actual = actual_range.start_time
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 1.0)
  api_number(actual.rate, 24.0)
  assert_eq(a.relates(b, @range.Contains, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Before, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Meets, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Contains, epsilon=0.0), true)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.0), true)
  assert_eq(
    a.relates(b, @range.Contains, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(
    a.relates(b, @range.Overlaps, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(a.relates(b, @range.Before, epsilon=2.6041666666666666e-06), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=2.6041666666666666e-06), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=2.6041666666666666e-06), false)
  assert_eq(
    a.relates(b, @range.Finishes, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(
    a.relates(b, @range.Intersects, epsilon=2.6041666666666666e-06),
    true,
  )
  assert_eq(a.relates(b, @range.Contains, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Contains, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.0 / 0.0), false)
  let actual = a.clamp_time(@opentime.RationalTime::new(value=10.0, rate=24.0))
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Contains,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Overlaps,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Before,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Begins,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Finishes,
    )
    .unwrap(),
    false,
  )
  let actual = a.clamp_time(@opentime.RationalTime::new(value=11.0, rate=24.0))
  api_number(actual.value, 11.0)
  api_number(actual.rate, 24.0)
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=11.0, rate=24.0),
      @range.Contains,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=11.0, rate=24.0),
      @range.Overlaps,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=11.0, rate=24.0),
      @range.Before,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=11.0, rate=24.0),
      @range.Begins,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=11.0, rate=24.0),
      @range.Finishes,
    )
    .unwrap(),
    false,
  )
  let actual_range = @opentime.from_start_end(a.start_time, b.start_time)
  let actual = actual_range.start_time
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual_range = @opentime.from_start_end(
    a.start_time,
    b.start_time,
    inclusive=true,
  )
  let actual = actual_range.start_time
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 1.0)
  api_number(actual.rate, 24.0)
  let b = @opentime.TimeRange::new(
    start_time=@opentime.RationalTime::new(value=10.0, rate=24.0),
    duration=@opentime.RationalTime::new(value=1.5, rate=24.0),
  )
  let actual_range = a.extended_by(b)
  let actual = actual_range.start_time
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 1.5)
  api_number(actual.rate, 24.0)
  let actual_range = a.clamp_range(b)
  let actual = actual_range.start_time
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 1.5)
  api_number(actual.rate, 24.0)
  assert_eq(a.relates(b, @range.Contains, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Before, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Meets, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Contains, epsilon=0.0), true)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.0), true)
  assert_eq(a.relates(b, @range.Before, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.0), true)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.0), true)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.0), true)
  assert_eq(
    a.relates(b, @range.Contains, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(
    a.relates(b, @range.Overlaps, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(a.relates(b, @range.Before, epsilon=2.6041666666666666e-06), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=2.6041666666666666e-06), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=2.6041666666666666e-06), false)
  assert_eq(
    a.relates(b, @range.Finishes, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(
    a.relates(b, @range.Intersects, epsilon=2.6041666666666666e-06),
    true,
  )
  assert_eq(a.relates(b, @range.Contains, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Contains, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.0 / 0.0), false)
  let actual = a.clamp_time(@opentime.RationalTime::new(value=10.0, rate=24.0))
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Contains,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Overlaps,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Before,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Begins,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Finishes,
    )
    .unwrap(),
    false,
  )
  let actual = a.clamp_time(@opentime.RationalTime::new(value=11.5, rate=24.0))
  api_number(actual.value, 11.0)
  api_number(actual.rate, 24.0)
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=11.5, rate=24.0),
      @range.Contains,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=11.5, rate=24.0),
      @range.Overlaps,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=11.5, rate=24.0),
      @range.Before,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=11.5, rate=24.0),
      @range.Begins,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=11.5, rate=24.0),
      @range.Finishes,
    )
    .unwrap(),
    true,
  )
  let actual_range = @opentime.from_start_end(a.start_time, b.start_time)
  let actual = actual_range.start_time
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual_range = @opentime.from_start_end(
    a.start_time,
    b.start_time,
    inclusive=true,
  )
  let actual = actual_range.start_time
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 1.0)
  api_number(actual.rate, 24.0)
  let b = @opentime.TimeRange::new(
    start_time=@opentime.RationalTime::new(value=10.0, rate=24.0),
    duration=@opentime.RationalTime::new(value=25.0, rate=30.0),
  )
  let actual_range = a.extended_by(b)
  let actual = actual_range.start_time
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 20.0)
  api_number(actual.rate, 24.0)
  let actual_range = a.clamp_range(b)
  let actual = actual_range.start_time
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 1.5)
  api_number(actual.rate, 24.0)
  assert_eq(a.relates(b, @range.Contains, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Before, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Meets, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Contains, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.0), true)
  assert_eq(a.relates(b, @range.Before, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.0), true)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.0), true)
  assert_eq(
    a.relates(b, @range.Contains, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(
    a.relates(b, @range.Overlaps, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(a.relates(b, @range.Before, epsilon=2.6041666666666666e-06), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=2.6041666666666666e-06), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=2.6041666666666666e-06), true)
  assert_eq(
    a.relates(b, @range.Finishes, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(
    a.relates(b, @range.Intersects, epsilon=2.6041666666666666e-06),
    true,
  )
  assert_eq(a.relates(b, @range.Contains, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.1), true)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Contains, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.0 / 0.0), false)
  let actual = a.clamp_time(@opentime.RationalTime::new(value=10.0, rate=24.0))
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Contains,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Overlaps,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Before,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Begins,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Finishes,
    )
    .unwrap(),
    false,
  )
  let actual = a.clamp_time(@opentime.RationalTime::new(value=37.5, rate=30.0))
  api_number(actual.value, 11.0)
  api_number(actual.rate, 24.0)
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=37.5, rate=30.0),
      @range.Contains,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=37.5, rate=30.0),
      @range.Overlaps,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=37.5, rate=30.0),
      @range.Before,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=37.5, rate=30.0),
      @range.Begins,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=37.5, rate=30.0),
      @range.Finishes,
    )
    .unwrap(),
    false,
  )
  let actual_range = @opentime.from_start_end(a.start_time, b.start_time)
  let actual = actual_range.start_time
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual_range = @opentime.from_start_end(
    a.start_time,
    b.start_time,
    inclusive=true,
  )
  let actual = actual_range.start_time
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 1.0)
  api_number(actual.rate, 24.0)
  let b = @opentime.TimeRange::new(
    start_time=@opentime.RationalTime::new(value=-10.0, rate=24.0),
    duration=@opentime.RationalTime::new(value=48.0, rate=48.0),
  )
  let actual_range = a.extended_by(b)
  let actual = actual_range.start_time
  api_number(actual.value, -10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 24.0)
  api_number(actual.rate, 24.0)
  let actual_range = a.clamp_range(b)
  let actual = actual_range.start_time
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 1.5)
  api_number(actual.rate, 24.0)
  assert_eq(a.relates(b, @range.Contains, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Before, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Meets, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Contains, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.0), true)
  assert_eq(
    a.relates(b, @range.Contains, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(
    a.relates(b, @range.Overlaps, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(a.relates(b, @range.Before, epsilon=2.6041666666666666e-06), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=2.6041666666666666e-06), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=2.6041666666666666e-06), false)
  assert_eq(
    a.relates(b, @range.Finishes, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(
    a.relates(b, @range.Intersects, epsilon=2.6041666666666666e-06),
    true,
  )
  assert_eq(a.relates(b, @range.Contains, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.1), true)
  assert_eq(a.relates(b, @range.Contains, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.0 / 0.0), false)
  let actual = a.clamp_time(@opentime.RationalTime::new(value=-10.0, rate=24.0))
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=-10.0, rate=24.0),
      @range.Contains,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=-10.0, rate=24.0),
      @range.Overlaps,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=-10.0, rate=24.0),
      @range.Before,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=-10.0, rate=24.0),
      @range.Begins,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=-10.0, rate=24.0),
      @range.Finishes,
    )
    .unwrap(),
    false,
  )
  let actual = a.clamp_time(@opentime.RationalTime::new(value=28.0, rate=48.0))
  api_number(actual.value, 11.0)
  api_number(actual.rate, 24.0)
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=28.0, rate=48.0),
      @range.Contains,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=28.0, rate=48.0),
      @range.Overlaps,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=28.0, rate=48.0),
      @range.Before,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=28.0, rate=48.0),
      @range.Begins,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=28.0, rate=48.0),
      @range.Finishes,
    )
    .unwrap(),
    false,
  )
  let actual_range = @opentime.from_start_end(a.start_time, b.start_time)
  let actual = actual_range.start_time
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, -20.0)
  api_number(actual.rate, 24.0)
  let actual_range = @opentime.from_start_end(
    a.start_time,
    b.start_time,
    inclusive=true,
  )
  let actual = actual_range.start_time
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, -19.0)
  api_number(actual.rate, 24.0)
}

///|
test "range:3" {
  let a = @opentime.TimeRange::new(
    start_time=@opentime.RationalTime::new(value=10.0, rate=24.0),
    duration=@opentime.RationalTime::new(value=25.0, rate=30.0),
  )
  assert_eq(a.is_valid_range(), true)
  assert_eq(a.is_invalid_range(), false)
  let actual = a.end_time_exclusive()
  api_number(actual.value, 37.5)
  api_number(actual.rate, 30.0)
  let actual = a.end_time_inclusive()
  api_number(actual.value, 36.5)
  api_number(actual.rate, 30.0)
  let actual_range = a.duration_extended_by(
    @opentime.RationalTime::new(value=-50.0, rate=30.0),
  )
  let actual = actual_range.start_time
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, -25.0)
  api_number(actual.rate, 30.0)
  let actual_range = a.duration_extended_by(
    @opentime.RationalTime::new(value=24.0, rate=24.0),
  )
  let actual = actual_range.start_time
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 55.0)
  api_number(actual.rate, 30.0)
  let b = @opentime.TimeRange::new(
    start_time=@opentime.RationalTime::new(value=0.0, rate=24.0),
    duration=@opentime.RationalTime::new(value=0.0, rate=24.0),
  )
  let actual_range = a.extended_by(b)
  let actual = actual_range.start_time
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 30.0)
  api_number(actual.rate, 24.0)
  let actual_range = a.clamp_range(b)
  let actual = actual_range.start_time
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  assert_eq(a.relates(b, @range.Contains, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Before, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Contains, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.0), false)
  assert_eq(
    a.relates(b, @range.Contains, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(
    a.relates(b, @range.Overlaps, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(a.relates(b, @range.Before, epsilon=2.6041666666666666e-06), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=2.6041666666666666e-06), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=2.6041666666666666e-06), false)
  assert_eq(
    a.relates(b, @range.Finishes, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(
    a.relates(b, @range.Intersects, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(a.relates(b, @range.Contains, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Contains, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.0 / 0.0), false)
  let actual = a.clamp_time(@opentime.RationalTime::new(value=0.0, rate=24.0))
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=0.0, rate=24.0),
      @range.Contains,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=0.0, rate=24.0),
      @range.Overlaps,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=0.0, rate=24.0),
      @range.Before,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=0.0, rate=24.0),
      @range.Begins,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=0.0, rate=24.0),
      @range.Finishes,
    )
    .unwrap(),
    false,
  )
  let actual = a.clamp_time(@opentime.RationalTime::new(value=0.0, rate=24.0))
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=0.0, rate=24.0),
      @range.Contains,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=0.0, rate=24.0),
      @range.Overlaps,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=0.0, rate=24.0),
      @range.Before,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=0.0, rate=24.0),
      @range.Begins,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=0.0, rate=24.0),
      @range.Finishes,
    )
    .unwrap(),
    false,
  )
  let actual_range = @opentime.from_start_end(a.start_time, b.start_time)
  let actual = actual_range.start_time
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, -10.0)
  api_number(actual.rate, 24.0)
  let actual_range = @opentime.from_start_end(
    a.start_time,
    b.start_time,
    inclusive=true,
  )
  let actual = actual_range.start_time
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, -9.0)
  api_number(actual.rate, 24.0)
  let b = @opentime.TimeRange::new(
    start_time=@opentime.RationalTime::new(value=10.0, rate=24.0),
    duration=@opentime.RationalTime::new(value=1.0, rate=24.0),
  )
  let actual_range = a.extended_by(b)
  let actual = actual_range.start_time
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 20.0)
  api_number(actual.rate, 24.0)
  let actual_range = a.clamp_range(b)
  let actual = actual_range.start_time
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 1.0)
  api_number(actual.rate, 24.0)
  assert_eq(a.relates(b, @range.Contains, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Before, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Meets, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Contains, epsilon=0.0), true)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.0), true)
  assert_eq(
    a.relates(b, @range.Contains, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(
    a.relates(b, @range.Overlaps, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(a.relates(b, @range.Before, epsilon=2.6041666666666666e-06), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=2.6041666666666666e-06), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=2.6041666666666666e-06), false)
  assert_eq(
    a.relates(b, @range.Finishes, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(
    a.relates(b, @range.Intersects, epsilon=2.6041666666666666e-06),
    true,
  )
  assert_eq(a.relates(b, @range.Contains, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Contains, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.0 / 0.0), false)
  let actual = a.clamp_time(@opentime.RationalTime::new(value=10.0, rate=24.0))
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Contains,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Overlaps,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Before,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Begins,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Finishes,
    )
    .unwrap(),
    false,
  )
  let actual = a.clamp_time(@opentime.RationalTime::new(value=11.0, rate=24.0))
  api_number(actual.value, 11.0)
  api_number(actual.rate, 24.0)
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=11.0, rate=24.0),
      @range.Contains,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=11.0, rate=24.0),
      @range.Overlaps,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=11.0, rate=24.0),
      @range.Before,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=11.0, rate=24.0),
      @range.Begins,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=11.0, rate=24.0),
      @range.Finishes,
    )
    .unwrap(),
    false,
  )
  let actual_range = @opentime.from_start_end(a.start_time, b.start_time)
  let actual = actual_range.start_time
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual_range = @opentime.from_start_end(
    a.start_time,
    b.start_time,
    inclusive=true,
  )
  let actual = actual_range.start_time
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 1.0)
  api_number(actual.rate, 24.0)
  let b = @opentime.TimeRange::new(
    start_time=@opentime.RationalTime::new(value=10.0, rate=24.0),
    duration=@opentime.RationalTime::new(value=1.5, rate=24.0),
  )
  let actual_range = a.extended_by(b)
  let actual = actual_range.start_time
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 20.0)
  api_number(actual.rate, 24.0)
  let actual_range = a.clamp_range(b)
  let actual = actual_range.start_time
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 1.5)
  api_number(actual.rate, 24.0)
  assert_eq(a.relates(b, @range.Contains, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Before, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Meets, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Contains, epsilon=0.0), true)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.0), true)
  assert_eq(
    a.relates(b, @range.Contains, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(
    a.relates(b, @range.Overlaps, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(a.relates(b, @range.Before, epsilon=2.6041666666666666e-06), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=2.6041666666666666e-06), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=2.6041666666666666e-06), false)
  assert_eq(
    a.relates(b, @range.Finishes, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(
    a.relates(b, @range.Intersects, epsilon=2.6041666666666666e-06),
    true,
  )
  assert_eq(a.relates(b, @range.Contains, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Contains, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.0 / 0.0), false)
  let actual = a.clamp_time(@opentime.RationalTime::new(value=10.0, rate=24.0))
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Contains,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Overlaps,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Before,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Begins,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Finishes,
    )
    .unwrap(),
    false,
  )
  let actual = a.clamp_time(@opentime.RationalTime::new(value=11.5, rate=24.0))
  api_number(actual.value, 11.5)
  api_number(actual.rate, 24.0)
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=11.5, rate=24.0),
      @range.Contains,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=11.5, rate=24.0),
      @range.Overlaps,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=11.5, rate=24.0),
      @range.Before,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=11.5, rate=24.0),
      @range.Begins,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=11.5, rate=24.0),
      @range.Finishes,
    )
    .unwrap(),
    false,
  )
  let actual_range = @opentime.from_start_end(a.start_time, b.start_time)
  let actual = actual_range.start_time
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual_range = @opentime.from_start_end(
    a.start_time,
    b.start_time,
    inclusive=true,
  )
  let actual = actual_range.start_time
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 1.0)
  api_number(actual.rate, 24.0)
  let b = @opentime.TimeRange::new(
    start_time=@opentime.RationalTime::new(value=10.0, rate=24.0),
    duration=@opentime.RationalTime::new(value=25.0, rate=30.0),
  )
  let actual_range = a.extended_by(b)
  let actual = actual_range.start_time
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 20.0)
  api_number(actual.rate, 24.0)
  let actual_range = a.clamp_range(b)
  let actual = actual_range.start_time
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 25.0)
  api_number(actual.rate, 30.0)
  assert_eq(a.relates(b, @range.Contains, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Before, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Meets, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Contains, epsilon=0.0), true)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.0), true)
  assert_eq(a.relates(b, @range.Before, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.0), true)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.0), true)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.0), true)
  assert_eq(
    a.relates(b, @range.Contains, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(
    a.relates(b, @range.Overlaps, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(a.relates(b, @range.Before, epsilon=2.6041666666666666e-06), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=2.6041666666666666e-06), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=2.6041666666666666e-06), false)
  assert_eq(
    a.relates(b, @range.Finishes, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(
    a.relates(b, @range.Intersects, epsilon=2.6041666666666666e-06),
    true,
  )
  assert_eq(a.relates(b, @range.Contains, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.1), true)
  assert_eq(a.relates(b, @range.Contains, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.0 / 0.0), false)
  let actual = a.clamp_time(@opentime.RationalTime::new(value=10.0, rate=24.0))
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Contains,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Overlaps,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Before,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Begins,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Finishes,
    )
    .unwrap(),
    false,
  )
  let actual = a.clamp_time(@opentime.RationalTime::new(value=37.5, rate=30.0))
  api_number(actual.value, 36.5)
  api_number(actual.rate, 30.0)
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=37.5, rate=30.0),
      @range.Contains,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=37.5, rate=30.0),
      @range.Overlaps,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=37.5, rate=30.0),
      @range.Before,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=37.5, rate=30.0),
      @range.Begins,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=37.5, rate=30.0),
      @range.Finishes,
    )
    .unwrap(),
    true,
  )
  let actual_range = @opentime.from_start_end(a.start_time, b.start_time)
  let actual = actual_range.start_time
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual_range = @opentime.from_start_end(
    a.start_time,
    b.start_time,
    inclusive=true,
  )
  let actual = actual_range.start_time
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 1.0)
  api_number(actual.rate, 24.0)
  let b = @opentime.TimeRange::new(
    start_time=@opentime.RationalTime::new(value=-10.0, rate=24.0),
    duration=@opentime.RationalTime::new(value=48.0, rate=48.0),
  )
  let actual_range = a.extended_by(b)
  let actual = actual_range.start_time
  api_number(actual.value, -10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 40.0)
  api_number(actual.rate, 24.0)
  let actual_range = a.clamp_range(b)
  let actual = actual_range.start_time
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 25.0)
  api_number(actual.rate, 30.0)
  assert_eq(a.relates(b, @range.Contains, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Before, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Contains, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.0), true)
  assert_eq(
    a.relates(b, @range.Contains, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(
    a.relates(b, @range.Overlaps, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(a.relates(b, @range.Before, epsilon=2.6041666666666666e-06), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=2.6041666666666666e-06), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=2.6041666666666666e-06), false)
  assert_eq(
    a.relates(b, @range.Finishes, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(
    a.relates(b, @range.Intersects, epsilon=2.6041666666666666e-06),
    true,
  )
  assert_eq(a.relates(b, @range.Contains, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.1), true)
  assert_eq(a.relates(b, @range.Contains, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.0 / 0.0), false)
  let actual = a.clamp_time(@opentime.RationalTime::new(value=-10.0, rate=24.0))
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=-10.0, rate=24.0),
      @range.Contains,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=-10.0, rate=24.0),
      @range.Overlaps,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=-10.0, rate=24.0),
      @range.Before,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=-10.0, rate=24.0),
      @range.Begins,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=-10.0, rate=24.0),
      @range.Finishes,
    )
    .unwrap(),
    false,
  )
  let actual = a.clamp_time(@opentime.RationalTime::new(value=28.0, rate=48.0))
  api_number(actual.value, 28.0)
  api_number(actual.rate, 48.0)
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=28.0, rate=48.0),
      @range.Contains,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=28.0, rate=48.0),
      @range.Overlaps,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=28.0, rate=48.0),
      @range.Before,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=28.0, rate=48.0),
      @range.Begins,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=28.0, rate=48.0),
      @range.Finishes,
    )
    .unwrap(),
    false,
  )
  let actual_range = @opentime.from_start_end(a.start_time, b.start_time)
  let actual = actual_range.start_time
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, -20.0)
  api_number(actual.rate, 24.0)
  let actual_range = @opentime.from_start_end(
    a.start_time,
    b.start_time,
    inclusive=true,
  )
  let actual = actual_range.start_time
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, -19.0)
  api_number(actual.rate, 24.0)
}

///|
test "range:4" {
  let a = @opentime.TimeRange::new(
    start_time=@opentime.RationalTime::new(value=-10.0, rate=24.0),
    duration=@opentime.RationalTime::new(value=48.0, rate=48.0),
  )
  assert_eq(a.is_valid_range(), true)
  assert_eq(a.is_invalid_range(), false)
  let actual = a.end_time_exclusive()
  api_number(actual.value, 28.0)
  api_number(actual.rate, 48.0)
  let actual = a.end_time_inclusive()
  api_number(actual.value, 27.0)
  api_number(actual.rate, 48.0)
  let actual_range = a.duration_extended_by(
    @opentime.RationalTime::new(value=-50.0, rate=30.0),
  )
  let actual = actual_range.start_time
  api_number(actual.value, -10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, -32.0)
  api_number(actual.rate, 48.0)
  let actual_range = a.duration_extended_by(
    @opentime.RationalTime::new(value=24.0, rate=24.0),
  )
  let actual = actual_range.start_time
  api_number(actual.value, -10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 96.0)
  api_number(actual.rate, 48.0)
  let b = @opentime.TimeRange::new(
    start_time=@opentime.RationalTime::new(value=0.0, rate=24.0),
    duration=@opentime.RationalTime::new(value=0.0, rate=24.0),
  )
  let actual_range = a.extended_by(b)
  let actual = actual_range.start_time
  api_number(actual.value, -10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 24.0)
  api_number(actual.rate, 24.0)
  let actual_range = a.clamp_range(b)
  let actual = actual_range.start_time
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  assert_eq(a.relates(b, @range.Contains, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Before, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Meets, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Contains, epsilon=0.0), true)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.0), true)
  assert_eq(a.relates(b, @range.Contains, epsilon=2.6041666666666666e-06), true)
  assert_eq(
    a.relates(b, @range.Overlaps, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(a.relates(b, @range.Before, epsilon=2.6041666666666666e-06), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=2.6041666666666666e-06), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=2.6041666666666666e-06), false)
  assert_eq(
    a.relates(b, @range.Finishes, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(
    a.relates(b, @range.Intersects, epsilon=2.6041666666666666e-06),
    true,
  )
  assert_eq(a.relates(b, @range.Contains, epsilon=0.1), true)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.1), true)
  assert_eq(a.relates(b, @range.Contains, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.0 / 0.0), false)
  let actual = a.clamp_time(@opentime.RationalTime::new(value=0.0, rate=24.0))
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=0.0, rate=24.0),
      @range.Contains,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=0.0, rate=24.0),
      @range.Overlaps,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=0.0, rate=24.0),
      @range.Before,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=0.0, rate=24.0),
      @range.Begins,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=0.0, rate=24.0),
      @range.Finishes,
    )
    .unwrap(),
    false,
  )
  let actual = a.clamp_time(@opentime.RationalTime::new(value=0.0, rate=24.0))
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=0.0, rate=24.0),
      @range.Contains,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=0.0, rate=24.0),
      @range.Overlaps,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=0.0, rate=24.0),
      @range.Before,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=0.0, rate=24.0),
      @range.Begins,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=0.0, rate=24.0),
      @range.Finishes,
    )
    .unwrap(),
    false,
  )
  let actual_range = @opentime.from_start_end(a.start_time, b.start_time)
  let actual = actual_range.start_time
  api_number(actual.value, -10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual_range = @opentime.from_start_end(
    a.start_time,
    b.start_time,
    inclusive=true,
  )
  let actual = actual_range.start_time
  api_number(actual.value, -10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 11.0)
  api_number(actual.rate, 24.0)
  let b = @opentime.TimeRange::new(
    start_time=@opentime.RationalTime::new(value=10.0, rate=24.0),
    duration=@opentime.RationalTime::new(value=1.0, rate=24.0),
  )
  let actual_range = a.extended_by(b)
  let actual = actual_range.start_time
  api_number(actual.value, -10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 24.0)
  api_number(actual.rate, 24.0)
  let actual_range = a.clamp_range(b)
  let actual = actual_range.start_time
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 1.0)
  api_number(actual.rate, 24.0)
  assert_eq(a.relates(b, @range.Contains, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Before, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Meets, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Contains, epsilon=0.0), true)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.0), true)
  assert_eq(a.relates(b, @range.Contains, epsilon=2.6041666666666666e-06), true)
  assert_eq(
    a.relates(b, @range.Overlaps, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(a.relates(b, @range.Before, epsilon=2.6041666666666666e-06), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=2.6041666666666666e-06), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=2.6041666666666666e-06), false)
  assert_eq(
    a.relates(b, @range.Finishes, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(
    a.relates(b, @range.Intersects, epsilon=2.6041666666666666e-06),
    true,
  )
  assert_eq(a.relates(b, @range.Contains, epsilon=0.1), true)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.1), true)
  assert_eq(a.relates(b, @range.Contains, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.0 / 0.0), false)
  let actual = a.clamp_time(@opentime.RationalTime::new(value=10.0, rate=24.0))
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Contains,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Overlaps,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Before,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Begins,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Finishes,
    )
    .unwrap(),
    false,
  )
  let actual = a.clamp_time(@opentime.RationalTime::new(value=11.0, rate=24.0))
  api_number(actual.value, 11.0)
  api_number(actual.rate, 24.0)
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=11.0, rate=24.0),
      @range.Contains,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=11.0, rate=24.0),
      @range.Overlaps,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=11.0, rate=24.0),
      @range.Before,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=11.0, rate=24.0),
      @range.Begins,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=11.0, rate=24.0),
      @range.Finishes,
    )
    .unwrap(),
    false,
  )
  let actual_range = @opentime.from_start_end(a.start_time, b.start_time)
  let actual = actual_range.start_time
  api_number(actual.value, -10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 20.0)
  api_number(actual.rate, 24.0)
  let actual_range = @opentime.from_start_end(
    a.start_time,
    b.start_time,
    inclusive=true,
  )
  let actual = actual_range.start_time
  api_number(actual.value, -10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 21.0)
  api_number(actual.rate, 24.0)
  let b = @opentime.TimeRange::new(
    start_time=@opentime.RationalTime::new(value=10.0, rate=24.0),
    duration=@opentime.RationalTime::new(value=1.5, rate=24.0),
  )
  let actual_range = a.extended_by(b)
  let actual = actual_range.start_time
  api_number(actual.value, -10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 24.0)
  api_number(actual.rate, 24.0)
  let actual_range = a.clamp_range(b)
  let actual = actual_range.start_time
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 1.5)
  api_number(actual.rate, 24.0)
  assert_eq(a.relates(b, @range.Contains, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Before, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Meets, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Contains, epsilon=0.0), true)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.0), true)
  assert_eq(a.relates(b, @range.Contains, epsilon=2.6041666666666666e-06), true)
  assert_eq(
    a.relates(b, @range.Overlaps, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(a.relates(b, @range.Before, epsilon=2.6041666666666666e-06), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=2.6041666666666666e-06), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=2.6041666666666666e-06), false)
  assert_eq(
    a.relates(b, @range.Finishes, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(
    a.relates(b, @range.Intersects, epsilon=2.6041666666666666e-06),
    true,
  )
  assert_eq(a.relates(b, @range.Contains, epsilon=0.1), true)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.1), true)
  assert_eq(a.relates(b, @range.Contains, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.0 / 0.0), false)
  let actual = a.clamp_time(@opentime.RationalTime::new(value=10.0, rate=24.0))
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Contains,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Overlaps,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Before,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Begins,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Finishes,
    )
    .unwrap(),
    false,
  )
  let actual = a.clamp_time(@opentime.RationalTime::new(value=11.5, rate=24.0))
  api_number(actual.value, 11.5)
  api_number(actual.rate, 24.0)
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=11.5, rate=24.0),
      @range.Contains,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=11.5, rate=24.0),
      @range.Overlaps,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=11.5, rate=24.0),
      @range.Before,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=11.5, rate=24.0),
      @range.Begins,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=11.5, rate=24.0),
      @range.Finishes,
    )
    .unwrap(),
    false,
  )
  let actual_range = @opentime.from_start_end(a.start_time, b.start_time)
  let actual = actual_range.start_time
  api_number(actual.value, -10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 20.0)
  api_number(actual.rate, 24.0)
  let actual_range = @opentime.from_start_end(
    a.start_time,
    b.start_time,
    inclusive=true,
  )
  let actual = actual_range.start_time
  api_number(actual.value, -10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 21.0)
  api_number(actual.rate, 24.0)
  let b = @opentime.TimeRange::new(
    start_time=@opentime.RationalTime::new(value=10.0, rate=24.0),
    duration=@opentime.RationalTime::new(value=25.0, rate=30.0),
  )
  let actual_range = a.extended_by(b)
  let actual = actual_range.start_time
  api_number(actual.value, -10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 40.0)
  api_number(actual.rate, 24.0)
  let actual_range = a.clamp_range(b)
  let actual = actual_range.start_time
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 8.0)
  api_number(actual.rate, 48.0)
  assert_eq(a.relates(b, @range.Contains, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Before, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Meets, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Contains, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.0), true)
  assert_eq(a.relates(b, @range.Before, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.0), true)
  assert_eq(
    a.relates(b, @range.Contains, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(a.relates(b, @range.Overlaps, epsilon=2.6041666666666666e-06), true)
  assert_eq(a.relates(b, @range.Before, epsilon=2.6041666666666666e-06), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=2.6041666666666666e-06), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=2.6041666666666666e-06), false)
  assert_eq(
    a.relates(b, @range.Finishes, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(
    a.relates(b, @range.Intersects, epsilon=2.6041666666666666e-06),
    true,
  )
  assert_eq(a.relates(b, @range.Contains, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.1), true)
  assert_eq(a.relates(b, @range.Before, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.1), true)
  assert_eq(a.relates(b, @range.Contains, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.0 / 0.0), false)
  let actual = a.clamp_time(@opentime.RationalTime::new(value=10.0, rate=24.0))
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Contains,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Overlaps,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Before,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Begins,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Finishes,
    )
    .unwrap(),
    false,
  )
  let actual = a.clamp_time(@opentime.RationalTime::new(value=37.5, rate=30.0))
  api_number(actual.value, 27.0)
  api_number(actual.rate, 48.0)
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=37.5, rate=30.0),
      @range.Contains,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=37.5, rate=30.0),
      @range.Overlaps,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=37.5, rate=30.0),
      @range.Before,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=37.5, rate=30.0),
      @range.Begins,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=37.5, rate=30.0),
      @range.Finishes,
    )
    .unwrap(),
    false,
  )
  let actual_range = @opentime.from_start_end(a.start_time, b.start_time)
  let actual = actual_range.start_time
  api_number(actual.value, -10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 20.0)
  api_number(actual.rate, 24.0)
  let actual_range = @opentime.from_start_end(
    a.start_time,
    b.start_time,
    inclusive=true,
  )
  let actual = actual_range.start_time
  api_number(actual.value, -10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 21.0)
  api_number(actual.rate, 24.0)
  let b = @opentime.TimeRange::new(
    start_time=@opentime.RationalTime::new(value=-10.0, rate=24.0),
    duration=@opentime.RationalTime::new(value=48.0, rate=48.0),
  )
  let actual_range = a.extended_by(b)
  let actual = actual_range.start_time
  api_number(actual.value, -10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 24.0)
  api_number(actual.rate, 24.0)
  let actual_range = a.clamp_range(b)
  let actual = actual_range.start_time
  api_number(actual.value, -10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 48.0)
  api_number(actual.rate, 48.0)
  assert_eq(a.relates(b, @range.Contains, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Before, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Meets, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Contains, epsilon=0.0), true)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.0), true)
  assert_eq(a.relates(b, @range.Before, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.0), true)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.0), true)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.0), true)
  assert_eq(
    a.relates(b, @range.Contains, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(
    a.relates(b, @range.Overlaps, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(a.relates(b, @range.Before, epsilon=2.6041666666666666e-06), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=2.6041666666666666e-06), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=2.6041666666666666e-06), false)
  assert_eq(
    a.relates(b, @range.Finishes, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(
    a.relates(b, @range.Intersects, epsilon=2.6041666666666666e-06),
    true,
  )
  assert_eq(a.relates(b, @range.Contains, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.1), true)
  assert_eq(a.relates(b, @range.Contains, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.0 / 0.0), false)
  let actual = a.clamp_time(@opentime.RationalTime::new(value=-10.0, rate=24.0))
  api_number(actual.value, -10.0)
  api_number(actual.rate, 24.0)
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=-10.0, rate=24.0),
      @range.Contains,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=-10.0, rate=24.0),
      @range.Overlaps,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=-10.0, rate=24.0),
      @range.Before,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=-10.0, rate=24.0),
      @range.Begins,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=-10.0, rate=24.0),
      @range.Finishes,
    )
    .unwrap(),
    false,
  )
  let actual = a.clamp_time(@opentime.RationalTime::new(value=28.0, rate=48.0))
  api_number(actual.value, 27.0)
  api_number(actual.rate, 48.0)
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=28.0, rate=48.0),
      @range.Contains,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=28.0, rate=48.0),
      @range.Overlaps,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=28.0, rate=48.0),
      @range.Before,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=28.0, rate=48.0),
      @range.Begins,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=28.0, rate=48.0),
      @range.Finishes,
    )
    .unwrap(),
    true,
  )
  let actual_range = @opentime.from_start_end(a.start_time, b.start_time)
  let actual = actual_range.start_time
  api_number(actual.value, -10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual_range = @opentime.from_start_end(
    a.start_time,
    b.start_time,
    inclusive=true,
  )
  let actual = actual_range.start_time
  api_number(actual.value, -10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 1.0)
  api_number(actual.rate, 24.0)
}

///|
test "range:5" {
  let a = @opentime.TimeRange::new(
    start_time=@opentime.RationalTime::new(value=0.0, rate=24.0),
    duration=@opentime.RationalTime::new(value=-3.0, rate=24.0),
  )
  assert_eq(a.is_valid_range(), false)
  assert_eq(a.is_invalid_range(), true)
  let actual = a.end_time_exclusive()
  api_number(actual.value, -3.0)
  api_number(actual.rate, 24.0)
  let actual = a.end_time_inclusive()
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual_range = a.duration_extended_by(
    @opentime.RationalTime::new(value=-50.0, rate=30.0),
  )
  let actual = actual_range.start_time
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, -53.75)
  api_number(actual.rate, 30.0)
  let actual_range = a.duration_extended_by(
    @opentime.RationalTime::new(value=24.0, rate=24.0),
  )
  let actual = actual_range.start_time
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 21.0)
  api_number(actual.rate, 24.0)
  let b = @opentime.TimeRange::new(
    start_time=@opentime.RationalTime::new(value=0.0, rate=24.0),
    duration=@opentime.RationalTime::new(value=0.0, rate=24.0),
  )
  let actual_range = a.extended_by(b)
  let actual = actual_range.start_time
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual_range = a.clamp_range(b)
  let actual = actual_range.start_time
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, -3.0)
  api_number(actual.rate, 24.0)
  assert_eq(a.relates(b, @range.Contains, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Before, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Meets, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Contains, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.0), true)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.0), true)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.0), false)
  assert_eq(
    a.relates(b, @range.Contains, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(
    a.relates(b, @range.Overlaps, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(a.relates(b, @range.Before, epsilon=2.6041666666666666e-06), true)
  assert_eq(a.relates(b, @range.Meets, epsilon=2.6041666666666666e-06), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=2.6041666666666666e-06), true)
  assert_eq(
    a.relates(b, @range.Finishes, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(
    a.relates(b, @range.Intersects, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(a.relates(b, @range.Contains, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.1), true)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.1), true)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Contains, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.0 / 0.0), false)
  let actual = a.clamp_time(@opentime.RationalTime::new(value=0.0, rate=24.0))
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=0.0, rate=24.0),
      @range.Contains,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=0.0, rate=24.0),
      @range.Overlaps,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=0.0, rate=24.0),
      @range.Before,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=0.0, rate=24.0),
      @range.Begins,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=0.0, rate=24.0),
      @range.Finishes,
    )
    .unwrap(),
    false,
  )
  let actual = a.clamp_time(@opentime.RationalTime::new(value=0.0, rate=24.0))
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=0.0, rate=24.0),
      @range.Contains,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=0.0, rate=24.0),
      @range.Overlaps,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=0.0, rate=24.0),
      @range.Before,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=0.0, rate=24.0),
      @range.Begins,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=0.0, rate=24.0),
      @range.Finishes,
    )
    .unwrap(),
    false,
  )
  let actual_range = @opentime.from_start_end(a.start_time, b.start_time)
  let actual = actual_range.start_time
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual_range = @opentime.from_start_end(
    a.start_time,
    b.start_time,
    inclusive=true,
  )
  let actual = actual_range.start_time
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 1.0)
  api_number(actual.rate, 24.0)
  let b = @opentime.TimeRange::new(
    start_time=@opentime.RationalTime::new(value=10.0, rate=24.0),
    duration=@opentime.RationalTime::new(value=1.0, rate=24.0),
  )
  let actual_range = a.extended_by(b)
  let actual = actual_range.start_time
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 11.0)
  api_number(actual.rate, 24.0)
  let actual_range = a.clamp_range(b)
  let actual = actual_range.start_time
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, -13.0)
  api_number(actual.rate, 24.0)
  assert_eq(a.relates(b, @range.Contains, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Before, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Meets, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Contains, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.0), true)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.0), false)
  assert_eq(
    a.relates(b, @range.Contains, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(
    a.relates(b, @range.Overlaps, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(a.relates(b, @range.Before, epsilon=2.6041666666666666e-06), true)
  assert_eq(a.relates(b, @range.Meets, epsilon=2.6041666666666666e-06), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=2.6041666666666666e-06), false)
  assert_eq(
    a.relates(b, @range.Finishes, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(
    a.relates(b, @range.Intersects, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(a.relates(b, @range.Contains, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.1), true)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Contains, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.0 / 0.0), false)
  let actual = a.clamp_time(@opentime.RationalTime::new(value=10.0, rate=24.0))
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Contains,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Overlaps,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Before,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Begins,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Finishes,
    )
    .unwrap(),
    false,
  )
  let actual = a.clamp_time(@opentime.RationalTime::new(value=11.0, rate=24.0))
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=11.0, rate=24.0),
      @range.Contains,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=11.0, rate=24.0),
      @range.Overlaps,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=11.0, rate=24.0),
      @range.Before,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=11.0, rate=24.0),
      @range.Begins,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=11.0, rate=24.0),
      @range.Finishes,
    )
    .unwrap(),
    false,
  )
  let actual_range = @opentime.from_start_end(a.start_time, b.start_time)
  let actual = actual_range.start_time
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual_range = @opentime.from_start_end(
    a.start_time,
    b.start_time,
    inclusive=true,
  )
  let actual = actual_range.start_time
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 11.0)
  api_number(actual.rate, 24.0)
  let b = @opentime.TimeRange::new(
    start_time=@opentime.RationalTime::new(value=10.0, rate=24.0),
    duration=@opentime.RationalTime::new(value=1.5, rate=24.0),
  )
  let actual_range = a.extended_by(b)
  let actual = actual_range.start_time
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 11.5)
  api_number(actual.rate, 24.0)
  let actual_range = a.clamp_range(b)
  let actual = actual_range.start_time
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, -13.0)
  api_number(actual.rate, 24.0)
  assert_eq(a.relates(b, @range.Contains, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Before, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Meets, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Contains, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.0), true)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.0), false)
  assert_eq(
    a.relates(b, @range.Contains, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(
    a.relates(b, @range.Overlaps, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(a.relates(b, @range.Before, epsilon=2.6041666666666666e-06), true)
  assert_eq(a.relates(b, @range.Meets, epsilon=2.6041666666666666e-06), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=2.6041666666666666e-06), false)
  assert_eq(
    a.relates(b, @range.Finishes, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(
    a.relates(b, @range.Intersects, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(a.relates(b, @range.Contains, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.1), true)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Contains, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.0 / 0.0), false)
  let actual = a.clamp_time(@opentime.RationalTime::new(value=10.0, rate=24.0))
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Contains,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Overlaps,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Before,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Begins,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Finishes,
    )
    .unwrap(),
    false,
  )
  let actual = a.clamp_time(@opentime.RationalTime::new(value=11.5, rate=24.0))
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=11.5, rate=24.0),
      @range.Contains,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=11.5, rate=24.0),
      @range.Overlaps,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=11.5, rate=24.0),
      @range.Before,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=11.5, rate=24.0),
      @range.Begins,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=11.5, rate=24.0),
      @range.Finishes,
    )
    .unwrap(),
    false,
  )
  let actual_range = @opentime.from_start_end(a.start_time, b.start_time)
  let actual = actual_range.start_time
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual_range = @opentime.from_start_end(
    a.start_time,
    b.start_time,
    inclusive=true,
  )
  let actual = actual_range.start_time
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 11.0)
  api_number(actual.rate, 24.0)
  let b = @opentime.TimeRange::new(
    start_time=@opentime.RationalTime::new(value=10.0, rate=24.0),
    duration=@opentime.RationalTime::new(value=25.0, rate=30.0),
  )
  let actual_range = a.extended_by(b)
  let actual = actual_range.start_time
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 30.0)
  api_number(actual.rate, 24.0)
  let actual_range = a.clamp_range(b)
  let actual = actual_range.start_time
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, -13.0)
  api_number(actual.rate, 24.0)
  assert_eq(a.relates(b, @range.Contains, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Before, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Meets, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Contains, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.0), true)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.0), false)
  assert_eq(
    a.relates(b, @range.Contains, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(
    a.relates(b, @range.Overlaps, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(a.relates(b, @range.Before, epsilon=2.6041666666666666e-06), true)
  assert_eq(a.relates(b, @range.Meets, epsilon=2.6041666666666666e-06), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=2.6041666666666666e-06), false)
  assert_eq(
    a.relates(b, @range.Finishes, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(
    a.relates(b, @range.Intersects, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(a.relates(b, @range.Contains, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.1), true)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Contains, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.0 / 0.0), false)
  let actual = a.clamp_time(@opentime.RationalTime::new(value=10.0, rate=24.0))
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Contains,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Overlaps,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Before,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Begins,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Finishes,
    )
    .unwrap(),
    false,
  )
  let actual = a.clamp_time(@opentime.RationalTime::new(value=37.5, rate=30.0))
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=37.5, rate=30.0),
      @range.Contains,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=37.5, rate=30.0),
      @range.Overlaps,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=37.5, rate=30.0),
      @range.Before,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=37.5, rate=30.0),
      @range.Begins,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=37.5, rate=30.0),
      @range.Finishes,
    )
    .unwrap(),
    false,
  )
  let actual_range = @opentime.from_start_end(a.start_time, b.start_time)
  let actual = actual_range.start_time
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual_range = @opentime.from_start_end(
    a.start_time,
    b.start_time,
    inclusive=true,
  )
  let actual = actual_range.start_time
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 11.0)
  api_number(actual.rate, 24.0)
  let b = @opentime.TimeRange::new(
    start_time=@opentime.RationalTime::new(value=-10.0, rate=24.0),
    duration=@opentime.RationalTime::new(value=48.0, rate=48.0),
  )
  let actual_range = a.extended_by(b)
  let actual = actual_range.start_time
  api_number(actual.value, -10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 24.0)
  api_number(actual.rate, 24.0)
  let actual_range = a.clamp_range(b)
  let actual = actual_range.start_time
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, -3.0)
  api_number(actual.rate, 24.0)
  assert_eq(a.relates(b, @range.Contains, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Before, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Meets, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Contains, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.0), true)
  assert_eq(
    a.relates(b, @range.Contains, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(
    a.relates(b, @range.Overlaps, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(a.relates(b, @range.Before, epsilon=2.6041666666666666e-06), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=2.6041666666666666e-06), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=2.6041666666666666e-06), false)
  assert_eq(
    a.relates(b, @range.Finishes, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(
    a.relates(b, @range.Intersects, epsilon=2.6041666666666666e-06),
    true,
  )
  assert_eq(a.relates(b, @range.Contains, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.1), true)
  assert_eq(a.relates(b, @range.Contains, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.0 / 0.0), false)
  let actual = a.clamp_time(@opentime.RationalTime::new(value=-10.0, rate=24.0))
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=-10.0, rate=24.0),
      @range.Contains,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=-10.0, rate=24.0),
      @range.Overlaps,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=-10.0, rate=24.0),
      @range.Before,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=-10.0, rate=24.0),
      @range.Begins,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=-10.0, rate=24.0),
      @range.Finishes,
    )
    .unwrap(),
    false,
  )
  let actual = a.clamp_time(@opentime.RationalTime::new(value=28.0, rate=48.0))
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=28.0, rate=48.0),
      @range.Contains,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=28.0, rate=48.0),
      @range.Overlaps,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=28.0, rate=48.0),
      @range.Before,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=28.0, rate=48.0),
      @range.Begins,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=28.0, rate=48.0),
      @range.Finishes,
    )
    .unwrap(),
    false,
  )
  let actual_range = @opentime.from_start_end(a.start_time, b.start_time)
  let actual = actual_range.start_time
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, -10.0)
  api_number(actual.rate, 24.0)
  let actual_range = @opentime.from_start_end(
    a.start_time,
    b.start_time,
    inclusive=true,
  )
  let actual = actual_range.start_time
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, -9.0)
  api_number(actual.rate, 24.0)
}

///|
test "range:6" {
  let a = @opentime.TimeRange::new(
    start_time=@opentime.RationalTime::new(value=0.0, rate=0.0),
    duration=@opentime.RationalTime::new(value=1.0, rate=24.0),
  )
  assert_eq(a.is_valid_range(), false)
  assert_eq(a.is_invalid_range(), true)
  let actual = a.end_time_exclusive()
  api_number(actual.value, 0.0 / 0.0)
  api_number(actual.rate, 24.0)
  let actual = a.end_time_inclusive()
  api_number(actual.value, 0.0)
  api_number(actual.rate, 0.0)
  let actual_range = a.duration_extended_by(
    @opentime.RationalTime::new(value=-50.0, rate=30.0),
  )
  let actual = actual_range.start_time
  api_number(actual.value, 0.0)
  api_number(actual.rate, 0.0)
  let actual = actual_range.duration
  api_number(actual.value, -48.75)
  api_number(actual.rate, 30.0)
  let actual_range = a.duration_extended_by(
    @opentime.RationalTime::new(value=24.0, rate=24.0),
  )
  let actual = actual_range.start_time
  api_number(actual.value, 0.0)
  api_number(actual.rate, 0.0)
  let actual = actual_range.duration
  api_number(actual.value, 25.0)
  api_number(actual.rate, 24.0)
  let b = @opentime.TimeRange::new(
    start_time=@opentime.RationalTime::new(value=0.0, rate=24.0),
    duration=@opentime.RationalTime::new(value=0.0, rate=24.0),
  )
  let actual_range = a.extended_by(b)
  let actual = actual_range.start_time
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual_range = a.clamp_range(b)
  let actual = actual_range.start_time
  api_number(actual.value, 0.0)
  api_number(actual.rate, 0.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.0 / 0.0)
  api_number(actual.rate, 24.0)
  assert_eq(a.relates(b, @range.Contains, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Before, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Contains, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.0), false)
  assert_eq(
    a.relates(b, @range.Contains, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(
    a.relates(b, @range.Overlaps, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(a.relates(b, @range.Before, epsilon=2.6041666666666666e-06), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=2.6041666666666666e-06), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=2.6041666666666666e-06), false)
  assert_eq(
    a.relates(b, @range.Finishes, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(
    a.relates(b, @range.Intersects, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(a.relates(b, @range.Contains, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Contains, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.0 / 0.0), false)
  let actual = a.clamp_time(@opentime.RationalTime::new(value=0.0, rate=24.0))
  api_number(actual.value, 0.0)
  api_number(actual.rate, 0.0)
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=0.0, rate=24.0),
      @range.Contains,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=0.0, rate=24.0),
      @range.Overlaps,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=0.0, rate=24.0),
      @range.Before,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=0.0, rate=24.0),
      @range.Begins,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=0.0, rate=24.0),
      @range.Finishes,
    )
    .unwrap(),
    false,
  )
  let actual = a.clamp_time(@opentime.RationalTime::new(value=0.0, rate=24.0))
  api_number(actual.value, 0.0)
  api_number(actual.rate, 0.0)
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=0.0, rate=24.0),
      @range.Contains,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=0.0, rate=24.0),
      @range.Overlaps,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=0.0, rate=24.0),
      @range.Before,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=0.0, rate=24.0),
      @range.Begins,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=0.0, rate=24.0),
      @range.Finishes,
    )
    .unwrap(),
    false,
  )
  let actual_range = @opentime.from_start_end(a.start_time, b.start_time)
  let actual = actual_range.start_time
  api_number(actual.value, 0.0)
  api_number(actual.rate, 0.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.0)
  api_number(actual.rate, 0.0)
  let actual_range = @opentime.from_start_end(
    a.start_time,
    b.start_time,
    inclusive=true,
  )
  let actual = actual_range.start_time
  api_number(actual.value, 0.0)
  api_number(actual.rate, 0.0)
  let actual = actual_range.duration
  api_number(actual.value, 1.0)
  api_number(actual.rate, 0.0)
  let b = @opentime.TimeRange::new(
    start_time=@opentime.RationalTime::new(value=10.0, rate=24.0),
    duration=@opentime.RationalTime::new(value=1.0, rate=24.0),
  )
  let actual_range = a.extended_by(b)
  let actual = actual_range.start_time
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 1.0)
  api_number(actual.rate, 24.0)
  let actual_range = a.clamp_range(b)
  let actual = actual_range.start_time
  api_number(actual.value, 0.0)
  api_number(actual.rate, 0.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.0 / 0.0)
  api_number(actual.rate, 24.0)
  assert_eq(a.relates(b, @range.Contains, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Before, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Contains, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.0), false)
  assert_eq(
    a.relates(b, @range.Contains, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(
    a.relates(b, @range.Overlaps, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(a.relates(b, @range.Before, epsilon=2.6041666666666666e-06), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=2.6041666666666666e-06), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=2.6041666666666666e-06), false)
  assert_eq(
    a.relates(b, @range.Finishes, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(
    a.relates(b, @range.Intersects, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(a.relates(b, @range.Contains, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Contains, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.0 / 0.0), false)
  let actual = a.clamp_time(@opentime.RationalTime::new(value=10.0, rate=24.0))
  api_number(actual.value, 0.0)
  api_number(actual.rate, 0.0)
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Contains,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Overlaps,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Before,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Begins,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Finishes,
    )
    .unwrap(),
    false,
  )
  let actual = a.clamp_time(@opentime.RationalTime::new(value=11.0, rate=24.0))
  api_number(actual.value, 0.0)
  api_number(actual.rate, 0.0)
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=11.0, rate=24.0),
      @range.Contains,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=11.0, rate=24.0),
      @range.Overlaps,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=11.0, rate=24.0),
      @range.Before,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=11.0, rate=24.0),
      @range.Begins,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=11.0, rate=24.0),
      @range.Finishes,
    )
    .unwrap(),
    false,
  )
  let actual_range = @opentime.from_start_end(a.start_time, b.start_time)
  let actual = actual_range.start_time
  api_number(actual.value, 0.0)
  api_number(actual.rate, 0.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.0)
  api_number(actual.rate, 0.0)
  let actual_range = @opentime.from_start_end(
    a.start_time,
    b.start_time,
    inclusive=true,
  )
  let actual = actual_range.start_time
  api_number(actual.value, 0.0)
  api_number(actual.rate, 0.0)
  let actual = actual_range.duration
  api_number(actual.value, 1.0)
  api_number(actual.rate, 0.0)
  let b = @opentime.TimeRange::new(
    start_time=@opentime.RationalTime::new(value=10.0, rate=24.0),
    duration=@opentime.RationalTime::new(value=1.5, rate=24.0),
  )
  let actual_range = a.extended_by(b)
  let actual = actual_range.start_time
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 1.5)
  api_number(actual.rate, 24.0)
  let actual_range = a.clamp_range(b)
  let actual = actual_range.start_time
  api_number(actual.value, 0.0)
  api_number(actual.rate, 0.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.0 / 0.0)
  api_number(actual.rate, 24.0)
  assert_eq(a.relates(b, @range.Contains, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Before, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Contains, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.0), false)
  assert_eq(
    a.relates(b, @range.Contains, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(
    a.relates(b, @range.Overlaps, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(a.relates(b, @range.Before, epsilon=2.6041666666666666e-06), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=2.6041666666666666e-06), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=2.6041666666666666e-06), false)
  assert_eq(
    a.relates(b, @range.Finishes, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(
    a.relates(b, @range.Intersects, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(a.relates(b, @range.Contains, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Contains, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.0 / 0.0), false)
  let actual = a.clamp_time(@opentime.RationalTime::new(value=10.0, rate=24.0))
  api_number(actual.value, 0.0)
  api_number(actual.rate, 0.0)
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Contains,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Overlaps,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Before,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Begins,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Finishes,
    )
    .unwrap(),
    false,
  )
  let actual = a.clamp_time(@opentime.RationalTime::new(value=11.5, rate=24.0))
  api_number(actual.value, 0.0)
  api_number(actual.rate, 0.0)
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=11.5, rate=24.0),
      @range.Contains,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=11.5, rate=24.0),
      @range.Overlaps,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=11.5, rate=24.0),
      @range.Before,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=11.5, rate=24.0),
      @range.Begins,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=11.5, rate=24.0),
      @range.Finishes,
    )
    .unwrap(),
    false,
  )
  let actual_range = @opentime.from_start_end(a.start_time, b.start_time)
  let actual = actual_range.start_time
  api_number(actual.value, 0.0)
  api_number(actual.rate, 0.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.0)
  api_number(actual.rate, 0.0)
  let actual_range = @opentime.from_start_end(
    a.start_time,
    b.start_time,
    inclusive=true,
  )
  let actual = actual_range.start_time
  api_number(actual.value, 0.0)
  api_number(actual.rate, 0.0)
  let actual = actual_range.duration
  api_number(actual.value, 1.0)
  api_number(actual.rate, 0.0)
  let b = @opentime.TimeRange::new(
    start_time=@opentime.RationalTime::new(value=10.0, rate=24.0),
    duration=@opentime.RationalTime::new(value=25.0, rate=30.0),
  )
  let actual_range = a.extended_by(b)
  let actual = actual_range.start_time
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 20.0)
  api_number(actual.rate, 24.0)
  let actual_range = a.clamp_range(b)
  let actual = actual_range.start_time
  api_number(actual.value, 0.0)
  api_number(actual.rate, 0.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.0 / 0.0)
  api_number(actual.rate, 24.0)
  assert_eq(a.relates(b, @range.Contains, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Before, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Contains, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.0), false)
  assert_eq(
    a.relates(b, @range.Contains, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(
    a.relates(b, @range.Overlaps, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(a.relates(b, @range.Before, epsilon=2.6041666666666666e-06), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=2.6041666666666666e-06), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=2.6041666666666666e-06), false)
  assert_eq(
    a.relates(b, @range.Finishes, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(
    a.relates(b, @range.Intersects, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(a.relates(b, @range.Contains, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Contains, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.0 / 0.0), false)
  let actual = a.clamp_time(@opentime.RationalTime::new(value=10.0, rate=24.0))
  api_number(actual.value, 0.0)
  api_number(actual.rate, 0.0)
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Contains,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Overlaps,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Before,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Begins,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Finishes,
    )
    .unwrap(),
    false,
  )
  let actual = a.clamp_time(@opentime.RationalTime::new(value=37.5, rate=30.0))
  api_number(actual.value, 0.0)
  api_number(actual.rate, 0.0)
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=37.5, rate=30.0),
      @range.Contains,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=37.5, rate=30.0),
      @range.Overlaps,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=37.5, rate=30.0),
      @range.Before,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=37.5, rate=30.0),
      @range.Begins,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=37.5, rate=30.0),
      @range.Finishes,
    )
    .unwrap(),
    false,
  )
  let actual_range = @opentime.from_start_end(a.start_time, b.start_time)
  let actual = actual_range.start_time
  api_number(actual.value, 0.0)
  api_number(actual.rate, 0.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.0)
  api_number(actual.rate, 0.0)
  let actual_range = @opentime.from_start_end(
    a.start_time,
    b.start_time,
    inclusive=true,
  )
  let actual = actual_range.start_time
  api_number(actual.value, 0.0)
  api_number(actual.rate, 0.0)
  let actual = actual_range.duration
  api_number(actual.value, 1.0)
  api_number(actual.rate, 0.0)
  let b = @opentime.TimeRange::new(
    start_time=@opentime.RationalTime::new(value=-10.0, rate=24.0),
    duration=@opentime.RationalTime::new(value=48.0, rate=48.0),
  )
  let actual_range = a.extended_by(b)
  let actual = actual_range.start_time
  api_number(actual.value, -10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 24.0)
  api_number(actual.rate, 24.0)
  let actual_range = a.clamp_range(b)
  let actual = actual_range.start_time
  api_number(actual.value, 0.0)
  api_number(actual.rate, 0.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.0 / 0.0)
  api_number(actual.rate, 24.0)
  assert_eq(a.relates(b, @range.Contains, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Before, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Contains, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.0), false)
  assert_eq(
    a.relates(b, @range.Contains, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(
    a.relates(b, @range.Overlaps, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(a.relates(b, @range.Before, epsilon=2.6041666666666666e-06), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=2.6041666666666666e-06), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=2.6041666666666666e-06), false)
  assert_eq(
    a.relates(b, @range.Finishes, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(
    a.relates(b, @range.Intersects, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(a.relates(b, @range.Contains, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Contains, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.0 / 0.0), false)
  let actual = a.clamp_time(@opentime.RationalTime::new(value=-10.0, rate=24.0))
  api_number(actual.value, 0.0)
  api_number(actual.rate, 0.0)
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=-10.0, rate=24.0),
      @range.Contains,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=-10.0, rate=24.0),
      @range.Overlaps,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=-10.0, rate=24.0),
      @range.Before,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=-10.0, rate=24.0),
      @range.Begins,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=-10.0, rate=24.0),
      @range.Finishes,
    )
    .unwrap(),
    false,
  )
  let actual = a.clamp_time(@opentime.RationalTime::new(value=28.0, rate=48.0))
  api_number(actual.value, 0.0)
  api_number(actual.rate, 0.0)
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=28.0, rate=48.0),
      @range.Contains,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=28.0, rate=48.0),
      @range.Overlaps,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=28.0, rate=48.0),
      @range.Before,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=28.0, rate=48.0),
      @range.Begins,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=28.0, rate=48.0),
      @range.Finishes,
    )
    .unwrap(),
    false,
  )
  let actual_range = @opentime.from_start_end(a.start_time, b.start_time)
  let actual = actual_range.start_time
  api_number(actual.value, 0.0)
  api_number(actual.rate, 0.0)
  let actual = actual_range.duration
  api_number(actual.value, -0.0)
  api_number(actual.rate, 0.0)
  let actual_range = @opentime.from_start_end(
    a.start_time,
    b.start_time,
    inclusive=true,
  )
  let actual = actual_range.start_time
  api_number(actual.value, 0.0)
  api_number(actual.rate, 0.0)
  let actual = actual_range.duration
  api_number(actual.value, 1.0)
  api_number(actual.rate, 0.0)
}

///|
test "range:7" {
  let a = @opentime.TimeRange::new(
    start_time=@opentime.RationalTime::new(value=0.0, rate=24.0),
    duration=@opentime.RationalTime::new(value=1.0, rate=-1.0),
  )
  assert_eq(a.is_valid_range(), false)
  assert_eq(a.is_invalid_range(), true)
  let actual = a.end_time_exclusive()
  api_number(actual.value, 1.0)
  api_number(actual.rate, -1.0)
  let actual = a.end_time_inclusive()
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual_range = a.duration_extended_by(
    @opentime.RationalTime::new(value=-50.0, rate=30.0),
  )
  let actual = actual_range.start_time
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, -80.0)
  api_number(actual.rate, 30.0)
  let actual_range = a.duration_extended_by(
    @opentime.RationalTime::new(value=24.0, rate=24.0),
  )
  let actual = actual_range.start_time
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let b = @opentime.TimeRange::new(
    start_time=@opentime.RationalTime::new(value=0.0, rate=24.0),
    duration=@opentime.RationalTime::new(value=0.0, rate=24.0),
  )
  let actual_range = a.extended_by(b)
  let actual = actual_range.start_time
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual_range = a.clamp_range(b)
  let actual = actual_range.start_time
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, -24.0)
  api_number(actual.rate, 24.0)
  assert_eq(a.relates(b, @range.Contains, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Before, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Meets, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Contains, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.0), true)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.0), true)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.0), false)
  assert_eq(
    a.relates(b, @range.Contains, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(
    a.relates(b, @range.Overlaps, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(a.relates(b, @range.Before, epsilon=2.6041666666666666e-06), true)
  assert_eq(a.relates(b, @range.Meets, epsilon=2.6041666666666666e-06), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=2.6041666666666666e-06), true)
  assert_eq(
    a.relates(b, @range.Finishes, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(
    a.relates(b, @range.Intersects, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(a.relates(b, @range.Contains, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.1), true)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.1), true)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Contains, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.0 / 0.0), false)
  let actual = a.clamp_time(@opentime.RationalTime::new(value=0.0, rate=24.0))
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=0.0, rate=24.0),
      @range.Contains,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=0.0, rate=24.0),
      @range.Overlaps,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=0.0, rate=24.0),
      @range.Before,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=0.0, rate=24.0),
      @range.Begins,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=0.0, rate=24.0),
      @range.Finishes,
    )
    .unwrap(),
    false,
  )
  let actual = a.clamp_time(@opentime.RationalTime::new(value=0.0, rate=24.0))
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=0.0, rate=24.0),
      @range.Contains,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=0.0, rate=24.0),
      @range.Overlaps,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=0.0, rate=24.0),
      @range.Before,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=0.0, rate=24.0),
      @range.Begins,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=0.0, rate=24.0),
      @range.Finishes,
    )
    .unwrap(),
    false,
  )
  let actual_range = @opentime.from_start_end(a.start_time, b.start_time)
  let actual = actual_range.start_time
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual_range = @opentime.from_start_end(
    a.start_time,
    b.start_time,
    inclusive=true,
  )
  let actual = actual_range.start_time
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 1.0)
  api_number(actual.rate, 24.0)
  let b = @opentime.TimeRange::new(
    start_time=@opentime.RationalTime::new(value=10.0, rate=24.0),
    duration=@opentime.RationalTime::new(value=1.0, rate=24.0),
  )
  let actual_range = a.extended_by(b)
  let actual = actual_range.start_time
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 11.0)
  api_number(actual.rate, 24.0)
  let actual_range = a.clamp_range(b)
  let actual = actual_range.start_time
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, -34.0)
  api_number(actual.rate, 24.0)
  assert_eq(a.relates(b, @range.Contains, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Before, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Meets, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Contains, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.0), true)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.0), false)
  assert_eq(
    a.relates(b, @range.Contains, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(
    a.relates(b, @range.Overlaps, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(a.relates(b, @range.Before, epsilon=2.6041666666666666e-06), true)
  assert_eq(a.relates(b, @range.Meets, epsilon=2.6041666666666666e-06), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=2.6041666666666666e-06), false)
  assert_eq(
    a.relates(b, @range.Finishes, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(
    a.relates(b, @range.Intersects, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(a.relates(b, @range.Contains, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.1), true)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Contains, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.0 / 0.0), false)
  let actual = a.clamp_time(@opentime.RationalTime::new(value=10.0, rate=24.0))
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Contains,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Overlaps,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Before,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Begins,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Finishes,
    )
    .unwrap(),
    false,
  )
  let actual = a.clamp_time(@opentime.RationalTime::new(value=11.0, rate=24.0))
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=11.0, rate=24.0),
      @range.Contains,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=11.0, rate=24.0),
      @range.Overlaps,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=11.0, rate=24.0),
      @range.Before,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=11.0, rate=24.0),
      @range.Begins,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=11.0, rate=24.0),
      @range.Finishes,
    )
    .unwrap(),
    false,
  )
  let actual_range = @opentime.from_start_end(a.start_time, b.start_time)
  let actual = actual_range.start_time
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual_range = @opentime.from_start_end(
    a.start_time,
    b.start_time,
    inclusive=true,
  )
  let actual = actual_range.start_time
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 11.0)
  api_number(actual.rate, 24.0)
  let b = @opentime.TimeRange::new(
    start_time=@opentime.RationalTime::new(value=10.0, rate=24.0),
    duration=@opentime.RationalTime::new(value=1.5, rate=24.0),
  )
  let actual_range = a.extended_by(b)
  let actual = actual_range.start_time
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 11.5)
  api_number(actual.rate, 24.0)
  let actual_range = a.clamp_range(b)
  let actual = actual_range.start_time
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, -34.0)
  api_number(actual.rate, 24.0)
  assert_eq(a.relates(b, @range.Contains, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Before, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Meets, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Contains, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.0), true)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.0), false)
  assert_eq(
    a.relates(b, @range.Contains, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(
    a.relates(b, @range.Overlaps, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(a.relates(b, @range.Before, epsilon=2.6041666666666666e-06), true)
  assert_eq(a.relates(b, @range.Meets, epsilon=2.6041666666666666e-06), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=2.6041666666666666e-06), false)
  assert_eq(
    a.relates(b, @range.Finishes, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(
    a.relates(b, @range.Intersects, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(a.relates(b, @range.Contains, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.1), true)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Contains, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.0 / 0.0), false)
  let actual = a.clamp_time(@opentime.RationalTime::new(value=10.0, rate=24.0))
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Contains,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Overlaps,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Before,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Begins,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Finishes,
    )
    .unwrap(),
    false,
  )
  let actual = a.clamp_time(@opentime.RationalTime::new(value=11.5, rate=24.0))
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=11.5, rate=24.0),
      @range.Contains,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=11.5, rate=24.0),
      @range.Overlaps,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=11.5, rate=24.0),
      @range.Before,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=11.5, rate=24.0),
      @range.Begins,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=11.5, rate=24.0),
      @range.Finishes,
    )
    .unwrap(),
    false,
  )
  let actual_range = @opentime.from_start_end(a.start_time, b.start_time)
  let actual = actual_range.start_time
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual_range = @opentime.from_start_end(
    a.start_time,
    b.start_time,
    inclusive=true,
  )
  let actual = actual_range.start_time
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 11.0)
  api_number(actual.rate, 24.0)
  let b = @opentime.TimeRange::new(
    start_time=@opentime.RationalTime::new(value=10.0, rate=24.0),
    duration=@opentime.RationalTime::new(value=25.0, rate=30.0),
  )
  let actual_range = a.extended_by(b)
  let actual = actual_range.start_time
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 30.0)
  api_number(actual.rate, 24.0)
  let actual_range = a.clamp_range(b)
  let actual = actual_range.start_time
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, -34.0)
  api_number(actual.rate, 24.0)
  assert_eq(a.relates(b, @range.Contains, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Before, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Meets, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Contains, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.0), true)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.0), false)
  assert_eq(
    a.relates(b, @range.Contains, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(
    a.relates(b, @range.Overlaps, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(a.relates(b, @range.Before, epsilon=2.6041666666666666e-06), true)
  assert_eq(a.relates(b, @range.Meets, epsilon=2.6041666666666666e-06), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=2.6041666666666666e-06), false)
  assert_eq(
    a.relates(b, @range.Finishes, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(
    a.relates(b, @range.Intersects, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(a.relates(b, @range.Contains, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.1), true)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Contains, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.0 / 0.0), false)
  let actual = a.clamp_time(@opentime.RationalTime::new(value=10.0, rate=24.0))
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Contains,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Overlaps,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Before,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Begins,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=10.0, rate=24.0),
      @range.Finishes,
    )
    .unwrap(),
    false,
  )
  let actual = a.clamp_time(@opentime.RationalTime::new(value=37.5, rate=30.0))
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=37.5, rate=30.0),
      @range.Contains,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=37.5, rate=30.0),
      @range.Overlaps,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=37.5, rate=30.0),
      @range.Before,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=37.5, rate=30.0),
      @range.Begins,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=37.5, rate=30.0),
      @range.Finishes,
    )
    .unwrap(),
    false,
  )
  let actual_range = @opentime.from_start_end(a.start_time, b.start_time)
  let actual = actual_range.start_time
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 10.0)
  api_number(actual.rate, 24.0)
  let actual_range = @opentime.from_start_end(
    a.start_time,
    b.start_time,
    inclusive=true,
  )
  let actual = actual_range.start_time
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 11.0)
  api_number(actual.rate, 24.0)
  let b = @opentime.TimeRange::new(
    start_time=@opentime.RationalTime::new(value=-10.0, rate=24.0),
    duration=@opentime.RationalTime::new(value=48.0, rate=48.0),
  )
  let actual_range = a.extended_by(b)
  let actual = actual_range.start_time
  api_number(actual.value, -10.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 24.0)
  api_number(actual.rate, 24.0)
  let actual_range = a.clamp_range(b)
  let actual = actual_range.start_time
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, -24.0)
  api_number(actual.rate, 24.0)
  assert_eq(a.relates(b, @range.Contains, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Before, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Meets, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=-1.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=-1.0), true)
  assert_eq(a.relates(b, @range.Contains, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.0), true)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.0), false)
  assert_eq(
    a.relates(b, @range.Contains, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(
    a.relates(b, @range.Overlaps, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(a.relates(b, @range.Before, epsilon=2.6041666666666666e-06), true)
  assert_eq(a.relates(b, @range.Meets, epsilon=2.6041666666666666e-06), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=2.6041666666666666e-06), false)
  assert_eq(
    a.relates(b, @range.Finishes, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(
    a.relates(b, @range.Intersects, epsilon=2.6041666666666666e-06),
    false,
  )
  assert_eq(a.relates(b, @range.Contains, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.1), true)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.1), false)
  assert_eq(a.relates(b, @range.Contains, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Overlaps, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Before, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Meets, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Begins, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Finishes, epsilon=0.0 / 0.0), false)
  assert_eq(a.relates(b, @range.Intersects, epsilon=0.0 / 0.0), false)
  let actual = a.clamp_time(@opentime.RationalTime::new(value=-10.0, rate=24.0))
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=-10.0, rate=24.0),
      @range.Contains,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=-10.0, rate=24.0),
      @range.Overlaps,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=-10.0, rate=24.0),
      @range.Before,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=-10.0, rate=24.0),
      @range.Begins,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=-10.0, rate=24.0),
      @range.Finishes,
    )
    .unwrap(),
    false,
  )
  let actual = a.clamp_time(@opentime.RationalTime::new(value=28.0, rate=48.0))
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=28.0, rate=48.0),
      @range.Contains,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=28.0, rate=48.0),
      @range.Overlaps,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=28.0, rate=48.0),
      @range.Before,
    )
    .unwrap(),
    true,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=28.0, rate=48.0),
      @range.Begins,
    )
    .unwrap(),
    false,
  )
  assert_eq(
    a
    .relates_time(
      @opentime.RationalTime::new(value=28.0, rate=48.0),
      @range.Finishes,
    )
    .unwrap(),
    false,
  )
  let actual_range = @opentime.from_start_end(a.start_time, b.start_time)
  let actual = actual_range.start_time
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, -10.0)
  api_number(actual.rate, 24.0)
  let actual_range = @opentime.from_start_end(
    a.start_time,
    b.start_time,
    inclusive=true,
  )
  let actual = actual_range.start_time
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, -9.0)
  api_number(actual.rate, 24.0)
}
