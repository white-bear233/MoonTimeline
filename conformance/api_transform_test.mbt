// Generated from official OTIO 0.18.1 by tools/generate_api_tests.py.

///|
test "transform:0" {
  let t = @opentime.TimeTransform::new(
    offset=@opentime.RationalTime::new(value=12.0, rate=24.0),
    scale=-2.0,
    rate=-1.0,
  )
  let actual = t.apply_time(@opentime.RationalTime::new(value=50.0, rate=30.0))
  api_number(actual.value, -85.0)
  api_number(actual.rate, 30.0)
  let actual = t.apply_time(@opentime.RationalTime::new(value=3.0, rate=-1.0))
  api_number(actual.value, 156.0)
  api_number(actual.rate, 24.0)
  let actual = t.apply_time(@opentime.RationalTime::new(value=0.0, rate=0.0))
  api_number(actual.value, 0.0 / 0.0)
  api_number(actual.rate, 24.0)
  let actual_range = t.apply_range(
    @opentime.TimeRange::new(
      start_time=@opentime.RationalTime::new(value=0.0, rate=24.0),
      duration=@opentime.RationalTime::new(value=0.0, rate=24.0),
    ),
  )
  let actual = actual_range.start_time
  api_number(actual.value, 12.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual_range = t.apply_range(
    @opentime.TimeRange::new(
      start_time=@opentime.RationalTime::new(value=10.0, rate=24.0),
      duration=@opentime.RationalTime::new(value=1.0, rate=24.0),
    ),
  )
  let actual = actual_range.start_time
  api_number(actual.value, -8.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, -2.0)
  api_number(actual.rate, 24.0)
  let actual_range = t.apply_range(
    @opentime.TimeRange::new(
      start_time=@opentime.RationalTime::new(value=10.0, rate=24.0),
      duration=@opentime.RationalTime::new(value=1.5, rate=24.0),
    ),
  )
  let actual = actual_range.start_time
  api_number(actual.value, -8.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, -3.0)
  api_number(actual.rate, 24.0)
  let actual_transform = t.apply_transform(
    @opentime.TimeTransform::new(
      offset=@opentime.RationalTime::new(value=5.0, rate=30.0),
      scale=-1.0,
      rate=48.0,
    ),
  )
  api_number(actual_transform.scale, 2.0)
  api_number(actual_transform.rate, 48.0)
  let actual = actual_transform.offset
  api_number(actual.value, 20.0)
  api_number(actual.rate, 30.0)
}

///|
test "transform:1" {
  let t = @opentime.TimeTransform::new(
    offset=@opentime.RationalTime::new(value=12.0, rate=24.0),
    scale=-2.0,
    rate=0.0,
  )
  let actual = t.apply_time(@opentime.RationalTime::new(value=50.0, rate=30.0))
  api_number(actual.value, -85.0)
  api_number(actual.rate, 30.0)
  let actual = t.apply_time(@opentime.RationalTime::new(value=3.0, rate=-1.0))
  api_number(actual.value, 156.0)
  api_number(actual.rate, 24.0)
  let actual = t.apply_time(@opentime.RationalTime::new(value=0.0, rate=0.0))
  api_number(actual.value, 0.0 / 0.0)
  api_number(actual.rate, 24.0)
  let actual_range = t.apply_range(
    @opentime.TimeRange::new(
      start_time=@opentime.RationalTime::new(value=0.0, rate=24.0),
      duration=@opentime.RationalTime::new(value=0.0, rate=24.0),
    ),
  )
  let actual = actual_range.start_time
  api_number(actual.value, 12.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual_range = t.apply_range(
    @opentime.TimeRange::new(
      start_time=@opentime.RationalTime::new(value=10.0, rate=24.0),
      duration=@opentime.RationalTime::new(value=1.0, rate=24.0),
    ),
  )
  let actual = actual_range.start_time
  api_number(actual.value, -8.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, -2.0)
  api_number(actual.rate, 24.0)
  let actual_range = t.apply_range(
    @opentime.TimeRange::new(
      start_time=@opentime.RationalTime::new(value=10.0, rate=24.0),
      duration=@opentime.RationalTime::new(value=1.5, rate=24.0),
    ),
  )
  let actual = actual_range.start_time
  api_number(actual.value, -8.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, -3.0)
  api_number(actual.rate, 24.0)
  let actual_transform = t.apply_transform(
    @opentime.TimeTransform::new(
      offset=@opentime.RationalTime::new(value=5.0, rate=30.0),
      scale=-1.0,
      rate=48.0,
    ),
  )
  api_number(actual_transform.scale, 2.0)
  api_number(actual_transform.rate, 48.0)
  let actual = actual_transform.offset
  api_number(actual.value, 20.0)
  api_number(actual.rate, 30.0)
}

///|
test "transform:2" {
  let t = @opentime.TimeTransform::new(
    offset=@opentime.RationalTime::new(value=12.0, rate=24.0),
    scale=-2.0,
    rate=24.0,
  )
  let actual = t.apply_time(@opentime.RationalTime::new(value=50.0, rate=30.0))
  api_number(actual.value, -68.0)
  api_number(actual.rate, 24.0)
  let actual = t.apply_time(@opentime.RationalTime::new(value=3.0, rate=-1.0))
  api_number(actual.value, 156.0)
  api_number(actual.rate, 24.0)
  let actual = t.apply_time(@opentime.RationalTime::new(value=0.0, rate=0.0))
  api_number(actual.value, 0.0 / 0.0)
  api_number(actual.rate, 24.0)
  let actual_range = t.apply_range(
    @opentime.TimeRange::new(
      start_time=@opentime.RationalTime::new(value=0.0, rate=24.0),
      duration=@opentime.RationalTime::new(value=0.0, rate=24.0),
    ),
  )
  let actual = actual_range.start_time
  api_number(actual.value, 12.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual_range = t.apply_range(
    @opentime.TimeRange::new(
      start_time=@opentime.RationalTime::new(value=10.0, rate=24.0),
      duration=@opentime.RationalTime::new(value=1.0, rate=24.0),
    ),
  )
  let actual = actual_range.start_time
  api_number(actual.value, -8.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, -2.0)
  api_number(actual.rate, 24.0)
  let actual_range = t.apply_range(
    @opentime.TimeRange::new(
      start_time=@opentime.RationalTime::new(value=10.0, rate=24.0),
      duration=@opentime.RationalTime::new(value=1.5, rate=24.0),
    ),
  )
  let actual = actual_range.start_time
  api_number(actual.value, -8.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, -3.0)
  api_number(actual.rate, 24.0)
  let actual_transform = t.apply_transform(
    @opentime.TimeTransform::new(
      offset=@opentime.RationalTime::new(value=5.0, rate=30.0),
      scale=-1.0,
      rate=48.0,
    ),
  )
  api_number(actual_transform.scale, 2.0)
  api_number(actual_transform.rate, 24.0)
  let actual = actual_transform.offset
  api_number(actual.value, 20.0)
  api_number(actual.rate, 30.0)
}

///|
test "transform:3" {
  let t = @opentime.TimeTransform::new(
    offset=@opentime.RationalTime::new(value=12.0, rate=24.0),
    scale=-2.0,
    rate=60.0,
  )
  let actual = t.apply_time(@opentime.RationalTime::new(value=50.0, rate=30.0))
  api_number(actual.value, -170.0)
  api_number(actual.rate, 60.0)
  let actual = t.apply_time(@opentime.RationalTime::new(value=3.0, rate=-1.0))
  api_number(actual.value, 390.0)
  api_number(actual.rate, 60.0)
  let actual = t.apply_time(@opentime.RationalTime::new(value=0.0, rate=0.0))
  api_number(actual.value, 0.0 / 0.0)
  api_number(actual.rate, 60.0)
  let actual_range = t.apply_range(
    @opentime.TimeRange::new(
      start_time=@opentime.RationalTime::new(value=0.0, rate=24.0),
      duration=@opentime.RationalTime::new(value=0.0, rate=24.0),
    ),
  )
  let actual = actual_range.start_time
  api_number(actual.value, 30.0)
  api_number(actual.rate, 60.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.0)
  api_number(actual.rate, 60.0)
  let actual_range = t.apply_range(
    @opentime.TimeRange::new(
      start_time=@opentime.RationalTime::new(value=10.0, rate=24.0),
      duration=@opentime.RationalTime::new(value=1.0, rate=24.0),
    ),
  )
  let actual = actual_range.start_time
  api_number(actual.value, -20.0)
  api_number(actual.rate, 60.0)
  let actual = actual_range.duration
  api_number(actual.value, -5.0)
  api_number(actual.rate, 60.0)
  let actual_range = t.apply_range(
    @opentime.TimeRange::new(
      start_time=@opentime.RationalTime::new(value=10.0, rate=24.0),
      duration=@opentime.RationalTime::new(value=1.5, rate=24.0),
    ),
  )
  let actual = actual_range.start_time
  api_number(actual.value, -20.0)
  api_number(actual.rate, 60.0)
  let actual = actual_range.duration
  api_number(actual.value, -7.5)
  api_number(actual.rate, 60.0)
  let actual_transform = t.apply_transform(
    @opentime.TimeTransform::new(
      offset=@opentime.RationalTime::new(value=5.0, rate=30.0),
      scale=-1.0,
      rate=48.0,
    ),
  )
  api_number(actual_transform.scale, 2.0)
  api_number(actual_transform.rate, 60.0)
  let actual = actual_transform.offset
  api_number(actual.value, 20.0)
  api_number(actual.rate, 30.0)
}

///|
test "transform:4" {
  let t = @opentime.TimeTransform::new(
    offset=@opentime.RationalTime::new(value=12.0, rate=24.0),
    scale=0.0,
    rate=-1.0,
  )
  let actual = t.apply_time(@opentime.RationalTime::new(value=50.0, rate=30.0))
  api_number(actual.value, 15.0)
  api_number(actual.rate, 30.0)
  let actual = t.apply_time(@opentime.RationalTime::new(value=3.0, rate=-1.0))
  api_number(actual.value, 12.0)
  api_number(actual.rate, 24.0)
  let actual = t.apply_time(@opentime.RationalTime::new(value=0.0, rate=0.0))
  api_number(actual.value, 0.0 / 0.0)
  api_number(actual.rate, 24.0)
  let actual_range = t.apply_range(
    @opentime.TimeRange::new(
      start_time=@opentime.RationalTime::new(value=0.0, rate=24.0),
      duration=@opentime.RationalTime::new(value=0.0, rate=24.0),
    ),
  )
  let actual = actual_range.start_time
  api_number(actual.value, 12.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual_range = t.apply_range(
    @opentime.TimeRange::new(
      start_time=@opentime.RationalTime::new(value=10.0, rate=24.0),
      duration=@opentime.RationalTime::new(value=1.0, rate=24.0),
    ),
  )
  let actual = actual_range.start_time
  api_number(actual.value, 12.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual_range = t.apply_range(
    @opentime.TimeRange::new(
      start_time=@opentime.RationalTime::new(value=10.0, rate=24.0),
      duration=@opentime.RationalTime::new(value=1.5, rate=24.0),
    ),
  )
  let actual = actual_range.start_time
  api_number(actual.value, 12.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual_transform = t.apply_transform(
    @opentime.TimeTransform::new(
      offset=@opentime.RationalTime::new(value=5.0, rate=30.0),
      scale=-1.0,
      rate=48.0,
    ),
  )
  api_number(actual_transform.scale, -0.0)
  api_number(actual_transform.rate, 48.0)
  let actual = actual_transform.offset
  api_number(actual.value, 20.0)
  api_number(actual.rate, 30.0)
}

///|
test "transform:5" {
  let t = @opentime.TimeTransform::new(
    offset=@opentime.RationalTime::new(value=12.0, rate=24.0),
    scale=0.0,
    rate=0.0,
  )
  let actual = t.apply_time(@opentime.RationalTime::new(value=50.0, rate=30.0))
  api_number(actual.value, 15.0)
  api_number(actual.rate, 30.0)
  let actual = t.apply_time(@opentime.RationalTime::new(value=3.0, rate=-1.0))
  api_number(actual.value, 12.0)
  api_number(actual.rate, 24.0)
  let actual = t.apply_time(@opentime.RationalTime::new(value=0.0, rate=0.0))
  api_number(actual.value, 0.0 / 0.0)
  api_number(actual.rate, 24.0)
  let actual_range = t.apply_range(
    @opentime.TimeRange::new(
      start_time=@opentime.RationalTime::new(value=0.0, rate=24.0),
      duration=@opentime.RationalTime::new(value=0.0, rate=24.0),
    ),
  )
  let actual = actual_range.start_time
  api_number(actual.value, 12.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual_range = t.apply_range(
    @opentime.TimeRange::new(
      start_time=@opentime.RationalTime::new(value=10.0, rate=24.0),
      duration=@opentime.RationalTime::new(value=1.0, rate=24.0),
    ),
  )
  let actual = actual_range.start_time
  api_number(actual.value, 12.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual_range = t.apply_range(
    @opentime.TimeRange::new(
      start_time=@opentime.RationalTime::new(value=10.0, rate=24.0),
      duration=@opentime.RationalTime::new(value=1.5, rate=24.0),
    ),
  )
  let actual = actual_range.start_time
  api_number(actual.value, 12.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual_transform = t.apply_transform(
    @opentime.TimeTransform::new(
      offset=@opentime.RationalTime::new(value=5.0, rate=30.0),
      scale=-1.0,
      rate=48.0,
    ),
  )
  api_number(actual_transform.scale, -0.0)
  api_number(actual_transform.rate, 48.0)
  let actual = actual_transform.offset
  api_number(actual.value, 20.0)
  api_number(actual.rate, 30.0)
}

///|
test "transform:6" {
  let t = @opentime.TimeTransform::new(
    offset=@opentime.RationalTime::new(value=12.0, rate=24.0),
    scale=0.0,
    rate=24.0,
  )
  let actual = t.apply_time(@opentime.RationalTime::new(value=50.0, rate=30.0))
  api_number(actual.value, 12.0)
  api_number(actual.rate, 24.0)
  let actual = t.apply_time(@opentime.RationalTime::new(value=3.0, rate=-1.0))
  api_number(actual.value, 12.0)
  api_number(actual.rate, 24.0)
  let actual = t.apply_time(@opentime.RationalTime::new(value=0.0, rate=0.0))
  api_number(actual.value, 0.0 / 0.0)
  api_number(actual.rate, 24.0)
  let actual_range = t.apply_range(
    @opentime.TimeRange::new(
      start_time=@opentime.RationalTime::new(value=0.0, rate=24.0),
      duration=@opentime.RationalTime::new(value=0.0, rate=24.0),
    ),
  )
  let actual = actual_range.start_time
  api_number(actual.value, 12.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual_range = t.apply_range(
    @opentime.TimeRange::new(
      start_time=@opentime.RationalTime::new(value=10.0, rate=24.0),
      duration=@opentime.RationalTime::new(value=1.0, rate=24.0),
    ),
  )
  let actual = actual_range.start_time
  api_number(actual.value, 12.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual_range = t.apply_range(
    @opentime.TimeRange::new(
      start_time=@opentime.RationalTime::new(value=10.0, rate=24.0),
      duration=@opentime.RationalTime::new(value=1.5, rate=24.0),
    ),
  )
  let actual = actual_range.start_time
  api_number(actual.value, 12.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual_transform = t.apply_transform(
    @opentime.TimeTransform::new(
      offset=@opentime.RationalTime::new(value=5.0, rate=30.0),
      scale=-1.0,
      rate=48.0,
    ),
  )
  api_number(actual_transform.scale, -0.0)
  api_number(actual_transform.rate, 24.0)
  let actual = actual_transform.offset
  api_number(actual.value, 20.0)
  api_number(actual.rate, 30.0)
}

///|
test "transform:7" {
  let t = @opentime.TimeTransform::new(
    offset=@opentime.RationalTime::new(value=12.0, rate=24.0),
    scale=0.0,
    rate=60.0,
  )
  let actual = t.apply_time(@opentime.RationalTime::new(value=50.0, rate=30.0))
  api_number(actual.value, 30.0)
  api_number(actual.rate, 60.0)
  let actual = t.apply_time(@opentime.RationalTime::new(value=3.0, rate=-1.0))
  api_number(actual.value, 30.0)
  api_number(actual.rate, 60.0)
  let actual = t.apply_time(@opentime.RationalTime::new(value=0.0, rate=0.0))
  api_number(actual.value, 0.0 / 0.0)
  api_number(actual.rate, 60.0)
  let actual_range = t.apply_range(
    @opentime.TimeRange::new(
      start_time=@opentime.RationalTime::new(value=0.0, rate=24.0),
      duration=@opentime.RationalTime::new(value=0.0, rate=24.0),
    ),
  )
  let actual = actual_range.start_time
  api_number(actual.value, 30.0)
  api_number(actual.rate, 60.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.0)
  api_number(actual.rate, 60.0)
  let actual_range = t.apply_range(
    @opentime.TimeRange::new(
      start_time=@opentime.RationalTime::new(value=10.0, rate=24.0),
      duration=@opentime.RationalTime::new(value=1.0, rate=24.0),
    ),
  )
  let actual = actual_range.start_time
  api_number(actual.value, 30.0)
  api_number(actual.rate, 60.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.0)
  api_number(actual.rate, 60.0)
  let actual_range = t.apply_range(
    @opentime.TimeRange::new(
      start_time=@opentime.RationalTime::new(value=10.0, rate=24.0),
      duration=@opentime.RationalTime::new(value=1.5, rate=24.0),
    ),
  )
  let actual = actual_range.start_time
  api_number(actual.value, 30.0)
  api_number(actual.rate, 60.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.0)
  api_number(actual.rate, 60.0)
  let actual_transform = t.apply_transform(
    @opentime.TimeTransform::new(
      offset=@opentime.RationalTime::new(value=5.0, rate=30.0),
      scale=-1.0,
      rate=48.0,
    ),
  )
  api_number(actual_transform.scale, -0.0)
  api_number(actual_transform.rate, 60.0)
  let actual = actual_transform.offset
  api_number(actual.value, 20.0)
  api_number(actual.rate, 30.0)
}

///|
test "transform:8" {
  let t = @opentime.TimeTransform::new(
    offset=@opentime.RationalTime::new(value=12.0, rate=24.0),
    scale=0.5,
    rate=-1.0,
  )
  let actual = t.apply_time(@opentime.RationalTime::new(value=50.0, rate=30.0))
  api_number(actual.value, 40.0)
  api_number(actual.rate, 30.0)
  let actual = t.apply_time(@opentime.RationalTime::new(value=3.0, rate=-1.0))
  api_number(actual.value, -24.0)
  api_number(actual.rate, 24.0)
  let actual = t.apply_time(@opentime.RationalTime::new(value=0.0, rate=0.0))
  api_number(actual.value, 0.0 / 0.0)
  api_number(actual.rate, 24.0)
  let actual_range = t.apply_range(
    @opentime.TimeRange::new(
      start_time=@opentime.RationalTime::new(value=0.0, rate=24.0),
      duration=@opentime.RationalTime::new(value=0.0, rate=24.0),
    ),
  )
  let actual = actual_range.start_time
  api_number(actual.value, 12.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual_range = t.apply_range(
    @opentime.TimeRange::new(
      start_time=@opentime.RationalTime::new(value=10.0, rate=24.0),
      duration=@opentime.RationalTime::new(value=1.0, rate=24.0),
    ),
  )
  let actual = actual_range.start_time
  api_number(actual.value, 17.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.5)
  api_number(actual.rate, 24.0)
  let actual_range = t.apply_range(
    @opentime.TimeRange::new(
      start_time=@opentime.RationalTime::new(value=10.0, rate=24.0),
      duration=@opentime.RationalTime::new(value=1.5, rate=24.0),
    ),
  )
  let actual = actual_range.start_time
  api_number(actual.value, 17.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.75)
  api_number(actual.rate, 24.0)
  let actual_transform = t.apply_transform(
    @opentime.TimeTransform::new(
      offset=@opentime.RationalTime::new(value=5.0, rate=30.0),
      scale=-1.0,
      rate=48.0,
    ),
  )
  api_number(actual_transform.scale, -0.5)
  api_number(actual_transform.rate, 48.0)
  let actual = actual_transform.offset
  api_number(actual.value, 20.0)
  api_number(actual.rate, 30.0)
}

///|
test "transform:9" {
  let t = @opentime.TimeTransform::new(
    offset=@opentime.RationalTime::new(value=12.0, rate=24.0),
    scale=0.5,
    rate=0.0,
  )
  let actual = t.apply_time(@opentime.RationalTime::new(value=50.0, rate=30.0))
  api_number(actual.value, 40.0)
  api_number(actual.rate, 30.0)
  let actual = t.apply_time(@opentime.RationalTime::new(value=3.0, rate=-1.0))
  api_number(actual.value, -24.0)
  api_number(actual.rate, 24.0)
  let actual = t.apply_time(@opentime.RationalTime::new(value=0.0, rate=0.0))
  api_number(actual.value, 0.0 / 0.0)
  api_number(actual.rate, 24.0)
  let actual_range = t.apply_range(
    @opentime.TimeRange::new(
      start_time=@opentime.RationalTime::new(value=0.0, rate=24.0),
      duration=@opentime.RationalTime::new(value=0.0, rate=24.0),
    ),
  )
  let actual = actual_range.start_time
  api_number(actual.value, 12.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual_range = t.apply_range(
    @opentime.TimeRange::new(
      start_time=@opentime.RationalTime::new(value=10.0, rate=24.0),
      duration=@opentime.RationalTime::new(value=1.0, rate=24.0),
    ),
  )
  let actual = actual_range.start_time
  api_number(actual.value, 17.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.5)
  api_number(actual.rate, 24.0)
  let actual_range = t.apply_range(
    @opentime.TimeRange::new(
      start_time=@opentime.RationalTime::new(value=10.0, rate=24.0),
      duration=@opentime.RationalTime::new(value=1.5, rate=24.0),
    ),
  )
  let actual = actual_range.start_time
  api_number(actual.value, 17.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.75)
  api_number(actual.rate, 24.0)
  let actual_transform = t.apply_transform(
    @opentime.TimeTransform::new(
      offset=@opentime.RationalTime::new(value=5.0, rate=30.0),
      scale=-1.0,
      rate=48.0,
    ),
  )
  api_number(actual_transform.scale, -0.5)
  api_number(actual_transform.rate, 48.0)
  let actual = actual_transform.offset
  api_number(actual.value, 20.0)
  api_number(actual.rate, 30.0)
}

///|
test "transform:10" {
  let t = @opentime.TimeTransform::new(
    offset=@opentime.RationalTime::new(value=12.0, rate=24.0),
    scale=0.5,
    rate=24.0,
  )
  let actual = t.apply_time(@opentime.RationalTime::new(value=50.0, rate=30.0))
  api_number(actual.value, 32.0)
  api_number(actual.rate, 24.0)
  let actual = t.apply_time(@opentime.RationalTime::new(value=3.0, rate=-1.0))
  api_number(actual.value, -24.0)
  api_number(actual.rate, 24.0)
  let actual = t.apply_time(@opentime.RationalTime::new(value=0.0, rate=0.0))
  api_number(actual.value, 0.0 / 0.0)
  api_number(actual.rate, 24.0)
  let actual_range = t.apply_range(
    @opentime.TimeRange::new(
      start_time=@opentime.RationalTime::new(value=0.0, rate=24.0),
      duration=@opentime.RationalTime::new(value=0.0, rate=24.0),
    ),
  )
  let actual = actual_range.start_time
  api_number(actual.value, 12.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual_range = t.apply_range(
    @opentime.TimeRange::new(
      start_time=@opentime.RationalTime::new(value=10.0, rate=24.0),
      duration=@opentime.RationalTime::new(value=1.0, rate=24.0),
    ),
  )
  let actual = actual_range.start_time
  api_number(actual.value, 17.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.5)
  api_number(actual.rate, 24.0)
  let actual_range = t.apply_range(
    @opentime.TimeRange::new(
      start_time=@opentime.RationalTime::new(value=10.0, rate=24.0),
      duration=@opentime.RationalTime::new(value=1.5, rate=24.0),
    ),
  )
  let actual = actual_range.start_time
  api_number(actual.value, 17.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.75)
  api_number(actual.rate, 24.0)
  let actual_transform = t.apply_transform(
    @opentime.TimeTransform::new(
      offset=@opentime.RationalTime::new(value=5.0, rate=30.0),
      scale=-1.0,
      rate=48.0,
    ),
  )
  api_number(actual_transform.scale, -0.5)
  api_number(actual_transform.rate, 24.0)
  let actual = actual_transform.offset
  api_number(actual.value, 20.0)
  api_number(actual.rate, 30.0)
}

///|
test "transform:11" {
  let t = @opentime.TimeTransform::new(
    offset=@opentime.RationalTime::new(value=12.0, rate=24.0),
    scale=0.5,
    rate=60.0,
  )
  let actual = t.apply_time(@opentime.RationalTime::new(value=50.0, rate=30.0))
  api_number(actual.value, 80.0)
  api_number(actual.rate, 60.0)
  let actual = t.apply_time(@opentime.RationalTime::new(value=3.0, rate=-1.0))
  api_number(actual.value, -60.0)
  api_number(actual.rate, 60.0)
  let actual = t.apply_time(@opentime.RationalTime::new(value=0.0, rate=0.0))
  api_number(actual.value, 0.0 / 0.0)
  api_number(actual.rate, 60.0)
  let actual_range = t.apply_range(
    @opentime.TimeRange::new(
      start_time=@opentime.RationalTime::new(value=0.0, rate=24.0),
      duration=@opentime.RationalTime::new(value=0.0, rate=24.0),
    ),
  )
  let actual = actual_range.start_time
  api_number(actual.value, 30.0)
  api_number(actual.rate, 60.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.0)
  api_number(actual.rate, 60.0)
  let actual_range = t.apply_range(
    @opentime.TimeRange::new(
      start_time=@opentime.RationalTime::new(value=10.0, rate=24.0),
      duration=@opentime.RationalTime::new(value=1.0, rate=24.0),
    ),
  )
  let actual = actual_range.start_time
  api_number(actual.value, 42.5)
  api_number(actual.rate, 60.0)
  let actual = actual_range.duration
  api_number(actual.value, 1.25)
  api_number(actual.rate, 60.0)
  let actual_range = t.apply_range(
    @opentime.TimeRange::new(
      start_time=@opentime.RationalTime::new(value=10.0, rate=24.0),
      duration=@opentime.RationalTime::new(value=1.5, rate=24.0),
    ),
  )
  let actual = actual_range.start_time
  api_number(actual.value, 42.5)
  api_number(actual.rate, 60.0)
  let actual = actual_range.duration
  api_number(actual.value, 1.875)
  api_number(actual.rate, 60.0)
  let actual_transform = t.apply_transform(
    @opentime.TimeTransform::new(
      offset=@opentime.RationalTime::new(value=5.0, rate=30.0),
      scale=-1.0,
      rate=48.0,
    ),
  )
  api_number(actual_transform.scale, -0.5)
  api_number(actual_transform.rate, 60.0)
  let actual = actual_transform.offset
  api_number(actual.value, 20.0)
  api_number(actual.rate, 30.0)
}

///|
test "transform:12" {
  let t = @opentime.TimeTransform::new(
    offset=@opentime.RationalTime::new(value=12.0, rate=24.0),
    scale=2.0,
    rate=-1.0,
  )
  let actual = t.apply_time(@opentime.RationalTime::new(value=50.0, rate=30.0))
  api_number(actual.value, 115.0)
  api_number(actual.rate, 30.0)
  let actual = t.apply_time(@opentime.RationalTime::new(value=3.0, rate=-1.0))
  api_number(actual.value, -132.0)
  api_number(actual.rate, 24.0)
  let actual = t.apply_time(@opentime.RationalTime::new(value=0.0, rate=0.0))
  api_number(actual.value, 0.0 / 0.0)
  api_number(actual.rate, 24.0)
  let actual_range = t.apply_range(
    @opentime.TimeRange::new(
      start_time=@opentime.RationalTime::new(value=0.0, rate=24.0),
      duration=@opentime.RationalTime::new(value=0.0, rate=24.0),
    ),
  )
  let actual = actual_range.start_time
  api_number(actual.value, 12.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual_range = t.apply_range(
    @opentime.TimeRange::new(
      start_time=@opentime.RationalTime::new(value=10.0, rate=24.0),
      duration=@opentime.RationalTime::new(value=1.0, rate=24.0),
    ),
  )
  let actual = actual_range.start_time
  api_number(actual.value, 32.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 2.0)
  api_number(actual.rate, 24.0)
  let actual_range = t.apply_range(
    @opentime.TimeRange::new(
      start_time=@opentime.RationalTime::new(value=10.0, rate=24.0),
      duration=@opentime.RationalTime::new(value=1.5, rate=24.0),
    ),
  )
  let actual = actual_range.start_time
  api_number(actual.value, 32.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 3.0)
  api_number(actual.rate, 24.0)
  let actual_transform = t.apply_transform(
    @opentime.TimeTransform::new(
      offset=@opentime.RationalTime::new(value=5.0, rate=30.0),
      scale=-1.0,
      rate=48.0,
    ),
  )
  api_number(actual_transform.scale, -2.0)
  api_number(actual_transform.rate, 48.0)
  let actual = actual_transform.offset
  api_number(actual.value, 20.0)
  api_number(actual.rate, 30.0)
}

///|
test "transform:13" {
  let t = @opentime.TimeTransform::new(
    offset=@opentime.RationalTime::new(value=12.0, rate=24.0),
    scale=2.0,
    rate=0.0,
  )
  let actual = t.apply_time(@opentime.RationalTime::new(value=50.0, rate=30.0))
  api_number(actual.value, 115.0)
  api_number(actual.rate, 30.0)
  let actual = t.apply_time(@opentime.RationalTime::new(value=3.0, rate=-1.0))
  api_number(actual.value, -132.0)
  api_number(actual.rate, 24.0)
  let actual = t.apply_time(@opentime.RationalTime::new(value=0.0, rate=0.0))
  api_number(actual.value, 0.0 / 0.0)
  api_number(actual.rate, 24.0)
  let actual_range = t.apply_range(
    @opentime.TimeRange::new(
      start_time=@opentime.RationalTime::new(value=0.0, rate=24.0),
      duration=@opentime.RationalTime::new(value=0.0, rate=24.0),
    ),
  )
  let actual = actual_range.start_time
  api_number(actual.value, 12.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual_range = t.apply_range(
    @opentime.TimeRange::new(
      start_time=@opentime.RationalTime::new(value=10.0, rate=24.0),
      duration=@opentime.RationalTime::new(value=1.0, rate=24.0),
    ),
  )
  let actual = actual_range.start_time
  api_number(actual.value, 32.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 2.0)
  api_number(actual.rate, 24.0)
  let actual_range = t.apply_range(
    @opentime.TimeRange::new(
      start_time=@opentime.RationalTime::new(value=10.0, rate=24.0),
      duration=@opentime.RationalTime::new(value=1.5, rate=24.0),
    ),
  )
  let actual = actual_range.start_time
  api_number(actual.value, 32.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 3.0)
  api_number(actual.rate, 24.0)
  let actual_transform = t.apply_transform(
    @opentime.TimeTransform::new(
      offset=@opentime.RationalTime::new(value=5.0, rate=30.0),
      scale=-1.0,
      rate=48.0,
    ),
  )
  api_number(actual_transform.scale, -2.0)
  api_number(actual_transform.rate, 48.0)
  let actual = actual_transform.offset
  api_number(actual.value, 20.0)
  api_number(actual.rate, 30.0)
}

///|
test "transform:14" {
  let t = @opentime.TimeTransform::new(
    offset=@opentime.RationalTime::new(value=12.0, rate=24.0),
    scale=2.0,
    rate=24.0,
  )
  let actual = t.apply_time(@opentime.RationalTime::new(value=50.0, rate=30.0))
  api_number(actual.value, 92.0)
  api_number(actual.rate, 24.0)
  let actual = t.apply_time(@opentime.RationalTime::new(value=3.0, rate=-1.0))
  api_number(actual.value, -132.0)
  api_number(actual.rate, 24.0)
  let actual = t.apply_time(@opentime.RationalTime::new(value=0.0, rate=0.0))
  api_number(actual.value, 0.0 / 0.0)
  api_number(actual.rate, 24.0)
  let actual_range = t.apply_range(
    @opentime.TimeRange::new(
      start_time=@opentime.RationalTime::new(value=0.0, rate=24.0),
      duration=@opentime.RationalTime::new(value=0.0, rate=24.0),
    ),
  )
  let actual = actual_range.start_time
  api_number(actual.value, 12.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual_range = t.apply_range(
    @opentime.TimeRange::new(
      start_time=@opentime.RationalTime::new(value=10.0, rate=24.0),
      duration=@opentime.RationalTime::new(value=1.0, rate=24.0),
    ),
  )
  let actual = actual_range.start_time
  api_number(actual.value, 32.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 2.0)
  api_number(actual.rate, 24.0)
  let actual_range = t.apply_range(
    @opentime.TimeRange::new(
      start_time=@opentime.RationalTime::new(value=10.0, rate=24.0),
      duration=@opentime.RationalTime::new(value=1.5, rate=24.0),
    ),
  )
  let actual = actual_range.start_time
  api_number(actual.value, 32.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 3.0)
  api_number(actual.rate, 24.0)
  let actual_transform = t.apply_transform(
    @opentime.TimeTransform::new(
      offset=@opentime.RationalTime::new(value=5.0, rate=30.0),
      scale=-1.0,
      rate=48.0,
    ),
  )
  api_number(actual_transform.scale, -2.0)
  api_number(actual_transform.rate, 24.0)
  let actual = actual_transform.offset
  api_number(actual.value, 20.0)
  api_number(actual.rate, 30.0)
}

///|
test "transform:15" {
  let t = @opentime.TimeTransform::new(
    offset=@opentime.RationalTime::new(value=12.0, rate=24.0),
    scale=2.0,
    rate=60.0,
  )
  let actual = t.apply_time(@opentime.RationalTime::new(value=50.0, rate=30.0))
  api_number(actual.value, 230.0)
  api_number(actual.rate, 60.0)
  let actual = t.apply_time(@opentime.RationalTime::new(value=3.0, rate=-1.0))
  api_number(actual.value, -330.0)
  api_number(actual.rate, 60.0)
  let actual = t.apply_time(@opentime.RationalTime::new(value=0.0, rate=0.0))
  api_number(actual.value, 0.0 / 0.0)
  api_number(actual.rate, 60.0)
  let actual_range = t.apply_range(
    @opentime.TimeRange::new(
      start_time=@opentime.RationalTime::new(value=0.0, rate=24.0),
      duration=@opentime.RationalTime::new(value=0.0, rate=24.0),
    ),
  )
  let actual = actual_range.start_time
  api_number(actual.value, 30.0)
  api_number(actual.rate, 60.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.0)
  api_number(actual.rate, 60.0)
  let actual_range = t.apply_range(
    @opentime.TimeRange::new(
      start_time=@opentime.RationalTime::new(value=10.0, rate=24.0),
      duration=@opentime.RationalTime::new(value=1.0, rate=24.0),
    ),
  )
  let actual = actual_range.start_time
  api_number(actual.value, 80.0)
  api_number(actual.rate, 60.0)
  let actual = actual_range.duration
  api_number(actual.value, 5.0)
  api_number(actual.rate, 60.0)
  let actual_range = t.apply_range(
    @opentime.TimeRange::new(
      start_time=@opentime.RationalTime::new(value=10.0, rate=24.0),
      duration=@opentime.RationalTime::new(value=1.5, rate=24.0),
    ),
  )
  let actual = actual_range.start_time
  api_number(actual.value, 80.0)
  api_number(actual.rate, 60.0)
  let actual = actual_range.duration
  api_number(actual.value, 7.5)
  api_number(actual.rate, 60.0)
  let actual_transform = t.apply_transform(
    @opentime.TimeTransform::new(
      offset=@opentime.RationalTime::new(value=5.0, rate=30.0),
      scale=-1.0,
      rate=48.0,
    ),
  )
  api_number(actual_transform.scale, -2.0)
  api_number(actual_transform.rate, 60.0)
  let actual = actual_transform.offset
  api_number(actual.value, 20.0)
  api_number(actual.rate, 30.0)
}

///|
test "transform:16" {
  let t = @opentime.TimeTransform::new(
    offset=@opentime.RationalTime::new(value=12.0, rate=24.0),
    scale=1.0 / 0.0,
    rate=-1.0,
  )
  let actual = t.apply_time(@opentime.RationalTime::new(value=50.0, rate=30.0))
  api_number(actual.value, 1.0 / 0.0)
  api_number(actual.rate, 30.0)
  let actual = t.apply_time(@opentime.RationalTime::new(value=3.0, rate=-1.0))
  api_number(actual.value, -1.0 / 0.0)
  api_number(actual.rate, 24.0)
  let actual = t.apply_time(@opentime.RationalTime::new(value=0.0, rate=0.0))
  api_number(actual.value, 0.0 / 0.0)
  api_number(actual.rate, 24.0)
  let actual_range = t.apply_range(
    @opentime.TimeRange::new(
      start_time=@opentime.RationalTime::new(value=0.0, rate=24.0),
      duration=@opentime.RationalTime::new(value=0.0, rate=24.0),
    ),
  )
  let actual = actual_range.start_time
  api_number(actual.value, 0.0 / 0.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.0 / 0.0)
  api_number(actual.rate, 24.0)
  let actual_range = t.apply_range(
    @opentime.TimeRange::new(
      start_time=@opentime.RationalTime::new(value=10.0, rate=24.0),
      duration=@opentime.RationalTime::new(value=1.0, rate=24.0),
    ),
  )
  let actual = actual_range.start_time
  api_number(actual.value, 1.0 / 0.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.0 / 0.0)
  api_number(actual.rate, 24.0)
  let actual_range = t.apply_range(
    @opentime.TimeRange::new(
      start_time=@opentime.RationalTime::new(value=10.0, rate=24.0),
      duration=@opentime.RationalTime::new(value=1.5, rate=24.0),
    ),
  )
  let actual = actual_range.start_time
  api_number(actual.value, 1.0 / 0.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.0 / 0.0)
  api_number(actual.rate, 24.0)
  let actual_transform = t.apply_transform(
    @opentime.TimeTransform::new(
      offset=@opentime.RationalTime::new(value=5.0, rate=30.0),
      scale=-1.0,
      rate=48.0,
    ),
  )
  api_number(actual_transform.scale, -1.0 / 0.0)
  api_number(actual_transform.rate, 48.0)
  let actual = actual_transform.offset
  api_number(actual.value, 20.0)
  api_number(actual.rate, 30.0)
}

///|
test "transform:17" {
  let t = @opentime.TimeTransform::new(
    offset=@opentime.RationalTime::new(value=12.0, rate=24.0),
    scale=1.0 / 0.0,
    rate=0.0,
  )
  let actual = t.apply_time(@opentime.RationalTime::new(value=50.0, rate=30.0))
  api_number(actual.value, 1.0 / 0.0)
  api_number(actual.rate, 30.0)
  let actual = t.apply_time(@opentime.RationalTime::new(value=3.0, rate=-1.0))
  api_number(actual.value, -1.0 / 0.0)
  api_number(actual.rate, 24.0)
  let actual = t.apply_time(@opentime.RationalTime::new(value=0.0, rate=0.0))
  api_number(actual.value, 0.0 / 0.0)
  api_number(actual.rate, 24.0)
  let actual_range = t.apply_range(
    @opentime.TimeRange::new(
      start_time=@opentime.RationalTime::new(value=0.0, rate=24.0),
      duration=@opentime.RationalTime::new(value=0.0, rate=24.0),
    ),
  )
  let actual = actual_range.start_time
  api_number(actual.value, 0.0 / 0.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.0 / 0.0)
  api_number(actual.rate, 24.0)
  let actual_range = t.apply_range(
    @opentime.TimeRange::new(
      start_time=@opentime.RationalTime::new(value=10.0, rate=24.0),
      duration=@opentime.RationalTime::new(value=1.0, rate=24.0),
    ),
  )
  let actual = actual_range.start_time
  api_number(actual.value, 1.0 / 0.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.0 / 0.0)
  api_number(actual.rate, 24.0)
  let actual_range = t.apply_range(
    @opentime.TimeRange::new(
      start_time=@opentime.RationalTime::new(value=10.0, rate=24.0),
      duration=@opentime.RationalTime::new(value=1.5, rate=24.0),
    ),
  )
  let actual = actual_range.start_time
  api_number(actual.value, 1.0 / 0.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.0 / 0.0)
  api_number(actual.rate, 24.0)
  let actual_transform = t.apply_transform(
    @opentime.TimeTransform::new(
      offset=@opentime.RationalTime::new(value=5.0, rate=30.0),
      scale=-1.0,
      rate=48.0,
    ),
  )
  api_number(actual_transform.scale, -1.0 / 0.0)
  api_number(actual_transform.rate, 48.0)
  let actual = actual_transform.offset
  api_number(actual.value, 20.0)
  api_number(actual.rate, 30.0)
}

///|
test "transform:18" {
  let t = @opentime.TimeTransform::new(
    offset=@opentime.RationalTime::new(value=12.0, rate=24.0),
    scale=1.0 / 0.0,
    rate=24.0,
  )
  let actual = t.apply_time(@opentime.RationalTime::new(value=50.0, rate=30.0))
  api_number(actual.value, 1.0 / 0.0)
  api_number(actual.rate, 24.0)
  let actual = t.apply_time(@opentime.RationalTime::new(value=3.0, rate=-1.0))
  api_number(actual.value, -1.0 / 0.0)
  api_number(actual.rate, 24.0)
  let actual = t.apply_time(@opentime.RationalTime::new(value=0.0, rate=0.0))
  api_number(actual.value, 0.0 / 0.0)
  api_number(actual.rate, 24.0)
  let actual_range = t.apply_range(
    @opentime.TimeRange::new(
      start_time=@opentime.RationalTime::new(value=0.0, rate=24.0),
      duration=@opentime.RationalTime::new(value=0.0, rate=24.0),
    ),
  )
  let actual = actual_range.start_time
  api_number(actual.value, 0.0 / 0.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.0 / 0.0)
  api_number(actual.rate, 24.0)
  let actual_range = t.apply_range(
    @opentime.TimeRange::new(
      start_time=@opentime.RationalTime::new(value=10.0, rate=24.0),
      duration=@opentime.RationalTime::new(value=1.0, rate=24.0),
    ),
  )
  let actual = actual_range.start_time
  api_number(actual.value, 1.0 / 0.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.0 / 0.0)
  api_number(actual.rate, 24.0)
  let actual_range = t.apply_range(
    @opentime.TimeRange::new(
      start_time=@opentime.RationalTime::new(value=10.0, rate=24.0),
      duration=@opentime.RationalTime::new(value=1.5, rate=24.0),
    ),
  )
  let actual = actual_range.start_time
  api_number(actual.value, 1.0 / 0.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.0 / 0.0)
  api_number(actual.rate, 24.0)
  let actual_transform = t.apply_transform(
    @opentime.TimeTransform::new(
      offset=@opentime.RationalTime::new(value=5.0, rate=30.0),
      scale=-1.0,
      rate=48.0,
    ),
  )
  api_number(actual_transform.scale, -1.0 / 0.0)
  api_number(actual_transform.rate, 24.0)
  let actual = actual_transform.offset
  api_number(actual.value, 20.0)
  api_number(actual.rate, 30.0)
}

///|
test "transform:19" {
  let t = @opentime.TimeTransform::new(
    offset=@opentime.RationalTime::new(value=12.0, rate=24.0),
    scale=1.0 / 0.0,
    rate=60.0,
  )
  let actual = t.apply_time(@opentime.RationalTime::new(value=50.0, rate=30.0))
  api_number(actual.value, 1.0 / 0.0)
  api_number(actual.rate, 60.0)
  let actual = t.apply_time(@opentime.RationalTime::new(value=3.0, rate=-1.0))
  api_number(actual.value, -1.0 / 0.0)
  api_number(actual.rate, 60.0)
  let actual = t.apply_time(@opentime.RationalTime::new(value=0.0, rate=0.0))
  api_number(actual.value, 0.0 / 0.0)
  api_number(actual.rate, 60.0)
  let actual_range = t.apply_range(
    @opentime.TimeRange::new(
      start_time=@opentime.RationalTime::new(value=0.0, rate=24.0),
      duration=@opentime.RationalTime::new(value=0.0, rate=24.0),
    ),
  )
  let actual = actual_range.start_time
  api_number(actual.value, 0.0 / 0.0)
  api_number(actual.rate, 60.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.0 / 0.0)
  api_number(actual.rate, 60.0)
  let actual_range = t.apply_range(
    @opentime.TimeRange::new(
      start_time=@opentime.RationalTime::new(value=10.0, rate=24.0),
      duration=@opentime.RationalTime::new(value=1.0, rate=24.0),
    ),
  )
  let actual = actual_range.start_time
  api_number(actual.value, 1.0 / 0.0)
  api_number(actual.rate, 60.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.0 / 0.0)
  api_number(actual.rate, 60.0)
  let actual_range = t.apply_range(
    @opentime.TimeRange::new(
      start_time=@opentime.RationalTime::new(value=10.0, rate=24.0),
      duration=@opentime.RationalTime::new(value=1.5, rate=24.0),
    ),
  )
  let actual = actual_range.start_time
  api_number(actual.value, 1.0 / 0.0)
  api_number(actual.rate, 60.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.0 / 0.0)
  api_number(actual.rate, 60.0)
  let actual_transform = t.apply_transform(
    @opentime.TimeTransform::new(
      offset=@opentime.RationalTime::new(value=5.0, rate=30.0),
      scale=-1.0,
      rate=48.0,
    ),
  )
  api_number(actual_transform.scale, -1.0 / 0.0)
  api_number(actual_transform.rate, 60.0)
  let actual = actual_transform.offset
  api_number(actual.value, 20.0)
  api_number(actual.rate, 30.0)
}

///|
test "transform:20" {
  let t = @opentime.TimeTransform::new(
    offset=@opentime.RationalTime::new(value=12.0, rate=24.0),
    scale=0.0 / 0.0,
    rate=-1.0,
  )
  let actual = t.apply_time(@opentime.RationalTime::new(value=50.0, rate=30.0))
  api_number(actual.value, 0.0 / 0.0)
  api_number(actual.rate, 30.0)
  let actual = t.apply_time(@opentime.RationalTime::new(value=3.0, rate=-1.0))
  api_number(actual.value, 0.0 / 0.0)
  api_number(actual.rate, 24.0)
  let actual = t.apply_time(@opentime.RationalTime::new(value=0.0, rate=0.0))
  api_number(actual.value, 0.0 / 0.0)
  api_number(actual.rate, 24.0)
  let actual_range = t.apply_range(
    @opentime.TimeRange::new(
      start_time=@opentime.RationalTime::new(value=0.0, rate=24.0),
      duration=@opentime.RationalTime::new(value=0.0, rate=24.0),
    ),
  )
  let actual = actual_range.start_time
  api_number(actual.value, 0.0 / 0.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.0 / 0.0)
  api_number(actual.rate, 24.0)
  let actual_range = t.apply_range(
    @opentime.TimeRange::new(
      start_time=@opentime.RationalTime::new(value=10.0, rate=24.0),
      duration=@opentime.RationalTime::new(value=1.0, rate=24.0),
    ),
  )
  let actual = actual_range.start_time
  api_number(actual.value, 0.0 / 0.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.0 / 0.0)
  api_number(actual.rate, 24.0)
  let actual_range = t.apply_range(
    @opentime.TimeRange::new(
      start_time=@opentime.RationalTime::new(value=10.0, rate=24.0),
      duration=@opentime.RationalTime::new(value=1.5, rate=24.0),
    ),
  )
  let actual = actual_range.start_time
  api_number(actual.value, 0.0 / 0.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.0 / 0.0)
  api_number(actual.rate, 24.0)
  let actual_transform = t.apply_transform(
    @opentime.TimeTransform::new(
      offset=@opentime.RationalTime::new(value=5.0, rate=30.0),
      scale=-1.0,
      rate=48.0,
    ),
  )
  api_number(actual_transform.scale, 0.0 / 0.0)
  api_number(actual_transform.rate, 48.0)
  let actual = actual_transform.offset
  api_number(actual.value, 20.0)
  api_number(actual.rate, 30.0)
}

///|
test "transform:21" {
  let t = @opentime.TimeTransform::new(
    offset=@opentime.RationalTime::new(value=12.0, rate=24.0),
    scale=0.0 / 0.0,
    rate=0.0,
  )
  let actual = t.apply_time(@opentime.RationalTime::new(value=50.0, rate=30.0))
  api_number(actual.value, 0.0 / 0.0)
  api_number(actual.rate, 30.0)
  let actual = t.apply_time(@opentime.RationalTime::new(value=3.0, rate=-1.0))
  api_number(actual.value, 0.0 / 0.0)
  api_number(actual.rate, 24.0)
  let actual = t.apply_time(@opentime.RationalTime::new(value=0.0, rate=0.0))
  api_number(actual.value, 0.0 / 0.0)
  api_number(actual.rate, 24.0)
  let actual_range = t.apply_range(
    @opentime.TimeRange::new(
      start_time=@opentime.RationalTime::new(value=0.0, rate=24.0),
      duration=@opentime.RationalTime::new(value=0.0, rate=24.0),
    ),
  )
  let actual = actual_range.start_time
  api_number(actual.value, 0.0 / 0.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.0 / 0.0)
  api_number(actual.rate, 24.0)
  let actual_range = t.apply_range(
    @opentime.TimeRange::new(
      start_time=@opentime.RationalTime::new(value=10.0, rate=24.0),
      duration=@opentime.RationalTime::new(value=1.0, rate=24.0),
    ),
  )
  let actual = actual_range.start_time
  api_number(actual.value, 0.0 / 0.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.0 / 0.0)
  api_number(actual.rate, 24.0)
  let actual_range = t.apply_range(
    @opentime.TimeRange::new(
      start_time=@opentime.RationalTime::new(value=10.0, rate=24.0),
      duration=@opentime.RationalTime::new(value=1.5, rate=24.0),
    ),
  )
  let actual = actual_range.start_time
  api_number(actual.value, 0.0 / 0.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.0 / 0.0)
  api_number(actual.rate, 24.0)
  let actual_transform = t.apply_transform(
    @opentime.TimeTransform::new(
      offset=@opentime.RationalTime::new(value=5.0, rate=30.0),
      scale=-1.0,
      rate=48.0,
    ),
  )
  api_number(actual_transform.scale, 0.0 / 0.0)
  api_number(actual_transform.rate, 48.0)
  let actual = actual_transform.offset
  api_number(actual.value, 20.0)
  api_number(actual.rate, 30.0)
}

///|
test "transform:22" {
  let t = @opentime.TimeTransform::new(
    offset=@opentime.RationalTime::new(value=12.0, rate=24.0),
    scale=0.0 / 0.0,
    rate=24.0,
  )
  let actual = t.apply_time(@opentime.RationalTime::new(value=50.0, rate=30.0))
  api_number(actual.value, 0.0 / 0.0)
  api_number(actual.rate, 24.0)
  let actual = t.apply_time(@opentime.RationalTime::new(value=3.0, rate=-1.0))
  api_number(actual.value, 0.0 / 0.0)
  api_number(actual.rate, 24.0)
  let actual = t.apply_time(@opentime.RationalTime::new(value=0.0, rate=0.0))
  api_number(actual.value, 0.0 / 0.0)
  api_number(actual.rate, 24.0)
  let actual_range = t.apply_range(
    @opentime.TimeRange::new(
      start_time=@opentime.RationalTime::new(value=0.0, rate=24.0),
      duration=@opentime.RationalTime::new(value=0.0, rate=24.0),
    ),
  )
  let actual = actual_range.start_time
  api_number(actual.value, 0.0 / 0.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.0 / 0.0)
  api_number(actual.rate, 24.0)
  let actual_range = t.apply_range(
    @opentime.TimeRange::new(
      start_time=@opentime.RationalTime::new(value=10.0, rate=24.0),
      duration=@opentime.RationalTime::new(value=1.0, rate=24.0),
    ),
  )
  let actual = actual_range.start_time
  api_number(actual.value, 0.0 / 0.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.0 / 0.0)
  api_number(actual.rate, 24.0)
  let actual_range = t.apply_range(
    @opentime.TimeRange::new(
      start_time=@opentime.RationalTime::new(value=10.0, rate=24.0),
      duration=@opentime.RationalTime::new(value=1.5, rate=24.0),
    ),
  )
  let actual = actual_range.start_time
  api_number(actual.value, 0.0 / 0.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.0 / 0.0)
  api_number(actual.rate, 24.0)
  let actual_transform = t.apply_transform(
    @opentime.TimeTransform::new(
      offset=@opentime.RationalTime::new(value=5.0, rate=30.0),
      scale=-1.0,
      rate=48.0,
    ),
  )
  api_number(actual_transform.scale, 0.0 / 0.0)
  api_number(actual_transform.rate, 24.0)
  let actual = actual_transform.offset
  api_number(actual.value, 20.0)
  api_number(actual.rate, 30.0)
}

///|
test "transform:23" {
  let t = @opentime.TimeTransform::new(
    offset=@opentime.RationalTime::new(value=12.0, rate=24.0),
    scale=0.0 / 0.0,
    rate=60.0,
  )
  let actual = t.apply_time(@opentime.RationalTime::new(value=50.0, rate=30.0))
  api_number(actual.value, 0.0 / 0.0)
  api_number(actual.rate, 60.0)
  let actual = t.apply_time(@opentime.RationalTime::new(value=3.0, rate=-1.0))
  api_number(actual.value, 0.0 / 0.0)
  api_number(actual.rate, 60.0)
  let actual = t.apply_time(@opentime.RationalTime::new(value=0.0, rate=0.0))
  api_number(actual.value, 0.0 / 0.0)
  api_number(actual.rate, 60.0)
  let actual_range = t.apply_range(
    @opentime.TimeRange::new(
      start_time=@opentime.RationalTime::new(value=0.0, rate=24.0),
      duration=@opentime.RationalTime::new(value=0.0, rate=24.0),
    ),
  )
  let actual = actual_range.start_time
  api_number(actual.value, 0.0 / 0.0)
  api_number(actual.rate, 60.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.0 / 0.0)
  api_number(actual.rate, 60.0)
  let actual_range = t.apply_range(
    @opentime.TimeRange::new(
      start_time=@opentime.RationalTime::new(value=10.0, rate=24.0),
      duration=@opentime.RationalTime::new(value=1.0, rate=24.0),
    ),
  )
  let actual = actual_range.start_time
  api_number(actual.value, 0.0 / 0.0)
  api_number(actual.rate, 60.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.0 / 0.0)
  api_number(actual.rate, 60.0)
  let actual_range = t.apply_range(
    @opentime.TimeRange::new(
      start_time=@opentime.RationalTime::new(value=10.0, rate=24.0),
      duration=@opentime.RationalTime::new(value=1.5, rate=24.0),
    ),
  )
  let actual = actual_range.start_time
  api_number(actual.value, 0.0 / 0.0)
  api_number(actual.rate, 60.0)
  let actual = actual_range.duration
  api_number(actual.value, 0.0 / 0.0)
  api_number(actual.rate, 60.0)
  let actual_transform = t.apply_transform(
    @opentime.TimeTransform::new(
      offset=@opentime.RationalTime::new(value=5.0, rate=30.0),
      scale=-1.0,
      rate=48.0,
    ),
  )
  api_number(actual_transform.scale, 0.0 / 0.0)
  api_number(actual_transform.rate, 60.0)
  let actual = actual_transform.offset
  api_number(actual.value, 20.0)
  api_number(actual.rate, 30.0)
}
