// Generated from official OTIO 0.18.1 by tools/generate_api_tests.py.

///|
test "functions:to_frames--1-0" {
  assert_eq(
    @opentime.RationalTime::new(value=-1.0, rate=0.0).to_frames().unwrap(),
    -1,
  )
}

///|
test "functions:to_seconds--1-0" {
  api_number(
    @opentime.RationalTime::new(value=-1.0, rate=0.0).to_seconds(),
    -1.0 / 0.0,
  )
}

///|
test "functions:to_time_string--1-0" {
  assert_true(
    @opentime.RationalTime::new(value=-1.0, rate=0.0).to_time_string() is Err(_),
  )
}

///|
test "functions:to_timecode--1-0" {
  assert_true(
    @opentime.RationalTime::new(value=-1.0, rate=0.0).to_timecode() is Err(_),
  )
}

///|
test "functions:to_nearest_timecode--1-0" {
  assert_true(
    @opentime.RationalTime::new(value=-1.0, rate=0.0).to_nearest_timecode()
    is Err(_),
  )
}

///|
test "functions:from_frames--1-0" {
  let actual = @opentime.from_frames(-1.0, 0.0).unwrap()
  api_number(actual.value, -1.0)
  api_number(actual.rate, 0.0)
}

///|
test "functions:from_seconds--1-0" {
  let actual = @opentime.from_seconds(-1.0)
  api_number(actual.value, -1.0)
  api_number(actual.rate, 1.0)
}

///|
test "functions:to_frames--1-1" {
  assert_eq(
    @opentime.RationalTime::new(value=-1.0, rate=1.0).to_frames().unwrap(),
    -1,
  )
}

///|
test "functions:to_seconds--1-1" {
  api_number(
    @opentime.RationalTime::new(value=-1.0, rate=1.0).to_seconds(),
    -1.0,
  )
}

///|
test "functions:to_time_string--1-1" {
  assert_eq(
    @opentime.RationalTime::new(value=-1.0, rate=1.0).to_time_string().unwrap(),
    "-00:00:01.0",
  )
}

///|
test "functions:to_timecode--1-1" {
  assert_true(
    @opentime.RationalTime::new(value=-1.0, rate=1.0).to_timecode() is Err(_),
  )
}

///|
test "functions:to_nearest_timecode--1-1" {
  assert_true(
    @opentime.RationalTime::new(value=-1.0, rate=1.0).to_nearest_timecode()
    is Err(_),
  )
}

///|
test "functions:from_frames--1-1" {
  let actual = @opentime.from_frames(-1.0, 1.0).unwrap()
  api_number(actual.value, -1.0)
  api_number(actual.rate, 1.0)
}

///|
test "functions:from_seconds--1-1" {
  let actual = @opentime.from_seconds(-1.0)
  api_number(actual.value, -1.0)
  api_number(actual.rate, 1.0)
}

///|
test "functions:to_frames--1-24" {
  assert_eq(
    @opentime.RationalTime::new(value=-1.0, rate=24.0).to_frames().unwrap(),
    -1,
  )
}

///|
test "functions:to_seconds--1-24" {
  api_number(
    @opentime.RationalTime::new(value=-1.0, rate=24.0).to_seconds(),
    -0.041666666666666664,
  )
}

///|
test "functions:to_time_string--1-24" {
  assert_eq(
    @opentime.RationalTime::new(value=-1.0, rate=24.0).to_time_string().unwrap(),
    "-00:00:00.041666",
  )
}

///|
test "functions:to_timecode--1-24" {
  assert_true(
    @opentime.RationalTime::new(value=-1.0, rate=24.0).to_timecode() is Err(_),
  )
}

///|
test "functions:to_nearest_timecode--1-24" {
  assert_true(
    @opentime.RationalTime::new(value=-1.0, rate=24.0).to_nearest_timecode()
    is Err(_),
  )
}

///|
test "functions:from_frames--1-24" {
  let actual = @opentime.from_frames(-1.0, 24.0).unwrap()
  api_number(actual.value, -1.0)
  api_number(actual.rate, 24.0)
}

///|
test "functions:from_seconds--1-24" {
  let actual = @opentime.from_seconds(-1.0)
  api_number(actual.value, -1.0)
  api_number(actual.rate, 1.0)
}

///|
test "functions:to_frames--1-29.97" {
  assert_eq(
    @opentime.RationalTime::new(value=-1.0, rate=29.97).to_frames().unwrap(),
    -1,
  )
}

///|
test "functions:to_seconds--1-29.97" {
  api_number(
    @opentime.RationalTime::new(value=-1.0, rate=29.97).to_seconds(),
    -0.033366700033366704,
  )
}

///|
test "functions:to_time_string--1-29.97" {
  assert_eq(
    @opentime.RationalTime::new(value=-1.0, rate=29.97)
    .to_time_string()
    .unwrap(),
    "-00:00:00.033366",
  )
}

///|
test "functions:to_timecode--1-29.97" {
  assert_true(
    @opentime.RationalTime::new(value=-1.0, rate=29.97).to_timecode() is Err(_),
  )
}

///|
test "functions:to_nearest_timecode--1-29.97" {
  assert_true(
    @opentime.RationalTime::new(value=-1.0, rate=29.97).to_nearest_timecode()
    is Err(_),
  )
}

///|
test "functions:from_frames--1-29.97" {
  let actual = @opentime.from_frames(-1.0, 29.97).unwrap()
  api_number(actual.value, -1.0)
  api_number(actual.rate, 29.97)
}

///|
test "functions:from_seconds--1-29.97" {
  let actual = @opentime.from_seconds(-1.0)
  api_number(actual.value, -1.0)
  api_number(actual.rate, 1.0)
}

///|
test "functions:to_frames-0-0" {
  assert_eq(
    @opentime.RationalTime::new(value=0.0, rate=0.0).to_frames().unwrap(),
    0,
  )
}

///|
test "functions:to_seconds-0-0" {
  api_number(
    @opentime.RationalTime::new(value=0.0, rate=0.0).to_seconds(),
    0.0 / 0.0,
  )
}

///|
test "functions:to_time_string-0-0" {
  assert_true(
    @opentime.RationalTime::new(value=0.0, rate=0.0).to_time_string() is Err(_),
  )
}

///|
test "functions:to_timecode-0-0" {
  assert_true(
    @opentime.RationalTime::new(value=0.0, rate=0.0).to_timecode() is Err(_),
  )
}

///|
test "functions:to_nearest_timecode-0-0" {
  assert_true(
    @opentime.RationalTime::new(value=0.0, rate=0.0).to_nearest_timecode()
    is Err(_),
  )
}

///|
test "functions:from_frames-0-0" {
  let actual = @opentime.from_frames(0.0, 0.0).unwrap()
  api_number(actual.value, 0.0)
  api_number(actual.rate, 0.0)
}

///|
test "functions:from_seconds-0-0" {
  let actual = @opentime.from_seconds(0.0)
  api_number(actual.value, 0.0)
  api_number(actual.rate, 1.0)
}

///|
test "functions:to_frames-0-1" {
  assert_eq(
    @opentime.RationalTime::new(value=0.0, rate=1.0).to_frames().unwrap(),
    0,
  )
}

///|
test "functions:to_seconds-0-1" {
  api_number(@opentime.RationalTime::new(value=0.0, rate=1.0).to_seconds(), 0.0)
}

///|
test "functions:to_time_string-0-1" {
  assert_eq(
    @opentime.RationalTime::new(value=0.0, rate=1.0).to_time_string().unwrap(),
    "00:00:00.0",
  )
}

///|
test "functions:to_timecode-0-1" {
  assert_true(
    @opentime.RationalTime::new(value=0.0, rate=1.0).to_timecode() is Err(_),
  )
}

///|
test "functions:to_nearest_timecode-0-1" {
  assert_true(
    @opentime.RationalTime::new(value=0.0, rate=1.0).to_nearest_timecode()
    is Err(_),
  )
}

///|
test "functions:from_frames-0-1" {
  let actual = @opentime.from_frames(0.0, 1.0).unwrap()
  api_number(actual.value, 0.0)
  api_number(actual.rate, 1.0)
}

///|
test "functions:from_seconds-0-1" {
  let actual = @opentime.from_seconds(0.0)
  api_number(actual.value, 0.0)
  api_number(actual.rate, 1.0)
}

///|
test "functions:to_frames-0-24" {
  assert_eq(
    @opentime.RationalTime::new(value=0.0, rate=24.0).to_frames().unwrap(),
    0,
  )
}

///|
test "functions:to_seconds-0-24" {
  api_number(
    @opentime.RationalTime::new(value=0.0, rate=24.0).to_seconds(),
    0.0,
  )
}

///|
test "functions:to_time_string-0-24" {
  assert_eq(
    @opentime.RationalTime::new(value=0.0, rate=24.0).to_time_string().unwrap(),
    "00:00:00.0",
  )
}

///|
test "functions:to_timecode-0-24" {
  assert_eq(
    @opentime.RationalTime::new(value=0.0, rate=24.0).to_timecode().unwrap(),
    "00:00:00:00",
  )
}

///|
test "functions:to_nearest_timecode-0-24" {
  assert_eq(
    @opentime.RationalTime::new(value=0.0, rate=24.0)
    .to_nearest_timecode()
    .unwrap(),
    "00:00:00:00",
  )
}

///|
test "functions:from_frames-0-24" {
  let actual = @opentime.from_frames(0.0, 24.0).unwrap()
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
}

///|
test "functions:from_seconds-0-24" {
  let actual = @opentime.from_seconds(0.0)
  api_number(actual.value, 0.0)
  api_number(actual.rate, 1.0)
}

///|
test "functions:to_frames-0-29.97" {
  assert_eq(
    @opentime.RationalTime::new(value=0.0, rate=29.97).to_frames().unwrap(),
    0,
  )
}

///|
test "functions:to_seconds-0-29.97" {
  api_number(
    @opentime.RationalTime::new(value=0.0, rate=29.97).to_seconds(),
    0.0,
  )
}

///|
test "functions:to_time_string-0-29.97" {
  assert_eq(
    @opentime.RationalTime::new(value=0.0, rate=29.97).to_time_string().unwrap(),
    "00:00:00.0",
  )
}

///|
test "functions:to_timecode-0-29.97" {
  assert_eq(
    @opentime.RationalTime::new(value=0.0, rate=29.97).to_timecode().unwrap(),
    "00:00:00;00",
  )
}

///|
test "functions:to_nearest_timecode-0-29.97" {
  assert_eq(
    @opentime.RationalTime::new(value=0.0, rate=29.97)
    .to_nearest_timecode()
    .unwrap(),
    "00:00:00;00",
  )
}

///|
test "functions:from_frames-0-29.97" {
  let actual = @opentime.from_frames(0.0, 29.97).unwrap()
  api_number(actual.value, 0.0)
  api_number(actual.rate, 29.97)
}

///|
test "functions:from_seconds-0-29.97" {
  let actual = @opentime.from_seconds(0.0)
  api_number(actual.value, 0.0)
  api_number(actual.rate, 1.0)
}

///|
test "functions:to_frames-1-0" {
  assert_eq(
    @opentime.RationalTime::new(value=1.0, rate=0.0).to_frames().unwrap(),
    1,
  )
}

///|
test "functions:to_seconds-1-0" {
  api_number(
    @opentime.RationalTime::new(value=1.0, rate=0.0).to_seconds(),
    1.0 / 0.0,
  )
}

///|
test "functions:to_time_string-1-0" {
  assert_true(
    @opentime.RationalTime::new(value=1.0, rate=0.0).to_time_string() is Err(_),
  )
}

///|
test "functions:to_timecode-1-0" {
  assert_true(
    @opentime.RationalTime::new(value=1.0, rate=0.0).to_timecode() is Err(_),
  )
}

///|
test "functions:to_nearest_timecode-1-0" {
  assert_true(
    @opentime.RationalTime::new(value=1.0, rate=0.0).to_nearest_timecode()
    is Err(_),
  )
}

///|
test "functions:from_frames-1-0" {
  let actual = @opentime.from_frames(1.0, 0.0).unwrap()
  api_number(actual.value, 1.0)
  api_number(actual.rate, 0.0)
}

///|
test "functions:from_seconds-1-0" {
  let actual = @opentime.from_seconds(1.0)
  api_number(actual.value, 1.0)
  api_number(actual.rate, 1.0)
}

///|
test "functions:to_frames-1-1" {
  assert_eq(
    @opentime.RationalTime::new(value=1.0, rate=1.0).to_frames().unwrap(),
    1,
  )
}

///|
test "functions:to_seconds-1-1" {
  api_number(@opentime.RationalTime::new(value=1.0, rate=1.0).to_seconds(), 1.0)
}

///|
test "functions:to_time_string-1-1" {
  assert_eq(
    @opentime.RationalTime::new(value=1.0, rate=1.0).to_time_string().unwrap(),
    "00:00:01.0",
  )
}

///|
test "functions:to_timecode-1-1" {
  assert_true(
    @opentime.RationalTime::new(value=1.0, rate=1.0).to_timecode() is Err(_),
  )
}

///|
test "functions:to_nearest_timecode-1-1" {
  assert_true(
    @opentime.RationalTime::new(value=1.0, rate=1.0).to_nearest_timecode()
    is Err(_),
  )
}

///|
test "functions:from_frames-1-1" {
  let actual = @opentime.from_frames(1.0, 1.0).unwrap()
  api_number(actual.value, 1.0)
  api_number(actual.rate, 1.0)
}

///|
test "functions:from_seconds-1-1" {
  let actual = @opentime.from_seconds(1.0)
  api_number(actual.value, 1.0)
  api_number(actual.rate, 1.0)
}

///|
test "functions:to_frames-1-24" {
  assert_eq(
    @opentime.RationalTime::new(value=1.0, rate=24.0).to_frames().unwrap(),
    1,
  )
}

///|
test "functions:to_seconds-1-24" {
  api_number(
    @opentime.RationalTime::new(value=1.0, rate=24.0).to_seconds(),
    0.041666666666666664,
  )
}

///|
test "functions:to_time_string-1-24" {
  assert_eq(
    @opentime.RationalTime::new(value=1.0, rate=24.0).to_time_string().unwrap(),
    "00:00:00.041666",
  )
}

///|
test "functions:to_timecode-1-24" {
  assert_eq(
    @opentime.RationalTime::new(value=1.0, rate=24.0).to_timecode().unwrap(),
    "00:00:00:01",
  )
}

///|
test "functions:to_nearest_timecode-1-24" {
  assert_eq(
    @opentime.RationalTime::new(value=1.0, rate=24.0)
    .to_nearest_timecode()
    .unwrap(),
    "00:00:00:01",
  )
}

///|
test "functions:from_frames-1-24" {
  let actual = @opentime.from_frames(1.0, 24.0).unwrap()
  api_number(actual.value, 1.0)
  api_number(actual.rate, 24.0)
}

///|
test "functions:from_seconds-1-24" {
  let actual = @opentime.from_seconds(1.0)
  api_number(actual.value, 1.0)
  api_number(actual.rate, 1.0)
}

///|
test "functions:to_frames-1-29.97" {
  assert_eq(
    @opentime.RationalTime::new(value=1.0, rate=29.97).to_frames().unwrap(),
    1,
  )
}

///|
test "functions:to_seconds-1-29.97" {
  api_number(
    @opentime.RationalTime::new(value=1.0, rate=29.97).to_seconds(),
    0.033366700033366704,
  )
}

///|
test "functions:to_time_string-1-29.97" {
  assert_eq(
    @opentime.RationalTime::new(value=1.0, rate=29.97).to_time_string().unwrap(),
    "00:00:00.033366",
  )
}

///|
test "functions:to_timecode-1-29.97" {
  assert_eq(
    @opentime.RationalTime::new(value=1.0, rate=29.97).to_timecode().unwrap(),
    "00:00:00;01",
  )
}

///|
test "functions:to_nearest_timecode-1-29.97" {
  assert_eq(
    @opentime.RationalTime::new(value=1.0, rate=29.97)
    .to_nearest_timecode()
    .unwrap(),
    "00:00:00;01",
  )
}

///|
test "functions:from_frames-1-29.97" {
  let actual = @opentime.from_frames(1.0, 29.97).unwrap()
  api_number(actual.value, 1.0)
  api_number(actual.rate, 29.97)
}

///|
test "functions:from_seconds-1-29.97" {
  let actual = @opentime.from_seconds(1.0)
  api_number(actual.value, 1.0)
  api_number(actual.rate, 1.0)
}

///|
test "functions:to_frames-100-0" {
  assert_eq(
    @opentime.RationalTime::new(value=100.0, rate=0.0).to_frames().unwrap(),
    100,
  )
}

///|
test "functions:to_seconds-100-0" {
  api_number(
    @opentime.RationalTime::new(value=100.0, rate=0.0).to_seconds(),
    1.0 / 0.0,
  )
}

///|
test "functions:to_time_string-100-0" {
  assert_true(
    @opentime.RationalTime::new(value=100.0, rate=0.0).to_time_string()
    is Err(_),
  )
}

///|
test "functions:to_timecode-100-0" {
  assert_true(
    @opentime.RationalTime::new(value=100.0, rate=0.0).to_timecode() is Err(_),
  )
}

///|
test "functions:to_nearest_timecode-100-0" {
  assert_true(
    @opentime.RationalTime::new(value=100.0, rate=0.0).to_nearest_timecode()
    is Err(_),
  )
}

///|
test "functions:from_frames-100-0" {
  let actual = @opentime.from_frames(100.0, 0.0).unwrap()
  api_number(actual.value, 100.0)
  api_number(actual.rate, 0.0)
}

///|
test "functions:from_seconds-100-0" {
  let actual = @opentime.from_seconds(100.0)
  api_number(actual.value, 100.0)
  api_number(actual.rate, 1.0)
}

///|
test "functions:to_frames-100-1" {
  assert_eq(
    @opentime.RationalTime::new(value=100.0, rate=1.0).to_frames().unwrap(),
    100,
  )
}

///|
test "functions:to_seconds-100-1" {
  api_number(
    @opentime.RationalTime::new(value=100.0, rate=1.0).to_seconds(),
    100.0,
  )
}

///|
test "functions:to_time_string-100-1" {
  assert_eq(
    @opentime.RationalTime::new(value=100.0, rate=1.0).to_time_string().unwrap(),
    "00:01:40.0",
  )
}

///|
test "functions:to_timecode-100-1" {
  assert_true(
    @opentime.RationalTime::new(value=100.0, rate=1.0).to_timecode() is Err(_),
  )
}

///|
test "functions:to_nearest_timecode-100-1" {
  assert_true(
    @opentime.RationalTime::new(value=100.0, rate=1.0).to_nearest_timecode()
    is Err(_),
  )
}

///|
test "functions:from_frames-100-1" {
  let actual = @opentime.from_frames(100.0, 1.0).unwrap()
  api_number(actual.value, 100.0)
  api_number(actual.rate, 1.0)
}

///|
test "functions:from_seconds-100-1" {
  let actual = @opentime.from_seconds(100.0)
  api_number(actual.value, 100.0)
  api_number(actual.rate, 1.0)
}

///|
test "functions:to_frames-100-24" {
  assert_eq(
    @opentime.RationalTime::new(value=100.0, rate=24.0).to_frames().unwrap(),
    100,
  )
}

///|
test "functions:to_seconds-100-24" {
  api_number(
    @opentime.RationalTime::new(value=100.0, rate=24.0).to_seconds(),
    4.166666666666667,
  )
}

///|
test "functions:to_time_string-100-24" {
  assert_eq(
    @opentime.RationalTime::new(value=100.0, rate=24.0)
    .to_time_string()
    .unwrap(),
    "00:00:04.166666",
  )
}

///|
test "functions:to_timecode-100-24" {
  assert_eq(
    @opentime.RationalTime::new(value=100.0, rate=24.0).to_timecode().unwrap(),
    "00:00:04:04",
  )
}

///|
test "functions:to_nearest_timecode-100-24" {
  assert_eq(
    @opentime.RationalTime::new(value=100.0, rate=24.0)
    .to_nearest_timecode()
    .unwrap(),
    "00:00:04:04",
  )
}

///|
test "functions:from_frames-100-24" {
  let actual = @opentime.from_frames(100.0, 24.0).unwrap()
  api_number(actual.value, 100.0)
  api_number(actual.rate, 24.0)
}

///|
test "functions:from_seconds-100-24" {
  let actual = @opentime.from_seconds(100.0)
  api_number(actual.value, 100.0)
  api_number(actual.rate, 1.0)
}

///|
test "functions:to_frames-100-29.97" {
  assert_eq(
    @opentime.RationalTime::new(value=100.0, rate=29.97).to_frames().unwrap(),
    100,
  )
}

///|
test "functions:to_seconds-100-29.97" {
  api_number(
    @opentime.RationalTime::new(value=100.0, rate=29.97).to_seconds(),
    3.3366700033366703,
  )
}

///|
test "functions:to_time_string-100-29.97" {
  assert_eq(
    @opentime.RationalTime::new(value=100.0, rate=29.97)
    .to_time_string()
    .unwrap(),
    "00:00:03.33667",
  )
}

///|
test "functions:to_timecode-100-29.97" {
  assert_eq(
    @opentime.RationalTime::new(value=100.0, rate=29.97).to_timecode().unwrap(),
    "00:00:03;10",
  )
}

///|
test "functions:to_nearest_timecode-100-29.97" {
  assert_eq(
    @opentime.RationalTime::new(value=100.0, rate=29.97)
    .to_nearest_timecode()
    .unwrap(),
    "00:00:03;10",
  )
}

///|
test "functions:from_frames-100-29.97" {
  let actual = @opentime.from_frames(100.0, 29.97).unwrap()
  api_number(actual.value, 100.0)
  api_number(actual.rate, 29.97)
}

///|
test "functions:from_seconds-100-29.97" {
  let actual = @opentime.from_seconds(100.0)
  api_number(actual.value, 100.0)
  api_number(actual.rate, 1.0)
}

///|
test "functions:from_timecode-0" {
  let actual = @opentime.from_timecode("00:00:01:00", 24.0).unwrap()
  api_number(actual.value, 24.0)
  api_number(actual.rate, 24.0)
}

///|
test "functions:from_timecode-1" {
  assert_true(@opentime.from_timecode("00:01:00;00", 24.0) is Err(_))
}

///|
test "functions:from_timecode-2" {
  assert_true(@opentime.from_timecode("bad", 24.0) is Err(_))
}

///|
test "functions:from_time_string-0" {
  let actual = @opentime.from_time_string("00:00:01.5", 24.0).unwrap()
  api_number(actual.value, 36.0)
  api_number(actual.rate, 24.0)
}

///|
test "functions:from_time_string-1" {
  let actual = @opentime.from_time_string("00:00:00", 24.0).unwrap()
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
}

///|
test "functions:from_time_string-2" {
  assert_true(@opentime.from_time_string("bad", 24.0) is Err(_))
}

///|
test "functions:duration_from_start_end_time-0.0-24.0" {
  let actual = @opentime.duration_from_start_end_time(
    @opentime.RationalTime::new(value=0.0, rate=24.0),
    @opentime.RationalTime::new(value=24.0, rate=30.0),
    inclusive=false,
  )
  api_number(actual.value, 19.2)
  api_number(actual.rate, 24.0)
}

///|
test "functions:range_from_start_end_time-0.0-24.0" {
  let actual_range = @opentime.from_start_end(
    @opentime.RationalTime::new(value=0.0, rate=24.0),
    @opentime.RationalTime::new(value=24.0, rate=30.0),
    inclusive=false,
  )
  let actual = actual_range.start_time
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 19.2)
  api_number(actual.rate, 24.0)
}

///|
test "functions:duration_from_start_end_time_inclusive-0.0-24.0" {
  let actual = @opentime.duration_from_start_end_time(
    @opentime.RationalTime::new(value=0.0, rate=24.0),
    @opentime.RationalTime::new(value=24.0, rate=30.0),
    inclusive=true,
  )
  api_number(actual.value, 20.2)
  api_number(actual.rate, 24.0)
}

///|
test "functions:range_from_start_end_time_inclusive-0.0-24.0" {
  let actual_range = @opentime.from_start_end(
    @opentime.RationalTime::new(value=0.0, rate=24.0),
    @opentime.RationalTime::new(value=24.0, rate=30.0),
    inclusive=true,
  )
  let actual = actual_range.start_time
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, 20.2)
  api_number(actual.rate, 24.0)
}

///|
test "functions:duration_from_start_end_time-100.0-0.0" {
  let actual = @opentime.duration_from_start_end_time(
    @opentime.RationalTime::new(value=100.0, rate=24.0),
    @opentime.RationalTime::new(value=0.0, rate=24.0),
    inclusive=false,
  )
  api_number(actual.value, -100.0)
  api_number(actual.rate, 24.0)
}

///|
test "functions:range_from_start_end_time-100.0-0.0" {
  let actual_range = @opentime.from_start_end(
    @opentime.RationalTime::new(value=100.0, rate=24.0),
    @opentime.RationalTime::new(value=0.0, rate=24.0),
    inclusive=false,
  )
  let actual = actual_range.start_time
  api_number(actual.value, 100.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, -100.0)
  api_number(actual.rate, 24.0)
}

///|
test "functions:duration_from_start_end_time_inclusive-100.0-0.0" {
  let actual = @opentime.duration_from_start_end_time(
    @opentime.RationalTime::new(value=100.0, rate=24.0),
    @opentime.RationalTime::new(value=0.0, rate=24.0),
    inclusive=true,
  )
  api_number(actual.value, -99.0)
  api_number(actual.rate, 24.0)
}

///|
test "functions:range_from_start_end_time_inclusive-100.0-0.0" {
  let actual_range = @opentime.from_start_end(
    @opentime.RationalTime::new(value=100.0, rate=24.0),
    @opentime.RationalTime::new(value=0.0, rate=24.0),
    inclusive=true,
  )
  let actual = actual_range.start_time
  api_number(actual.value, 100.0)
  api_number(actual.rate, 24.0)
  let actual = actual_range.duration
  api_number(actual.value, -99.0)
  api_number(actual.rate, 24.0)
}

///|
test "functions:duration_from_start_end_time--1.0-1.0" {
  let actual = @opentime.duration_from_start_end_time(
    @opentime.RationalTime::new(value=-1.0, rate=1.0),
    @opentime.RationalTime::new(value=1.0, rate=30.0),
    inclusive=false,
  )
  api_number(actual.value, 1.0333333333333334)
  api_number(actual.rate, 1.0)
}

///|
test "functions:range_from_start_end_time--1.0-1.0" {
  let actual_range = @opentime.from_start_end(
    @opentime.RationalTime::new(value=-1.0, rate=1.0),
    @opentime.RationalTime::new(value=1.0, rate=30.0),
    inclusive=false,
  )
  let actual = actual_range.start_time
  api_number(actual.value, -1.0)
  api_number(actual.rate, 1.0)
  let actual = actual_range.duration
  api_number(actual.value, 1.0333333333333334)
  api_number(actual.rate, 1.0)
}

///|
test "functions:duration_from_start_end_time_inclusive--1.0-1.0" {
  let actual = @opentime.duration_from_start_end_time(
    @opentime.RationalTime::new(value=-1.0, rate=1.0),
    @opentime.RationalTime::new(value=1.0, rate=30.0),
    inclusive=true,
  )
  api_number(actual.value, 2.033333333333333)
  api_number(actual.rate, 1.0)
}

///|
test "functions:range_from_start_end_time_inclusive--1.0-1.0" {
  let actual_range = @opentime.from_start_end(
    @opentime.RationalTime::new(value=-1.0, rate=1.0),
    @opentime.RationalTime::new(value=1.0, rate=30.0),
    inclusive=true,
  )
  let actual = actual_range.start_time
  api_number(actual.value, -1.0)
  api_number(actual.rate, 1.0)
  let actual = actual_range.duration
  api_number(actual.value, 2.033333333333333)
  api_number(actual.rate, 1.0)
}

///|
test "functions:timeline-0" {
  assert_true(
    @schema.timeline_from_clips([])
    .unwrap()
    .equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"Timeline.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"global_start_time\": null,\n    \"tracks\": {\n        \"OTIO_SCHEMA\": \"Stack.1\",\n        \"metadata\": {},\n        \"name\": \"tracks\",\n        \"source_range\": null,\n        \"effects\": [],\n        \"markers\": [],\n        \"enabled\": true,\n        \"color\": null,\n        \"children\": [\n            {\n                \"OTIO_SCHEMA\": \"Track.1\",\n                \"metadata\": {},\n                \"name\": \"\",\n                \"source_range\": null,\n                \"effects\": [],\n                \"markers\": [],\n                \"enabled\": true,\n                \"color\": null,\n                \"children\": [],\n                \"kind\": \"Video\"\n            }\n        ]\n    }\n}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:timeline-1" {
  assert_true(
    @schema.timeline_from_clips([
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"Clip.2\",\n    \"metadata\": {},\n    \"name\": \"a\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"media_references\": {\n        \"DEFAULT_MEDIA\": {\n            \"OTIO_SCHEMA\": \"MissingReference.1\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"available_range\": null,\n            \"available_image_bounds\": null\n        }\n    },\n    \"active_media_reference_key\": \"DEFAULT_MEDIA\"\n}",
      ).unwrap(),
    ])
    .unwrap()
    .equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"Timeline.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"global_start_time\": null,\n    \"tracks\": {\n        \"OTIO_SCHEMA\": \"Stack.1\",\n        \"metadata\": {},\n        \"name\": \"tracks\",\n        \"source_range\": null,\n        \"effects\": [],\n        \"markers\": [],\n        \"enabled\": true,\n        \"color\": null,\n        \"children\": [\n            {\n                \"OTIO_SCHEMA\": \"Track.1\",\n                \"metadata\": {},\n                \"name\": \"\",\n                \"source_range\": null,\n                \"effects\": [],\n                \"markers\": [],\n                \"enabled\": true,\n                \"color\": null,\n                \"children\": [\n                    {\n                        \"OTIO_SCHEMA\": \"Clip.2\",\n                        \"metadata\": {},\n                        \"name\": \"a\",\n                        \"source_range\": null,\n                        \"effects\": [],\n                        \"markers\": [],\n                        \"enabled\": true,\n                        \"color\": null,\n                        \"media_references\": {\n                            \"DEFAULT_MEDIA\": {\n                                \"OTIO_SCHEMA\": \"MissingReference.1\",\n                                \"metadata\": {},\n                                \"name\": \"\",\n                                \"available_range\": null,\n                                \"available_image_bounds\": null\n                            }\n                        },\n                        \"active_media_reference_key\": \"DEFAULT_MEDIA\"\n                    }\n                ],\n                \"kind\": \"Video\"\n            }\n        ]\n    }\n}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:timeline-2" {
  assert_true(
    @schema.timeline_from_clips([
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"Gap.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"source_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 1.0,\n            \"value\": 0.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 1.0,\n            \"value\": 0.0\n        }\n    },\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null\n}",
      ).unwrap(),
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"Transition.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"in_offset\": {\n        \"OTIO_SCHEMA\": \"RationalTime.1\",\n        \"rate\": 1.0,\n        \"value\": 0.0\n    },\n    \"out_offset\": {\n        \"OTIO_SCHEMA\": \"RationalTime.1\",\n        \"rate\": 1.0,\n        \"value\": 0.0\n    },\n    \"transition_type\": \"\"\n}",
      ).unwrap(),
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"Clip.2\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"media_references\": {\n        \"DEFAULT_MEDIA\": {\n            \"OTIO_SCHEMA\": \"MissingReference.1\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"available_range\": null,\n            \"available_image_bounds\": null\n        }\n    },\n    \"active_media_reference_key\": \"DEFAULT_MEDIA\"\n}",
      ).unwrap(),
    ])
    .unwrap()
    .equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"Timeline.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"global_start_time\": null,\n    \"tracks\": {\n        \"OTIO_SCHEMA\": \"Stack.1\",\n        \"metadata\": {},\n        \"name\": \"tracks\",\n        \"source_range\": null,\n        \"effects\": [],\n        \"markers\": [],\n        \"enabled\": true,\n        \"color\": null,\n        \"children\": [\n            {\n                \"OTIO_SCHEMA\": \"Track.1\",\n                \"metadata\": {},\n                \"name\": \"\",\n                \"source_range\": null,\n                \"effects\": [],\n                \"markers\": [],\n                \"enabled\": true,\n                \"color\": null,\n                \"children\": [\n                    {\n                        \"OTIO_SCHEMA\": \"Gap.1\",\n                        \"metadata\": {},\n                        \"name\": \"\",\n                        \"source_range\": {\n                            \"OTIO_SCHEMA\": \"TimeRange.1\",\n                            \"duration\": {\n                                \"OTIO_SCHEMA\": \"RationalTime.1\",\n                                \"rate\": 1.0,\n                                \"value\": 0.0\n                            },\n                            \"start_time\": {\n                                \"OTIO_SCHEMA\": \"RationalTime.1\",\n                                \"rate\": 1.0,\n                                \"value\": 0.0\n                            }\n                        },\n                        \"effects\": [],\n                        \"markers\": [],\n                        \"enabled\": true,\n                        \"color\": null\n                    },\n                    {\n                        \"OTIO_SCHEMA\": \"Transition.1\",\n                        \"metadata\": {},\n                        \"name\": \"\",\n                        \"in_offset\": {\n                            \"OTIO_SCHEMA\": \"RationalTime.1\",\n                            \"rate\": 1.0,\n                            \"value\": 0.0\n                        },\n                        \"out_offset\": {\n                            \"OTIO_SCHEMA\": \"RationalTime.1\",\n                            \"rate\": 1.0,\n                            \"value\": 0.0\n                        },\n                        \"transition_type\": \"\"\n                    },\n                    {\n                        \"OTIO_SCHEMA\": \"Clip.2\",\n                        \"metadata\": {},\n                        \"name\": \"\",\n                        \"source_range\": null,\n                        \"effects\": [],\n                        \"markers\": [],\n                        \"enabled\": true,\n                        \"color\": null,\n                        \"media_references\": {\n                            \"DEFAULT_MEDIA\": {\n                                \"OTIO_SCHEMA\": \"MissingReference.1\",\n                                \"metadata\": {},\n                                \"name\": \"\",\n                                \"available_range\": null,\n                                \"available_image_bounds\": null\n                            }\n                        },\n                        \"active_media_reference_key\": \"DEFAULT_MEDIA\"\n                    }\n                ],\n                \"kind\": \"Video\"\n            }\n        ]\n    }\n}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:timeline-3" {
  assert_true(
    @schema.timeline_from_clips([
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"Marker.2\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"color\": \"RED\",\n    \"marked_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 1.0,\n            \"value\": 0.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 1.0,\n            \"value\": 0.0\n        }\n    },\n    \"comment\": \"\"\n}",
      ).unwrap(),
    ])
    is Err(_),
  )
}

///|
test "functions:timeline-4" {
  assert_true(
    @schema.timeline_from_clips([
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"Effect.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"effect_name\": \"\",\n    \"enabled\": true\n}",
      ).unwrap(),
    ])
    is Err(_),
  )
}

///|
test "functions:url-False-url_from_filepath-0" {
  assert_eq(@url_utils.url_from_filepath("", windows=false), "")
}

///|
test "functions:url-False-url_from_filepath-1" {
  assert_eq(@url_utils.url_from_filepath("a/b.mov", windows=false), "a/b.mov")
}

///|
test "functions:url-False-url_from_filepath-2" {
  assert_eq(@url_utils.url_from_filepath("a b.mov", windows=false), "a b.mov")
}

///|
test "functions:url-False-url_from_filepath-3" {
  assert_eq(
    @url_utils.url_from_filepath("/a/b.mov", windows=false),
    "file:///a/b.mov",
  )
}

///|
test "functions:url-False-url_from_filepath-4" {
  assert_eq(
    @url_utils.url_from_filepath("/a//./b.mov", windows=false),
    "file:///a/b.mov",
  )
}

///|
test "functions:url-False-url_from_filepath-5" {
  assert_eq(
    @url_utils.url_from_filepath("//host/share/a.mov", windows=false),
    "file:////host/share/a.mov",
  )
}

///|
test "functions:url-False-url_from_filepath-6" {
  assert_eq(
    @url_utils.url_from_filepath("C:/a b.mov", windows=false),
    "C:/a b.mov",
  )
}

///|
test "functions:url-False-url_from_filepath-7" {
  assert_eq(
    @url_utils.url_from_filepath("C:\\a\\b.mov", windows=false),
    "C:\\a\\b.mov",
  )
}

///|
test "functions:url-False-url_from_filepath-8" {
  assert_eq(@url_utils.url_from_filepath("../a.mov", windows=false), "../a.mov")
}

///|
test "functions:url-False-url_from_filepath-9" {
  assert_eq(
    @url_utils.url_from_filepath("a%20b.mov", windows=false),
    "a%20b.mov",
  )
}

///|
test "functions:url-False-url_from_filepath-10" {
  assert_eq(
    @url_utils.url_from_filepath("/中文/a.mov", windows=false),
    "file:///中文/a.mov",
  )
}

///|
test "functions:url-False-filepath_from_url-0" {
  assert_true(@url_utils.filepath_from_url("", windows=false) is Err(_))
}

///|
test "functions:url-False-filepath_from_url-1" {
  assert_true(@url_utils.filepath_from_url("file:", windows=false) is Err(_))
}

///|
test "functions:url-False-filepath_from_url-2" {
  assert_eq(
    @url_utils.filepath_from_url("relative.mov", windows=false).unwrap(),
    "relative.mov",
  )
}

///|
test "functions:url-False-filepath_from_url-3" {
  assert_eq(
    @url_utils.filepath_from_url("a%20b.mov", windows=false).unwrap(),
    "a b.mov",
  )
}

///|
test "functions:url-False-filepath_from_url-4" {
  assert_eq(
    @url_utils.filepath_from_url("file:///a/b.mov", windows=false).unwrap(),
    "/a/b.mov",
  )
}

///|
test "functions:url-False-filepath_from_url-5" {
  assert_eq(
    @url_utils.filepath_from_url("file:///a%2520b.mov", windows=false).unwrap(),
    "/a b.mov",
  )
}

///|
test "functions:url-False-filepath_from_url-6" {
  assert_eq(
    @url_utils.filepath_from_url("file://localhost/a.mov", windows=false).unwrap(),
    "/a.mov",
  )
}

///|
test "functions:url-False-filepath_from_url-7" {
  assert_eq(
    @url_utils.filepath_from_url("file://host/share/a.mov", windows=false).unwrap(),
    "//host/share/a.mov",
  )
}

///|
test "functions:url-False-filepath_from_url-8" {
  assert_eq(
    @url_utils.filepath_from_url("file://C:/a.mov", windows=false).unwrap(),
    "C:/a.mov",
  )
}

///|
test "functions:url-False-filepath_from_url-9" {
  assert_eq(
    @url_utils.filepath_from_url("file:///C:/a.mov", windows=false).unwrap(),
    "C:/a.mov",
  )
}

///|
test "functions:url-False-filepath_from_url-10" {
  assert_eq(
    @url_utils.filepath_from_url("C:/a.mov", windows=false).unwrap(),
    "/a.mov",
  )
}

///|
test "functions:url-False-filepath_from_url-11" {
  assert_eq(
    @url_utils.filepath_from_url("file:///中文/a.mov", windows=false).unwrap(),
    "/中文/a.mov",
  )
}

///|
test "functions:url-False-filepath_from_url-12" {
  assert_eq(
    @url_utils.filepath_from_url("file:///a%ZZb.mov", windows=false).unwrap(),
    "/a%ZZb.mov",
  )
}

///|
test "functions:url-False-filepath_from_url-13" {
  assert_eq(
    @url_utils.filepath_from_url("file:///a%FFb.mov", windows=false).unwrap(),
    "/a�b.mov",
  )
}

///|
test "functions:url-False-filepath_from_url-14" {
  assert_eq(
    @url_utils.filepath_from_url("file:///a//./b.mov", windows=false).unwrap(),
    "/a/b.mov",
  )
}

///|
test "functions:url-False-filepath_from_url-15" {
  assert_eq(
    @url_utils.filepath_from_url("http://host/a.mov?q=1#x", windows=false).unwrap(),
    "//host/a.mov",
  )
}

///|
test "functions:url-False-filepath_from_url-16" {
  assert_eq(
    @url_utils.filepath_from_url("a.mov;part", windows=false).unwrap(),
    "a.mov",
  )
}

///|
test "functions:url-False-filepath_from_url-17" {
  assert_eq(
    @url_utils.filepath_from_url("file:///a.mov;part", windows=false).unwrap(),
    "/a.mov;part",
  )
}

///|
test "functions:url-False-filepath_from_url-18" {
  assert_true(
    @url_utils.filepath_from_url("file://[bad/path", windows=false) is Err(_),
  )
}

///|
test "functions:url-False-filepath_from_url-19" {
  assert_eq(
    @url_utils.filepath_from_url("file:///a%00b.mov", windows=false).unwrap(),
    "/a\u0000b.mov",
  )
}

///|
test "functions:url-False-filepath_from_url-20" {
  assert_eq(
    @url_utils.filepath_from_url(
      "file://host/S%3a/path/file.ext",
      windows=false,
    ).unwrap(),
    "S:/path/file.ext",
  )
}

///|
test "functions:url-False-filepath_from_url-21" {
  assert_eq(
    @url_utils.filepath_from_url(
      "file://unc/path/sub%20dir/file.ext",
      windows=false,
    ).unwrap(),
    "//unc/path/sub dir/file.ext",
  )
}

///|
test "functions:url-False-filepath_from_url-22" {
  assert_eq(
    @url_utils.filepath_from_url("./docs", windows=false).unwrap(),
    "docs",
  )
}

///|
test "functions:url-False-filepath_from_url-23" {
  assert_eq(
    @url_utils.filepath_from_url("/a/%EF%BB%BFb", windows=false).unwrap(),
    "/a/﻿b",
  )
}

///|
test "functions:url-False-filepath_from_url-24" {
  assert_eq(
    @url_utils.filepath_from_url("file:///a%252520b.mov", windows=false).unwrap(),
    "/a%20b.mov",
  )
}

///|
test "functions:url-False-filepath_from_url-25" {
  assert_eq(
    @url_utils.filepath_from_url("file:///a|/b.mov", windows=false).unwrap(),
    "/a|/b.mov",
  )
}

///|
test "functions:url-False-filepath_from_url-26" {
  assert_true(
    @url_utils.filepath_from_url("file://localhost", windows=false) is Err(_),
  )
}

///|
test "functions:url-False-filepath_from_url-27" {
  assert_eq(
    @url_utils.filepath_from_url("file://host/", windows=false).unwrap(),
    "//host",
  )
}

///|
test "functions:url-True-url_from_filepath-0" {
  assert_eq(@url_utils.url_from_filepath("", windows=true), "")
}

///|
test "functions:url-True-url_from_filepath-1" {
  assert_eq(@url_utils.url_from_filepath("a/b.mov", windows=true), "a/b.mov")
}

///|
test "functions:url-True-url_from_filepath-2" {
  assert_eq(@url_utils.url_from_filepath("a b.mov", windows=true), "a b.mov")
}

///|
test "functions:url-True-url_from_filepath-3" {
  assert_eq(
    @url_utils.url_from_filepath("/a/b.mov", windows=true),
    "file:///a/b.mov",
  )
}

///|
test "functions:url-True-url_from_filepath-4" {
  assert_eq(
    @url_utils.url_from_filepath("/a//./b.mov", windows=true),
    "file:///a//./b.mov",
  )
}

///|
test "functions:url-True-url_from_filepath-5" {
  assert_eq(
    @url_utils.url_from_filepath("//host/share/a.mov", windows=true),
    "file://host/share/a.mov",
  )
}

///|
test "functions:url-True-url_from_filepath-6" {
  assert_eq(
    @url_utils.url_from_filepath("C:/a b.mov", windows=true),
    "file:///C:/a b.mov",
  )
}

///|
test "functions:url-True-url_from_filepath-7" {
  assert_eq(
    @url_utils.url_from_filepath("C:\\a\\b.mov", windows=true),
    "file:///C:/a/b.mov",
  )
}

///|
test "functions:url-True-url_from_filepath-8" {
  assert_eq(@url_utils.url_from_filepath("../a.mov", windows=true), "../a.mov")
}

///|
test "functions:url-True-url_from_filepath-9" {
  assert_eq(
    @url_utils.url_from_filepath("a%20b.mov", windows=true),
    "a%20b.mov",
  )
}

///|
test "functions:url-True-url_from_filepath-10" {
  assert_eq(
    @url_utils.url_from_filepath("/中文/a.mov", windows=true),
    "file:///中文/a.mov",
  )
}

///|
test "functions:url-True-filepath_from_url-0" {
  assert_true(@url_utils.filepath_from_url("", windows=true) is Err(_))
}

///|
test "functions:url-True-filepath_from_url-1" {
  assert_true(@url_utils.filepath_from_url("file:", windows=true) is Err(_))
}

///|
test "functions:url-True-filepath_from_url-2" {
  assert_eq(
    @url_utils.filepath_from_url("relative.mov", windows=true).unwrap(),
    "relative.mov",
  )
}

///|
test "functions:url-True-filepath_from_url-3" {
  assert_eq(
    @url_utils.filepath_from_url("a%20b.mov", windows=true).unwrap(),
    "a b.mov",
  )
}

///|
test "functions:url-True-filepath_from_url-4" {
  assert_eq(
    @url_utils.filepath_from_url("file:///a/b.mov", windows=true).unwrap(),
    "/a/b.mov",
  )
}

///|
test "functions:url-True-filepath_from_url-5" {
  assert_eq(
    @url_utils.filepath_from_url("file:///a%2520b.mov", windows=true).unwrap(),
    "/a b.mov",
  )
}

///|
test "functions:url-True-filepath_from_url-6" {
  assert_eq(
    @url_utils.filepath_from_url("file://localhost/a.mov", windows=true).unwrap(),
    "/a.mov",
  )
}

///|
test "functions:url-True-filepath_from_url-7" {
  assert_eq(
    @url_utils.filepath_from_url("file://host/share/a.mov", windows=true).unwrap(),
    "//host/share/a.mov",
  )
}

///|
test "functions:url-True-filepath_from_url-8" {
  assert_eq(
    @url_utils.filepath_from_url("file://C:/a.mov", windows=true).unwrap(),
    "C:/a.mov",
  )
}

///|
test "functions:url-True-filepath_from_url-9" {
  assert_eq(
    @url_utils.filepath_from_url("file:///C:/a.mov", windows=true).unwrap(),
    "C:/a.mov",
  )
}

///|
test "functions:url-True-filepath_from_url-10" {
  assert_eq(
    @url_utils.filepath_from_url("C:/a.mov", windows=true).unwrap(),
    "/a.mov",
  )
}

///|
test "functions:url-True-filepath_from_url-11" {
  assert_eq(
    @url_utils.filepath_from_url("file:///中文/a.mov", windows=true).unwrap(),
    "/中文/a.mov",
  )
}

///|
test "functions:url-True-filepath_from_url-12" {
  assert_eq(
    @url_utils.filepath_from_url("file:///a%ZZb.mov", windows=true).unwrap(),
    "/a%ZZb.mov",
  )
}

///|
test "functions:url-True-filepath_from_url-13" {
  assert_eq(
    @url_utils.filepath_from_url("file:///a%FFb.mov", windows=true).unwrap(),
    "/a�b.mov",
  )
}

///|
test "functions:url-True-filepath_from_url-14" {
  assert_eq(
    @url_utils.filepath_from_url("file:///a//./b.mov", windows=true).unwrap(),
    "/a/b.mov",
  )
}

///|
test "functions:url-True-filepath_from_url-15" {
  assert_eq(
    @url_utils.filepath_from_url("http://host/a.mov?q=1#x", windows=true).unwrap(),
    "//host/a.mov",
  )
}

///|
test "functions:url-True-filepath_from_url-16" {
  assert_eq(
    @url_utils.filepath_from_url("a.mov;part", windows=true).unwrap(),
    "a.mov",
  )
}

///|
test "functions:url-True-filepath_from_url-17" {
  assert_eq(
    @url_utils.filepath_from_url("file:///a.mov;part", windows=true).unwrap(),
    "/a.mov;part",
  )
}

///|
test "functions:url-True-filepath_from_url-18" {
  assert_true(
    @url_utils.filepath_from_url("file://[bad/path", windows=true) is Err(_),
  )
}

///|
test "functions:url-True-filepath_from_url-19" {
  assert_eq(
    @url_utils.filepath_from_url("file:///a%00b.mov", windows=true).unwrap(),
    "/a\u0000b.mov",
  )
}

///|
test "functions:url-True-filepath_from_url-20" {
  assert_eq(
    @url_utils.filepath_from_url("file://host/S%3a/path/file.ext", windows=true).unwrap(),
    "S:/path/file.ext",
  )
}

///|
test "functions:url-True-filepath_from_url-21" {
  assert_eq(
    @url_utils.filepath_from_url(
      "file://unc/path/sub%20dir/file.ext",
      windows=true,
    ).unwrap(),
    "//unc/path/sub dir/file.ext",
  )
}

///|
test "functions:url-True-filepath_from_url-22" {
  assert_eq(
    @url_utils.filepath_from_url("./docs", windows=true).unwrap(),
    "docs",
  )
}

///|
test "functions:url-True-filepath_from_url-23" {
  assert_eq(
    @url_utils.filepath_from_url("/a/%EF%BB%BFb", windows=true).unwrap(),
    "/a/﻿b",
  )
}

///|
test "functions:url-True-filepath_from_url-24" {
  assert_eq(
    @url_utils.filepath_from_url("file:///a%252520b.mov", windows=true).unwrap(),
    "/a%20b.mov",
  )
}

///|
test "functions:url-True-filepath_from_url-25" {
  assert_eq(
    @url_utils.filepath_from_url("file:///a|/b.mov", windows=true).unwrap(),
    "A:/b.mov",
  )
}

///|
test "functions:url-True-filepath_from_url-26" {
  assert_true(
    @url_utils.filepath_from_url("file://localhost", windows=true) is Err(_),
  )
}

///|
test "functions:url-True-filepath_from_url-27" {
  assert_eq(
    @url_utils.filepath_from_url("file://host/", windows=true).unwrap(),
    "//host",
  )
}

///|
test "functions:available_adapter_names" {
  let manifest = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"PluginManifest.1\",\n    \"adapters\": [\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"read.py\",\n            \"name\": \"read\",\n            \"suffixes\": [\n                \"same\",\n                \"read\"\n            ]\n        },\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"write.py\",\n            \"name\": \"write\",\n            \"suffixes\": [\n                \"same\",\n                \"write\"\n            ]\n        }\n    ],\n    \"hook_scripts\": [\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"first.py\",\n            \"name\": \"first\"\n        },\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"second.py\",\n            \"name\": \"second\"\n        }\n    ],\n    \"hooks\": {\n        \"custom\": [\n            \"first\",\n            \"second\"\n        ],\n        \"empty\": []\n    },\n    \"media_linkers\": [\n        {\n            \"OTIO_SCHEMA\": \"MediaLinker.1\",\n            \"filepath\": \"link.py\",\n            \"name\": \"link\"\n        }\n    ],\n    \"schemadefs\": [],\n    \"version_manifests\": {}\n}",
  ).unwrap()
  assert_eq(@plugins.manifest_names(manifest, "adapters").unwrap(), [
    "read", "write",
  ])
}

///|
test "functions:available_media_linker_names" {
  let manifest = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"PluginManifest.1\",\n    \"adapters\": [\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"read.py\",\n            \"name\": \"read\",\n            \"suffixes\": [\n                \"same\",\n                \"read\"\n            ]\n        },\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"write.py\",\n            \"name\": \"write\",\n            \"suffixes\": [\n                \"same\",\n                \"write\"\n            ]\n        }\n    ],\n    \"hook_scripts\": [\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"first.py\",\n            \"name\": \"first\"\n        },\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"second.py\",\n            \"name\": \"second\"\n        }\n    ],\n    \"hooks\": {\n        \"custom\": [\n            \"first\",\n            \"second\"\n        ],\n        \"empty\": []\n    },\n    \"media_linkers\": [\n        {\n            \"OTIO_SCHEMA\": \"MediaLinker.1\",\n            \"filepath\": \"link.py\",\n            \"name\": \"link\"\n        }\n    ],\n    \"schemadefs\": [],\n    \"version_manifests\": {}\n}",
  ).unwrap()
  assert_eq(@plugins.manifest_names(manifest, "media_linkers").unwrap(), [
    "link",
  ])
}

///|
test "functions:available_hookscript_names" {
  let manifest = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"PluginManifest.1\",\n    \"adapters\": [\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"read.py\",\n            \"name\": \"read\",\n            \"suffixes\": [\n                \"same\",\n                \"read\"\n            ]\n        },\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"write.py\",\n            \"name\": \"write\",\n            \"suffixes\": [\n                \"same\",\n                \"write\"\n            ]\n        }\n    ],\n    \"hook_scripts\": [\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"first.py\",\n            \"name\": \"first\"\n        },\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"second.py\",\n            \"name\": \"second\"\n        }\n    ],\n    \"hooks\": {\n        \"custom\": [\n            \"first\",\n            \"second\"\n        ],\n        \"empty\": []\n    },\n    \"media_linkers\": [\n        {\n            \"OTIO_SCHEMA\": \"MediaLinker.1\",\n            \"filepath\": \"link.py\",\n            \"name\": \"link\"\n        }\n    ],\n    \"schemadefs\": [],\n    \"version_manifests\": {}\n}",
  ).unwrap()
  assert_eq(@plugins.manifest_names(manifest, "hook_scripts").unwrap(), [
    "first", "second",
  ])
}

///|
test "functions:available-hooks" {
  let manifest = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"PluginManifest.1\",\n    \"adapters\": [\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"read.py\",\n            \"name\": \"read\",\n            \"suffixes\": [\n                \"same\",\n                \"read\"\n            ]\n        },\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"write.py\",\n            \"name\": \"write\",\n            \"suffixes\": [\n                \"same\",\n                \"write\"\n            ]\n        }\n    ],\n    \"hook_scripts\": [\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"first.py\",\n            \"name\": \"first\"\n        },\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"second.py\",\n            \"name\": \"second\"\n        }\n    ],\n    \"hooks\": {\n        \"custom\": [\n            \"first\",\n            \"second\"\n        ],\n        \"empty\": []\n    },\n    \"media_linkers\": [\n        {\n            \"OTIO_SCHEMA\": \"MediaLinker.1\",\n            \"filepath\": \"link.py\",\n            \"name\": \"link\"\n        }\n    ],\n    \"schemadefs\": [],\n    \"version_manifests\": {}\n}",
  ).unwrap()
  let scripts = @plugins.manifest_plugins(manifest, "hook_scripts").unwrap()
  assert_eq(scripts.length(), 2)
  assert_true(
    scripts[0].equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"HookScript.1\",\n    \"filepath\": \"first.py\",\n    \"name\": \"first\"\n}",
      ).unwrap(),
    ),
  )
  assert_true(
    scripts[1].equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"HookScript.1\",\n    \"filepath\": \"second.py\",\n    \"name\": \"second\"\n}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:hook-names" {
  let manifest = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"PluginManifest.1\",\n    \"adapters\": [\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"read.py\",\n            \"name\": \"read\",\n            \"suffixes\": [\n                \"same\",\n                \"read\"\n            ]\n        },\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"write.py\",\n            \"name\": \"write\",\n            \"suffixes\": [\n                \"same\",\n                \"write\"\n            ]\n        }\n    ],\n    \"hook_scripts\": [\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"first.py\",\n            \"name\": \"first\"\n        },\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"second.py\",\n            \"name\": \"second\"\n        }\n    ],\n    \"hooks\": {\n        \"custom\": [\n            \"first\",\n            \"second\"\n        ],\n        \"empty\": []\n    },\n    \"media_linkers\": [\n        {\n            \"OTIO_SCHEMA\": \"MediaLinker.1\",\n            \"filepath\": \"link.py\",\n            \"name\": \"link\"\n        }\n    ],\n    \"schemadefs\": [],\n    \"version_manifests\": {}\n}",
  ).unwrap()
  let names = @plugins.hook_names(manifest).unwrap()
  assert_eq(names.length(), 2)
  assert_true(names.contains("custom"))
  assert_true(names.contains("empty"))
}

///|
test "functions:scripts-custom" {
  let manifest = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"PluginManifest.1\",\n    \"adapters\": [\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"read.py\",\n            \"name\": \"read\",\n            \"suffixes\": [\n                \"same\",\n                \"read\"\n            ]\n        },\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"write.py\",\n            \"name\": \"write\",\n            \"suffixes\": [\n                \"same\",\n                \"write\"\n            ]\n        }\n    ],\n    \"hook_scripts\": [\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"first.py\",\n            \"name\": \"first\"\n        },\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"second.py\",\n            \"name\": \"second\"\n        }\n    ],\n    \"hooks\": {\n        \"custom\": [\n            \"first\",\n            \"second\"\n        ],\n        \"empty\": []\n    },\n    \"media_linkers\": [\n        {\n            \"OTIO_SCHEMA\": \"MediaLinker.1\",\n            \"filepath\": \"link.py\",\n            \"name\": \"link\"\n        }\n    ],\n    \"schemadefs\": [],\n    \"version_manifests\": {}\n}",
  ).unwrap()
  assert_eq(@plugins.scripts_attached_to(manifest, "custom").unwrap(), [
    "first", "second",
  ])
}

///|
test "functions:scripts-empty" {
  let manifest = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"PluginManifest.1\",\n    \"adapters\": [\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"read.py\",\n            \"name\": \"read\",\n            \"suffixes\": [\n                \"same\",\n                \"read\"\n            ]\n        },\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"write.py\",\n            \"name\": \"write\",\n            \"suffixes\": [\n                \"same\",\n                \"write\"\n            ]\n        }\n    ],\n    \"hook_scripts\": [\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"first.py\",\n            \"name\": \"first\"\n        },\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"second.py\",\n            \"name\": \"second\"\n        }\n    ],\n    \"hooks\": {\n        \"custom\": [\n            \"first\",\n            \"second\"\n        ],\n        \"empty\": []\n    },\n    \"media_linkers\": [\n        {\n            \"OTIO_SCHEMA\": \"MediaLinker.1\",\n            \"filepath\": \"link.py\",\n            \"name\": \"link\"\n        }\n    ],\n    \"schemadefs\": [],\n    \"version_manifests\": {}\n}",
  ).unwrap()
  assert_eq(@plugins.scripts_attached_to(manifest, "empty").unwrap(), [])
}

///|
test "functions:scripts-missing" {
  let manifest = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"PluginManifest.1\",\n    \"adapters\": [\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"read.py\",\n            \"name\": \"read\",\n            \"suffixes\": [\n                \"same\",\n                \"read\"\n            ]\n        },\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"write.py\",\n            \"name\": \"write\",\n            \"suffixes\": [\n                \"same\",\n                \"write\"\n            ]\n        }\n    ],\n    \"hook_scripts\": [\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"first.py\",\n            \"name\": \"first\"\n        },\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"second.py\",\n            \"name\": \"second\"\n        }\n    ],\n    \"hooks\": {\n        \"custom\": [\n            \"first\",\n            \"second\"\n        ],\n        \"empty\": []\n    },\n    \"media_linkers\": [\n        {\n            \"OTIO_SCHEMA\": \"MediaLinker.1\",\n            \"filepath\": \"link.py\",\n            \"name\": \"link\"\n        }\n    ],\n    \"schemadefs\": [],\n    \"version_manifests\": {}\n}",
  ).unwrap()
  assert_true(@plugins.scripts_attached_to(manifest, "missing") is Err(_))
}

///|
test "functions:adapter-name-read" {
  let manifest = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"PluginManifest.1\",\n    \"adapters\": [\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"read.py\",\n            \"name\": \"read\",\n            \"suffixes\": [\n                \"same\",\n                \"read\"\n            ]\n        },\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"write.py\",\n            \"name\": \"write\",\n            \"suffixes\": [\n                \"same\",\n                \"write\"\n            ]\n        }\n    ],\n    \"hook_scripts\": [\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"first.py\",\n            \"name\": \"first\"\n        },\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"second.py\",\n            \"name\": \"second\"\n        }\n    ],\n    \"hooks\": {\n        \"custom\": [\n            \"first\",\n            \"second\"\n        ],\n        \"empty\": []\n    },\n    \"media_linkers\": [\n        {\n            \"OTIO_SCHEMA\": \"MediaLinker.1\",\n            \"filepath\": \"link.py\",\n            \"name\": \"link\"\n        }\n    ],\n    \"schemadefs\": [],\n    \"version_manifests\": {}\n}",
  ).unwrap()
  assert_true(
    @plugins.manifest_from_name(manifest, "read")
    .unwrap()
    .equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"Adapter.1\",\n    \"filepath\": \"read.py\",\n    \"name\": \"read\",\n    \"suffixes\": [\n        \"same\",\n        \"read\"\n    ]\n}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:adapter-name-write" {
  let manifest = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"PluginManifest.1\",\n    \"adapters\": [\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"read.py\",\n            \"name\": \"read\",\n            \"suffixes\": [\n                \"same\",\n                \"read\"\n            ]\n        },\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"write.py\",\n            \"name\": \"write\",\n            \"suffixes\": [\n                \"same\",\n                \"write\"\n            ]\n        }\n    ],\n    \"hook_scripts\": [\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"first.py\",\n            \"name\": \"first\"\n        },\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"second.py\",\n            \"name\": \"second\"\n        }\n    ],\n    \"hooks\": {\n        \"custom\": [\n            \"first\",\n            \"second\"\n        ],\n        \"empty\": []\n    },\n    \"media_linkers\": [\n        {\n            \"OTIO_SCHEMA\": \"MediaLinker.1\",\n            \"filepath\": \"link.py\",\n            \"name\": \"link\"\n        }\n    ],\n    \"schemadefs\": [],\n    \"version_manifests\": {}\n}",
  ).unwrap()
  assert_true(
    @plugins.manifest_from_name(manifest, "write")
    .unwrap()
    .equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"Adapter.1\",\n    \"filepath\": \"write.py\",\n    \"name\": \"write\",\n    \"suffixes\": [\n        \"same\",\n        \"write\"\n    ]\n}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:adapter-name-missing" {
  let manifest = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"PluginManifest.1\",\n    \"adapters\": [\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"read.py\",\n            \"name\": \"read\",\n            \"suffixes\": [\n                \"same\",\n                \"read\"\n            ]\n        },\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"write.py\",\n            \"name\": \"write\",\n            \"suffixes\": [\n                \"same\",\n                \"write\"\n            ]\n        }\n    ],\n    \"hook_scripts\": [\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"first.py\",\n            \"name\": \"first\"\n        },\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"second.py\",\n            \"name\": \"second\"\n        }\n    ],\n    \"hooks\": {\n        \"custom\": [\n            \"first\",\n            \"second\"\n        ],\n        \"empty\": []\n    },\n    \"media_linkers\": [\n        {\n            \"OTIO_SCHEMA\": \"MediaLinker.1\",\n            \"filepath\": \"link.py\",\n            \"name\": \"link\"\n        }\n    ],\n    \"schemadefs\": [],\n    \"version_manifests\": {}\n}",
  ).unwrap()
  assert_true(@plugins.manifest_from_name(manifest, "missing") is Err(_))
}

///|
test "functions:adapter-name-" {
  let manifest = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"PluginManifest.1\",\n    \"adapters\": [\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"read.py\",\n            \"name\": \"read\",\n            \"suffixes\": [\n                \"same\",\n                \"read\"\n            ]\n        },\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"write.py\",\n            \"name\": \"write\",\n            \"suffixes\": [\n                \"same\",\n                \"write\"\n            ]\n        }\n    ],\n    \"hook_scripts\": [\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"first.py\",\n            \"name\": \"first\"\n        },\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"second.py\",\n            \"name\": \"second\"\n        }\n    ],\n    \"hooks\": {\n        \"custom\": [\n            \"first\",\n            \"second\"\n        ],\n        \"empty\": []\n    },\n    \"media_linkers\": [\n        {\n            \"OTIO_SCHEMA\": \"MediaLinker.1\",\n            \"filepath\": \"link.py\",\n            \"name\": \"link\"\n        }\n    ],\n    \"schemadefs\": [],\n    \"version_manifests\": {}\n}",
  ).unwrap()
  assert_true(@plugins.manifest_from_name(manifest, "") is Err(_))
}

///|
test "functions:adapter-filepath-0" {
  let manifest = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"PluginManifest.1\",\n    \"adapters\": [\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"read.py\",\n            \"name\": \"read\",\n            \"suffixes\": [\n                \"same\",\n                \"read\"\n            ]\n        },\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"write.py\",\n            \"name\": \"write\",\n            \"suffixes\": [\n                \"same\",\n                \"write\"\n            ]\n        }\n    ],\n    \"hook_scripts\": [\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"first.py\",\n            \"name\": \"first\"\n        },\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"second.py\",\n            \"name\": \"second\"\n        }\n    ],\n    \"hooks\": {\n        \"custom\": [\n            \"first\",\n            \"second\"\n        ],\n        \"empty\": []\n    },\n    \"media_linkers\": [\n        {\n            \"OTIO_SCHEMA\": \"MediaLinker.1\",\n            \"filepath\": \"link.py\",\n            \"name\": \"link\"\n        }\n    ],\n    \"schemadefs\": [],\n    \"version_manifests\": {}\n}",
  ).unwrap()
  assert_true(
    @plugins.adapter_from_filepath(manifest, "a.read")
    .unwrap()
    .equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"Adapter.1\",\n    \"filepath\": \"read.py\",\n    \"name\": \"read\",\n    \"suffixes\": [\n        \"same\",\n        \"read\"\n    ]\n}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:adapter-filepath-1" {
  let manifest = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"PluginManifest.1\",\n    \"adapters\": [\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"read.py\",\n            \"name\": \"read\",\n            \"suffixes\": [\n                \"same\",\n                \"read\"\n            ]\n        },\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"write.py\",\n            \"name\": \"write\",\n            \"suffixes\": [\n                \"same\",\n                \"write\"\n            ]\n        }\n    ],\n    \"hook_scripts\": [\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"first.py\",\n            \"name\": \"first\"\n        },\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"second.py\",\n            \"name\": \"second\"\n        }\n    ],\n    \"hooks\": {\n        \"custom\": [\n            \"first\",\n            \"second\"\n        ],\n        \"empty\": []\n    },\n    \"media_linkers\": [\n        {\n            \"OTIO_SCHEMA\": \"MediaLinker.1\",\n            \"filepath\": \"link.py\",\n            \"name\": \"link\"\n        }\n    ],\n    \"schemadefs\": [],\n    \"version_manifests\": {}\n}",
  ).unwrap()
  assert_true(
    @plugins.adapter_from_filepath(manifest, "a.READ")
    .unwrap()
    .equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"Adapter.1\",\n    \"filepath\": \"read.py\",\n    \"name\": \"read\",\n    \"suffixes\": [\n        \"same\",\n        \"read\"\n    ]\n}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:adapter-filepath-2" {
  let manifest = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"PluginManifest.1\",\n    \"adapters\": [\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"read.py\",\n            \"name\": \"read\",\n            \"suffixes\": [\n                \"same\",\n                \"read\"\n            ]\n        },\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"write.py\",\n            \"name\": \"write\",\n            \"suffixes\": [\n                \"same\",\n                \"write\"\n            ]\n        }\n    ],\n    \"hook_scripts\": [\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"first.py\",\n            \"name\": \"first\"\n        },\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"second.py\",\n            \"name\": \"second\"\n        }\n    ],\n    \"hooks\": {\n        \"custom\": [\n            \"first\",\n            \"second\"\n        ],\n        \"empty\": []\n    },\n    \"media_linkers\": [\n        {\n            \"OTIO_SCHEMA\": \"MediaLinker.1\",\n            \"filepath\": \"link.py\",\n            \"name\": \"link\"\n        }\n    ],\n    \"schemadefs\": [],\n    \"version_manifests\": {}\n}",
  ).unwrap()
  assert_true(
    @plugins.adapter_from_filepath(manifest, "a.write")
    .unwrap()
    .equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"Adapter.1\",\n    \"filepath\": \"write.py\",\n    \"name\": \"write\",\n    \"suffixes\": [\n        \"same\",\n        \"write\"\n    ]\n}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:adapter-filepath-3" {
  let manifest = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"PluginManifest.1\",\n    \"adapters\": [\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"read.py\",\n            \"name\": \"read\",\n            \"suffixes\": [\n                \"same\",\n                \"read\"\n            ]\n        },\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"write.py\",\n            \"name\": \"write\",\n            \"suffixes\": [\n                \"same\",\n                \"write\"\n            ]\n        }\n    ],\n    \"hook_scripts\": [\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"first.py\",\n            \"name\": \"first\"\n        },\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"second.py\",\n            \"name\": \"second\"\n        }\n    ],\n    \"hooks\": {\n        \"custom\": [\n            \"first\",\n            \"second\"\n        ],\n        \"empty\": []\n    },\n    \"media_linkers\": [\n        {\n            \"OTIO_SCHEMA\": \"MediaLinker.1\",\n            \"filepath\": \"link.py\",\n            \"name\": \"link\"\n        }\n    ],\n    \"schemadefs\": [],\n    \"version_manifests\": {}\n}",
  ).unwrap()
  assert_true(@plugins.adapter_from_filepath(manifest, ".read") is Err(_))
}

///|
test "functions:adapter-filepath-4" {
  let manifest = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"PluginManifest.1\",\n    \"adapters\": [\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"read.py\",\n            \"name\": \"read\",\n            \"suffixes\": [\n                \"same\",\n                \"read\"\n            ]\n        },\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"write.py\",\n            \"name\": \"write\",\n            \"suffixes\": [\n                \"same\",\n                \"write\"\n            ]\n        }\n    ],\n    \"hook_scripts\": [\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"first.py\",\n            \"name\": \"first\"\n        },\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"second.py\",\n            \"name\": \"second\"\n        }\n    ],\n    \"hooks\": {\n        \"custom\": [\n            \"first\",\n            \"second\"\n        ],\n        \"empty\": []\n    },\n    \"media_linkers\": [\n        {\n            \"OTIO_SCHEMA\": \"MediaLinker.1\",\n            \"filepath\": \"link.py\",\n            \"name\": \"link\"\n        }\n    ],\n    \"schemadefs\": [],\n    \"version_manifests\": {}\n}",
  ).unwrap()
  assert_true(
    @plugins.adapter_from_filepath(manifest, "dir.dot/file") is Err(_),
  )
}

///|
test "functions:adapter-filepath-5" {
  let manifest = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"PluginManifest.1\",\n    \"adapters\": [\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"read.py\",\n            \"name\": \"read\",\n            \"suffixes\": [\n                \"same\",\n                \"read\"\n            ]\n        },\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"write.py\",\n            \"name\": \"write\",\n            \"suffixes\": [\n                \"same\",\n                \"write\"\n            ]\n        }\n    ],\n    \"hook_scripts\": [\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"first.py\",\n            \"name\": \"first\"\n        },\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"second.py\",\n            \"name\": \"second\"\n        }\n    ],\n    \"hooks\": {\n        \"custom\": [\n            \"first\",\n            \"second\"\n        ],\n        \"empty\": []\n    },\n    \"media_linkers\": [\n        {\n            \"OTIO_SCHEMA\": \"MediaLinker.1\",\n            \"filepath\": \"link.py\",\n            \"name\": \"link\"\n        }\n    ],\n    \"schemadefs\": [],\n    \"version_manifests\": {}\n}",
  ).unwrap()
  assert_true(
    @plugins.adapter_from_filepath(manifest, "dir.dot/a.read")
    .unwrap()
    .equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"Adapter.1\",\n    \"filepath\": \"read.py\",\n    \"name\": \"read\",\n    \"suffixes\": [\n        \"same\",\n        \"read\"\n    ]\n}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:adapter-filepath-6" {
  let manifest = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"PluginManifest.1\",\n    \"adapters\": [\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"read.py\",\n            \"name\": \"read\",\n            \"suffixes\": [\n                \"same\",\n                \"read\"\n            ]\n        },\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"write.py\",\n            \"name\": \"write\",\n            \"suffixes\": [\n                \"same\",\n                \"write\"\n            ]\n        }\n    ],\n    \"hook_scripts\": [\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"first.py\",\n            \"name\": \"first\"\n        },\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"second.py\",\n            \"name\": \"second\"\n        }\n    ],\n    \"hooks\": {\n        \"custom\": [\n            \"first\",\n            \"second\"\n        ],\n        \"empty\": []\n    },\n    \"media_linkers\": [\n        {\n            \"OTIO_SCHEMA\": \"MediaLinker.1\",\n            \"filepath\": \"link.py\",\n            \"name\": \"link\"\n        }\n    ],\n    \"schemadefs\": [],\n    \"version_manifests\": {}\n}",
  ).unwrap()
  assert_true(@plugins.adapter_from_filepath(manifest, "a.") is Err(_))
}

///|
test "functions:adapter-filepath-7" {
  let manifest = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"PluginManifest.1\",\n    \"adapters\": [\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"read.py\",\n            \"name\": \"read\",\n            \"suffixes\": [\n                \"same\",\n                \"read\"\n            ]\n        },\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"write.py\",\n            \"name\": \"write\",\n            \"suffixes\": [\n                \"same\",\n                \"write\"\n            ]\n        }\n    ],\n    \"hook_scripts\": [\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"first.py\",\n            \"name\": \"first\"\n        },\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"second.py\",\n            \"name\": \"second\"\n        }\n    ],\n    \"hooks\": {\n        \"custom\": [\n            \"first\",\n            \"second\"\n        ],\n        \"empty\": []\n    },\n    \"media_linkers\": [\n        {\n            \"OTIO_SCHEMA\": \"MediaLinker.1\",\n            \"filepath\": \"link.py\",\n            \"name\": \"link\"\n        }\n    ],\n    \"schemadefs\": [],\n    \"version_manifests\": {}\n}",
  ).unwrap()
  assert_true(@plugins.adapter_from_filepath(manifest, "a.bad") is Err(_))
}

///|
test "functions:suffixes-False-False" {
  let manifest = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"PluginManifest.1\",\n    \"adapters\": [\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"read.py\",\n            \"name\": \"read\",\n            \"suffixes\": [\n                \"same\",\n                \"read\"\n            ]\n        },\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"write.py\",\n            \"name\": \"write\",\n            \"suffixes\": [\n                \"same\",\n                \"write\"\n            ]\n        }\n    ],\n    \"hook_scripts\": [\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"first.py\",\n            \"name\": \"first\"\n        },\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"second.py\",\n            \"name\": \"second\"\n        }\n    ],\n    \"hooks\": {\n        \"custom\": [\n            \"first\",\n            \"second\"\n        ],\n        \"empty\": []\n    },\n    \"media_linkers\": [\n        {\n            \"OTIO_SCHEMA\": \"MediaLinker.1\",\n            \"filepath\": \"link.py\",\n            \"name\": \"link\"\n        }\n    ],\n    \"schemadefs\": [],\n    \"version_manifests\": {}\n}",
  ).unwrap()
  let suffixes = @plugins.suffixes_with_defined_adapters(
    manifest,
    fn(d, feature) { Ok(d.get("name") == Some(Json::string(feature))) },
    read=false,
    write=false,
  ).unwrap()
  assert_eq(suffixes.length(), 3)
  assert_true(suffixes.contains("read"))
  assert_true(suffixes.contains("same"))
  assert_true(suffixes.contains("write"))
}

///|
test "functions:suffixes-False-True" {
  let manifest = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"PluginManifest.1\",\n    \"adapters\": [\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"read.py\",\n            \"name\": \"read\",\n            \"suffixes\": [\n                \"same\",\n                \"read\"\n            ]\n        },\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"write.py\",\n            \"name\": \"write\",\n            \"suffixes\": [\n                \"same\",\n                \"write\"\n            ]\n        }\n    ],\n    \"hook_scripts\": [\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"first.py\",\n            \"name\": \"first\"\n        },\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"second.py\",\n            \"name\": \"second\"\n        }\n    ],\n    \"hooks\": {\n        \"custom\": [\n            \"first\",\n            \"second\"\n        ],\n        \"empty\": []\n    },\n    \"media_linkers\": [\n        {\n            \"OTIO_SCHEMA\": \"MediaLinker.1\",\n            \"filepath\": \"link.py\",\n            \"name\": \"link\"\n        }\n    ],\n    \"schemadefs\": [],\n    \"version_manifests\": {}\n}",
  ).unwrap()
  let suffixes = @plugins.suffixes_with_defined_adapters(
    manifest,
    fn(d, feature) { Ok(d.get("name") == Some(Json::string(feature))) },
    read=false,
    write=true,
  ).unwrap()
  assert_eq(suffixes.length(), 2)
  assert_true(suffixes.contains("same"))
  assert_true(suffixes.contains("write"))
}

///|
test "functions:suffixes-True-False" {
  let manifest = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"PluginManifest.1\",\n    \"adapters\": [\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"read.py\",\n            \"name\": \"read\",\n            \"suffixes\": [\n                \"same\",\n                \"read\"\n            ]\n        },\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"write.py\",\n            \"name\": \"write\",\n            \"suffixes\": [\n                \"same\",\n                \"write\"\n            ]\n        }\n    ],\n    \"hook_scripts\": [\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"first.py\",\n            \"name\": \"first\"\n        },\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"second.py\",\n            \"name\": \"second\"\n        }\n    ],\n    \"hooks\": {\n        \"custom\": [\n            \"first\",\n            \"second\"\n        ],\n        \"empty\": []\n    },\n    \"media_linkers\": [\n        {\n            \"OTIO_SCHEMA\": \"MediaLinker.1\",\n            \"filepath\": \"link.py\",\n            \"name\": \"link\"\n        }\n    ],\n    \"schemadefs\": [],\n    \"version_manifests\": {}\n}",
  ).unwrap()
  let suffixes = @plugins.suffixes_with_defined_adapters(
    manifest,
    fn(d, feature) { Ok(d.get("name") == Some(Json::string(feature))) },
    read=true,
    write=false,
  ).unwrap()
  assert_eq(suffixes.length(), 2)
  assert_true(suffixes.contains("read"))
  assert_true(suffixes.contains("same"))
}

///|
test "functions:suffixes-True-True" {
  let manifest = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"PluginManifest.1\",\n    \"adapters\": [\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"read.py\",\n            \"name\": \"read\",\n            \"suffixes\": [\n                \"same\",\n                \"read\"\n            ]\n        },\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"write.py\",\n            \"name\": \"write\",\n            \"suffixes\": [\n                \"same\",\n                \"write\"\n            ]\n        }\n    ],\n    \"hook_scripts\": [\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"first.py\",\n            \"name\": \"first\"\n        },\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"second.py\",\n            \"name\": \"second\"\n        }\n    ],\n    \"hooks\": {\n        \"custom\": [\n            \"first\",\n            \"second\"\n        ],\n        \"empty\": []\n    },\n    \"media_linkers\": [\n        {\n            \"OTIO_SCHEMA\": \"MediaLinker.1\",\n            \"filepath\": \"link.py\",\n            \"name\": \"link\"\n        }\n    ],\n    \"schemadefs\": [],\n    \"version_manifests\": {}\n}",
  ).unwrap()
  let suffixes = @plugins.suffixes_with_defined_adapters(
    manifest,
    fn(d, feature) { Ok(d.get("name") == Some(Json::string(feature))) },
    read=true,
    write=true,
  ).unwrap()
  assert_eq(suffixes.length(), 3)
  assert_true(suffixes.contains("read"))
  assert_true(suffixes.contains("same"))
  assert_true(suffixes.contains("write"))
}

///|
test "functions:hooks-run-custom-False" {
  let manifest = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"PluginManifest.1\",\n    \"adapters\": [\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"read.py\",\n            \"name\": \"read\",\n            \"suffixes\": [\n                \"same\",\n                \"read\"\n            ]\n        },\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"write.py\",\n            \"name\": \"write\",\n            \"suffixes\": [\n                \"same\",\n                \"write\"\n            ]\n        }\n    ],\n    \"hook_scripts\": [\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"first.py\",\n            \"name\": \"first\"\n        },\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"second.py\",\n            \"name\": \"second\"\n        }\n    ],\n    \"hooks\": {\n        \"custom\": [\n            \"first\",\n            \"second\"\n        ],\n        \"empty\": []\n    },\n    \"media_linkers\": [\n        {\n            \"OTIO_SCHEMA\": \"MediaLinker.1\",\n            \"filepath\": \"link.py\",\n            \"name\": \"link\"\n        }\n    ],\n    \"schemadefs\": [],\n    \"version_manifests\": {}\n}",
  ).unwrap()
  let calls : Array[String] = []
  let fail = false
  let result = @plugins.run_manifest_hooks(
    manifest,
    "custom",
    @otiojson.parse(
      "{\n    \"OTIO_SCHEMA\": \"Clip.2\",\n    \"metadata\": {},\n    \"name\": \"keep\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"media_references\": {\n        \"DEFAULT_MEDIA\": {\n            \"OTIO_SCHEMA\": \"MissingReference.1\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"available_range\": null,\n            \"available_image_bounds\": null\n        }\n    },\n    \"active_media_reference_key\": \"DEFAULT_MEDIA\"\n}",
    ).unwrap(),
    Json::object({ "x": Json::number(1.0) }),
    fn(d, j, _args) {
      let name = match d.get("name") {
        Some(String(s)) => s
        _ => ""
      }
      calls.push(name)
      if fail && name == "second" {
        return Err("fixture")
      }
      match j {
        Object(m) => {
          let old = match m.get("name") {
            Some(String(s)) => s
            _ => ""
          }
          m["name"] = Json::string(old + ":" + name)
          Ok(Json::object(m))
        }
        _ => Err("invalid")
      }
    },
  )
  assert_eq(result is Ok(_), true)
  assert_eq(calls, ["first", "second"])
  assert_true(
    @otiojson.equivalent(
      result.unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"Clip.2\",\n    \"metadata\": {},\n    \"name\": \"keep:first:second\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"media_references\": {\n        \"DEFAULT_MEDIA\": {\n            \"OTIO_SCHEMA\": \"MissingReference.1\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"available_range\": null,\n            \"available_image_bounds\": null\n        }\n    },\n    \"active_media_reference_key\": \"DEFAULT_MEDIA\"\n}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:hooks-run-empty-False" {
  let manifest = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"PluginManifest.1\",\n    \"adapters\": [\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"read.py\",\n            \"name\": \"read\",\n            \"suffixes\": [\n                \"same\",\n                \"read\"\n            ]\n        },\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"write.py\",\n            \"name\": \"write\",\n            \"suffixes\": [\n                \"same\",\n                \"write\"\n            ]\n        }\n    ],\n    \"hook_scripts\": [\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"first.py\",\n            \"name\": \"first\"\n        },\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"second.py\",\n            \"name\": \"second\"\n        }\n    ],\n    \"hooks\": {\n        \"custom\": [\n            \"first\",\n            \"second\"\n        ],\n        \"empty\": []\n    },\n    \"media_linkers\": [\n        {\n            \"OTIO_SCHEMA\": \"MediaLinker.1\",\n            \"filepath\": \"link.py\",\n            \"name\": \"link\"\n        }\n    ],\n    \"schemadefs\": [],\n    \"version_manifests\": {}\n}",
  ).unwrap()
  let calls : Array[String] = []
  let fail = false
  let result = @plugins.run_manifest_hooks(
    manifest,
    "empty",
    @otiojson.parse(
      "{\n    \"OTIO_SCHEMA\": \"Clip.2\",\n    \"metadata\": {},\n    \"name\": \"keep\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"media_references\": {\n        \"DEFAULT_MEDIA\": {\n            \"OTIO_SCHEMA\": \"MissingReference.1\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"available_range\": null,\n            \"available_image_bounds\": null\n        }\n    },\n    \"active_media_reference_key\": \"DEFAULT_MEDIA\"\n}",
    ).unwrap(),
    Json::object({ "x": Json::number(1.0) }),
    fn(d, j, _args) {
      let name = match d.get("name") {
        Some(String(s)) => s
        _ => ""
      }
      calls.push(name)
      if fail && name == "second" {
        return Err("fixture")
      }
      match j {
        Object(m) => {
          let old = match m.get("name") {
            Some(String(s)) => s
            _ => ""
          }
          m["name"] = Json::string(old + ":" + name)
          Ok(Json::object(m))
        }
        _ => Err("invalid")
      }
    },
  )
  assert_eq(result is Ok(_), true)
  assert_eq(calls, [])
  assert_true(
    @otiojson.equivalent(
      result.unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"Clip.2\",\n    \"metadata\": {},\n    \"name\": \"keep\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"media_references\": {\n        \"DEFAULT_MEDIA\": {\n            \"OTIO_SCHEMA\": \"MissingReference.1\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"available_range\": null,\n            \"available_image_bounds\": null\n        }\n    },\n    \"active_media_reference_key\": \"DEFAULT_MEDIA\"\n}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:hooks-run-missing-False" {
  let manifest = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"PluginManifest.1\",\n    \"adapters\": [\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"read.py\",\n            \"name\": \"read\",\n            \"suffixes\": [\n                \"same\",\n                \"read\"\n            ]\n        },\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"write.py\",\n            \"name\": \"write\",\n            \"suffixes\": [\n                \"same\",\n                \"write\"\n            ]\n        }\n    ],\n    \"hook_scripts\": [\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"first.py\",\n            \"name\": \"first\"\n        },\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"second.py\",\n            \"name\": \"second\"\n        }\n    ],\n    \"hooks\": {\n        \"custom\": [\n            \"first\",\n            \"second\"\n        ],\n        \"empty\": []\n    },\n    \"media_linkers\": [\n        {\n            \"OTIO_SCHEMA\": \"MediaLinker.1\",\n            \"filepath\": \"link.py\",\n            \"name\": \"link\"\n        }\n    ],\n    \"schemadefs\": [],\n    \"version_manifests\": {}\n}",
  ).unwrap()
  let calls : Array[String] = []
  let fail = false
  let result = @plugins.run_manifest_hooks(
    manifest,
    "missing",
    @otiojson.parse(
      "{\n    \"OTIO_SCHEMA\": \"Clip.2\",\n    \"metadata\": {},\n    \"name\": \"keep\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"media_references\": {\n        \"DEFAULT_MEDIA\": {\n            \"OTIO_SCHEMA\": \"MissingReference.1\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"available_range\": null,\n            \"available_image_bounds\": null\n        }\n    },\n    \"active_media_reference_key\": \"DEFAULT_MEDIA\"\n}",
    ).unwrap(),
    Json::object({ "x": Json::number(1.0) }),
    fn(d, j, _args) {
      let name = match d.get("name") {
        Some(String(s)) => s
        _ => ""
      }
      calls.push(name)
      if fail && name == "second" {
        return Err("fixture")
      }
      match j {
        Object(m) => {
          let old = match m.get("name") {
            Some(String(s)) => s
            _ => ""
          }
          m["name"] = Json::string(old + ":" + name)
          Ok(Json::object(m))
        }
        _ => Err("invalid")
      }
    },
  )
  assert_eq(result is Ok(_), false)
  assert_eq(calls, [])
}

///|
test "functions:hooks-run-custom-True" {
  let manifest = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"PluginManifest.1\",\n    \"adapters\": [\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"read.py\",\n            \"name\": \"read\",\n            \"suffixes\": [\n                \"same\",\n                \"read\"\n            ]\n        },\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"write.py\",\n            \"name\": \"write\",\n            \"suffixes\": [\n                \"same\",\n                \"write\"\n            ]\n        }\n    ],\n    \"hook_scripts\": [\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"first.py\",\n            \"name\": \"first\"\n        },\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"second.py\",\n            \"name\": \"second\"\n        }\n    ],\n    \"hooks\": {\n        \"custom\": [\n            \"first\",\n            \"second\"\n        ],\n        \"empty\": []\n    },\n    \"media_linkers\": [\n        {\n            \"OTIO_SCHEMA\": \"MediaLinker.1\",\n            \"filepath\": \"link.py\",\n            \"name\": \"link\"\n        }\n    ],\n    \"schemadefs\": [],\n    \"version_manifests\": {}\n}",
  ).unwrap()
  let calls : Array[String] = []
  let fail = true
  let result = @plugins.run_manifest_hooks(
    manifest,
    "custom",
    @otiojson.parse(
      "{\n    \"OTIO_SCHEMA\": \"Clip.2\",\n    \"metadata\": {},\n    \"name\": \"keep\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"media_references\": {\n        \"DEFAULT_MEDIA\": {\n            \"OTIO_SCHEMA\": \"MissingReference.1\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"available_range\": null,\n            \"available_image_bounds\": null\n        }\n    },\n    \"active_media_reference_key\": \"DEFAULT_MEDIA\"\n}",
    ).unwrap(),
    Json::object({ "x": Json::number(1.0) }),
    fn(d, j, _args) {
      let name = match d.get("name") {
        Some(String(s)) => s
        _ => ""
      }
      calls.push(name)
      if fail && name == "second" {
        return Err("fixture")
      }
      match j {
        Object(m) => {
          let old = match m.get("name") {
            Some(String(s)) => s
            _ => ""
          }
          m["name"] = Json::string(old + ":" + name)
          Ok(Json::object(m))
        }
        _ => Err("invalid")
      }
    },
  )
  assert_eq(result is Ok(_), false)
  assert_eq(calls, ["first", "second"])
}

///|
test "functions:hooks-run-empty-True" {
  let manifest = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"PluginManifest.1\",\n    \"adapters\": [\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"read.py\",\n            \"name\": \"read\",\n            \"suffixes\": [\n                \"same\",\n                \"read\"\n            ]\n        },\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"write.py\",\n            \"name\": \"write\",\n            \"suffixes\": [\n                \"same\",\n                \"write\"\n            ]\n        }\n    ],\n    \"hook_scripts\": [\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"first.py\",\n            \"name\": \"first\"\n        },\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"second.py\",\n            \"name\": \"second\"\n        }\n    ],\n    \"hooks\": {\n        \"custom\": [\n            \"first\",\n            \"second\"\n        ],\n        \"empty\": []\n    },\n    \"media_linkers\": [\n        {\n            \"OTIO_SCHEMA\": \"MediaLinker.1\",\n            \"filepath\": \"link.py\",\n            \"name\": \"link\"\n        }\n    ],\n    \"schemadefs\": [],\n    \"version_manifests\": {}\n}",
  ).unwrap()
  let calls : Array[String] = []
  let fail = true
  let result = @plugins.run_manifest_hooks(
    manifest,
    "empty",
    @otiojson.parse(
      "{\n    \"OTIO_SCHEMA\": \"Clip.2\",\n    \"metadata\": {},\n    \"name\": \"keep\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"media_references\": {\n        \"DEFAULT_MEDIA\": {\n            \"OTIO_SCHEMA\": \"MissingReference.1\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"available_range\": null,\n            \"available_image_bounds\": null\n        }\n    },\n    \"active_media_reference_key\": \"DEFAULT_MEDIA\"\n}",
    ).unwrap(),
    Json::object({ "x": Json::number(1.0) }),
    fn(d, j, _args) {
      let name = match d.get("name") {
        Some(String(s)) => s
        _ => ""
      }
      calls.push(name)
      if fail && name == "second" {
        return Err("fixture")
      }
      match j {
        Object(m) => {
          let old = match m.get("name") {
            Some(String(s)) => s
            _ => ""
          }
          m["name"] = Json::string(old + ":" + name)
          Ok(Json::object(m))
        }
        _ => Err("invalid")
      }
    },
  )
  assert_eq(result is Ok(_), true)
  assert_eq(calls, [])
  assert_true(
    @otiojson.equivalent(
      result.unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"Clip.2\",\n    \"metadata\": {},\n    \"name\": \"keep\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"media_references\": {\n        \"DEFAULT_MEDIA\": {\n            \"OTIO_SCHEMA\": \"MissingReference.1\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"available_range\": null,\n            \"available_image_bounds\": null\n        }\n    },\n    \"active_media_reference_key\": \"DEFAULT_MEDIA\"\n}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:hooks-run-missing-True" {
  let manifest = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"PluginManifest.1\",\n    \"adapters\": [\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"read.py\",\n            \"name\": \"read\",\n            \"suffixes\": [\n                \"same\",\n                \"read\"\n            ]\n        },\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"write.py\",\n            \"name\": \"write\",\n            \"suffixes\": [\n                \"same\",\n                \"write\"\n            ]\n        }\n    ],\n    \"hook_scripts\": [\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"first.py\",\n            \"name\": \"first\"\n        },\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"second.py\",\n            \"name\": \"second\"\n        }\n    ],\n    \"hooks\": {\n        \"custom\": [\n            \"first\",\n            \"second\"\n        ],\n        \"empty\": []\n    },\n    \"media_linkers\": [\n        {\n            \"OTIO_SCHEMA\": \"MediaLinker.1\",\n            \"filepath\": \"link.py\",\n            \"name\": \"link\"\n        }\n    ],\n    \"schemadefs\": [],\n    \"version_manifests\": {}\n}",
  ).unwrap()
  let calls : Array[String] = []
  let fail = true
  let result = @plugins.run_manifest_hooks(
    manifest,
    "missing",
    @otiojson.parse(
      "{\n    \"OTIO_SCHEMA\": \"Clip.2\",\n    \"metadata\": {},\n    \"name\": \"keep\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"media_references\": {\n        \"DEFAULT_MEDIA\": {\n            \"OTIO_SCHEMA\": \"MissingReference.1\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"available_range\": null,\n            \"available_image_bounds\": null\n        }\n    },\n    \"active_media_reference_key\": \"DEFAULT_MEDIA\"\n}",
    ).unwrap(),
    Json::object({ "x": Json::number(1.0) }),
    fn(d, j, _args) {
      let name = match d.get("name") {
        Some(String(s)) => s
        _ => ""
      }
      calls.push(name)
      if fail && name == "second" {
        return Err("fixture")
      }
      match j {
        Object(m) => {
          let old = match m.get("name") {
            Some(String(s)) => s
            _ => ""
          }
          m["name"] = Json::string(old + ":" + name)
          Ok(Json::object(m))
        }
        _ => Err("invalid")
      }
    },
  )
  assert_eq(result is Ok(_), false)
  assert_eq(calls, [])
}

///|
test "functions:default-linker-None" {
  assert_true(@plugins.default_media_linker(None) is Err(_))
}

///|
test "functions:linker-from-name-None-None" {
  let manifest = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"PluginManifest.1\",\n    \"adapters\": [\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"read.py\",\n            \"name\": \"read\",\n            \"suffixes\": [\n                \"same\",\n                \"read\"\n            ]\n        },\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"write.py\",\n            \"name\": \"write\",\n            \"suffixes\": [\n                \"same\",\n                \"write\"\n            ]\n        }\n    ],\n    \"hook_scripts\": [\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"first.py\",\n            \"name\": \"first\"\n        },\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"second.py\",\n            \"name\": \"second\"\n        }\n    ],\n    \"hooks\": {\n        \"custom\": [\n            \"first\",\n            \"second\"\n        ],\n        \"empty\": []\n    },\n    \"media_linkers\": [\n        {\n            \"OTIO_SCHEMA\": \"MediaLinker.1\",\n            \"filepath\": \"link.py\",\n            \"name\": \"link\"\n        }\n    ],\n    \"schemadefs\": [],\n    \"version_manifests\": {}\n}",
  ).unwrap()
  assert_true(
    @plugins.media_linker_from_name(manifest, None, None).unwrap() is None,
  )
}

///|
test "functions:linked-reference-None-None" {
  let manifest = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"PluginManifest.1\",\n    \"adapters\": [\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"read.py\",\n            \"name\": \"read\",\n            \"suffixes\": [\n                \"same\",\n                \"read\"\n            ]\n        },\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"write.py\",\n            \"name\": \"write\",\n            \"suffixes\": [\n                \"same\",\n                \"write\"\n            ]\n        }\n    ],\n    \"hook_scripts\": [\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"first.py\",\n            \"name\": \"first\"\n        },\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"second.py\",\n            \"name\": \"second\"\n        }\n    ],\n    \"hooks\": {\n        \"custom\": [\n            \"first\",\n            \"second\"\n        ],\n        \"empty\": []\n    },\n    \"media_linkers\": [\n        {\n            \"OTIO_SCHEMA\": \"MediaLinker.1\",\n            \"filepath\": \"link.py\",\n            \"name\": \"link\"\n        }\n    ],\n    \"schemadefs\": [],\n    \"version_manifests\": {}\n}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(
      @plugins.linked_media_reference(
        manifest,
        @otiojson.parse(
          "{\n    \"OTIO_SCHEMA\": \"Clip.2\",\n    \"metadata\": {},\n    \"name\": \"keep\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"media_references\": {\n        \"DEFAULT_MEDIA\": {\n            \"OTIO_SCHEMA\": \"MissingReference.1\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"available_range\": null,\n            \"available_image_bounds\": null\n        }\n    },\n    \"active_media_reference_key\": \"DEFAULT_MEDIA\"\n}",
        ).unwrap(),
        None,
        None,
        Json::empty_object(),
        fn(_d, _c, _a) {
          @otiojson.parse(
            "{\n    \"OTIO_SCHEMA\": \"MissingReference.1\",\n    \"metadata\": {},\n    \"name\": \"linked\",\n    \"available_range\": null,\n    \"available_image_bounds\": null\n}",
          )
        },
      ).unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"Clip.2\",\n    \"metadata\": {},\n    \"name\": \"keep\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"media_references\": {\n        \"DEFAULT_MEDIA\": {\n            \"OTIO_SCHEMA\": \"MissingReference.1\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"available_range\": null,\n            \"available_image_bounds\": null\n        }\n    },\n    \"active_media_reference_key\": \"DEFAULT_MEDIA\"\n}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:linker-from-name-None-" {
  let manifest = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"PluginManifest.1\",\n    \"adapters\": [\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"read.py\",\n            \"name\": \"read\",\n            \"suffixes\": [\n                \"same\",\n                \"read\"\n            ]\n        },\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"write.py\",\n            \"name\": \"write\",\n            \"suffixes\": [\n                \"same\",\n                \"write\"\n            ]\n        }\n    ],\n    \"hook_scripts\": [\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"first.py\",\n            \"name\": \"first\"\n        },\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"second.py\",\n            \"name\": \"second\"\n        }\n    ],\n    \"hooks\": {\n        \"custom\": [\n            \"first\",\n            \"second\"\n        ],\n        \"empty\": []\n    },\n    \"media_linkers\": [\n        {\n            \"OTIO_SCHEMA\": \"MediaLinker.1\",\n            \"filepath\": \"link.py\",\n            \"name\": \"link\"\n        }\n    ],\n    \"schemadefs\": [],\n    \"version_manifests\": {}\n}",
  ).unwrap()
  assert_true(
    @plugins.media_linker_from_name(manifest, Some(""), None).unwrap() is None,
  )
}

///|
test "functions:linked-reference-None-" {
  let manifest = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"PluginManifest.1\",\n    \"adapters\": [\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"read.py\",\n            \"name\": \"read\",\n            \"suffixes\": [\n                \"same\",\n                \"read\"\n            ]\n        },\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"write.py\",\n            \"name\": \"write\",\n            \"suffixes\": [\n                \"same\",\n                \"write\"\n            ]\n        }\n    ],\n    \"hook_scripts\": [\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"first.py\",\n            \"name\": \"first\"\n        },\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"second.py\",\n            \"name\": \"second\"\n        }\n    ],\n    \"hooks\": {\n        \"custom\": [\n            \"first\",\n            \"second\"\n        ],\n        \"empty\": []\n    },\n    \"media_linkers\": [\n        {\n            \"OTIO_SCHEMA\": \"MediaLinker.1\",\n            \"filepath\": \"link.py\",\n            \"name\": \"link\"\n        }\n    ],\n    \"schemadefs\": [],\n    \"version_manifests\": {}\n}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(
      @plugins.linked_media_reference(
        manifest,
        @otiojson.parse(
          "{\n    \"OTIO_SCHEMA\": \"Clip.2\",\n    \"metadata\": {},\n    \"name\": \"keep\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"media_references\": {\n        \"DEFAULT_MEDIA\": {\n            \"OTIO_SCHEMA\": \"MissingReference.1\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"available_range\": null,\n            \"available_image_bounds\": null\n        }\n    },\n    \"active_media_reference_key\": \"DEFAULT_MEDIA\"\n}",
        ).unwrap(),
        Some(""),
        None,
        Json::empty_object(),
        fn(_d, _c, _a) {
          @otiojson.parse(
            "{\n    \"OTIO_SCHEMA\": \"MissingReference.1\",\n    \"metadata\": {},\n    \"name\": \"linked\",\n    \"available_range\": null,\n    \"available_image_bounds\": null\n}",
          )
        },
      ).unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"Clip.2\",\n    \"metadata\": {},\n    \"name\": \"keep\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"media_references\": {\n        \"DEFAULT_MEDIA\": {\n            \"OTIO_SCHEMA\": \"MissingReference.1\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"available_range\": null,\n            \"available_image_bounds\": null\n        }\n    },\n    \"active_media_reference_key\": \"DEFAULT_MEDIA\"\n}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:linker-from-name-None-__default" {
  let manifest = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"PluginManifest.1\",\n    \"adapters\": [\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"read.py\",\n            \"name\": \"read\",\n            \"suffixes\": [\n                \"same\",\n                \"read\"\n            ]\n        },\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"write.py\",\n            \"name\": \"write\",\n            \"suffixes\": [\n                \"same\",\n                \"write\"\n            ]\n        }\n    ],\n    \"hook_scripts\": [\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"first.py\",\n            \"name\": \"first\"\n        },\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"second.py\",\n            \"name\": \"second\"\n        }\n    ],\n    \"hooks\": {\n        \"custom\": [\n            \"first\",\n            \"second\"\n        ],\n        \"empty\": []\n    },\n    \"media_linkers\": [\n        {\n            \"OTIO_SCHEMA\": \"MediaLinker.1\",\n            \"filepath\": \"link.py\",\n            \"name\": \"link\"\n        }\n    ],\n    \"schemadefs\": [],\n    \"version_manifests\": {}\n}",
  ).unwrap()
  assert_true(
    @plugins.media_linker_from_name(manifest, Some("__default"), None).unwrap()
    is None,
  )
}

///|
test "functions:linked-reference-None-__default" {
  let manifest = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"PluginManifest.1\",\n    \"adapters\": [\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"read.py\",\n            \"name\": \"read\",\n            \"suffixes\": [\n                \"same\",\n                \"read\"\n            ]\n        },\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"write.py\",\n            \"name\": \"write\",\n            \"suffixes\": [\n                \"same\",\n                \"write\"\n            ]\n        }\n    ],\n    \"hook_scripts\": [\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"first.py\",\n            \"name\": \"first\"\n        },\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"second.py\",\n            \"name\": \"second\"\n        }\n    ],\n    \"hooks\": {\n        \"custom\": [\n            \"first\",\n            \"second\"\n        ],\n        \"empty\": []\n    },\n    \"media_linkers\": [\n        {\n            \"OTIO_SCHEMA\": \"MediaLinker.1\",\n            \"filepath\": \"link.py\",\n            \"name\": \"link\"\n        }\n    ],\n    \"schemadefs\": [],\n    \"version_manifests\": {}\n}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(
      @plugins.linked_media_reference(
        manifest,
        @otiojson.parse(
          "{\n    \"OTIO_SCHEMA\": \"Clip.2\",\n    \"metadata\": {},\n    \"name\": \"keep\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"media_references\": {\n        \"DEFAULT_MEDIA\": {\n            \"OTIO_SCHEMA\": \"MissingReference.1\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"available_range\": null,\n            \"available_image_bounds\": null\n        }\n    },\n    \"active_media_reference_key\": \"DEFAULT_MEDIA\"\n}",
        ).unwrap(),
        Some("__default"),
        None,
        Json::empty_object(),
        fn(_d, _c, _a) {
          @otiojson.parse(
            "{\n    \"OTIO_SCHEMA\": \"MissingReference.1\",\n    \"metadata\": {},\n    \"name\": \"linked\",\n    \"available_range\": null,\n    \"available_image_bounds\": null\n}",
          )
        },
      ).unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"Clip.2\",\n    \"metadata\": {},\n    \"name\": \"keep\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"media_references\": {\n        \"DEFAULT_MEDIA\": {\n            \"OTIO_SCHEMA\": \"MissingReference.1\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"available_range\": null,\n            \"available_image_bounds\": null\n        }\n    },\n    \"active_media_reference_key\": \"DEFAULT_MEDIA\"\n}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:linker-from-name-None-link" {
  let manifest = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"PluginManifest.1\",\n    \"adapters\": [\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"read.py\",\n            \"name\": \"read\",\n            \"suffixes\": [\n                \"same\",\n                \"read\"\n            ]\n        },\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"write.py\",\n            \"name\": \"write\",\n            \"suffixes\": [\n                \"same\",\n                \"write\"\n            ]\n        }\n    ],\n    \"hook_scripts\": [\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"first.py\",\n            \"name\": \"first\"\n        },\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"second.py\",\n            \"name\": \"second\"\n        }\n    ],\n    \"hooks\": {\n        \"custom\": [\n            \"first\",\n            \"second\"\n        ],\n        \"empty\": []\n    },\n    \"media_linkers\": [\n        {\n            \"OTIO_SCHEMA\": \"MediaLinker.1\",\n            \"filepath\": \"link.py\",\n            \"name\": \"link\"\n        }\n    ],\n    \"schemadefs\": [],\n    \"version_manifests\": {}\n}",
  ).unwrap()
  assert_true(
    @plugins.media_linker_from_name(manifest, Some("link"), None)
    .unwrap()
    .unwrap()
    .equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"MediaLinker.1\",\n    \"filepath\": \"link.py\",\n    \"name\": \"link\"\n}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:linked-reference-None-link" {
  let manifest = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"PluginManifest.1\",\n    \"adapters\": [\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"read.py\",\n            \"name\": \"read\",\n            \"suffixes\": [\n                \"same\",\n                \"read\"\n            ]\n        },\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"write.py\",\n            \"name\": \"write\",\n            \"suffixes\": [\n                \"same\",\n                \"write\"\n            ]\n        }\n    ],\n    \"hook_scripts\": [\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"first.py\",\n            \"name\": \"first\"\n        },\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"second.py\",\n            \"name\": \"second\"\n        }\n    ],\n    \"hooks\": {\n        \"custom\": [\n            \"first\",\n            \"second\"\n        ],\n        \"empty\": []\n    },\n    \"media_linkers\": [\n        {\n            \"OTIO_SCHEMA\": \"MediaLinker.1\",\n            \"filepath\": \"link.py\",\n            \"name\": \"link\"\n        }\n    ],\n    \"schemadefs\": [],\n    \"version_manifests\": {}\n}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(
      @plugins.linked_media_reference(
        manifest,
        @otiojson.parse(
          "{\n    \"OTIO_SCHEMA\": \"Clip.2\",\n    \"metadata\": {},\n    \"name\": \"keep\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"media_references\": {\n        \"DEFAULT_MEDIA\": {\n            \"OTIO_SCHEMA\": \"MissingReference.1\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"available_range\": null,\n            \"available_image_bounds\": null\n        }\n    },\n    \"active_media_reference_key\": \"DEFAULT_MEDIA\"\n}",
        ).unwrap(),
        Some("link"),
        None,
        Json::empty_object(),
        fn(_d, _c, _a) {
          @otiojson.parse(
            "{\n    \"OTIO_SCHEMA\": \"MissingReference.1\",\n    \"metadata\": {},\n    \"name\": \"linked\",\n    \"available_range\": null,\n    \"available_image_bounds\": null\n}",
          )
        },
      ).unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"MissingReference.1\",\n    \"metadata\": {},\n    \"name\": \"linked\",\n    \"available_range\": null,\n    \"available_image_bounds\": null\n}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:linker-from-name-None-missing" {
  let manifest = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"PluginManifest.1\",\n    \"adapters\": [\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"read.py\",\n            \"name\": \"read\",\n            \"suffixes\": [\n                \"same\",\n                \"read\"\n            ]\n        },\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"write.py\",\n            \"name\": \"write\",\n            \"suffixes\": [\n                \"same\",\n                \"write\"\n            ]\n        }\n    ],\n    \"hook_scripts\": [\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"first.py\",\n            \"name\": \"first\"\n        },\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"second.py\",\n            \"name\": \"second\"\n        }\n    ],\n    \"hooks\": {\n        \"custom\": [\n            \"first\",\n            \"second\"\n        ],\n        \"empty\": []\n    },\n    \"media_linkers\": [\n        {\n            \"OTIO_SCHEMA\": \"MediaLinker.1\",\n            \"filepath\": \"link.py\",\n            \"name\": \"link\"\n        }\n    ],\n    \"schemadefs\": [],\n    \"version_manifests\": {}\n}",
  ).unwrap()
  assert_true(
    @plugins.media_linker_from_name(manifest, Some("missing"), None) is Err(_),
  )
}

///|
test "functions:linked-reference-None-missing" {
  let manifest = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"PluginManifest.1\",\n    \"adapters\": [\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"read.py\",\n            \"name\": \"read\",\n            \"suffixes\": [\n                \"same\",\n                \"read\"\n            ]\n        },\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"write.py\",\n            \"name\": \"write\",\n            \"suffixes\": [\n                \"same\",\n                \"write\"\n            ]\n        }\n    ],\n    \"hook_scripts\": [\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"first.py\",\n            \"name\": \"first\"\n        },\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"second.py\",\n            \"name\": \"second\"\n        }\n    ],\n    \"hooks\": {\n        \"custom\": [\n            \"first\",\n            \"second\"\n        ],\n        \"empty\": []\n    },\n    \"media_linkers\": [\n        {\n            \"OTIO_SCHEMA\": \"MediaLinker.1\",\n            \"filepath\": \"link.py\",\n            \"name\": \"link\"\n        }\n    ],\n    \"schemadefs\": [],\n    \"version_manifests\": {}\n}",
  ).unwrap()
  assert_true(
    @plugins.linked_media_reference(
      manifest,
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"Clip.2\",\n    \"metadata\": {},\n    \"name\": \"keep\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"media_references\": {\n        \"DEFAULT_MEDIA\": {\n            \"OTIO_SCHEMA\": \"MissingReference.1\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"available_range\": null,\n            \"available_image_bounds\": null\n        }\n    },\n    \"active_media_reference_key\": \"DEFAULT_MEDIA\"\n}",
      ).unwrap(),
      Some("missing"),
      None,
      Json::empty_object(),
      fn(_d, _c, _a) {
        @otiojson.parse(
          "{\n    \"OTIO_SCHEMA\": \"MissingReference.1\",\n    \"metadata\": {},\n    \"name\": \"linked\",\n    \"available_range\": null,\n    \"available_image_bounds\": null\n}",
        )
      },
    )
    is Err(_),
  )
}

///|
test "functions:default-linker-" {
  assert_eq(@plugins.default_media_linker(Some("")).unwrap(), "")
}

///|
test "functions:linker-from-name--None" {
  let manifest = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"PluginManifest.1\",\n    \"adapters\": [\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"read.py\",\n            \"name\": \"read\",\n            \"suffixes\": [\n                \"same\",\n                \"read\"\n            ]\n        },\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"write.py\",\n            \"name\": \"write\",\n            \"suffixes\": [\n                \"same\",\n                \"write\"\n            ]\n        }\n    ],\n    \"hook_scripts\": [\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"first.py\",\n            \"name\": \"first\"\n        },\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"second.py\",\n            \"name\": \"second\"\n        }\n    ],\n    \"hooks\": {\n        \"custom\": [\n            \"first\",\n            \"second\"\n        ],\n        \"empty\": []\n    },\n    \"media_linkers\": [\n        {\n            \"OTIO_SCHEMA\": \"MediaLinker.1\",\n            \"filepath\": \"link.py\",\n            \"name\": \"link\"\n        }\n    ],\n    \"schemadefs\": [],\n    \"version_manifests\": {}\n}",
  ).unwrap()
  assert_true(
    @plugins.media_linker_from_name(manifest, None, Some("")).unwrap() is None,
  )
}

///|
test "functions:linked-reference--None" {
  let manifest = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"PluginManifest.1\",\n    \"adapters\": [\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"read.py\",\n            \"name\": \"read\",\n            \"suffixes\": [\n                \"same\",\n                \"read\"\n            ]\n        },\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"write.py\",\n            \"name\": \"write\",\n            \"suffixes\": [\n                \"same\",\n                \"write\"\n            ]\n        }\n    ],\n    \"hook_scripts\": [\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"first.py\",\n            \"name\": \"first\"\n        },\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"second.py\",\n            \"name\": \"second\"\n        }\n    ],\n    \"hooks\": {\n        \"custom\": [\n            \"first\",\n            \"second\"\n        ],\n        \"empty\": []\n    },\n    \"media_linkers\": [\n        {\n            \"OTIO_SCHEMA\": \"MediaLinker.1\",\n            \"filepath\": \"link.py\",\n            \"name\": \"link\"\n        }\n    ],\n    \"schemadefs\": [],\n    \"version_manifests\": {}\n}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(
      @plugins.linked_media_reference(
        manifest,
        @otiojson.parse(
          "{\n    \"OTIO_SCHEMA\": \"Clip.2\",\n    \"metadata\": {},\n    \"name\": \"keep\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"media_references\": {\n        \"DEFAULT_MEDIA\": {\n            \"OTIO_SCHEMA\": \"MissingReference.1\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"available_range\": null,\n            \"available_image_bounds\": null\n        }\n    },\n    \"active_media_reference_key\": \"DEFAULT_MEDIA\"\n}",
        ).unwrap(),
        None,
        Some(""),
        Json::empty_object(),
        fn(_d, _c, _a) {
          @otiojson.parse(
            "{\n    \"OTIO_SCHEMA\": \"MissingReference.1\",\n    \"metadata\": {},\n    \"name\": \"linked\",\n    \"available_range\": null,\n    \"available_image_bounds\": null\n}",
          )
        },
      ).unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"Clip.2\",\n    \"metadata\": {},\n    \"name\": \"keep\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"media_references\": {\n        \"DEFAULT_MEDIA\": {\n            \"OTIO_SCHEMA\": \"MissingReference.1\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"available_range\": null,\n            \"available_image_bounds\": null\n        }\n    },\n    \"active_media_reference_key\": \"DEFAULT_MEDIA\"\n}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:linker-from-name--" {
  let manifest = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"PluginManifest.1\",\n    \"adapters\": [\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"read.py\",\n            \"name\": \"read\",\n            \"suffixes\": [\n                \"same\",\n                \"read\"\n            ]\n        },\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"write.py\",\n            \"name\": \"write\",\n            \"suffixes\": [\n                \"same\",\n                \"write\"\n            ]\n        }\n    ],\n    \"hook_scripts\": [\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"first.py\",\n            \"name\": \"first\"\n        },\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"second.py\",\n            \"name\": \"second\"\n        }\n    ],\n    \"hooks\": {\n        \"custom\": [\n            \"first\",\n            \"second\"\n        ],\n        \"empty\": []\n    },\n    \"media_linkers\": [\n        {\n            \"OTIO_SCHEMA\": \"MediaLinker.1\",\n            \"filepath\": \"link.py\",\n            \"name\": \"link\"\n        }\n    ],\n    \"schemadefs\": [],\n    \"version_manifests\": {}\n}",
  ).unwrap()
  assert_true(
    @plugins.media_linker_from_name(manifest, Some(""), Some("")).unwrap()
    is None,
  )
}

///|
test "functions:linked-reference--" {
  let manifest = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"PluginManifest.1\",\n    \"adapters\": [\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"read.py\",\n            \"name\": \"read\",\n            \"suffixes\": [\n                \"same\",\n                \"read\"\n            ]\n        },\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"write.py\",\n            \"name\": \"write\",\n            \"suffixes\": [\n                \"same\",\n                \"write\"\n            ]\n        }\n    ],\n    \"hook_scripts\": [\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"first.py\",\n            \"name\": \"first\"\n        },\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"second.py\",\n            \"name\": \"second\"\n        }\n    ],\n    \"hooks\": {\n        \"custom\": [\n            \"first\",\n            \"second\"\n        ],\n        \"empty\": []\n    },\n    \"media_linkers\": [\n        {\n            \"OTIO_SCHEMA\": \"MediaLinker.1\",\n            \"filepath\": \"link.py\",\n            \"name\": \"link\"\n        }\n    ],\n    \"schemadefs\": [],\n    \"version_manifests\": {}\n}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(
      @plugins.linked_media_reference(
        manifest,
        @otiojson.parse(
          "{\n    \"OTIO_SCHEMA\": \"Clip.2\",\n    \"metadata\": {},\n    \"name\": \"keep\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"media_references\": {\n        \"DEFAULT_MEDIA\": {\n            \"OTIO_SCHEMA\": \"MissingReference.1\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"available_range\": null,\n            \"available_image_bounds\": null\n        }\n    },\n    \"active_media_reference_key\": \"DEFAULT_MEDIA\"\n}",
        ).unwrap(),
        Some(""),
        Some(""),
        Json::empty_object(),
        fn(_d, _c, _a) {
          @otiojson.parse(
            "{\n    \"OTIO_SCHEMA\": \"MissingReference.1\",\n    \"metadata\": {},\n    \"name\": \"linked\",\n    \"available_range\": null,\n    \"available_image_bounds\": null\n}",
          )
        },
      ).unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"Clip.2\",\n    \"metadata\": {},\n    \"name\": \"keep\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"media_references\": {\n        \"DEFAULT_MEDIA\": {\n            \"OTIO_SCHEMA\": \"MissingReference.1\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"available_range\": null,\n            \"available_image_bounds\": null\n        }\n    },\n    \"active_media_reference_key\": \"DEFAULT_MEDIA\"\n}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:linker-from-name--__default" {
  let manifest = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"PluginManifest.1\",\n    \"adapters\": [\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"read.py\",\n            \"name\": \"read\",\n            \"suffixes\": [\n                \"same\",\n                \"read\"\n            ]\n        },\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"write.py\",\n            \"name\": \"write\",\n            \"suffixes\": [\n                \"same\",\n                \"write\"\n            ]\n        }\n    ],\n    \"hook_scripts\": [\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"first.py\",\n            \"name\": \"first\"\n        },\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"second.py\",\n            \"name\": \"second\"\n        }\n    ],\n    \"hooks\": {\n        \"custom\": [\n            \"first\",\n            \"second\"\n        ],\n        \"empty\": []\n    },\n    \"media_linkers\": [\n        {\n            \"OTIO_SCHEMA\": \"MediaLinker.1\",\n            \"filepath\": \"link.py\",\n            \"name\": \"link\"\n        }\n    ],\n    \"schemadefs\": [],\n    \"version_manifests\": {}\n}",
  ).unwrap()
  assert_true(
    @plugins.media_linker_from_name(manifest, Some("__default"), Some("")).unwrap()
    is None,
  )
}

///|
test "functions:linked-reference--__default" {
  let manifest = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"PluginManifest.1\",\n    \"adapters\": [\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"read.py\",\n            \"name\": \"read\",\n            \"suffixes\": [\n                \"same\",\n                \"read\"\n            ]\n        },\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"write.py\",\n            \"name\": \"write\",\n            \"suffixes\": [\n                \"same\",\n                \"write\"\n            ]\n        }\n    ],\n    \"hook_scripts\": [\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"first.py\",\n            \"name\": \"first\"\n        },\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"second.py\",\n            \"name\": \"second\"\n        }\n    ],\n    \"hooks\": {\n        \"custom\": [\n            \"first\",\n            \"second\"\n        ],\n        \"empty\": []\n    },\n    \"media_linkers\": [\n        {\n            \"OTIO_SCHEMA\": \"MediaLinker.1\",\n            \"filepath\": \"link.py\",\n            \"name\": \"link\"\n        }\n    ],\n    \"schemadefs\": [],\n    \"version_manifests\": {}\n}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(
      @plugins.linked_media_reference(
        manifest,
        @otiojson.parse(
          "{\n    \"OTIO_SCHEMA\": \"Clip.2\",\n    \"metadata\": {},\n    \"name\": \"keep\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"media_references\": {\n        \"DEFAULT_MEDIA\": {\n            \"OTIO_SCHEMA\": \"MissingReference.1\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"available_range\": null,\n            \"available_image_bounds\": null\n        }\n    },\n    \"active_media_reference_key\": \"DEFAULT_MEDIA\"\n}",
        ).unwrap(),
        Some("__default"),
        Some(""),
        Json::empty_object(),
        fn(_d, _c, _a) {
          @otiojson.parse(
            "{\n    \"OTIO_SCHEMA\": \"MissingReference.1\",\n    \"metadata\": {},\n    \"name\": \"linked\",\n    \"available_range\": null,\n    \"available_image_bounds\": null\n}",
          )
        },
      ).unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"Clip.2\",\n    \"metadata\": {},\n    \"name\": \"keep\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"media_references\": {\n        \"DEFAULT_MEDIA\": {\n            \"OTIO_SCHEMA\": \"MissingReference.1\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"available_range\": null,\n            \"available_image_bounds\": null\n        }\n    },\n    \"active_media_reference_key\": \"DEFAULT_MEDIA\"\n}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:linker-from-name--link" {
  let manifest = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"PluginManifest.1\",\n    \"adapters\": [\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"read.py\",\n            \"name\": \"read\",\n            \"suffixes\": [\n                \"same\",\n                \"read\"\n            ]\n        },\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"write.py\",\n            \"name\": \"write\",\n            \"suffixes\": [\n                \"same\",\n                \"write\"\n            ]\n        }\n    ],\n    \"hook_scripts\": [\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"first.py\",\n            \"name\": \"first\"\n        },\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"second.py\",\n            \"name\": \"second\"\n        }\n    ],\n    \"hooks\": {\n        \"custom\": [\n            \"first\",\n            \"second\"\n        ],\n        \"empty\": []\n    },\n    \"media_linkers\": [\n        {\n            \"OTIO_SCHEMA\": \"MediaLinker.1\",\n            \"filepath\": \"link.py\",\n            \"name\": \"link\"\n        }\n    ],\n    \"schemadefs\": [],\n    \"version_manifests\": {}\n}",
  ).unwrap()
  assert_true(
    @plugins.media_linker_from_name(manifest, Some("link"), Some(""))
    .unwrap()
    .unwrap()
    .equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"MediaLinker.1\",\n    \"filepath\": \"link.py\",\n    \"name\": \"link\"\n}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:linked-reference--link" {
  let manifest = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"PluginManifest.1\",\n    \"adapters\": [\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"read.py\",\n            \"name\": \"read\",\n            \"suffixes\": [\n                \"same\",\n                \"read\"\n            ]\n        },\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"write.py\",\n            \"name\": \"write\",\n            \"suffixes\": [\n                \"same\",\n                \"write\"\n            ]\n        }\n    ],\n    \"hook_scripts\": [\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"first.py\",\n            \"name\": \"first\"\n        },\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"second.py\",\n            \"name\": \"second\"\n        }\n    ],\n    \"hooks\": {\n        \"custom\": [\n            \"first\",\n            \"second\"\n        ],\n        \"empty\": []\n    },\n    \"media_linkers\": [\n        {\n            \"OTIO_SCHEMA\": \"MediaLinker.1\",\n            \"filepath\": \"link.py\",\n            \"name\": \"link\"\n        }\n    ],\n    \"schemadefs\": [],\n    \"version_manifests\": {}\n}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(
      @plugins.linked_media_reference(
        manifest,
        @otiojson.parse(
          "{\n    \"OTIO_SCHEMA\": \"Clip.2\",\n    \"metadata\": {},\n    \"name\": \"keep\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"media_references\": {\n        \"DEFAULT_MEDIA\": {\n            \"OTIO_SCHEMA\": \"MissingReference.1\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"available_range\": null,\n            \"available_image_bounds\": null\n        }\n    },\n    \"active_media_reference_key\": \"DEFAULT_MEDIA\"\n}",
        ).unwrap(),
        Some("link"),
        Some(""),
        Json::empty_object(),
        fn(_d, _c, _a) {
          @otiojson.parse(
            "{\n    \"OTIO_SCHEMA\": \"MissingReference.1\",\n    \"metadata\": {},\n    \"name\": \"linked\",\n    \"available_range\": null,\n    \"available_image_bounds\": null\n}",
          )
        },
      ).unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"MissingReference.1\",\n    \"metadata\": {},\n    \"name\": \"linked\",\n    \"available_range\": null,\n    \"available_image_bounds\": null\n}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:linker-from-name--missing" {
  let manifest = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"PluginManifest.1\",\n    \"adapters\": [\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"read.py\",\n            \"name\": \"read\",\n            \"suffixes\": [\n                \"same\",\n                \"read\"\n            ]\n        },\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"write.py\",\n            \"name\": \"write\",\n            \"suffixes\": [\n                \"same\",\n                \"write\"\n            ]\n        }\n    ],\n    \"hook_scripts\": [\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"first.py\",\n            \"name\": \"first\"\n        },\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"second.py\",\n            \"name\": \"second\"\n        }\n    ],\n    \"hooks\": {\n        \"custom\": [\n            \"first\",\n            \"second\"\n        ],\n        \"empty\": []\n    },\n    \"media_linkers\": [\n        {\n            \"OTIO_SCHEMA\": \"MediaLinker.1\",\n            \"filepath\": \"link.py\",\n            \"name\": \"link\"\n        }\n    ],\n    \"schemadefs\": [],\n    \"version_manifests\": {}\n}",
  ).unwrap()
  assert_true(
    @plugins.media_linker_from_name(manifest, Some("missing"), Some(""))
    is Err(_),
  )
}

///|
test "functions:linked-reference--missing" {
  let manifest = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"PluginManifest.1\",\n    \"adapters\": [\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"read.py\",\n            \"name\": \"read\",\n            \"suffixes\": [\n                \"same\",\n                \"read\"\n            ]\n        },\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"write.py\",\n            \"name\": \"write\",\n            \"suffixes\": [\n                \"same\",\n                \"write\"\n            ]\n        }\n    ],\n    \"hook_scripts\": [\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"first.py\",\n            \"name\": \"first\"\n        },\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"second.py\",\n            \"name\": \"second\"\n        }\n    ],\n    \"hooks\": {\n        \"custom\": [\n            \"first\",\n            \"second\"\n        ],\n        \"empty\": []\n    },\n    \"media_linkers\": [\n        {\n            \"OTIO_SCHEMA\": \"MediaLinker.1\",\n            \"filepath\": \"link.py\",\n            \"name\": \"link\"\n        }\n    ],\n    \"schemadefs\": [],\n    \"version_manifests\": {}\n}",
  ).unwrap()
  assert_true(
    @plugins.linked_media_reference(
      manifest,
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"Clip.2\",\n    \"metadata\": {},\n    \"name\": \"keep\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"media_references\": {\n        \"DEFAULT_MEDIA\": {\n            \"OTIO_SCHEMA\": \"MissingReference.1\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"available_range\": null,\n            \"available_image_bounds\": null\n        }\n    },\n    \"active_media_reference_key\": \"DEFAULT_MEDIA\"\n}",
      ).unwrap(),
      Some("missing"),
      Some(""),
      Json::empty_object(),
      fn(_d, _c, _a) {
        @otiojson.parse(
          "{\n    \"OTIO_SCHEMA\": \"MissingReference.1\",\n    \"metadata\": {},\n    \"name\": \"linked\",\n    \"available_range\": null,\n    \"available_image_bounds\": null\n}",
        )
      },
    )
    is Err(_),
  )
}

///|
test "functions:default-linker-link" {
  assert_eq(@plugins.default_media_linker(Some("link")).unwrap(), "link")
}

///|
test "functions:linker-from-name-link-None" {
  let manifest = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"PluginManifest.1\",\n    \"adapters\": [\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"read.py\",\n            \"name\": \"read\",\n            \"suffixes\": [\n                \"same\",\n                \"read\"\n            ]\n        },\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"write.py\",\n            \"name\": \"write\",\n            \"suffixes\": [\n                \"same\",\n                \"write\"\n            ]\n        }\n    ],\n    \"hook_scripts\": [\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"first.py\",\n            \"name\": \"first\"\n        },\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"second.py\",\n            \"name\": \"second\"\n        }\n    ],\n    \"hooks\": {\n        \"custom\": [\n            \"first\",\n            \"second\"\n        ],\n        \"empty\": []\n    },\n    \"media_linkers\": [\n        {\n            \"OTIO_SCHEMA\": \"MediaLinker.1\",\n            \"filepath\": \"link.py\",\n            \"name\": \"link\"\n        }\n    ],\n    \"schemadefs\": [],\n    \"version_manifests\": {}\n}",
  ).unwrap()
  assert_true(
    @plugins.media_linker_from_name(manifest, None, Some("link"))
    .unwrap()
    .unwrap()
    .equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"MediaLinker.1\",\n    \"filepath\": \"link.py\",\n    \"name\": \"link\"\n}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:linked-reference-link-None" {
  let manifest = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"PluginManifest.1\",\n    \"adapters\": [\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"read.py\",\n            \"name\": \"read\",\n            \"suffixes\": [\n                \"same\",\n                \"read\"\n            ]\n        },\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"write.py\",\n            \"name\": \"write\",\n            \"suffixes\": [\n                \"same\",\n                \"write\"\n            ]\n        }\n    ],\n    \"hook_scripts\": [\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"first.py\",\n            \"name\": \"first\"\n        },\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"second.py\",\n            \"name\": \"second\"\n        }\n    ],\n    \"hooks\": {\n        \"custom\": [\n            \"first\",\n            \"second\"\n        ],\n        \"empty\": []\n    },\n    \"media_linkers\": [\n        {\n            \"OTIO_SCHEMA\": \"MediaLinker.1\",\n            \"filepath\": \"link.py\",\n            \"name\": \"link\"\n        }\n    ],\n    \"schemadefs\": [],\n    \"version_manifests\": {}\n}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(
      @plugins.linked_media_reference(
        manifest,
        @otiojson.parse(
          "{\n    \"OTIO_SCHEMA\": \"Clip.2\",\n    \"metadata\": {},\n    \"name\": \"keep\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"media_references\": {\n        \"DEFAULT_MEDIA\": {\n            \"OTIO_SCHEMA\": \"MissingReference.1\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"available_range\": null,\n            \"available_image_bounds\": null\n        }\n    },\n    \"active_media_reference_key\": \"DEFAULT_MEDIA\"\n}",
        ).unwrap(),
        None,
        Some("link"),
        Json::empty_object(),
        fn(_d, _c, _a) {
          @otiojson.parse(
            "{\n    \"OTIO_SCHEMA\": \"MissingReference.1\",\n    \"metadata\": {},\n    \"name\": \"linked\",\n    \"available_range\": null,\n    \"available_image_bounds\": null\n}",
          )
        },
      ).unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"MissingReference.1\",\n    \"metadata\": {},\n    \"name\": \"linked\",\n    \"available_range\": null,\n    \"available_image_bounds\": null\n}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:linker-from-name-link-" {
  let manifest = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"PluginManifest.1\",\n    \"adapters\": [\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"read.py\",\n            \"name\": \"read\",\n            \"suffixes\": [\n                \"same\",\n                \"read\"\n            ]\n        },\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"write.py\",\n            \"name\": \"write\",\n            \"suffixes\": [\n                \"same\",\n                \"write\"\n            ]\n        }\n    ],\n    \"hook_scripts\": [\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"first.py\",\n            \"name\": \"first\"\n        },\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"second.py\",\n            \"name\": \"second\"\n        }\n    ],\n    \"hooks\": {\n        \"custom\": [\n            \"first\",\n            \"second\"\n        ],\n        \"empty\": []\n    },\n    \"media_linkers\": [\n        {\n            \"OTIO_SCHEMA\": \"MediaLinker.1\",\n            \"filepath\": \"link.py\",\n            \"name\": \"link\"\n        }\n    ],\n    \"schemadefs\": [],\n    \"version_manifests\": {}\n}",
  ).unwrap()
  assert_true(
    @plugins.media_linker_from_name(manifest, Some(""), Some("link"))
    .unwrap()
    .unwrap()
    .equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"MediaLinker.1\",\n    \"filepath\": \"link.py\",\n    \"name\": \"link\"\n}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:linked-reference-link-" {
  let manifest = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"PluginManifest.1\",\n    \"adapters\": [\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"read.py\",\n            \"name\": \"read\",\n            \"suffixes\": [\n                \"same\",\n                \"read\"\n            ]\n        },\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"write.py\",\n            \"name\": \"write\",\n            \"suffixes\": [\n                \"same\",\n                \"write\"\n            ]\n        }\n    ],\n    \"hook_scripts\": [\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"first.py\",\n            \"name\": \"first\"\n        },\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"second.py\",\n            \"name\": \"second\"\n        }\n    ],\n    \"hooks\": {\n        \"custom\": [\n            \"first\",\n            \"second\"\n        ],\n        \"empty\": []\n    },\n    \"media_linkers\": [\n        {\n            \"OTIO_SCHEMA\": \"MediaLinker.1\",\n            \"filepath\": \"link.py\",\n            \"name\": \"link\"\n        }\n    ],\n    \"schemadefs\": [],\n    \"version_manifests\": {}\n}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(
      @plugins.linked_media_reference(
        manifest,
        @otiojson.parse(
          "{\n    \"OTIO_SCHEMA\": \"Clip.2\",\n    \"metadata\": {},\n    \"name\": \"keep\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"media_references\": {\n        \"DEFAULT_MEDIA\": {\n            \"OTIO_SCHEMA\": \"MissingReference.1\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"available_range\": null,\n            \"available_image_bounds\": null\n        }\n    },\n    \"active_media_reference_key\": \"DEFAULT_MEDIA\"\n}",
        ).unwrap(),
        Some(""),
        Some("link"),
        Json::empty_object(),
        fn(_d, _c, _a) {
          @otiojson.parse(
            "{\n    \"OTIO_SCHEMA\": \"MissingReference.1\",\n    \"metadata\": {},\n    \"name\": \"linked\",\n    \"available_range\": null,\n    \"available_image_bounds\": null\n}",
          )
        },
      ).unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"MissingReference.1\",\n    \"metadata\": {},\n    \"name\": \"linked\",\n    \"available_range\": null,\n    \"available_image_bounds\": null\n}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:linker-from-name-link-__default" {
  let manifest = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"PluginManifest.1\",\n    \"adapters\": [\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"read.py\",\n            \"name\": \"read\",\n            \"suffixes\": [\n                \"same\",\n                \"read\"\n            ]\n        },\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"write.py\",\n            \"name\": \"write\",\n            \"suffixes\": [\n                \"same\",\n                \"write\"\n            ]\n        }\n    ],\n    \"hook_scripts\": [\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"first.py\",\n            \"name\": \"first\"\n        },\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"second.py\",\n            \"name\": \"second\"\n        }\n    ],\n    \"hooks\": {\n        \"custom\": [\n            \"first\",\n            \"second\"\n        ],\n        \"empty\": []\n    },\n    \"media_linkers\": [\n        {\n            \"OTIO_SCHEMA\": \"MediaLinker.1\",\n            \"filepath\": \"link.py\",\n            \"name\": \"link\"\n        }\n    ],\n    \"schemadefs\": [],\n    \"version_manifests\": {}\n}",
  ).unwrap()
  assert_true(
    @plugins.media_linker_from_name(manifest, Some("__default"), Some("link"))
    .unwrap()
    .unwrap()
    .equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"MediaLinker.1\",\n    \"filepath\": \"link.py\",\n    \"name\": \"link\"\n}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:linked-reference-link-__default" {
  let manifest = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"PluginManifest.1\",\n    \"adapters\": [\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"read.py\",\n            \"name\": \"read\",\n            \"suffixes\": [\n                \"same\",\n                \"read\"\n            ]\n        },\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"write.py\",\n            \"name\": \"write\",\n            \"suffixes\": [\n                \"same\",\n                \"write\"\n            ]\n        }\n    ],\n    \"hook_scripts\": [\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"first.py\",\n            \"name\": \"first\"\n        },\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"second.py\",\n            \"name\": \"second\"\n        }\n    ],\n    \"hooks\": {\n        \"custom\": [\n            \"first\",\n            \"second\"\n        ],\n        \"empty\": []\n    },\n    \"media_linkers\": [\n        {\n            \"OTIO_SCHEMA\": \"MediaLinker.1\",\n            \"filepath\": \"link.py\",\n            \"name\": \"link\"\n        }\n    ],\n    \"schemadefs\": [],\n    \"version_manifests\": {}\n}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(
      @plugins.linked_media_reference(
        manifest,
        @otiojson.parse(
          "{\n    \"OTIO_SCHEMA\": \"Clip.2\",\n    \"metadata\": {},\n    \"name\": \"keep\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"media_references\": {\n        \"DEFAULT_MEDIA\": {\n            \"OTIO_SCHEMA\": \"MissingReference.1\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"available_range\": null,\n            \"available_image_bounds\": null\n        }\n    },\n    \"active_media_reference_key\": \"DEFAULT_MEDIA\"\n}",
        ).unwrap(),
        Some("__default"),
        Some("link"),
        Json::empty_object(),
        fn(_d, _c, _a) {
          @otiojson.parse(
            "{\n    \"OTIO_SCHEMA\": \"MissingReference.1\",\n    \"metadata\": {},\n    \"name\": \"linked\",\n    \"available_range\": null,\n    \"available_image_bounds\": null\n}",
          )
        },
      ).unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"MissingReference.1\",\n    \"metadata\": {},\n    \"name\": \"linked\",\n    \"available_range\": null,\n    \"available_image_bounds\": null\n}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:linker-from-name-link-link" {
  let manifest = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"PluginManifest.1\",\n    \"adapters\": [\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"read.py\",\n            \"name\": \"read\",\n            \"suffixes\": [\n                \"same\",\n                \"read\"\n            ]\n        },\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"write.py\",\n            \"name\": \"write\",\n            \"suffixes\": [\n                \"same\",\n                \"write\"\n            ]\n        }\n    ],\n    \"hook_scripts\": [\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"first.py\",\n            \"name\": \"first\"\n        },\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"second.py\",\n            \"name\": \"second\"\n        }\n    ],\n    \"hooks\": {\n        \"custom\": [\n            \"first\",\n            \"second\"\n        ],\n        \"empty\": []\n    },\n    \"media_linkers\": [\n        {\n            \"OTIO_SCHEMA\": \"MediaLinker.1\",\n            \"filepath\": \"link.py\",\n            \"name\": \"link\"\n        }\n    ],\n    \"schemadefs\": [],\n    \"version_manifests\": {}\n}",
  ).unwrap()
  assert_true(
    @plugins.media_linker_from_name(manifest, Some("link"), Some("link"))
    .unwrap()
    .unwrap()
    .equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"MediaLinker.1\",\n    \"filepath\": \"link.py\",\n    \"name\": \"link\"\n}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:linked-reference-link-link" {
  let manifest = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"PluginManifest.1\",\n    \"adapters\": [\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"read.py\",\n            \"name\": \"read\",\n            \"suffixes\": [\n                \"same\",\n                \"read\"\n            ]\n        },\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"write.py\",\n            \"name\": \"write\",\n            \"suffixes\": [\n                \"same\",\n                \"write\"\n            ]\n        }\n    ],\n    \"hook_scripts\": [\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"first.py\",\n            \"name\": \"first\"\n        },\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"second.py\",\n            \"name\": \"second\"\n        }\n    ],\n    \"hooks\": {\n        \"custom\": [\n            \"first\",\n            \"second\"\n        ],\n        \"empty\": []\n    },\n    \"media_linkers\": [\n        {\n            \"OTIO_SCHEMA\": \"MediaLinker.1\",\n            \"filepath\": \"link.py\",\n            \"name\": \"link\"\n        }\n    ],\n    \"schemadefs\": [],\n    \"version_manifests\": {}\n}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(
      @plugins.linked_media_reference(
        manifest,
        @otiojson.parse(
          "{\n    \"OTIO_SCHEMA\": \"Clip.2\",\n    \"metadata\": {},\n    \"name\": \"keep\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"media_references\": {\n        \"DEFAULT_MEDIA\": {\n            \"OTIO_SCHEMA\": \"MissingReference.1\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"available_range\": null,\n            \"available_image_bounds\": null\n        }\n    },\n    \"active_media_reference_key\": \"DEFAULT_MEDIA\"\n}",
        ).unwrap(),
        Some("link"),
        Some("link"),
        Json::empty_object(),
        fn(_d, _c, _a) {
          @otiojson.parse(
            "{\n    \"OTIO_SCHEMA\": \"MissingReference.1\",\n    \"metadata\": {},\n    \"name\": \"linked\",\n    \"available_range\": null,\n    \"available_image_bounds\": null\n}",
          )
        },
      ).unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"MissingReference.1\",\n    \"metadata\": {},\n    \"name\": \"linked\",\n    \"available_range\": null,\n    \"available_image_bounds\": null\n}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:linker-from-name-link-missing" {
  let manifest = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"PluginManifest.1\",\n    \"adapters\": [\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"read.py\",\n            \"name\": \"read\",\n            \"suffixes\": [\n                \"same\",\n                \"read\"\n            ]\n        },\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"write.py\",\n            \"name\": \"write\",\n            \"suffixes\": [\n                \"same\",\n                \"write\"\n            ]\n        }\n    ],\n    \"hook_scripts\": [\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"first.py\",\n            \"name\": \"first\"\n        },\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"second.py\",\n            \"name\": \"second\"\n        }\n    ],\n    \"hooks\": {\n        \"custom\": [\n            \"first\",\n            \"second\"\n        ],\n        \"empty\": []\n    },\n    \"media_linkers\": [\n        {\n            \"OTIO_SCHEMA\": \"MediaLinker.1\",\n            \"filepath\": \"link.py\",\n            \"name\": \"link\"\n        }\n    ],\n    \"schemadefs\": [],\n    \"version_manifests\": {}\n}",
  ).unwrap()
  assert_true(
    @plugins.media_linker_from_name(manifest, Some("missing"), Some("link"))
    is Err(_),
  )
}

///|
test "functions:linked-reference-link-missing" {
  let manifest = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"PluginManifest.1\",\n    \"adapters\": [\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"read.py\",\n            \"name\": \"read\",\n            \"suffixes\": [\n                \"same\",\n                \"read\"\n            ]\n        },\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"write.py\",\n            \"name\": \"write\",\n            \"suffixes\": [\n                \"same\",\n                \"write\"\n            ]\n        }\n    ],\n    \"hook_scripts\": [\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"first.py\",\n            \"name\": \"first\"\n        },\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"second.py\",\n            \"name\": \"second\"\n        }\n    ],\n    \"hooks\": {\n        \"custom\": [\n            \"first\",\n            \"second\"\n        ],\n        \"empty\": []\n    },\n    \"media_linkers\": [\n        {\n            \"OTIO_SCHEMA\": \"MediaLinker.1\",\n            \"filepath\": \"link.py\",\n            \"name\": \"link\"\n        }\n    ],\n    \"schemadefs\": [],\n    \"version_manifests\": {}\n}",
  ).unwrap()
  assert_true(
    @plugins.linked_media_reference(
      manifest,
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"Clip.2\",\n    \"metadata\": {},\n    \"name\": \"keep\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"media_references\": {\n        \"DEFAULT_MEDIA\": {\n            \"OTIO_SCHEMA\": \"MissingReference.1\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"available_range\": null,\n            \"available_image_bounds\": null\n        }\n    },\n    \"active_media_reference_key\": \"DEFAULT_MEDIA\"\n}",
      ).unwrap(),
      Some("missing"),
      Some("link"),
      Json::empty_object(),
      fn(_d, _c, _a) {
        @otiojson.parse(
          "{\n    \"OTIO_SCHEMA\": \"MissingReference.1\",\n    \"metadata\": {},\n    \"name\": \"linked\",\n    \"available_range\": null,\n    \"available_image_bounds\": null\n}",
        )
      },
    )
    is Err(_),
  )
}

///|
test "functions:default-linker-missing" {
  assert_eq(@plugins.default_media_linker(Some("missing")).unwrap(), "missing")
}

///|
test "functions:linker-from-name-missing-None" {
  let manifest = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"PluginManifest.1\",\n    \"adapters\": [\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"read.py\",\n            \"name\": \"read\",\n            \"suffixes\": [\n                \"same\",\n                \"read\"\n            ]\n        },\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"write.py\",\n            \"name\": \"write\",\n            \"suffixes\": [\n                \"same\",\n                \"write\"\n            ]\n        }\n    ],\n    \"hook_scripts\": [\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"first.py\",\n            \"name\": \"first\"\n        },\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"second.py\",\n            \"name\": \"second\"\n        }\n    ],\n    \"hooks\": {\n        \"custom\": [\n            \"first\",\n            \"second\"\n        ],\n        \"empty\": []\n    },\n    \"media_linkers\": [\n        {\n            \"OTIO_SCHEMA\": \"MediaLinker.1\",\n            \"filepath\": \"link.py\",\n            \"name\": \"link\"\n        }\n    ],\n    \"schemadefs\": [],\n    \"version_manifests\": {}\n}",
  ).unwrap()
  assert_true(
    @plugins.media_linker_from_name(manifest, None, Some("missing")) is Err(_),
  )
}

///|
test "functions:linked-reference-missing-None" {
  let manifest = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"PluginManifest.1\",\n    \"adapters\": [\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"read.py\",\n            \"name\": \"read\",\n            \"suffixes\": [\n                \"same\",\n                \"read\"\n            ]\n        },\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"write.py\",\n            \"name\": \"write\",\n            \"suffixes\": [\n                \"same\",\n                \"write\"\n            ]\n        }\n    ],\n    \"hook_scripts\": [\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"first.py\",\n            \"name\": \"first\"\n        },\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"second.py\",\n            \"name\": \"second\"\n        }\n    ],\n    \"hooks\": {\n        \"custom\": [\n            \"first\",\n            \"second\"\n        ],\n        \"empty\": []\n    },\n    \"media_linkers\": [\n        {\n            \"OTIO_SCHEMA\": \"MediaLinker.1\",\n            \"filepath\": \"link.py\",\n            \"name\": \"link\"\n        }\n    ],\n    \"schemadefs\": [],\n    \"version_manifests\": {}\n}",
  ).unwrap()
  assert_true(
    @plugins.linked_media_reference(
      manifest,
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"Clip.2\",\n    \"metadata\": {},\n    \"name\": \"keep\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"media_references\": {\n        \"DEFAULT_MEDIA\": {\n            \"OTIO_SCHEMA\": \"MissingReference.1\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"available_range\": null,\n            \"available_image_bounds\": null\n        }\n    },\n    \"active_media_reference_key\": \"DEFAULT_MEDIA\"\n}",
      ).unwrap(),
      None,
      Some("missing"),
      Json::empty_object(),
      fn(_d, _c, _a) {
        @otiojson.parse(
          "{\n    \"OTIO_SCHEMA\": \"MissingReference.1\",\n    \"metadata\": {},\n    \"name\": \"linked\",\n    \"available_range\": null,\n    \"available_image_bounds\": null\n}",
        )
      },
    )
    is Err(_),
  )
}

///|
test "functions:linker-from-name-missing-" {
  let manifest = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"PluginManifest.1\",\n    \"adapters\": [\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"read.py\",\n            \"name\": \"read\",\n            \"suffixes\": [\n                \"same\",\n                \"read\"\n            ]\n        },\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"write.py\",\n            \"name\": \"write\",\n            \"suffixes\": [\n                \"same\",\n                \"write\"\n            ]\n        }\n    ],\n    \"hook_scripts\": [\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"first.py\",\n            \"name\": \"first\"\n        },\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"second.py\",\n            \"name\": \"second\"\n        }\n    ],\n    \"hooks\": {\n        \"custom\": [\n            \"first\",\n            \"second\"\n        ],\n        \"empty\": []\n    },\n    \"media_linkers\": [\n        {\n            \"OTIO_SCHEMA\": \"MediaLinker.1\",\n            \"filepath\": \"link.py\",\n            \"name\": \"link\"\n        }\n    ],\n    \"schemadefs\": [],\n    \"version_manifests\": {}\n}",
  ).unwrap()
  assert_true(
    @plugins.media_linker_from_name(manifest, Some(""), Some("missing"))
    is Err(_),
  )
}

///|
test "functions:linked-reference-missing-" {
  let manifest = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"PluginManifest.1\",\n    \"adapters\": [\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"read.py\",\n            \"name\": \"read\",\n            \"suffixes\": [\n                \"same\",\n                \"read\"\n            ]\n        },\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"write.py\",\n            \"name\": \"write\",\n            \"suffixes\": [\n                \"same\",\n                \"write\"\n            ]\n        }\n    ],\n    \"hook_scripts\": [\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"first.py\",\n            \"name\": \"first\"\n        },\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"second.py\",\n            \"name\": \"second\"\n        }\n    ],\n    \"hooks\": {\n        \"custom\": [\n            \"first\",\n            \"second\"\n        ],\n        \"empty\": []\n    },\n    \"media_linkers\": [\n        {\n            \"OTIO_SCHEMA\": \"MediaLinker.1\",\n            \"filepath\": \"link.py\",\n            \"name\": \"link\"\n        }\n    ],\n    \"schemadefs\": [],\n    \"version_manifests\": {}\n}",
  ).unwrap()
  assert_true(
    @plugins.linked_media_reference(
      manifest,
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"Clip.2\",\n    \"metadata\": {},\n    \"name\": \"keep\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"media_references\": {\n        \"DEFAULT_MEDIA\": {\n            \"OTIO_SCHEMA\": \"MissingReference.1\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"available_range\": null,\n            \"available_image_bounds\": null\n        }\n    },\n    \"active_media_reference_key\": \"DEFAULT_MEDIA\"\n}",
      ).unwrap(),
      Some(""),
      Some("missing"),
      Json::empty_object(),
      fn(_d, _c, _a) {
        @otiojson.parse(
          "{\n    \"OTIO_SCHEMA\": \"MissingReference.1\",\n    \"metadata\": {},\n    \"name\": \"linked\",\n    \"available_range\": null,\n    \"available_image_bounds\": null\n}",
        )
      },
    )
    is Err(_),
  )
}

///|
test "functions:linker-from-name-missing-__default" {
  let manifest = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"PluginManifest.1\",\n    \"adapters\": [\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"read.py\",\n            \"name\": \"read\",\n            \"suffixes\": [\n                \"same\",\n                \"read\"\n            ]\n        },\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"write.py\",\n            \"name\": \"write\",\n            \"suffixes\": [\n                \"same\",\n                \"write\"\n            ]\n        }\n    ],\n    \"hook_scripts\": [\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"first.py\",\n            \"name\": \"first\"\n        },\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"second.py\",\n            \"name\": \"second\"\n        }\n    ],\n    \"hooks\": {\n        \"custom\": [\n            \"first\",\n            \"second\"\n        ],\n        \"empty\": []\n    },\n    \"media_linkers\": [\n        {\n            \"OTIO_SCHEMA\": \"MediaLinker.1\",\n            \"filepath\": \"link.py\",\n            \"name\": \"link\"\n        }\n    ],\n    \"schemadefs\": [],\n    \"version_manifests\": {}\n}",
  ).unwrap()
  assert_true(
    @plugins.media_linker_from_name(
      manifest,
      Some("__default"),
      Some("missing"),
    )
    is Err(_),
  )
}

///|
test "functions:linked-reference-missing-__default" {
  let manifest = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"PluginManifest.1\",\n    \"adapters\": [\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"read.py\",\n            \"name\": \"read\",\n            \"suffixes\": [\n                \"same\",\n                \"read\"\n            ]\n        },\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"write.py\",\n            \"name\": \"write\",\n            \"suffixes\": [\n                \"same\",\n                \"write\"\n            ]\n        }\n    ],\n    \"hook_scripts\": [\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"first.py\",\n            \"name\": \"first\"\n        },\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"second.py\",\n            \"name\": \"second\"\n        }\n    ],\n    \"hooks\": {\n        \"custom\": [\n            \"first\",\n            \"second\"\n        ],\n        \"empty\": []\n    },\n    \"media_linkers\": [\n        {\n            \"OTIO_SCHEMA\": \"MediaLinker.1\",\n            \"filepath\": \"link.py\",\n            \"name\": \"link\"\n        }\n    ],\n    \"schemadefs\": [],\n    \"version_manifests\": {}\n}",
  ).unwrap()
  assert_true(
    @plugins.linked_media_reference(
      manifest,
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"Clip.2\",\n    \"metadata\": {},\n    \"name\": \"keep\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"media_references\": {\n        \"DEFAULT_MEDIA\": {\n            \"OTIO_SCHEMA\": \"MissingReference.1\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"available_range\": null,\n            \"available_image_bounds\": null\n        }\n    },\n    \"active_media_reference_key\": \"DEFAULT_MEDIA\"\n}",
      ).unwrap(),
      Some("__default"),
      Some("missing"),
      Json::empty_object(),
      fn(_d, _c, _a) {
        @otiojson.parse(
          "{\n    \"OTIO_SCHEMA\": \"MissingReference.1\",\n    \"metadata\": {},\n    \"name\": \"linked\",\n    \"available_range\": null,\n    \"available_image_bounds\": null\n}",
        )
      },
    )
    is Err(_),
  )
}

///|
test "functions:linker-from-name-missing-link" {
  let manifest = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"PluginManifest.1\",\n    \"adapters\": [\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"read.py\",\n            \"name\": \"read\",\n            \"suffixes\": [\n                \"same\",\n                \"read\"\n            ]\n        },\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"write.py\",\n            \"name\": \"write\",\n            \"suffixes\": [\n                \"same\",\n                \"write\"\n            ]\n        }\n    ],\n    \"hook_scripts\": [\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"first.py\",\n            \"name\": \"first\"\n        },\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"second.py\",\n            \"name\": \"second\"\n        }\n    ],\n    \"hooks\": {\n        \"custom\": [\n            \"first\",\n            \"second\"\n        ],\n        \"empty\": []\n    },\n    \"media_linkers\": [\n        {\n            \"OTIO_SCHEMA\": \"MediaLinker.1\",\n            \"filepath\": \"link.py\",\n            \"name\": \"link\"\n        }\n    ],\n    \"schemadefs\": [],\n    \"version_manifests\": {}\n}",
  ).unwrap()
  assert_true(
    @plugins.media_linker_from_name(manifest, Some("link"), Some("missing"))
    .unwrap()
    .unwrap()
    .equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"MediaLinker.1\",\n    \"filepath\": \"link.py\",\n    \"name\": \"link\"\n}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:linked-reference-missing-link" {
  let manifest = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"PluginManifest.1\",\n    \"adapters\": [\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"read.py\",\n            \"name\": \"read\",\n            \"suffixes\": [\n                \"same\",\n                \"read\"\n            ]\n        },\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"write.py\",\n            \"name\": \"write\",\n            \"suffixes\": [\n                \"same\",\n                \"write\"\n            ]\n        }\n    ],\n    \"hook_scripts\": [\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"first.py\",\n            \"name\": \"first\"\n        },\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"second.py\",\n            \"name\": \"second\"\n        }\n    ],\n    \"hooks\": {\n        \"custom\": [\n            \"first\",\n            \"second\"\n        ],\n        \"empty\": []\n    },\n    \"media_linkers\": [\n        {\n            \"OTIO_SCHEMA\": \"MediaLinker.1\",\n            \"filepath\": \"link.py\",\n            \"name\": \"link\"\n        }\n    ],\n    \"schemadefs\": [],\n    \"version_manifests\": {}\n}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(
      @plugins.linked_media_reference(
        manifest,
        @otiojson.parse(
          "{\n    \"OTIO_SCHEMA\": \"Clip.2\",\n    \"metadata\": {},\n    \"name\": \"keep\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"media_references\": {\n        \"DEFAULT_MEDIA\": {\n            \"OTIO_SCHEMA\": \"MissingReference.1\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"available_range\": null,\n            \"available_image_bounds\": null\n        }\n    },\n    \"active_media_reference_key\": \"DEFAULT_MEDIA\"\n}",
        ).unwrap(),
        Some("link"),
        Some("missing"),
        Json::empty_object(),
        fn(_d, _c, _a) {
          @otiojson.parse(
            "{\n    \"OTIO_SCHEMA\": \"MissingReference.1\",\n    \"metadata\": {},\n    \"name\": \"linked\",\n    \"available_range\": null,\n    \"available_image_bounds\": null\n}",
          )
        },
      ).unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"MissingReference.1\",\n    \"metadata\": {},\n    \"name\": \"linked\",\n    \"available_range\": null,\n    \"available_image_bounds\": null\n}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:linker-from-name-missing-missing" {
  let manifest = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"PluginManifest.1\",\n    \"adapters\": [\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"read.py\",\n            \"name\": \"read\",\n            \"suffixes\": [\n                \"same\",\n                \"read\"\n            ]\n        },\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"write.py\",\n            \"name\": \"write\",\n            \"suffixes\": [\n                \"same\",\n                \"write\"\n            ]\n        }\n    ],\n    \"hook_scripts\": [\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"first.py\",\n            \"name\": \"first\"\n        },\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"second.py\",\n            \"name\": \"second\"\n        }\n    ],\n    \"hooks\": {\n        \"custom\": [\n            \"first\",\n            \"second\"\n        ],\n        \"empty\": []\n    },\n    \"media_linkers\": [\n        {\n            \"OTIO_SCHEMA\": \"MediaLinker.1\",\n            \"filepath\": \"link.py\",\n            \"name\": \"link\"\n        }\n    ],\n    \"schemadefs\": [],\n    \"version_manifests\": {}\n}",
  ).unwrap()
  assert_true(
    @plugins.media_linker_from_name(manifest, Some("missing"), Some("missing"))
    is Err(_),
  )
}

///|
test "functions:linked-reference-missing-missing" {
  let manifest = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"PluginManifest.1\",\n    \"adapters\": [\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"read.py\",\n            \"name\": \"read\",\n            \"suffixes\": [\n                \"same\",\n                \"read\"\n            ]\n        },\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"write.py\",\n            \"name\": \"write\",\n            \"suffixes\": [\n                \"same\",\n                \"write\"\n            ]\n        }\n    ],\n    \"hook_scripts\": [\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"first.py\",\n            \"name\": \"first\"\n        },\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"second.py\",\n            \"name\": \"second\"\n        }\n    ],\n    \"hooks\": {\n        \"custom\": [\n            \"first\",\n            \"second\"\n        ],\n        \"empty\": []\n    },\n    \"media_linkers\": [\n        {\n            \"OTIO_SCHEMA\": \"MediaLinker.1\",\n            \"filepath\": \"link.py\",\n            \"name\": \"link\"\n        }\n    ],\n    \"schemadefs\": [],\n    \"version_manifests\": {}\n}",
  ).unwrap()
  assert_true(
    @plugins.linked_media_reference(
      manifest,
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"Clip.2\",\n    \"metadata\": {},\n    \"name\": \"keep\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"media_references\": {\n        \"DEFAULT_MEDIA\": {\n            \"OTIO_SCHEMA\": \"MissingReference.1\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"available_range\": null,\n            \"available_image_bounds\": null\n        }\n    },\n    \"active_media_reference_key\": \"DEFAULT_MEDIA\"\n}",
      ).unwrap(),
      Some("missing"),
      Some("missing"),
      Json::empty_object(),
      fn(_d, _c, _a) {
        @otiojson.parse(
          "{\n    \"OTIO_SCHEMA\": \"MissingReference.1\",\n    \"metadata\": {},\n    \"name\": \"linked\",\n    \"available_range\": null,\n    \"available_image_bounds\": null\n}",
        )
      },
    )
    is Err(_),
  )
}

///|
test "functions:all-plugin-info-False" {
  let manifest = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"PluginManifest.1\",\n    \"adapters\": [\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"read.py\",\n            \"name\": \"read\",\n            \"suffixes\": [\n                \"same\",\n                \"read\"\n            ]\n        },\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"write.py\",\n            \"name\": \"write\",\n            \"suffixes\": [\n                \"same\",\n                \"write\"\n            ]\n        }\n    ],\n    \"hook_scripts\": [\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"first.py\",\n            \"name\": \"first\"\n        },\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"second.py\",\n            \"name\": \"second\"\n        }\n    ],\n    \"hooks\": {\n        \"custom\": [\n            \"first\",\n            \"second\"\n        ],\n        \"empty\": []\n    },\n    \"media_linkers\": [\n        {\n            \"OTIO_SCHEMA\": \"MediaLinker.1\",\n            \"filepath\": \"link.py\",\n            \"name\": \"link\"\n        }\n    ],\n    \"schemadefs\": [],\n    \"version_manifests\": {}\n}",
  ).unwrap()
  let fail = false
  assert_true(
    @otiojson.equivalent(
      @plugins.plugin_info_map(
        { manifest, source_files: ["/plugins/manifest.json"], },
        fn(d) {
          let name = d.get("name").unwrap()
          if fail && name == Json::string("second") {
            Err("fixture")
          } else {
            Ok(Json::object({ "name": name }))
          }
        },
      ).unwrap(),
      @otiojson.parse(
        "{\"adapters\":{\"read\":{\"name\":\"read\"},\"write\":{\"name\":\"write\"}},\"hook_scripts\":{\"first\":{\"name\":\"first\"},\"second\":{\"name\":\"second\"}},\"hooks\":{\"custom\":[\"first\",\"second\"],\"empty\":[]},\"manifests\":[\"/plugins/manifest.json\"],\"media_linkers\":{\"link\":{\"name\":\"link\"}},\"schemadefs\":{},\"version_manifests\":{}}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:all-plugin-info-True" {
  let manifest = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"PluginManifest.1\",\n    \"adapters\": [\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"read.py\",\n            \"name\": \"read\",\n            \"suffixes\": [\n                \"same\",\n                \"read\"\n            ]\n        },\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"write.py\",\n            \"name\": \"write\",\n            \"suffixes\": [\n                \"same\",\n                \"write\"\n            ]\n        }\n    ],\n    \"hook_scripts\": [\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"first.py\",\n            \"name\": \"first\"\n        },\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"second.py\",\n            \"name\": \"second\"\n        }\n    ],\n    \"hooks\": {\n        \"custom\": [\n            \"first\",\n            \"second\"\n        ],\n        \"empty\": []\n    },\n    \"media_linkers\": [\n        {\n            \"OTIO_SCHEMA\": \"MediaLinker.1\",\n            \"filepath\": \"link.py\",\n            \"name\": \"link\"\n        }\n    ],\n    \"schemadefs\": [],\n    \"version_manifests\": {}\n}",
  ).unwrap()
  let fail = true
  assert_true(
    @otiojson.equivalent(
      @plugins.plugin_info_map(
        { manifest, source_files: ["/plugins/manifest.json"], },
        fn(d) {
          let name = d.get("name").unwrap()
          if fail && name == Json::string("second") {
            Err("fixture")
          } else {
            Ok(Json::object({ "name": name }))
          }
        },
      ).unwrap(),
      @otiojson.parse(
        "{\"adapters\":{\"read\":{\"name\":\"read\"},\"write\":{\"name\":\"write\"}},\"hook_scripts\":{\"first\":{\"name\":\"first\"},\"second\":\"ERROR: could not compute plugin_info_map because: fixture\"},\"hooks\":{\"custom\":[\"first\",\"second\"],\"empty\":[]},\"manifests\":[\"/plugins/manifest.json\"],\"media_linkers\":{\"link\":{\"name\":\"link\"}},\"schemadefs\":{},\"version_manifests\":{}}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:plugin-info-version-family" {
  let manifest = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"PluginManifest.1\",\n    \"adapters\": [\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"read.py\",\n            \"name\": \"read\",\n            \"suffixes\": [\n                \"same\",\n                \"read\"\n            ]\n        },\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"write.py\",\n            \"name\": \"write\",\n            \"suffixes\": [\n                \"same\",\n                \"write\"\n            ]\n        }\n    ],\n    \"hook_scripts\": [\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"first.py\",\n            \"name\": \"first\"\n        },\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"second.py\",\n            \"name\": \"second\"\n        }\n    ],\n    \"hooks\": {\n        \"custom\": [\n            \"first\",\n            \"second\"\n        ],\n        \"empty\": []\n    },\n    \"media_linkers\": [\n        {\n            \"OTIO_SCHEMA\": \"MediaLinker.1\",\n            \"filepath\": \"link.py\",\n            \"name\": \"link\"\n        }\n    ],\n    \"schemadefs\": [],\n    \"version_manifests\": {\n        \"family\": {\n            \"v1\": {\n                \"Clip\": 1\n            }\n        }\n    }\n}",
  ).unwrap()
  assert_true(
    @plugins.plugin_info_map({ manifest, source_files: [], }, fn(_d) {
      Ok(Json::empty_object())
    })
    is Err(_),
  )
}

///|
test "functions:active-manifest-False" {
  let manifest = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"PluginManifest.1\",\n    \"adapters\": [\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"read.py\",\n            \"name\": \"read\",\n            \"suffixes\": [\n                \"same\",\n                \"read\"\n            ]\n        },\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"write.py\",\n            \"name\": \"write\",\n            \"suffixes\": [\n                \"same\",\n                \"write\"\n            ]\n        }\n    ],\n    \"hook_scripts\": [\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"first.py\",\n            \"name\": \"first\"\n        },\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"second.py\",\n            \"name\": \"second\"\n        }\n    ],\n    \"hooks\": {\n        \"custom\": [\n            \"first\",\n            \"second\"\n        ],\n        \"empty\": []\n    },\n    \"media_linkers\": [\n        {\n            \"OTIO_SCHEMA\": \"MediaLinker.1\",\n            \"filepath\": \"link.py\",\n            \"name\": \"link\"\n        }\n    ],\n    \"schemadefs\": [],\n    \"version_manifests\": {}\n}",
  ).unwrap()
  let calls : Array[String] = []
  let fail = false
  let context = @plugins.ManifestContext::new(fn() {
    calls.push("load")
    if fail && calls.length() == 2 {
      Err("fixture")
    } else {
      Ok({ manifest, source_files: [], })
    }
  })
  assert_eq(context.active(force_reload=false) is Ok(_), true)
  assert_eq(context.active(force_reload=false) is Ok(_), true)
  assert_eq(context.active(force_reload=true) is Ok(_), true)
  assert_eq(context.active(force_reload=false) is Ok(_), true)
  assert_eq(calls, ["load", "load"])
}

///|
test "functions:active-manifest-True" {
  let manifest = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"PluginManifest.1\",\n    \"adapters\": [\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"read.py\",\n            \"name\": \"read\",\n            \"suffixes\": [\n                \"same\",\n                \"read\"\n            ]\n        },\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"write.py\",\n            \"name\": \"write\",\n            \"suffixes\": [\n                \"same\",\n                \"write\"\n            ]\n        }\n    ],\n    \"hook_scripts\": [\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"first.py\",\n            \"name\": \"first\"\n        },\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"second.py\",\n            \"name\": \"second\"\n        }\n    ],\n    \"hooks\": {\n        \"custom\": [\n            \"first\",\n            \"second\"\n        ],\n        \"empty\": []\n    },\n    \"media_linkers\": [\n        {\n            \"OTIO_SCHEMA\": \"MediaLinker.1\",\n            \"filepath\": \"link.py\",\n            \"name\": \"link\"\n        }\n    ],\n    \"schemadefs\": [],\n    \"version_manifests\": {}\n}",
  ).unwrap()
  let calls : Array[String] = []
  let fail = true
  let context = @plugins.ManifestContext::new(fn() {
    calls.push("load")
    if fail && calls.length() == 2 {
      Err("fixture")
    } else {
      Ok({ manifest, source_files: [], })
    }
  })
  assert_eq(context.active(force_reload=false) is Ok(_), true)
  assert_eq(context.active(force_reload=false) is Ok(_), true)
  assert_eq(context.active(force_reload=true) is Ok(_), false)
  assert_eq(context.active(force_reload=false) is Ok(_), true)
  assert_eq(calls, ["load", "load"])
}

///|
test "functions:manifest-file-0" {
  let result = @plugins.manifest_from_file("/plugins/manifest.json", fn(_path) {
    Ok(
      "{\n    \"OTIO_SCHEMA\": \"PluginManifest.1\",\n    \"adapters\": [\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"read.py\",\n            \"name\": \"read\",\n            \"suffixes\": [\n                \"same\",\n                \"read\"\n            ]\n        },\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"write.py\",\n            \"name\": \"write\",\n            \"suffixes\": [\n                \"same\",\n                \"write\"\n            ]\n        }\n    ],\n    \"hook_scripts\": [\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"first.py\",\n            \"name\": \"first\"\n        },\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"second.py\",\n            \"name\": \"second\"\n        }\n    ],\n    \"hooks\": {\n        \"custom\": [\n            \"first\",\n            \"second\"\n        ],\n        \"empty\": []\n    },\n    \"media_linkers\": [\n        {\n            \"OTIO_SCHEMA\": \"MediaLinker.1\",\n            \"filepath\": \"link.py\",\n            \"name\": \"link\"\n        }\n    ],\n    \"schemadefs\": [],\n    \"version_manifests\": {}\n}",
    )
  })
  assert_eq(result is Ok(_), true)
  assert_true(
    result.unwrap().manifest.equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"PluginManifest.1\",\n    \"adapters\": [\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"read.py\",\n            \"name\": \"read\",\n            \"suffixes\": [\n                \"same\",\n                \"read\"\n            ]\n        },\n        {\n            \"OTIO_SCHEMA\": \"Adapter.1\",\n            \"filepath\": \"write.py\",\n            \"name\": \"write\",\n            \"suffixes\": [\n                \"same\",\n                \"write\"\n            ]\n        }\n    ],\n    \"hook_scripts\": [\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"first.py\",\n            \"name\": \"first\"\n        },\n        {\n            \"OTIO_SCHEMA\": \"HookScript.1\",\n            \"filepath\": \"second.py\",\n            \"name\": \"second\"\n        }\n    ],\n    \"hooks\": {\n        \"custom\": [\n            \"first\",\n            \"second\"\n        ],\n        \"empty\": []\n    },\n    \"media_linkers\": [\n        {\n            \"OTIO_SCHEMA\": \"MediaLinker.1\",\n            \"filepath\": \"link.py\",\n            \"name\": \"link\"\n        }\n    ],\n    \"schemadefs\": [],\n    \"version_manifests\": {}\n}",
      ).unwrap(),
    ),
  )
  assert_eq(result.unwrap().source_files, ["/plugins/manifest.json"])
}

///|
test "functions:manifest-file-1" {
  let result = @plugins.manifest_from_file("/plugins/manifest.json", fn(_path) {
    Ok(
      "{\n    \"OTIO_SCHEMA\": \"Clip.2\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"media_references\": {\n        \"DEFAULT_MEDIA\": {\n            \"OTIO_SCHEMA\": \"MissingReference.1\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"available_range\": null,\n            \"available_image_bounds\": null\n        }\n    },\n    \"active_media_reference_key\": \"DEFAULT_MEDIA\"\n}",
    )
  })
  assert_eq(result is Ok(_), false)
}

///|
test "functions:manifest-file-2" {
  let result = @plugins.manifest_from_file("/plugins/manifest.json", fn(_path) {
    Ok("{")
  })
  assert_eq(result is Ok(_), false)
}

///|
test "functions:adapter-shortcut-read_from_string-Timeline" {
  assert_true(
    @otiojson.equivalent(
      @plugins.Registry::new()
      .read(
        "{\n    \"OTIO_SCHEMA\": \"Timeline.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"global_start_time\": null,\n    \"tracks\": {\n        \"OTIO_SCHEMA\": \"Stack.1\",\n        \"metadata\": {},\n        \"name\": \"tracks\",\n        \"source_range\": null,\n        \"effects\": [],\n        \"markers\": [],\n        \"enabled\": true,\n        \"color\": null,\n        \"children\": []\n    }\n}",
      )
      .unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"Timeline.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"global_start_time\": null,\n    \"tracks\": {\n        \"OTIO_SCHEMA\": \"Stack.1\",\n        \"metadata\": {},\n        \"name\": \"tracks\",\n        \"source_range\": null,\n        \"effects\": [],\n        \"markers\": [],\n        \"enabled\": true,\n        \"color\": null,\n        \"children\": []\n    }\n}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:adapter-shortcut-read_from_string-Clip" {
  assert_true(
    @otiojson.equivalent(
      @plugins.Registry::new()
      .read(
        "{\n    \"OTIO_SCHEMA\": \"Clip.2\",\n    \"metadata\": {},\n    \"name\": \"keep\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"media_references\": {\n        \"DEFAULT_MEDIA\": {\n            \"OTIO_SCHEMA\": \"MissingReference.1\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"available_range\": null,\n            \"available_image_bounds\": null\n        }\n    },\n    \"active_media_reference_key\": \"DEFAULT_MEDIA\"\n}",
      )
      .unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"Clip.2\",\n    \"metadata\": {},\n    \"name\": \"keep\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"media_references\": {\n        \"DEFAULT_MEDIA\": {\n            \"OTIO_SCHEMA\": \"MissingReference.1\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"available_range\": null,\n            \"available_image_bounds\": null\n        }\n    },\n    \"active_media_reference_key\": \"DEFAULT_MEDIA\"\n}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:adapter-shortcut-read_from_string-Marker" {
  assert_true(
    @otiojson.equivalent(
      @plugins.Registry::new()
      .read(
        "{\n    \"OTIO_SCHEMA\": \"Marker.2\",\n    \"metadata\": {},\n    \"name\": \"keep\",\n    \"color\": \"RED\",\n    \"marked_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 1.0,\n            \"value\": 0.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 1.0,\n            \"value\": 0.0\n        }\n    },\n    \"comment\": \"\"\n}",
      )
      .unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"Marker.2\",\n    \"metadata\": {},\n    \"name\": \"keep\",\n    \"color\": \"RED\",\n    \"marked_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 1.0,\n            \"value\": 0.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 1.0,\n            \"value\": 0.0\n        }\n    },\n    \"comment\": \"\"\n}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:adapter-shortcut-write_to_string-Timeline" {
  assert_true(
    @otiojson.equivalent(
      @otiojson.parse(
        @plugins.Registry::new()
        .write(
          @otiojson.parse(
            "{\n    \"OTIO_SCHEMA\": \"Timeline.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"global_start_time\": null,\n    \"tracks\": {\n        \"OTIO_SCHEMA\": \"Stack.1\",\n        \"metadata\": {},\n        \"name\": \"tracks\",\n        \"source_range\": null,\n        \"effects\": [],\n        \"markers\": [],\n        \"enabled\": true,\n        \"color\": null,\n        \"children\": []\n    }\n}",
          ).unwrap(),
        )
        .unwrap(),
      ).unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"Timeline.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"global_start_time\": null,\n    \"tracks\": {\n        \"OTIO_SCHEMA\": \"Stack.1\",\n        \"metadata\": {},\n        \"name\": \"tracks\",\n        \"source_range\": null,\n        \"effects\": [],\n        \"markers\": [],\n        \"enabled\": true,\n        \"color\": null,\n        \"children\": []\n    }\n}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:adapter-shortcut-write_to_string-Clip" {
  assert_true(
    @otiojson.equivalent(
      @otiojson.parse(
        @plugins.Registry::new()
        .write(
          @otiojson.parse(
            "{\n    \"OTIO_SCHEMA\": \"Clip.2\",\n    \"metadata\": {},\n    \"name\": \"keep\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"media_references\": {\n        \"DEFAULT_MEDIA\": {\n            \"OTIO_SCHEMA\": \"MissingReference.1\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"available_range\": null,\n            \"available_image_bounds\": null\n        }\n    },\n    \"active_media_reference_key\": \"DEFAULT_MEDIA\"\n}",
          ).unwrap(),
        )
        .unwrap(),
      ).unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"Clip.2\",\n    \"metadata\": {},\n    \"name\": \"keep\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"media_references\": {\n        \"DEFAULT_MEDIA\": {\n            \"OTIO_SCHEMA\": \"MissingReference.1\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"available_range\": null,\n            \"available_image_bounds\": null\n        }\n    },\n    \"active_media_reference_key\": \"DEFAULT_MEDIA\"\n}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:adapter-shortcut-write_to_string-Marker" {
  assert_true(
    @otiojson.equivalent(
      @otiojson.parse(
        @plugins.Registry::new()
        .write(
          @otiojson.parse(
            "{\n    \"OTIO_SCHEMA\": \"Marker.2\",\n    \"metadata\": {},\n    \"name\": \"keep\",\n    \"color\": \"RED\",\n    \"marked_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 1.0,\n            \"value\": 0.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 1.0,\n            \"value\": 0.0\n        }\n    },\n    \"comment\": \"\"\n}",
          ).unwrap(),
        )
        .unwrap(),
      ).unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"Marker.2\",\n    \"metadata\": {},\n    \"name\": \"keep\",\n    \"color\": \"RED\",\n    \"marked_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 1.0,\n            \"value\": 0.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 1.0,\n            \"value\": 0.0\n        }\n    },\n    \"comment\": \"\"\n}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:adapter-shortcut-read-{" {
  assert_true(@plugins.Registry::new().read("{") is Err(_))
}

///|
test "functions:adapter-shortcut-read-{\"OTIO_SCHEMA\":\"Clip.2\"}" {
  assert_true(
    @plugins.Registry::new().read("{\"OTIO_SCHEMA\":\"Clip.2\"}") is Err(_),
  )
}

///|
test "functions:type_version_map" {
  assert_true(
    @otiojson.equivalent(
      @core_api.type_version_map(),
      @otiojson.parse(
        "{\"MissingReference\":1,\"Adapter\":1,\"Effect\":1,\"Composable\":1,\"FreezeFrame\":1,\"Clip\":2,\"Composition\":1,\"Gap\":1,\"ExternalReference\":1,\"GeneratorReference\":1,\"HookScript\":1,\"ImageSequenceReference\":1,\"Item\":1,\"PluginManifest\":1,\"LinearTimeWarp\":1,\"Marker\":2,\"Track\":1,\"MediaLinker\":1,\"SerializableObjectWithMetadata\":1,\"MediaReference\":1,\"SchemaDef\":1,\"Transition\":1,\"SerializableCollection\":1,\"SerializableObject\":1,\"Stack\":1,\"Test\":1,\"TimeEffect\":1,\"Timeline\":1,\"UnknownSchema\":1}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:release_to_schema_version_map" {
  assert_true(
    @otiojson.equivalent(
      @core_api.release_to_schema_version_map(),
      @otiojson.parse(
        "{\"0.14.0\":{\"Effect\":1,\"Adapter\":1,\"MissingReference\":1,\"Composable\":1,\"FreezeFrame\":1,\"Clip\":1,\"Composition\":1,\"Gap\":1,\"ExternalReference\":1,\"GeneratorReference\":1,\"HookScript\":1,\"ImageSequenceReference\":1,\"Item\":1,\"LinearTimeWarp\":1,\"PluginManifest\":1,\"Marker\":2,\"MediaLinker\":1,\"Track\":1,\"MediaReference\":1,\"SerializableObjectWithMetadata\":1,\"SchemaDef\":1,\"SerializableCollection\":1,\"Transition\":1,\"SerializableObject\":1,\"Stack\":1,\"TimeEffect\":1,\"Timeline\":1,\"UnknownSchema\":1},\"0.15.0\":{\"Effect\":1,\"Adapter\":1,\"MissingReference\":1,\"Composable\":1,\"FreezeFrame\":1,\"Clip\":2,\"Composition\":1,\"Gap\":1,\"ExternalReference\":1,\"GeneratorReference\":1,\"HookScript\":1,\"ImageSequenceReference\":1,\"Item\":1,\"LinearTimeWarp\":1,\"PluginManifest\":1,\"Marker\":2,\"MediaLinker\":1,\"Track\":1,\"MediaReference\":1,\"SerializableObjectWithMetadata\":1,\"SchemaDef\":1,\"SerializableCollection\":1,\"Transition\":1,\"SerializableObject\":1,\"Stack\":1,\"Test\":1,\"TimeEffect\":1,\"Timeline\":1,\"UnknownSchema\":1},\"0.18.1\":{\"Effect\":1,\"Adapter\":1,\"MissingReference\":1,\"Composable\":1,\"FreezeFrame\":1,\"Clip\":2,\"Composition\":1,\"Gap\":1,\"ExternalReference\":1,\"GeneratorReference\":1,\"HookScript\":1,\"ImageSequenceReference\":1,\"Item\":1,\"LinearTimeWarp\":1,\"PluginManifest\":1,\"Marker\":2,\"MediaLinker\":1,\"Track\":1,\"MediaReference\":1,\"SerializableObjectWithMetadata\":1,\"SchemaDef\":1,\"SerializableCollection\":1,\"Transition\":1,\"SerializableObject\":1,\"Stack\":1,\"Test\":1,\"TimeEffect\":1,\"Timeline\":1,\"UnknownSchema\":1},\"0.16.0\":{\"Effect\":1,\"Adapter\":1,\"MissingReference\":1,\"Composable\":1,\"FreezeFrame\":1,\"Clip\":2,\"Composition\":1,\"Gap\":1,\"ExternalReference\":1,\"GeneratorReference\":1,\"HookScript\":1,\"ImageSequenceReference\":1,\"Item\":1,\"LinearTimeWarp\":1,\"PluginManifest\":1,\"Marker\":2,\"MediaLinker\":1,\"Track\":1,\"MediaReference\":1,\"SerializableObjectWithMetadata\":1,\"SchemaDef\":1,\"SerializableCollection\":1,\"Transition\":1,\"SerializableObject\":1,\"Stack\":1,\"Test\":1,\"TimeEffect\":1,\"Timeline\":1,\"UnknownSchema\":1},\"0.17.0\":{\"Effect\":1,\"Adapter\":1,\"MissingReference\":1,\"Composable\":1,\"FreezeFrame\":1,\"Clip\":2,\"Composition\":1,\"Gap\":1,\"ExternalReference\":1,\"GeneratorReference\":1,\"HookScript\":1,\"ImageSequenceReference\":1,\"Item\":1,\"LinearTimeWarp\":1,\"PluginManifest\":1,\"Marker\":2,\"MediaLinker\":1,\"Track\":1,\"MediaReference\":1,\"SerializableObjectWithMetadata\":1,\"SchemaDef\":1,\"SerializableCollection\":1,\"Transition\":1,\"SerializableObject\":1,\"Stack\":1,\"Test\":1,\"TimeEffect\":1,\"Timeline\":1,\"UnknownSchema\":1},\"0.18.0\":{\"Effect\":1,\"Adapter\":1,\"MissingReference\":1,\"Composable\":1,\"FreezeFrame\":1,\"Clip\":2,\"Composition\":1,\"Gap\":1,\"ExternalReference\":1,\"GeneratorReference\":1,\"HookScript\":1,\"ImageSequenceReference\":1,\"Item\":1,\"LinearTimeWarp\":1,\"PluginManifest\":1,\"Marker\":2,\"MediaLinker\":1,\"Track\":1,\"MediaReference\":1,\"SerializableObjectWithMetadata\":1,\"SchemaDef\":1,\"SerializableCollection\":1,\"Transition\":1,\"SerializableObject\":1,\"Stack\":1,\"Test\":1,\"TimeEffect\":1,\"Timeline\":1,\"UnknownSchema\":1}}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:core-file-read-none" {
  assert_true(
    @otiojson.equivalent(
      @core_api.deserialize_json_from_file("source.otio", fn(_path) {
        Ok(
          "{\n    \"OTIO_SCHEMA\": \"Clip.2\",\n    \"metadata\": {},\n    \"name\": \"keep\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"media_references\": {\n        \"DEFAULT_MEDIA\": {\n            \"OTIO_SCHEMA\": \"MissingReference.1\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"available_range\": null,\n            \"available_image_bounds\": null\n        }\n    },\n    \"active_media_reference_key\": \"DEFAULT_MEDIA\"\n}",
        )
      }).unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"Clip.2\",\n    \"metadata\": {},\n    \"name\": \"keep\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"media_references\": {\n        \"DEFAULT_MEDIA\": {\n            \"OTIO_SCHEMA\": \"MissingReference.1\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"available_range\": null,\n            \"available_image_bounds\": null\n        }\n    },\n    \"active_media_reference_key\": \"DEFAULT_MEDIA\"\n}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:core-file-read-io" {
  assert_true(
    @core_api.deserialize_json_from_file("source.otio", fn(_path) {
      Err("file_error")
    })
    is Err(_),
  )
}

///|
test "functions:core-file-read-malformed" {
  assert_true(
    @core_api.deserialize_json_from_file("source.otio", fn(_path) { Ok("{") })
    is Err(_),
  )
}

///|
test "functions:core-file-write-False" {
  let writes : Array[String] = []
  let fail = false
  let result = @core_api.serialize_json_to_file(
    @otiojson.parse(
      "{\n    \"OTIO_SCHEMA\": \"Clip.2\",\n    \"metadata\": {},\n    \"name\": \"keep\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"media_references\": {\n        \"DEFAULT_MEDIA\": {\n            \"OTIO_SCHEMA\": \"MissingReference.1\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"available_range\": null,\n            \"available_image_bounds\": null\n        }\n    },\n    \"active_media_reference_key\": \"DEFAULT_MEDIA\"\n}",
    ).unwrap(),
    "output.otio",
    fn(_path, text) {
      if fail {
        Err("file_error")
      } else {
        writes.push(text)
        Ok(())
      }
    },
  )
  assert_eq(result is Ok(_), true)
  assert_eq(writes.length(), 1)
  assert_eq(result.unwrap(), true)
  assert_true(
    @otiojson.equivalent(
      @otiojson.parse(writes[0]).unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"Clip.2\",\n    \"metadata\": {},\n    \"name\": \"keep\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"media_references\": {\n        \"DEFAULT_MEDIA\": {\n            \"OTIO_SCHEMA\": \"MissingReference.1\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"available_range\": null,\n            \"available_image_bounds\": null\n        }\n    },\n    \"active_media_reference_key\": \"DEFAULT_MEDIA\"\n}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:core-file-write-True" {
  let writes : Array[String] = []
  let fail = true
  let result = @core_api.serialize_json_to_file(
    @otiojson.parse(
      "{\n    \"OTIO_SCHEMA\": \"Clip.2\",\n    \"metadata\": {},\n    \"name\": \"keep\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"media_references\": {\n        \"DEFAULT_MEDIA\": {\n            \"OTIO_SCHEMA\": \"MissingReference.1\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"available_range\": null,\n            \"available_image_bounds\": null\n        }\n    },\n    \"active_media_reference_key\": \"DEFAULT_MEDIA\"\n}",
    ).unwrap(),
    "output.otio",
    fn(_path, text) {
      if fail {
        Err("file_error")
      } else {
        writes.push(text)
        Ok(())
      }
    },
  )
  assert_eq(result is Ok(_), false)
  assert_eq(writes.length(), 0)
}

///|
test "functions:core-json-Adapter" {
  let value = @core_api.deserialize_json_from_string(
    "{\n    \"OTIO_SCHEMA\": \"Adapter.1\",\n    \"filepath\": null,\n    \"name\": null,\n    \"suffixes\": []\n}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(
      @otiojson.parse(@core_api.serialize_json_to_string(value).unwrap()).unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"Adapter.1\",\n    \"filepath\": null,\n    \"name\": null,\n    \"suffixes\": []\n}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:core-json-Clip" {
  let value = @core_api.deserialize_json_from_string(
    "{\n    \"OTIO_SCHEMA\": \"Clip.2\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"media_references\": {\n        \"DEFAULT_MEDIA\": {\n            \"OTIO_SCHEMA\": \"MissingReference.1\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"available_range\": null,\n            \"available_image_bounds\": null\n        }\n    },\n    \"active_media_reference_key\": \"DEFAULT_MEDIA\"\n}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(
      @otiojson.parse(@core_api.serialize_json_to_string(value).unwrap()).unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"Clip.2\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"media_references\": {\n        \"DEFAULT_MEDIA\": {\n            \"OTIO_SCHEMA\": \"MissingReference.1\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"available_range\": null,\n            \"available_image_bounds\": null\n        }\n    },\n    \"active_media_reference_key\": \"DEFAULT_MEDIA\"\n}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:core-json-Composable" {
  let value = @core_api.deserialize_json_from_string(
    "{\n    \"OTIO_SCHEMA\": \"Composable.1\",\n    \"metadata\": {},\n    \"name\": \"\"\n}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(
      @otiojson.parse(@core_api.serialize_json_to_string(value).unwrap()).unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"Composable.1\",\n    \"metadata\": {},\n    \"name\": \"\"\n}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:core-json-Composition" {
  let value = @core_api.deserialize_json_from_string(
    "{\n    \"OTIO_SCHEMA\": \"Composition.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"children\": []\n}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(
      @otiojson.parse(@core_api.serialize_json_to_string(value).unwrap()).unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"Composition.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"children\": []\n}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:core-json-Effect" {
  let value = @core_api.deserialize_json_from_string(
    "{\n    \"OTIO_SCHEMA\": \"Effect.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"effect_name\": \"\",\n    \"enabled\": true\n}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(
      @otiojson.parse(@core_api.serialize_json_to_string(value).unwrap()).unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"Effect.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"effect_name\": \"\",\n    \"enabled\": true\n}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:core-json-ExternalReference" {
  let value = @core_api.deserialize_json_from_string(
    "{\n    \"OTIO_SCHEMA\": \"ExternalReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": null,\n    \"available_image_bounds\": null,\n    \"target_url\": \"\"\n}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(
      @otiojson.parse(@core_api.serialize_json_to_string(value).unwrap()).unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"ExternalReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": null,\n    \"available_image_bounds\": null,\n    \"target_url\": \"\"\n}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:core-json-FreezeFrame" {
  let value = @core_api.deserialize_json_from_string(
    "{\n    \"OTIO_SCHEMA\": \"FreezeFrame.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"effect_name\": \"FreezeFrame\",\n    \"enabled\": true,\n    \"time_scalar\": 0.0\n}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(
      @otiojson.parse(@core_api.serialize_json_to_string(value).unwrap()).unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"FreezeFrame.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"effect_name\": \"FreezeFrame\",\n    \"enabled\": true,\n    \"time_scalar\": 0.0\n}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:core-json-Gap" {
  let value = @core_api.deserialize_json_from_string(
    "{\n    \"OTIO_SCHEMA\": \"Gap.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"source_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 1.0,\n            \"value\": 0.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 1.0,\n            \"value\": 0.0\n        }\n    },\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null\n}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(
      @otiojson.parse(@core_api.serialize_json_to_string(value).unwrap()).unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"Gap.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"source_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 1.0,\n            \"value\": 0.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 1.0,\n            \"value\": 0.0\n        }\n    },\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null\n}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:core-json-GeneratorReference" {
  let value = @core_api.deserialize_json_from_string(
    "{\n    \"OTIO_SCHEMA\": \"GeneratorReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": null,\n    \"available_image_bounds\": null,\n    \"generator_kind\": \"\",\n    \"parameters\": {}\n}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(
      @otiojson.parse(@core_api.serialize_json_to_string(value).unwrap()).unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"GeneratorReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": null,\n    \"available_image_bounds\": null,\n    \"generator_kind\": \"\",\n    \"parameters\": {}\n}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:core-json-HookScript" {
  let value = @core_api.deserialize_json_from_string(
    "{\n    \"OTIO_SCHEMA\": \"HookScript.1\",\n    \"filepath\": null,\n    \"name\": null\n}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(
      @otiojson.parse(@core_api.serialize_json_to_string(value).unwrap()).unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"HookScript.1\",\n    \"filepath\": null,\n    \"name\": null\n}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:core-json-ImageSequenceReference" {
  let value = @core_api.deserialize_json_from_string(
    "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": null,\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"\",\n    \"name_prefix\": \"\",\n    \"name_suffix\": \"\",\n    \"start_frame\": 1,\n    \"frame_step\": 1,\n    \"rate\": 1.0,\n    \"frame_zero_padding\": 0,\n    \"missing_frame_policy\": \"error\"\n}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(
      @otiojson.parse(@core_api.serialize_json_to_string(value).unwrap()).unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": null,\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"\",\n    \"name_prefix\": \"\",\n    \"name_suffix\": \"\",\n    \"start_frame\": 1,\n    \"frame_step\": 1,\n    \"rate\": 1.0,\n    \"frame_zero_padding\": 0,\n    \"missing_frame_policy\": \"error\"\n}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:core-json-Item" {
  let value = @core_api.deserialize_json_from_string(
    "{\n    \"OTIO_SCHEMA\": \"Item.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null\n}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(
      @otiojson.parse(@core_api.serialize_json_to_string(value).unwrap()).unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"Item.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null\n}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:core-json-LinearTimeWarp" {
  let value = @core_api.deserialize_json_from_string(
    "{\n    \"OTIO_SCHEMA\": \"LinearTimeWarp.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"effect_name\": \"LinearTimeWarp\",\n    \"enabled\": true,\n    \"time_scalar\": 1.0\n}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(
      @otiojson.parse(@core_api.serialize_json_to_string(value).unwrap()).unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"LinearTimeWarp.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"effect_name\": \"LinearTimeWarp\",\n    \"enabled\": true,\n    \"time_scalar\": 1.0\n}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:core-json-Marker" {
  let value = @core_api.deserialize_json_from_string(
    "{\n    \"OTIO_SCHEMA\": \"Marker.2\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"color\": \"RED\",\n    \"marked_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 1.0,\n            \"value\": 0.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 1.0,\n            \"value\": 0.0\n        }\n    },\n    \"comment\": \"\"\n}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(
      @otiojson.parse(@core_api.serialize_json_to_string(value).unwrap()).unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"Marker.2\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"color\": \"RED\",\n    \"marked_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 1.0,\n            \"value\": 0.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 1.0,\n            \"value\": 0.0\n        }\n    },\n    \"comment\": \"\"\n}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:core-json-MediaLinker" {
  let value = @core_api.deserialize_json_from_string(
    "{\n    \"OTIO_SCHEMA\": \"MediaLinker.1\",\n    \"filepath\": null,\n    \"name\": null\n}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(
      @otiojson.parse(@core_api.serialize_json_to_string(value).unwrap()).unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"MediaLinker.1\",\n    \"filepath\": null,\n    \"name\": null\n}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:core-json-MediaReference" {
  let value = @core_api.deserialize_json_from_string(
    "{\n    \"OTIO_SCHEMA\": \"MediaReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": null,\n    \"available_image_bounds\": null\n}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(
      @otiojson.parse(@core_api.serialize_json_to_string(value).unwrap()).unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"MediaReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": null,\n    \"available_image_bounds\": null\n}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:core-json-MissingReference" {
  let value = @core_api.deserialize_json_from_string(
    "{\n    \"OTIO_SCHEMA\": \"MissingReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": null,\n    \"available_image_bounds\": null\n}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(
      @otiojson.parse(@core_api.serialize_json_to_string(value).unwrap()).unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"MissingReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": null,\n    \"available_image_bounds\": null\n}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:core-json-SchemaDef" {
  let value = @core_api.deserialize_json_from_string(
    "{\n    \"OTIO_SCHEMA\": \"SchemaDef.1\",\n    \"filepath\": null,\n    \"name\": null\n}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(
      @otiojson.parse(@core_api.serialize_json_to_string(value).unwrap()).unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"SchemaDef.1\",\n    \"filepath\": null,\n    \"name\": null\n}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:core-json-SerializableCollection" {
  let value = @core_api.deserialize_json_from_string(
    "{\n    \"OTIO_SCHEMA\": \"SerializableCollection.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"children\": []\n}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(
      @otiojson.parse(@core_api.serialize_json_to_string(value).unwrap()).unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"SerializableCollection.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"children\": []\n}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:core-json-SerializableObject" {
  let value = @core_api.deserialize_json_from_string(
    "{\n    \"OTIO_SCHEMA\": \"SerializableObject.1\"\n}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(
      @otiojson.parse(@core_api.serialize_json_to_string(value).unwrap()).unwrap(),
      @otiojson.parse("{\n    \"OTIO_SCHEMA\": \"SerializableObject.1\"\n}").unwrap(),
    ),
  )
}

///|
test "functions:core-json-SerializableObjectWithMetadata" {
  let value = @core_api.deserialize_json_from_string(
    "{\n    \"OTIO_SCHEMA\": \"SerializableObjectWithMetadata.1\",\n    \"metadata\": {},\n    \"name\": \"\"\n}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(
      @otiojson.parse(@core_api.serialize_json_to_string(value).unwrap()).unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"SerializableObjectWithMetadata.1\",\n    \"metadata\": {},\n    \"name\": \"\"\n}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:core-json-Stack" {
  let value = @core_api.deserialize_json_from_string(
    "{\n    \"OTIO_SCHEMA\": \"Stack.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"children\": []\n}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(
      @otiojson.parse(@core_api.serialize_json_to_string(value).unwrap()).unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"Stack.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"children\": []\n}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:core-json-TimeEffect" {
  let value = @core_api.deserialize_json_from_string(
    "{\n    \"OTIO_SCHEMA\": \"TimeEffect.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"effect_name\": \"\",\n    \"enabled\": true\n}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(
      @otiojson.parse(@core_api.serialize_json_to_string(value).unwrap()).unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"TimeEffect.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"effect_name\": \"\",\n    \"enabled\": true\n}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:core-json-Timeline" {
  let value = @core_api.deserialize_json_from_string(
    "{\n    \"OTIO_SCHEMA\": \"Timeline.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"global_start_time\": null,\n    \"tracks\": {\n        \"OTIO_SCHEMA\": \"Stack.1\",\n        \"metadata\": {},\n        \"name\": \"tracks\",\n        \"source_range\": null,\n        \"effects\": [],\n        \"markers\": [],\n        \"enabled\": true,\n        \"color\": null,\n        \"children\": []\n    }\n}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(
      @otiojson.parse(@core_api.serialize_json_to_string(value).unwrap()).unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"Timeline.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"global_start_time\": null,\n    \"tracks\": {\n        \"OTIO_SCHEMA\": \"Stack.1\",\n        \"metadata\": {},\n        \"name\": \"tracks\",\n        \"source_range\": null,\n        \"effects\": [],\n        \"markers\": [],\n        \"enabled\": true,\n        \"color\": null,\n        \"children\": []\n    }\n}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:core-json-Track" {
  let value = @core_api.deserialize_json_from_string(
    "{\n    \"OTIO_SCHEMA\": \"Track.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"children\": [],\n    \"kind\": \"Video\"\n}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(
      @otiojson.parse(@core_api.serialize_json_to_string(value).unwrap()).unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"Track.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"children\": [],\n    \"kind\": \"Video\"\n}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:core-json-Transition" {
  let value = @core_api.deserialize_json_from_string(
    "{\n    \"OTIO_SCHEMA\": \"Transition.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"in_offset\": {\n        \"OTIO_SCHEMA\": \"RationalTime.1\",\n        \"rate\": 1.0,\n        \"value\": 0.0\n    },\n    \"out_offset\": {\n        \"OTIO_SCHEMA\": \"RationalTime.1\",\n        \"rate\": 1.0,\n        \"value\": 0.0\n    },\n    \"transition_type\": \"\"\n}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(
      @otiojson.parse(@core_api.serialize_json_to_string(value).unwrap()).unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"Transition.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"in_offset\": {\n        \"OTIO_SCHEMA\": \"RationalTime.1\",\n        \"rate\": 1.0,\n        \"value\": 0.0\n    },\n    \"out_offset\": {\n        \"OTIO_SCHEMA\": \"RationalTime.1\",\n        \"rate\": 1.0,\n        \"value\": 0.0\n    },\n    \"transition_type\": \"\"\n}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:core-json-PluginManifest" {
  let value = @core_api.deserialize_json_from_string(
    "{\n    \"OTIO_SCHEMA\": \"PluginManifest.1\",\n    \"adapters\": [],\n    \"hook_scripts\": [],\n    \"hooks\": {},\n    \"media_linkers\": [],\n    \"schemadefs\": [],\n    \"version_manifests\": {}\n}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(
      @otiojson.parse(@core_api.serialize_json_to_string(value).unwrap()).unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"PluginManifest.1\",\n    \"adapters\": [],\n    \"hook_scripts\": [],\n    \"hooks\": {},\n    \"media_linkers\": [],\n    \"schemadefs\": [],\n    \"version_manifests\": {}\n}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:core-json-RationalTime" {
  let value = @core_api.deserialize_json_from_string(
    "{\n    \"OTIO_SCHEMA\": \"RationalTime.1\",\n    \"rate\": 1.0,\n    \"value\": 0.0\n}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(
      @otiojson.parse(@core_api.serialize_json_to_string(value).unwrap()).unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"RationalTime.1\",\n    \"rate\": 1.0,\n    \"value\": 0.0\n}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:core-json-TimeRange" {
  let value = @core_api.deserialize_json_from_string(
    "{\n    \"OTIO_SCHEMA\": \"TimeRange.1\",\n    \"duration\": {\n        \"OTIO_SCHEMA\": \"RationalTime.1\",\n        \"rate\": 1.0,\n        \"value\": 0.0\n    },\n    \"start_time\": {\n        \"OTIO_SCHEMA\": \"RationalTime.1\",\n        \"rate\": 1.0,\n        \"value\": 0.0\n    }\n}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(
      @otiojson.parse(@core_api.serialize_json_to_string(value).unwrap()).unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"TimeRange.1\",\n    \"duration\": {\n        \"OTIO_SCHEMA\": \"RationalTime.1\",\n        \"rate\": 1.0,\n        \"value\": 0.0\n    },\n    \"start_time\": {\n        \"OTIO_SCHEMA\": \"RationalTime.1\",\n        \"rate\": 1.0,\n        \"value\": 0.0\n    }\n}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:core-json-TimeTransform" {
  let value = @core_api.deserialize_json_from_string(
    "{\n    \"OTIO_SCHEMA\": \"TimeTransform.1\",\n    \"offset\": {\n        \"OTIO_SCHEMA\": \"RationalTime.1\",\n        \"rate\": 1.0,\n        \"value\": 0.0\n    },\n    \"rate\": -1.0,\n    \"scale\": 1.0\n}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(
      @otiojson.parse(@core_api.serialize_json_to_string(value).unwrap()).unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"TimeTransform.1\",\n    \"offset\": {\n        \"OTIO_SCHEMA\": \"RationalTime.1\",\n        \"rate\": 1.0,\n        \"value\": 0.0\n    },\n    \"rate\": -1.0,\n    \"scale\": 1.0\n}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:core-json-V2d" {
  let value = @core_api.deserialize_json_from_string(
    "{\n    \"OTIO_SCHEMA\": \"V2d.1\",\n    \"x\": 0.0,\n    \"y\": 0.0\n}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(
      @otiojson.parse(@core_api.serialize_json_to_string(value).unwrap()).unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"V2d.1\",\n    \"x\": 0.0,\n    \"y\": 0.0\n}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:core-json-Box2d" {
  let value = @core_api.deserialize_json_from_string(
    "{\n    \"OTIO_SCHEMA\": \"Box2d.1\",\n    \"min\": {\n        \"OTIO_SCHEMA\": \"V2d.1\",\n        \"x\": 0.0,\n        \"y\": 0.0\n    },\n    \"max\": {\n        \"OTIO_SCHEMA\": \"V2d.1\",\n        \"x\": 0.0,\n        \"y\": 0.0\n    }\n}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(
      @otiojson.parse(@core_api.serialize_json_to_string(value).unwrap()).unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"Box2d.1\",\n    \"min\": {\n        \"OTIO_SCHEMA\": \"V2d.1\",\n        \"x\": 0.0,\n        \"y\": 0.0\n    },\n    \"max\": {\n        \"OTIO_SCHEMA\": \"V2d.1\",\n        \"x\": 0.0,\n        \"y\": 0.0\n    }\n}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:core-json-Color" {
  let value = @core_api.deserialize_json_from_string(
    "{\n    \"OTIO_SCHEMA\": \"Color.1\",\n    \"r\": 1.0,\n    \"g\": 1.0,\n    \"b\": 1.0,\n    \"a\": 1.0,\n    \"name\": \"\"\n}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(
      @otiojson.parse(@core_api.serialize_json_to_string(value).unwrap()).unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"Color.1\",\n    \"r\": 1.0,\n    \"g\": 1.0,\n    \"b\": 1.0,\n    \"a\": 1.0,\n    \"name\": \"\"\n}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:core-read-0" {
  assert_true(@core_api.deserialize_json_from_string("{") is Err(_))
}

///|
test "functions:core-read-1" {
  assert_true(
    @otiojson.equivalent(
      @core_api.deserialize_json_from_string("null").unwrap(),
      @otiojson.parse("null").unwrap(),
    ),
  )
}

///|
test "functions:core-read-2" {
  assert_true(
    @otiojson.equivalent(
      @core_api.deserialize_json_from_string("[1,true,{\"x\":2}]").unwrap(),
      @otiojson.parse("[\n    1,\n    true,\n    {\n        \"x\": 2\n    }\n]").unwrap(),
    ),
  )
}

///|
test "functions:core-read-3" {
  assert_true(
    @core_api.deserialize_json_from_string("{\"OTIO_SCHEMA\":\"Clip.2\"}")
    is Err(_),
  )
}

///|
test "functions:core-read-4" {
  assert_true(
    @otiojson.equivalent(
      @core_api.deserialize_json_from_string(
        "{\"OTIO_SCHEMA\":\"Future.9\",\"x\":[1,2]}",
      ).unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"Future.9\",\n    \"x\": [\n        1,\n        2\n    ]\n}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:core-read-5" {
  assert_true(
    @core_api.deserialize_json_from_string("{\"OTIO_SCHEMA\":\"Marker.1\"}")
    is Err(_),
  )
}

///|
test "functions:instance-0" {
  assert_true(
    @core_api.instance_from_schema("Clip", 2, @otiojson.parse("{}").unwrap())
    is Err(_),
  )
}

///|
test "functions:instance-1" {
  assert_true(
    @otiojson.equivalent(
      @core_api.instance_from_schema("Clip", 1, @otiojson.parse("{}").unwrap()).unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"Clip.2\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"media_references\": {\n        \"DEFAULT_MEDIA\": {\n            \"OTIO_SCHEMA\": \"MissingReference.1\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"available_range\": null,\n            \"available_image_bounds\": null\n        }\n    },\n    \"active_media_reference_key\": \"DEFAULT_MEDIA\"\n}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:instance-2" {
  assert_true(
    @otiojson.equivalent(
      @core_api.instance_from_schema(
        "Future",
        1,
        @otiojson.parse("{}").unwrap(),
      ).unwrap(),
      @otiojson.parse("{\n    \"OTIO_SCHEMA\": \"Future.1\"\n}").unwrap(),
    ),
  )
}

///|
test "functions:instance-3" {
  assert_true(
    @core_api.instance_from_schema("Clip", 9, @otiojson.parse("{}").unwrap())
    is Err(_),
  )
}

///|
test "functions:instance-4" {
  assert_true(
    @core_api.instance_from_schema("Marker", 1, @otiojson.parse("{}").unwrap())
    is Err(_),
  )
}

///|
test "functions:instance-5" {
  assert_true(
    @otiojson.equivalent(
      @core_api.instance_from_schema(
        "RationalTime",
        1,
        @otiojson.parse("{}").unwrap(),
      ).unwrap(),
      @otiojson.parse("{\n    \"OTIO_SCHEMA\": \"RationalTime.1\"\n}").unwrap(),
    ),
  )
}

///|
test "functions:instance-6" {
  assert_true(
    @core_api.instance_from_schema(
      "Track",
      1,
      @otiojson.parse("{\"children\":[]}").unwrap(),
    )
    is Err(_),
  )
}

///|
test "functions:instance-7" {
  assert_true(
    @otiojson.equivalent(
      @core_api.instance_from_schema("Gap", 1, @otiojson.parse("{}").unwrap()).unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"Gap.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"source_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 1.0,\n            \"value\": 0.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 1.0,\n            \"value\": 0.0\n        }\n    },\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null\n}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:instance-8" {
  assert_true(
    @otiojson.equivalent(
      @core_api.instance_from_schema(
        "Clip",
        2,
        @otiojson.parse(
          "{\"media_references\":{},\"active_media_reference_key\":\"DEFAULT_MEDIA\"}",
        ).unwrap(),
      ).unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"Clip.2\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"media_references\": {},\n    \"active_media_reference_key\": \"DEFAULT_MEDIA\"\n}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:core-flatten" {
  assert_true(
    @algorithms.flatten_stack(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"Stack.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"children\": [\n        {\n            \"OTIO_SCHEMA\": \"Track.1\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"source_range\": null,\n            \"effects\": [],\n            \"markers\": [],\n            \"enabled\": true,\n            \"color\": null,\n            \"children\": [\n                {\n                    \"OTIO_SCHEMA\": \"Clip.2\",\n                    \"metadata\": {},\n                    \"name\": \"\",\n                    \"source_range\": {\n                        \"OTIO_SCHEMA\": \"TimeRange.1\",\n                        \"duration\": {\n                            \"OTIO_SCHEMA\": \"RationalTime.1\",\n                            \"rate\": 24.0,\n                            \"value\": 24.0\n                        },\n                        \"start_time\": {\n                            \"OTIO_SCHEMA\": \"RationalTime.1\",\n                            \"rate\": 24.0,\n                            \"value\": 0.0\n                        }\n                    },\n                    \"effects\": [],\n                    \"markers\": [],\n                    \"enabled\": true,\n                    \"color\": null,\n                    \"media_references\": {\n                        \"DEFAULT_MEDIA\": {\n                            \"OTIO_SCHEMA\": \"MissingReference.1\",\n                            \"metadata\": {},\n                            \"name\": \"\",\n                            \"available_range\": null,\n                            \"available_image_bounds\": null\n                        }\n                    },\n                    \"active_media_reference_key\": \"DEFAULT_MEDIA\"\n                }\n            ],\n            \"kind\": \"Video\"\n        }\n    ]\n}",
      ).unwrap(),
    )
    .unwrap()
    .equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"Track.1\",\n    \"metadata\": {},\n    \"name\": \"Flattened\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"children\": [\n        {\n            \"OTIO_SCHEMA\": \"Clip.2\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"source_range\": {\n                \"OTIO_SCHEMA\": \"TimeRange.1\",\n                \"duration\": {\n                    \"OTIO_SCHEMA\": \"RationalTime.1\",\n                    \"rate\": 24.0,\n                    \"value\": 24.0\n                },\n                \"start_time\": {\n                    \"OTIO_SCHEMA\": \"RationalTime.1\",\n                    \"rate\": 24.0,\n                    \"value\": 0.0\n                }\n            },\n            \"effects\": [],\n            \"markers\": [],\n            \"enabled\": true,\n            \"color\": null,\n            \"media_references\": {\n                \"DEFAULT_MEDIA\": {\n                    \"OTIO_SCHEMA\": \"MissingReference.1\",\n                    \"metadata\": {},\n                    \"name\": \"\",\n                    \"available_range\": null,\n                    \"available_image_bounds\": null\n                }\n            },\n            \"active_media_reference_key\": \"DEFAULT_MEDIA\"\n        }\n    ],\n    \"kind\": \"Video\"\n}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:custom-schema--1" {
  let registry = @plugins.Registry::new()
  registry
  .register_schema({
    name: "APICompatibilityFixture",
    version: 2,
    upgrade: fn(j, _v) {
      match j {
        Object(m) => {
          let n = match m.get("old_value") {
            Some(Number(n, ..)) => n
            _ => return Err("missing_old")
          }
          m.remove("old_value")
          m["value"] = Json::number(n + 1.0)
          Ok(Json::object(m))
        }
        _ => Err("invalid")
      }
    },
    downgrade: fn(j, _v) {
      match j {
        Object(m) => {
          let n = match m.get("value") {
            Some(Number(n, ..)) => n
            _ => return Err("missing_value")
          }
          m.remove("value")
          m["old_value"] = Json::number(n - 1.0)
          Ok(Json::object(m))
        }
        _ => Err("invalid")
      }
    },
  })
  .unwrap()
  let upgraded = registry
    .upgrade_document(
      @otiojson.parse(
        "{\"OTIO_SCHEMA\":\"APICompatibilityFixture.1\",\"old_value\":-1}",
      ).unwrap(),
    )
    .unwrap()
  assert_true(
    @otiojson.equivalent(
      upgraded,
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"APICompatibilityFixture.2\",\n    \"value\": 0\n}",
      ).unwrap(),
    ),
  )
  registry
  .register_version_manifest("legacy", { "APICompatibilityFixture": 1 })
  .unwrap()
  assert_true(
    @otiojson.equivalent(
      @otiojson.parse(registry.write_versions(upgraded, "legacy").unwrap()).unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"APICompatibilityFixture.1\",\n    \"old_value\": -1\n}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:custom-schema-0" {
  let registry = @plugins.Registry::new()
  registry
  .register_schema({
    name: "APICompatibilityFixture",
    version: 2,
    upgrade: fn(j, _v) {
      match j {
        Object(m) => {
          let n = match m.get("old_value") {
            Some(Number(n, ..)) => n
            _ => return Err("missing_old")
          }
          m.remove("old_value")
          m["value"] = Json::number(n + 1.0)
          Ok(Json::object(m))
        }
        _ => Err("invalid")
      }
    },
    downgrade: fn(j, _v) {
      match j {
        Object(m) => {
          let n = match m.get("value") {
            Some(Number(n, ..)) => n
            _ => return Err("missing_value")
          }
          m.remove("value")
          m["old_value"] = Json::number(n - 1.0)
          Ok(Json::object(m))
        }
        _ => Err("invalid")
      }
    },
  })
  .unwrap()
  let upgraded = registry
    .upgrade_document(
      @otiojson.parse(
        "{\"OTIO_SCHEMA\":\"APICompatibilityFixture.1\",\"old_value\":0}",
      ).unwrap(),
    )
    .unwrap()
  assert_true(
    @otiojson.equivalent(
      upgraded,
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"APICompatibilityFixture.2\",\n    \"value\": 1\n}",
      ).unwrap(),
    ),
  )
  registry
  .register_version_manifest("legacy", { "APICompatibilityFixture": 1 })
  .unwrap()
  assert_true(
    @otiojson.equivalent(
      @otiojson.parse(registry.write_versions(upgraded, "legacy").unwrap()).unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"APICompatibilityFixture.1\",\n    \"old_value\": 0\n}",
      ).unwrap(),
    ),
  )
}

///|
test "functions:custom-schema-3" {
  let registry = @plugins.Registry::new()
  registry
  .register_schema({
    name: "APICompatibilityFixture",
    version: 2,
    upgrade: fn(j, _v) {
      match j {
        Object(m) => {
          let n = match m.get("old_value") {
            Some(Number(n, ..)) => n
            _ => return Err("missing_old")
          }
          m.remove("old_value")
          m["value"] = Json::number(n + 1.0)
          Ok(Json::object(m))
        }
        _ => Err("invalid")
      }
    },
    downgrade: fn(j, _v) {
      match j {
        Object(m) => {
          let n = match m.get("value") {
            Some(Number(n, ..)) => n
            _ => return Err("missing_value")
          }
          m.remove("value")
          m["old_value"] = Json::number(n - 1.0)
          Ok(Json::object(m))
        }
        _ => Err("invalid")
      }
    },
  })
  .unwrap()
  let upgraded = registry
    .upgrade_document(
      @otiojson.parse(
        "{\"OTIO_SCHEMA\":\"APICompatibilityFixture.1\",\"old_value\":3}",
      ).unwrap(),
    )
    .unwrap()
  assert_true(
    @otiojson.equivalent(
      upgraded,
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"APICompatibilityFixture.2\",\n    \"value\": 4\n}",
      ).unwrap(),
    ),
  )
  registry
  .register_version_manifest("legacy", { "APICompatibilityFixture": 1 })
  .unwrap()
  assert_true(
    @otiojson.equivalent(
      @otiojson.parse(registry.write_versions(upgraded, "legacy").unwrap()).unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"APICompatibilityFixture.1\",\n    \"old_value\": 3\n}",
      ).unwrap(),
    ),
  )
}
