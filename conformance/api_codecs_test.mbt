// Generated from official OTIO 0.18.1 by tools/generate_api_tests.py.

///|
test "codecs:0" {
  let t = @opentime.RationalTime::new(value=-1.0, rate=12.0)
  assert_true(t.to_timecode(drop_frame=None) is Err(_))
  assert_true(t.to_timecode(drop_frame=Some(false)) is Err(_))
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=None) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=Some(false)) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "-00:00:00.083333")
}

///|
test "codecs:1" {
  let t = @opentime.RationalTime::new(value=-1.0, rate=23.976)
  assert_true(t.to_timecode(drop_frame=None) is Err(_))
  assert_true(t.to_timecode(drop_frame=Some(false)) is Err(_))
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=None) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=Some(false)) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "-00:00:00.041708")
}

///|
test "codecs:2" {
  let t = @opentime.RationalTime::new(value=-1.0, rate=23.976023976023978)
  assert_true(t.to_timecode(drop_frame=None) is Err(_))
  assert_true(t.to_timecode(drop_frame=Some(false)) is Err(_))
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=None) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=Some(false)) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "-00:00:00.041708")
}

///|
test "codecs:3" {
  let t = @opentime.RationalTime::new(value=-1.0, rate=24.0)
  assert_true(t.to_timecode(drop_frame=None) is Err(_))
  assert_true(t.to_timecode(drop_frame=Some(false)) is Err(_))
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=None) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=Some(false)) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "-00:00:00.041666")
}

///|
test "codecs:4" {
  let t = @opentime.RationalTime::new(value=-1.0, rate=25.0)
  assert_true(t.to_timecode(drop_frame=None) is Err(_))
  assert_true(t.to_timecode(drop_frame=Some(false)) is Err(_))
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=None) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=Some(false)) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "-00:00:00.04")
}

///|
test "codecs:5" {
  let t = @opentime.RationalTime::new(value=-1.0, rate=29.97)
  assert_true(t.to_timecode(drop_frame=None) is Err(_))
  assert_true(t.to_timecode(drop_frame=Some(false)) is Err(_))
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=None) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=Some(false)) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "-00:00:00.033366")
}

///|
test "codecs:6" {
  let t = @opentime.RationalTime::new(value=-1.0, rate=29.97002997002997)
  assert_true(t.to_timecode(drop_frame=None) is Err(_))
  assert_true(t.to_timecode(drop_frame=Some(false)) is Err(_))
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=None) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=Some(false)) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "-00:00:00.033366")
}

///|
test "codecs:7" {
  let t = @opentime.RationalTime::new(value=-1.0, rate=30.0)
  assert_true(t.to_timecode(drop_frame=None) is Err(_))
  assert_true(t.to_timecode(drop_frame=Some(false)) is Err(_))
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=None) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=Some(false)) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "-00:00:00.033333")
}

///|
test "codecs:8" {
  let t = @opentime.RationalTime::new(value=-1.0, rate=48.0)
  assert_true(t.to_timecode(drop_frame=None) is Err(_))
  assert_true(t.to_timecode(drop_frame=Some(false)) is Err(_))
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=None) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=Some(false)) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "-00:00:00.020833")
}

///|
test "codecs:9" {
  let t = @opentime.RationalTime::new(value=-1.0, rate=50.0)
  assert_true(t.to_timecode(drop_frame=None) is Err(_))
  assert_true(t.to_timecode(drop_frame=Some(false)) is Err(_))
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=None) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=Some(false)) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "-00:00:00.02")
}

///|
test "codecs:10" {
  let t = @opentime.RationalTime::new(value=-1.0, rate=59.94)
  assert_true(t.to_timecode(drop_frame=None) is Err(_))
  assert_true(t.to_timecode(drop_frame=Some(false)) is Err(_))
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=None) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=Some(false)) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "-00:00:00.016683")
}

///|
test "codecs:11" {
  let t = @opentime.RationalTime::new(value=-1.0, rate=59.94005994005994)
  assert_true(t.to_timecode(drop_frame=None) is Err(_))
  assert_true(t.to_timecode(drop_frame=Some(false)) is Err(_))
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=None) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=Some(false)) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "-00:00:00.016683")
}

///|
test "codecs:12" {
  let t = @opentime.RationalTime::new(value=-1.0, rate=60.0)
  assert_true(t.to_timecode(drop_frame=None) is Err(_))
  assert_true(t.to_timecode(drop_frame=Some(false)) is Err(_))
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=None) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=Some(false)) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "-00:00:00.016666")
}

///|
test "codecs:13" {
  let t = @opentime.RationalTime::new(value=-1.0, rate=120.0)
  assert_true(t.to_timecode(drop_frame=None) is Err(_))
  assert_true(t.to_timecode(drop_frame=Some(false)) is Err(_))
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=None) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=Some(false)) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "-00:00:00.008333")
}

///|
test "codecs:14" {
  let t = @opentime.RationalTime::new(value=-0.5, rate=12.0)
  assert_true(t.to_timecode(drop_frame=None) is Err(_))
  assert_true(t.to_timecode(drop_frame=Some(false)) is Err(_))
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=None) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=Some(false)) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "-00:00:00.041666")
}

///|
test "codecs:15" {
  let t = @opentime.RationalTime::new(value=-0.5, rate=23.976)
  assert_true(t.to_timecode(drop_frame=None) is Err(_))
  assert_true(t.to_timecode(drop_frame=Some(false)) is Err(_))
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=None) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=Some(false)) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "-00:00:00.020854")
}

///|
test "codecs:16" {
  let t = @opentime.RationalTime::new(value=-0.5, rate=23.976023976023978)
  assert_true(t.to_timecode(drop_frame=None) is Err(_))
  assert_true(t.to_timecode(drop_frame=Some(false)) is Err(_))
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=None) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=Some(false)) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "-00:00:00.020854")
}

///|
test "codecs:17" {
  let t = @opentime.RationalTime::new(value=-0.5, rate=24.0)
  assert_true(t.to_timecode(drop_frame=None) is Err(_))
  assert_true(t.to_timecode(drop_frame=Some(false)) is Err(_))
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=None) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=Some(false)) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "-00:00:00.020833")
}

///|
test "codecs:18" {
  let t = @opentime.RationalTime::new(value=-0.5, rate=25.0)
  assert_true(t.to_timecode(drop_frame=None) is Err(_))
  assert_true(t.to_timecode(drop_frame=Some(false)) is Err(_))
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=None) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=Some(false)) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "-00:00:00.02")
}

///|
test "codecs:19" {
  let t = @opentime.RationalTime::new(value=-0.5, rate=29.97)
  assert_true(t.to_timecode(drop_frame=None) is Err(_))
  assert_true(t.to_timecode(drop_frame=Some(false)) is Err(_))
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=None) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=Some(false)) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "-00:00:00.016683")
}

///|
test "codecs:20" {
  let t = @opentime.RationalTime::new(value=-0.5, rate=29.97002997002997)
  assert_true(t.to_timecode(drop_frame=None) is Err(_))
  assert_true(t.to_timecode(drop_frame=Some(false)) is Err(_))
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=None) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=Some(false)) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "-00:00:00.016683")
}

///|
test "codecs:21" {
  let t = @opentime.RationalTime::new(value=-0.5, rate=30.0)
  assert_true(t.to_timecode(drop_frame=None) is Err(_))
  assert_true(t.to_timecode(drop_frame=Some(false)) is Err(_))
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=None) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=Some(false)) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "-00:00:00.016666")
}

///|
test "codecs:22" {
  let t = @opentime.RationalTime::new(value=-0.5, rate=48.0)
  assert_true(t.to_timecode(drop_frame=None) is Err(_))
  assert_true(t.to_timecode(drop_frame=Some(false)) is Err(_))
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=None) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=Some(false)) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "-00:00:00.010416")
}

///|
test "codecs:23" {
  let t = @opentime.RationalTime::new(value=-0.5, rate=50.0)
  assert_true(t.to_timecode(drop_frame=None) is Err(_))
  assert_true(t.to_timecode(drop_frame=Some(false)) is Err(_))
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=None) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=Some(false)) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "-00:00:00.01")
}

///|
test "codecs:24" {
  let t = @opentime.RationalTime::new(value=-0.5, rate=59.94)
  assert_true(t.to_timecode(drop_frame=None) is Err(_))
  assert_true(t.to_timecode(drop_frame=Some(false)) is Err(_))
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=None) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=Some(false)) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "-00:00:00.008341")
}

///|
test "codecs:25" {
  let t = @opentime.RationalTime::new(value=-0.5, rate=59.94005994005994)
  assert_true(t.to_timecode(drop_frame=None) is Err(_))
  assert_true(t.to_timecode(drop_frame=Some(false)) is Err(_))
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=None) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=Some(false)) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "-00:00:00.008341")
}

///|
test "codecs:26" {
  let t = @opentime.RationalTime::new(value=-0.5, rate=60.0)
  assert_true(t.to_timecode(drop_frame=None) is Err(_))
  assert_true(t.to_timecode(drop_frame=Some(false)) is Err(_))
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=None) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=Some(false)) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "-00:00:00.008333")
}

///|
test "codecs:27" {
  let t = @opentime.RationalTime::new(value=-0.5, rate=120.0)
  assert_true(t.to_timecode(drop_frame=None) is Err(_))
  assert_true(t.to_timecode(drop_frame=Some(false)) is Err(_))
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=None) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=Some(false)) is Err(_))
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "-00:00:00.004166")
}

///|
test "codecs:28" {
  let t = @opentime.RationalTime::new(value=0.0, rate=12.0)
  assert_true(t.to_timecode(drop_frame=None) is Err(_))
  assert_true(t.to_timecode(drop_frame=Some(false)) is Err(_))
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "00:00:00:00")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "00:00:00:00",
  )
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "00:00:00.0")
}

///|
test "codecs:29" {
  let t = @opentime.RationalTime::new(value=0.0, rate=23.976)
  assert_eq(t.to_timecode(drop_frame=None).unwrap(), "00:00:00:00")
  assert_eq(t.to_timecode(drop_frame=Some(false)).unwrap(), "00:00:00:00")
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "00:00:00:00")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "00:00:00:00",
  )
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "00:00:00.0")
}

///|
test "codecs:30" {
  let t = @opentime.RationalTime::new(value=0.0, rate=23.976023976023978)
  assert_eq(t.to_timecode(drop_frame=None).unwrap(), "00:00:00:00")
  assert_eq(t.to_timecode(drop_frame=Some(false)).unwrap(), "00:00:00:00")
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "00:00:00:00")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "00:00:00:00",
  )
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "00:00:00.0")
}

///|
test "codecs:31" {
  let t = @opentime.RationalTime::new(value=0.0, rate=24.0)
  assert_eq(t.to_timecode(drop_frame=None).unwrap(), "00:00:00:00")
  assert_eq(t.to_timecode(drop_frame=Some(false)).unwrap(), "00:00:00:00")
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "00:00:00:00")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "00:00:00:00",
  )
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "00:00:00.0")
}

///|
test "codecs:32" {
  let t = @opentime.RationalTime::new(value=0.0, rate=25.0)
  assert_eq(t.to_timecode(drop_frame=None).unwrap(), "00:00:00:00")
  assert_eq(t.to_timecode(drop_frame=Some(false)).unwrap(), "00:00:00:00")
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "00:00:00:00")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "00:00:00:00",
  )
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "00:00:00.0")
}

///|
test "codecs:33" {
  let t = @opentime.RationalTime::new(value=0.0, rate=29.97)
  assert_eq(t.to_timecode(drop_frame=None).unwrap(), "00:00:00;00")
  assert_eq(t.to_timecode(drop_frame=Some(false)).unwrap(), "00:00:00:00")
  assert_eq(t.to_timecode(drop_frame=Some(true)).unwrap(), "00:00:00;00")
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "00:00:00;00")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "00:00:00:00",
  )
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(true)).unwrap(),
    "00:00:00;00",
  )
  assert_eq(t.to_time_string().unwrap(), "00:00:00.0")
}

///|
test "codecs:34" {
  let t = @opentime.RationalTime::new(value=0.0, rate=29.97002997002997)
  assert_eq(t.to_timecode(drop_frame=None).unwrap(), "00:00:00;00")
  assert_eq(t.to_timecode(drop_frame=Some(false)).unwrap(), "00:00:00:00")
  assert_eq(t.to_timecode(drop_frame=Some(true)).unwrap(), "00:00:00;00")
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "00:00:00;00")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "00:00:00:00",
  )
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(true)).unwrap(),
    "00:00:00;00",
  )
  assert_eq(t.to_time_string().unwrap(), "00:00:00.0")
}

///|
test "codecs:35" {
  let t = @opentime.RationalTime::new(value=0.0, rate=30.0)
  assert_eq(t.to_timecode(drop_frame=None).unwrap(), "00:00:00:00")
  assert_eq(t.to_timecode(drop_frame=Some(false)).unwrap(), "00:00:00:00")
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "00:00:00:00")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "00:00:00:00",
  )
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "00:00:00.0")
}

///|
test "codecs:36" {
  let t = @opentime.RationalTime::new(value=0.0, rate=48.0)
  assert_eq(t.to_timecode(drop_frame=None).unwrap(), "00:00:00:00")
  assert_eq(t.to_timecode(drop_frame=Some(false)).unwrap(), "00:00:00:00")
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "00:00:00:00")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "00:00:00:00",
  )
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "00:00:00.0")
}

///|
test "codecs:37" {
  let t = @opentime.RationalTime::new(value=0.0, rate=50.0)
  assert_eq(t.to_timecode(drop_frame=None).unwrap(), "00:00:00:00")
  assert_eq(t.to_timecode(drop_frame=Some(false)).unwrap(), "00:00:00:00")
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "00:00:00:00")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "00:00:00:00",
  )
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "00:00:00.0")
}

///|
test "codecs:38" {
  let t = @opentime.RationalTime::new(value=0.0, rate=59.94)
  assert_eq(t.to_timecode(drop_frame=None).unwrap(), "00:00:00;00")
  assert_eq(t.to_timecode(drop_frame=Some(false)).unwrap(), "00:00:00:00")
  assert_eq(t.to_timecode(drop_frame=Some(true)).unwrap(), "00:00:00;00")
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "00:00:00;00")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "00:00:00:00",
  )
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(true)).unwrap(),
    "00:00:00;00",
  )
  assert_eq(t.to_time_string().unwrap(), "00:00:00.0")
}

///|
test "codecs:39" {
  let t = @opentime.RationalTime::new(value=0.0, rate=59.94005994005994)
  assert_eq(t.to_timecode(drop_frame=None).unwrap(), "00:00:00;00")
  assert_eq(t.to_timecode(drop_frame=Some(false)).unwrap(), "00:00:00:00")
  assert_eq(t.to_timecode(drop_frame=Some(true)).unwrap(), "00:00:00;00")
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "00:00:00;00")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "00:00:00:00",
  )
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(true)).unwrap(),
    "00:00:00;00",
  )
  assert_eq(t.to_time_string().unwrap(), "00:00:00.0")
}

///|
test "codecs:40" {
  let t = @opentime.RationalTime::new(value=0.0, rate=60.0)
  assert_eq(t.to_timecode(drop_frame=None).unwrap(), "00:00:00:00")
  assert_eq(t.to_timecode(drop_frame=Some(false)).unwrap(), "00:00:00:00")
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "00:00:00:00")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "00:00:00:00",
  )
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "00:00:00.0")
}

///|
test "codecs:41" {
  let t = @opentime.RationalTime::new(value=0.0, rate=120.0)
  assert_true(t.to_timecode(drop_frame=None) is Err(_))
  assert_true(t.to_timecode(drop_frame=Some(false)) is Err(_))
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "00:00:00:00")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "00:00:00:00",
  )
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "00:00:00.0")
}

///|
test "codecs:42" {
  let t = @opentime.RationalTime::new(value=1.0, rate=12.0)
  assert_true(t.to_timecode(drop_frame=None) is Err(_))
  assert_true(t.to_timecode(drop_frame=Some(false)) is Err(_))
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "00:00:00:01")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "00:00:00:01",
  )
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "00:00:00.083333")
}

///|
test "codecs:43" {
  let t = @opentime.RationalTime::new(value=1.0, rate=23.976)
  assert_eq(t.to_timecode(drop_frame=None).unwrap(), "00:00:00:01")
  assert_eq(t.to_timecode(drop_frame=Some(false)).unwrap(), "00:00:00:01")
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "00:00:00:01")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "00:00:00:01",
  )
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "00:00:00.041708")
}

///|
test "codecs:44" {
  let t = @opentime.RationalTime::new(value=1.0, rate=23.976023976023978)
  assert_eq(t.to_timecode(drop_frame=None).unwrap(), "00:00:00:01")
  assert_eq(t.to_timecode(drop_frame=Some(false)).unwrap(), "00:00:00:01")
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "00:00:00:01")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "00:00:00:01",
  )
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "00:00:00.041708")
}

///|
test "codecs:45" {
  let t = @opentime.RationalTime::new(value=1.0, rate=24.0)
  assert_eq(t.to_timecode(drop_frame=None).unwrap(), "00:00:00:01")
  assert_eq(t.to_timecode(drop_frame=Some(false)).unwrap(), "00:00:00:01")
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "00:00:00:01")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "00:00:00:01",
  )
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "00:00:00.041666")
}

///|
test "codecs:46" {
  let t = @opentime.RationalTime::new(value=1.0, rate=25.0)
  assert_eq(t.to_timecode(drop_frame=None).unwrap(), "00:00:00:01")
  assert_eq(t.to_timecode(drop_frame=Some(false)).unwrap(), "00:00:00:01")
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "00:00:00:01")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "00:00:00:01",
  )
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "00:00:00.04")
}

///|
test "codecs:47" {
  let t = @opentime.RationalTime::new(value=1.0, rate=29.97)
  assert_eq(t.to_timecode(drop_frame=None).unwrap(), "00:00:00;01")
  assert_eq(t.to_timecode(drop_frame=Some(false)).unwrap(), "00:00:00:01")
  assert_eq(t.to_timecode(drop_frame=Some(true)).unwrap(), "00:00:00;01")
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "00:00:00;01")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "00:00:00:01",
  )
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(true)).unwrap(),
    "00:00:00;01",
  )
  assert_eq(t.to_time_string().unwrap(), "00:00:00.033366")
}

///|
test "codecs:48" {
  let t = @opentime.RationalTime::new(value=1.0, rate=29.97002997002997)
  assert_eq(t.to_timecode(drop_frame=None).unwrap(), "00:00:00;01")
  assert_eq(t.to_timecode(drop_frame=Some(false)).unwrap(), "00:00:00:01")
  assert_eq(t.to_timecode(drop_frame=Some(true)).unwrap(), "00:00:00;01")
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "00:00:00;01")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "00:00:00:01",
  )
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(true)).unwrap(),
    "00:00:00;01",
  )
  assert_eq(t.to_time_string().unwrap(), "00:00:00.033366")
}

///|
test "codecs:49" {
  let t = @opentime.RationalTime::new(value=1.0, rate=30.0)
  assert_eq(t.to_timecode(drop_frame=None).unwrap(), "00:00:00:01")
  assert_eq(t.to_timecode(drop_frame=Some(false)).unwrap(), "00:00:00:01")
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "00:00:00:01")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "00:00:00:01",
  )
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "00:00:00.033333")
}

///|
test "codecs:50" {
  let t = @opentime.RationalTime::new(value=1.0, rate=48.0)
  assert_eq(t.to_timecode(drop_frame=None).unwrap(), "00:00:00:01")
  assert_eq(t.to_timecode(drop_frame=Some(false)).unwrap(), "00:00:00:01")
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "00:00:00:01")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "00:00:00:01",
  )
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "00:00:00.020833")
}

///|
test "codecs:51" {
  let t = @opentime.RationalTime::new(value=1.0, rate=50.0)
  assert_eq(t.to_timecode(drop_frame=None).unwrap(), "00:00:00:01")
  assert_eq(t.to_timecode(drop_frame=Some(false)).unwrap(), "00:00:00:01")
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "00:00:00:01")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "00:00:00:01",
  )
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "00:00:00.02")
}

///|
test "codecs:52" {
  let t = @opentime.RationalTime::new(value=1.0, rate=59.94)
  assert_eq(t.to_timecode(drop_frame=None).unwrap(), "00:00:00;01")
  assert_eq(t.to_timecode(drop_frame=Some(false)).unwrap(), "00:00:00:01")
  assert_eq(t.to_timecode(drop_frame=Some(true)).unwrap(), "00:00:00;01")
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "00:00:00;01")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "00:00:00:01",
  )
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(true)).unwrap(),
    "00:00:00;01",
  )
  assert_eq(t.to_time_string().unwrap(), "00:00:00.016683")
}

///|
test "codecs:53" {
  let t = @opentime.RationalTime::new(value=1.0, rate=59.94005994005994)
  assert_eq(t.to_timecode(drop_frame=None).unwrap(), "00:00:00;01")
  assert_eq(t.to_timecode(drop_frame=Some(false)).unwrap(), "00:00:00:01")
  assert_eq(t.to_timecode(drop_frame=Some(true)).unwrap(), "00:00:00;01")
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "00:00:00;01")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "00:00:00:01",
  )
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(true)).unwrap(),
    "00:00:00;01",
  )
  assert_eq(t.to_time_string().unwrap(), "00:00:00.016683")
}

///|
test "codecs:54" {
  let t = @opentime.RationalTime::new(value=1.0, rate=60.0)
  assert_eq(t.to_timecode(drop_frame=None).unwrap(), "00:00:00:01")
  assert_eq(t.to_timecode(drop_frame=Some(false)).unwrap(), "00:00:00:01")
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "00:00:00:01")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "00:00:00:01",
  )
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "00:00:00.016666")
}

///|
test "codecs:55" {
  let t = @opentime.RationalTime::new(value=1.0, rate=120.0)
  assert_true(t.to_timecode(drop_frame=None) is Err(_))
  assert_true(t.to_timecode(drop_frame=Some(false)) is Err(_))
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "00:00:00:00")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "00:00:00:00",
  )
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "00:00:00.008333")
}

///|
test "codecs:56" {
  let t = @opentime.RationalTime::new(value=23.75, rate=12.0)
  assert_true(t.to_timecode(drop_frame=None) is Err(_))
  assert_true(t.to_timecode(drop_frame=Some(false)) is Err(_))
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "00:00:01:23")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "00:00:01:23",
  )
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "00:00:01.979166")
}

///|
test "codecs:57" {
  let t = @opentime.RationalTime::new(value=23.75, rate=23.976)
  assert_eq(t.to_timecode(drop_frame=None).unwrap(), "00:00:00:23")
  assert_eq(t.to_timecode(drop_frame=Some(false)).unwrap(), "00:00:00:23")
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "00:00:00:23")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "00:00:00:23",
  )
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "00:00:00.990573")
}

///|
test "codecs:58" {
  let t = @opentime.RationalTime::new(value=23.75, rate=23.976023976023978)
  assert_eq(t.to_timecode(drop_frame=None).unwrap(), "00:00:00:23")
  assert_eq(t.to_timecode(drop_frame=Some(false)).unwrap(), "00:00:00:23")
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "00:00:00:23")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "00:00:00:23",
  )
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "00:00:00.990572")
}

///|
test "codecs:59" {
  let t = @opentime.RationalTime::new(value=23.75, rate=24.0)
  assert_eq(t.to_timecode(drop_frame=None).unwrap(), "00:00:00:23")
  assert_eq(t.to_timecode(drop_frame=Some(false)).unwrap(), "00:00:00:23")
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "00:00:00:23")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "00:00:00:23",
  )
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "00:00:00.989583")
}

///|
test "codecs:60" {
  let t = @opentime.RationalTime::new(value=23.75, rate=25.0)
  assert_eq(t.to_timecode(drop_frame=None).unwrap(), "00:00:00:23")
  assert_eq(t.to_timecode(drop_frame=Some(false)).unwrap(), "00:00:00:23")
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "00:00:00:23")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "00:00:00:23",
  )
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "00:00:00.95")
}

///|
test "codecs:61" {
  let t = @opentime.RationalTime::new(value=23.75, rate=29.97)
  assert_eq(t.to_timecode(drop_frame=None).unwrap(), "00:00:00;23")
  assert_eq(t.to_timecode(drop_frame=Some(false)).unwrap(), "00:00:00:23")
  assert_eq(t.to_timecode(drop_frame=Some(true)).unwrap(), "00:00:00;23")
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "00:00:00;23")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "00:00:00:23",
  )
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(true)).unwrap(),
    "00:00:00;23",
  )
  assert_eq(t.to_time_string().unwrap(), "00:00:00.792459")
}

///|
test "codecs:62" {
  let t = @opentime.RationalTime::new(value=23.75, rate=29.97002997002997)
  assert_eq(t.to_timecode(drop_frame=None).unwrap(), "00:00:00;23")
  assert_eq(t.to_timecode(drop_frame=Some(false)).unwrap(), "00:00:00:23")
  assert_eq(t.to_timecode(drop_frame=Some(true)).unwrap(), "00:00:00;23")
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "00:00:00;23")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "00:00:00:23",
  )
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(true)).unwrap(),
    "00:00:00;23",
  )
  assert_eq(t.to_time_string().unwrap(), "00:00:00.792458")
}

///|
test "codecs:63" {
  let t = @opentime.RationalTime::new(value=23.75, rate=30.0)
  assert_eq(t.to_timecode(drop_frame=None).unwrap(), "00:00:00:23")
  assert_eq(t.to_timecode(drop_frame=Some(false)).unwrap(), "00:00:00:23")
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "00:00:00:23")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "00:00:00:23",
  )
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "00:00:00.791666")
}

///|
test "codecs:64" {
  let t = @opentime.RationalTime::new(value=23.75, rate=48.0)
  assert_eq(t.to_timecode(drop_frame=None).unwrap(), "00:00:00:23")
  assert_eq(t.to_timecode(drop_frame=Some(false)).unwrap(), "00:00:00:23")
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "00:00:00:23")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "00:00:00:23",
  )
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "00:00:00.494791")
}

///|
test "codecs:65" {
  let t = @opentime.RationalTime::new(value=23.75, rate=50.0)
  assert_eq(t.to_timecode(drop_frame=None).unwrap(), "00:00:00:23")
  assert_eq(t.to_timecode(drop_frame=Some(false)).unwrap(), "00:00:00:23")
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "00:00:00:23")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "00:00:00:23",
  )
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "00:00:00.475")
}

///|
test "codecs:66" {
  let t = @opentime.RationalTime::new(value=23.75, rate=59.94)
  assert_eq(t.to_timecode(drop_frame=None).unwrap(), "00:00:00;23")
  assert_eq(t.to_timecode(drop_frame=Some(false)).unwrap(), "00:00:00:23")
  assert_eq(t.to_timecode(drop_frame=Some(true)).unwrap(), "00:00:00;23")
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "00:00:00;23")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "00:00:00:23",
  )
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(true)).unwrap(),
    "00:00:00;23",
  )
  assert_eq(t.to_time_string().unwrap(), "00:00:00.396229")
}

///|
test "codecs:67" {
  let t = @opentime.RationalTime::new(value=23.75, rate=59.94005994005994)
  assert_eq(t.to_timecode(drop_frame=None).unwrap(), "00:00:00;23")
  assert_eq(t.to_timecode(drop_frame=Some(false)).unwrap(), "00:00:00:23")
  assert_eq(t.to_timecode(drop_frame=Some(true)).unwrap(), "00:00:00;23")
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "00:00:00;23")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "00:00:00:23",
  )
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(true)).unwrap(),
    "00:00:00;23",
  )
  assert_eq(t.to_time_string().unwrap(), "00:00:00.396229")
}

///|
test "codecs:68" {
  let t = @opentime.RationalTime::new(value=23.75, rate=60.0)
  assert_eq(t.to_timecode(drop_frame=None).unwrap(), "00:00:00:23")
  assert_eq(t.to_timecode(drop_frame=Some(false)).unwrap(), "00:00:00:23")
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "00:00:00:23")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "00:00:00:23",
  )
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "00:00:00.395833")
}

///|
test "codecs:69" {
  let t = @opentime.RationalTime::new(value=23.75, rate=120.0)
  assert_true(t.to_timecode(drop_frame=None) is Err(_))
  assert_true(t.to_timecode(drop_frame=Some(false)) is Err(_))
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "00:00:00:11")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "00:00:00:11",
  )
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "00:00:00.197916")
}

///|
test "codecs:70" {
  let t = @opentime.RationalTime::new(value=1800.0, rate=12.0)
  assert_true(t.to_timecode(drop_frame=None) is Err(_))
  assert_true(t.to_timecode(drop_frame=Some(false)) is Err(_))
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "00:02:29:20")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "00:02:29:20",
  )
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "00:02:30.0")
}

///|
test "codecs:71" {
  let t = @opentime.RationalTime::new(value=1800.0, rate=23.976)
  assert_eq(t.to_timecode(drop_frame=None).unwrap(), "00:01:15:00")
  assert_eq(t.to_timecode(drop_frame=Some(false)).unwrap(), "00:01:15:00")
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "00:01:15:00")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "00:01:15:00",
  )
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "00:01:15.075075")
}

///|
test "codecs:72" {
  let t = @opentime.RationalTime::new(value=1800.0, rate=23.976023976023978)
  assert_eq(t.to_timecode(drop_frame=None).unwrap(), "00:01:15:00")
  assert_eq(t.to_timecode(drop_frame=Some(false)).unwrap(), "00:01:15:00")
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "00:01:15:00")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "00:01:15:00",
  )
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "00:01:15.075")
}

///|
test "codecs:73" {
  let t = @opentime.RationalTime::new(value=1800.0, rate=24.0)
  assert_eq(t.to_timecode(drop_frame=None).unwrap(), "00:01:15:00")
  assert_eq(t.to_timecode(drop_frame=Some(false)).unwrap(), "00:01:15:00")
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "00:01:15:00")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "00:01:15:00",
  )
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "00:01:15.0")
}

///|
test "codecs:74" {
  let t = @opentime.RationalTime::new(value=1800.0, rate=25.0)
  assert_eq(t.to_timecode(drop_frame=None).unwrap(), "00:01:12:00")
  assert_eq(t.to_timecode(drop_frame=Some(false)).unwrap(), "00:01:12:00")
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "00:01:12:00")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "00:01:12:00",
  )
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "00:01:12.0")
}

///|
test "codecs:75" {
  let t = @opentime.RationalTime::new(value=1800.0, rate=29.97)
  assert_eq(t.to_timecode(drop_frame=None).unwrap(), "00:01:00;02")
  assert_eq(t.to_timecode(drop_frame=Some(false)).unwrap(), "00:01:00:00")
  assert_eq(t.to_timecode(drop_frame=Some(true)).unwrap(), "00:01:00;02")
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "00:01:00;02")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "00:01:00:00",
  )
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(true)).unwrap(),
    "00:01:00;02",
  )
  assert_eq(t.to_time_string().unwrap(), "00:01:00.060060")
}

///|
test "codecs:76" {
  let t = @opentime.RationalTime::new(value=1800.0, rate=29.97002997002997)
  assert_eq(t.to_timecode(drop_frame=None).unwrap(), "00:01:00;02")
  assert_eq(t.to_timecode(drop_frame=Some(false)).unwrap(), "00:01:00:00")
  assert_eq(t.to_timecode(drop_frame=Some(true)).unwrap(), "00:01:00;02")
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "00:01:00;02")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "00:01:00:00",
  )
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(true)).unwrap(),
    "00:01:00;02",
  )
  assert_eq(t.to_time_string().unwrap(), "00:01:00.06")
}

///|
test "codecs:77" {
  let t = @opentime.RationalTime::new(value=1800.0, rate=30.0)
  assert_eq(t.to_timecode(drop_frame=None).unwrap(), "00:01:00:00")
  assert_eq(t.to_timecode(drop_frame=Some(false)).unwrap(), "00:01:00:00")
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "00:01:00:00")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "00:01:00:00",
  )
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "00:01:00.0")
}

///|
test "codecs:78" {
  let t = @opentime.RationalTime::new(value=1800.0, rate=48.0)
  assert_eq(t.to_timecode(drop_frame=None).unwrap(), "00:00:37:24")
  assert_eq(t.to_timecode(drop_frame=Some(false)).unwrap(), "00:00:37:24")
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "00:00:37:24")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "00:00:37:24",
  )
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "00:00:37.5")
}

///|
test "codecs:79" {
  let t = @opentime.RationalTime::new(value=1800.0, rate=50.0)
  assert_eq(t.to_timecode(drop_frame=None).unwrap(), "00:00:36:00")
  assert_eq(t.to_timecode(drop_frame=Some(false)).unwrap(), "00:00:36:00")
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "00:00:36:00")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "00:00:36:00",
  )
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "00:00:36.0")
}

///|
test "codecs:80" {
  let t = @opentime.RationalTime::new(value=1800.0, rate=59.94)
  assert_eq(t.to_timecode(drop_frame=None).unwrap(), "00:00:30;00")
  assert_eq(t.to_timecode(drop_frame=Some(false)).unwrap(), "00:00:30:00")
  assert_eq(t.to_timecode(drop_frame=Some(true)).unwrap(), "00:00:30;00")
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "00:00:30;00")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "00:00:30:00",
  )
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(true)).unwrap(),
    "00:00:30;00",
  )
  assert_eq(t.to_time_string().unwrap(), "00:00:30.030030")
}

///|
test "codecs:81" {
  let t = @opentime.RationalTime::new(value=1800.0, rate=59.94005994005994)
  assert_eq(t.to_timecode(drop_frame=None).unwrap(), "00:00:30;00")
  assert_eq(t.to_timecode(drop_frame=Some(false)).unwrap(), "00:00:30:00")
  assert_eq(t.to_timecode(drop_frame=Some(true)).unwrap(), "00:00:30;00")
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "00:00:30;00")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "00:00:30:00",
  )
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(true)).unwrap(),
    "00:00:30;00",
  )
  assert_eq(t.to_time_string().unwrap(), "00:00:30.03")
}

///|
test "codecs:82" {
  let t = @opentime.RationalTime::new(value=1800.0, rate=60.0)
  assert_eq(t.to_timecode(drop_frame=None).unwrap(), "00:00:30:00")
  assert_eq(t.to_timecode(drop_frame=Some(false)).unwrap(), "00:00:30:00")
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "00:00:30:00")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "00:00:30:00",
  )
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "00:00:30.0")
}

///|
test "codecs:83" {
  let t = @opentime.RationalTime::new(value=1800.0, rate=120.0)
  assert_true(t.to_timecode(drop_frame=None) is Err(_))
  assert_true(t.to_timecode(drop_frame=Some(false)) is Err(_))
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "00:00:15:00")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "00:00:15:00",
  )
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "00:00:15.0")
}

///|
test "codecs:84" {
  let t = @opentime.RationalTime::new(value=18000.0, rate=12.0)
  assert_true(t.to_timecode(drop_frame=None) is Err(_))
  assert_true(t.to_timecode(drop_frame=Some(false)) is Err(_))
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "00:24:58:12")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "00:24:58:12",
  )
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "00:25:00.0")
}

///|
test "codecs:85" {
  let t = @opentime.RationalTime::new(value=18000.0, rate=23.976)
  assert_eq(t.to_timecode(drop_frame=None).unwrap(), "00:12:30:00")
  assert_eq(t.to_timecode(drop_frame=Some(false)).unwrap(), "00:12:30:00")
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "00:12:30:00")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "00:12:30:00",
  )
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "00:12:30.750750")
}

///|
test "codecs:86" {
  let t = @opentime.RationalTime::new(value=18000.0, rate=23.976023976023978)
  assert_eq(t.to_timecode(drop_frame=None).unwrap(), "00:12:30:00")
  assert_eq(t.to_timecode(drop_frame=Some(false)).unwrap(), "00:12:30:00")
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "00:12:30:00")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "00:12:30:00",
  )
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "00:12:30.75")
}

///|
test "codecs:87" {
  let t = @opentime.RationalTime::new(value=18000.0, rate=24.0)
  assert_eq(t.to_timecode(drop_frame=None).unwrap(), "00:12:30:00")
  assert_eq(t.to_timecode(drop_frame=Some(false)).unwrap(), "00:12:30:00")
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "00:12:30:00")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "00:12:30:00",
  )
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "00:12:30.0")
}

///|
test "codecs:88" {
  let t = @opentime.RationalTime::new(value=18000.0, rate=25.0)
  assert_eq(t.to_timecode(drop_frame=None).unwrap(), "00:12:00:00")
  assert_eq(t.to_timecode(drop_frame=Some(false)).unwrap(), "00:12:00:00")
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "00:12:00:00")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "00:12:00:00",
  )
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "00:12:00.0")
}

///|
test "codecs:89" {
  let t = @opentime.RationalTime::new(value=18000.0, rate=29.97)
  assert_eq(t.to_timecode(drop_frame=None).unwrap(), "00:10:00;18")
  assert_eq(t.to_timecode(drop_frame=Some(false)).unwrap(), "00:10:00:00")
  assert_eq(t.to_timecode(drop_frame=Some(true)).unwrap(), "00:10:00;18")
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "00:10:00;18")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "00:10:00:00",
  )
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(true)).unwrap(),
    "00:10:00;18",
  )
  assert_eq(t.to_time_string().unwrap(), "00:10:00.600600")
}

///|
test "codecs:90" {
  let t = @opentime.RationalTime::new(value=18000.0, rate=29.97002997002997)
  assert_eq(t.to_timecode(drop_frame=None).unwrap(), "00:10:00;18")
  assert_eq(t.to_timecode(drop_frame=Some(false)).unwrap(), "00:10:00:00")
  assert_eq(t.to_timecode(drop_frame=Some(true)).unwrap(), "00:10:00;18")
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "00:10:00;18")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "00:10:00:00",
  )
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(true)).unwrap(),
    "00:10:00;18",
  )
  assert_eq(t.to_time_string().unwrap(), "00:10:00.6")
}

///|
test "codecs:91" {
  let t = @opentime.RationalTime::new(value=18000.0, rate=30.0)
  assert_eq(t.to_timecode(drop_frame=None).unwrap(), "00:10:00:00")
  assert_eq(t.to_timecode(drop_frame=Some(false)).unwrap(), "00:10:00:00")
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "00:10:00:00")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "00:10:00:00",
  )
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "00:10:00.0")
}

///|
test "codecs:92" {
  let t = @opentime.RationalTime::new(value=18000.0, rate=48.0)
  assert_eq(t.to_timecode(drop_frame=None).unwrap(), "00:06:15:00")
  assert_eq(t.to_timecode(drop_frame=Some(false)).unwrap(), "00:06:15:00")
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "00:06:15:00")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "00:06:15:00",
  )
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "00:06:15.0")
}

///|
test "codecs:93" {
  let t = @opentime.RationalTime::new(value=18000.0, rate=50.0)
  assert_eq(t.to_timecode(drop_frame=None).unwrap(), "00:06:00:00")
  assert_eq(t.to_timecode(drop_frame=Some(false)).unwrap(), "00:06:00:00")
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "00:06:00:00")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "00:06:00:00",
  )
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "00:06:00.0")
}

///|
test "codecs:94" {
  let t = @opentime.RationalTime::new(value=18000.0, rate=59.94)
  assert_eq(t.to_timecode(drop_frame=None).unwrap(), "00:05:00;20")
  assert_eq(t.to_timecode(drop_frame=Some(false)).unwrap(), "00:05:00:00")
  assert_eq(t.to_timecode(drop_frame=Some(true)).unwrap(), "00:05:00;20")
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "00:05:00;20")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "00:05:00:00",
  )
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(true)).unwrap(),
    "00:05:00;20",
  )
  assert_eq(t.to_time_string().unwrap(), "00:05:00.300300")
}

///|
test "codecs:95" {
  let t = @opentime.RationalTime::new(value=18000.0, rate=59.94005994005994)
  assert_eq(t.to_timecode(drop_frame=None).unwrap(), "00:05:00;20")
  assert_eq(t.to_timecode(drop_frame=Some(false)).unwrap(), "00:05:00:00")
  assert_eq(t.to_timecode(drop_frame=Some(true)).unwrap(), "00:05:00;20")
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "00:05:00;20")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "00:05:00:00",
  )
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(true)).unwrap(),
    "00:05:00;20",
  )
  assert_eq(t.to_time_string().unwrap(), "00:05:00.3")
}

///|
test "codecs:96" {
  let t = @opentime.RationalTime::new(value=18000.0, rate=60.0)
  assert_eq(t.to_timecode(drop_frame=None).unwrap(), "00:05:00:00")
  assert_eq(t.to_timecode(drop_frame=Some(false)).unwrap(), "00:05:00:00")
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "00:05:00:00")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "00:05:00:00",
  )
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "00:05:00.0")
}

///|
test "codecs:97" {
  let t = @opentime.RationalTime::new(value=18000.0, rate=120.0)
  assert_true(t.to_timecode(drop_frame=None) is Err(_))
  assert_true(t.to_timecode(drop_frame=Some(false)) is Err(_))
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "00:02:30:00")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "00:02:30:00",
  )
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "00:02:30.0")
}

///|
test "codecs:98" {
  let t = @opentime.RationalTime::new(value=2073601.0, rate=12.0)
  assert_true(t.to_timecode(drop_frame=None) is Err(_))
  assert_true(t.to_timecode(drop_frame=Some(false)) is Err(_))
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "23:57:07:10")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "23:57:07:10",
  )
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "00:00:00.083333")
}

///|
test "codecs:99" {
  let t = @opentime.RationalTime::new(value=2073601.0, rate=23.976)
  assert_eq(t.to_timecode(drop_frame=None).unwrap(), "00:00:00:01")
  assert_eq(t.to_timecode(drop_frame=Some(false)).unwrap(), "00:00:00:01")
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "00:00:00:03")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "00:00:00:03",
  )
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "00:01:26.528194")
}

///|
test "codecs:100" {
  let t = @opentime.RationalTime::new(value=2073601.0, rate=23.976023976023978)
  assert_eq(t.to_timecode(drop_frame=None).unwrap(), "00:00:00:01")
  assert_eq(t.to_timecode(drop_frame=Some(false)).unwrap(), "00:00:00:01")
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "00:00:00:01")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "00:00:00:01",
  )
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "00:01:26.441708")
}

///|
test "codecs:101" {
  let t = @opentime.RationalTime::new(value=2073601.0, rate=24.0)
  assert_eq(t.to_timecode(drop_frame=None).unwrap(), "00:00:00:01")
  assert_eq(t.to_timecode(drop_frame=Some(false)).unwrap(), "00:00:00:01")
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "00:00:00:01")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "00:00:00:01",
  )
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "00:00:00.041666")
}

///|
test "codecs:102" {
  let t = @opentime.RationalTime::new(value=2073601.0, rate=25.0)
  assert_eq(t.to_timecode(drop_frame=None).unwrap(), "23:02:24:01")
  assert_eq(t.to_timecode(drop_frame=Some(false)).unwrap(), "23:02:24:01")
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "23:02:24:01")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "23:02:24:01",
  )
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "23:02:24.04")
}

///|
test "codecs:103" {
  let t = @opentime.RationalTime::new(value=2073601.0, rate=29.97)
  assert_eq(t.to_timecode(drop_frame=None).unwrap(), "19:13:09;07")
  assert_eq(t.to_timecode(drop_frame=Some(false)).unwrap(), "19:12:00:01")
  assert_eq(t.to_timecode(drop_frame=Some(true)).unwrap(), "19:13:09;07")
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "19:13:09;09")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "19:12:00:03",
  )
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(true)).unwrap(),
    "19:13:09;09",
  )
  assert_eq(t.to_time_string().unwrap(), "19:13:09.222555")
}

///|
test "codecs:104" {
  let t = @opentime.RationalTime::new(value=2073601.0, rate=29.97002997002997)
  assert_eq(t.to_timecode(drop_frame=None).unwrap(), "19:13:09;07")
  assert_eq(t.to_timecode(drop_frame=Some(false)).unwrap(), "19:12:00:01")
  assert_eq(t.to_timecode(drop_frame=Some(true)).unwrap(), "19:13:09;07")
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "19:13:09;07")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "19:12:00:01",
  )
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(true)).unwrap(),
    "19:13:09;07",
  )
  assert_eq(t.to_time_string().unwrap(), "19:13:09.153366")
}

///|
test "codecs:105" {
  let t = @opentime.RationalTime::new(value=2073601.0, rate=30.0)
  assert_eq(t.to_timecode(drop_frame=None).unwrap(), "19:12:00:01")
  assert_eq(t.to_timecode(drop_frame=Some(false)).unwrap(), "19:12:00:01")
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "19:12:00:01")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "19:12:00:01",
  )
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "19:12:00.033333")
}

///|
test "codecs:106" {
  let t = @opentime.RationalTime::new(value=2073601.0, rate=48.0)
  assert_eq(t.to_timecode(drop_frame=None).unwrap(), "12:00:00:01")
  assert_eq(t.to_timecode(drop_frame=Some(false)).unwrap(), "12:00:00:01")
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "12:00:00:01")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "12:00:00:01",
  )
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "12:00:00.020833")
}

///|
test "codecs:107" {
  let t = @opentime.RationalTime::new(value=2073601.0, rate=50.0)
  assert_eq(t.to_timecode(drop_frame=None).unwrap(), "11:31:12:01")
  assert_eq(t.to_timecode(drop_frame=Some(false)).unwrap(), "11:31:12:01")
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "11:31:12:01")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "11:31:12:01",
  )
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "11:31:12.02")
}

///|
test "codecs:108" {
  let t = @opentime.RationalTime::new(value=2073601.0, rate=59.94)
  assert_eq(t.to_timecode(drop_frame=None).unwrap(), "09:36:34;37")
  assert_eq(t.to_timecode(drop_frame=Some(false)).unwrap(), "09:36:00:01")
  assert_eq(t.to_timecode(drop_frame=Some(true)).unwrap(), "09:36:34;37")
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "09:36:34;39")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "09:36:00:03",
  )
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(true)).unwrap(),
    "09:36:34;39",
  )
  assert_eq(t.to_time_string().unwrap(), "09:36:34.611277")
}

///|
test "codecs:109" {
  let t = @opentime.RationalTime::new(value=2073601.0, rate=59.94005994005994)
  assert_eq(t.to_timecode(drop_frame=None).unwrap(), "09:36:34;37")
  assert_eq(t.to_timecode(drop_frame=Some(false)).unwrap(), "09:36:00:01")
  assert_eq(t.to_timecode(drop_frame=Some(true)).unwrap(), "09:36:34;37")
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "09:36:34;37")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "09:36:00:01",
  )
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(true)).unwrap(),
    "09:36:34;37",
  )
  assert_eq(t.to_time_string().unwrap(), "09:36:34.576683")
}

///|
test "codecs:110" {
  let t = @opentime.RationalTime::new(value=2073601.0, rate=60.0)
  assert_eq(t.to_timecode(drop_frame=None).unwrap(), "09:36:00:01")
  assert_eq(t.to_timecode(drop_frame=Some(false)).unwrap(), "09:36:00:01")
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "09:36:00:01")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "09:36:00:01",
  )
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "09:36:00.016666")
}

///|
test "codecs:111" {
  let t = @opentime.RationalTime::new(value=2073601.0, rate=120.0)
  assert_true(t.to_timecode(drop_frame=None) is Err(_))
  assert_true(t.to_timecode(drop_frame=Some(false)) is Err(_))
  assert_true(t.to_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_nearest_timecode(drop_frame=None).unwrap(), "04:48:00:00")
  assert_eq(
    t.to_nearest_timecode(drop_frame=Some(false)).unwrap(),
    "04:48:00:00",
  )
  assert_true(t.to_nearest_timecode(drop_frame=Some(true)) is Err(_))
  assert_eq(t.to_time_string().unwrap(), "04:48:00.008333")
}

///|
test "codecs:from_timecode-0" {
  assert_true(@opentime.from_timecode("", 0.0) is Err(_))
}

///|
test "codecs:from_timecode-1" {
  assert_true(@opentime.from_timecode("", -1.0) is Err(_))
}

///|
test "codecs:from_timecode-2" {
  assert_true(@opentime.from_timecode("", 24.0) is Err(_))
}

///|
test "codecs:from_timecode-3" {
  assert_true(@opentime.from_timecode("", 29.97) is Err(_))
}

///|
test "codecs:from_timecode-4" {
  assert_true(@opentime.from_timecode("", 60.0) is Err(_))
}

///|
test "codecs:from_timecode-5" {
  assert_true(@opentime.from_timecode("garbage", 0.0) is Err(_))
}

///|
test "codecs:from_timecode-6" {
  assert_true(@opentime.from_timecode("garbage", -1.0) is Err(_))
}

///|
test "codecs:from_timecode-7" {
  assert_true(@opentime.from_timecode("garbage", 24.0) is Err(_))
}

///|
test "codecs:from_timecode-8" {
  assert_true(@opentime.from_timecode("garbage", 29.97) is Err(_))
}

///|
test "codecs:from_timecode-9" {
  assert_true(@opentime.from_timecode("garbage", 60.0) is Err(_))
}

///|
test "codecs:from_timecode-10" {
  assert_true(@opentime.from_timecode("00:00:00:00", 0.0) is Err(_))
}

///|
test "codecs:from_timecode-11" {
  assert_true(@opentime.from_timecode("00:00:00:00", -1.0) is Err(_))
}

///|
test "codecs:from_timecode-12" {
  let actual = @opentime.from_timecode("00:00:00:00", 24.0).unwrap()
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
}

///|
test "codecs:from_timecode-13" {
  assert_true(@opentime.from_timecode("00:00:00:00", 29.97) is Err(_))
}

///|
test "codecs:from_timecode-14" {
  let actual = @opentime.from_timecode("00:00:00:00", 60.0).unwrap()
  api_number(actual.value, 0.0)
  api_number(actual.rate, 60.0)
}

///|
test "codecs:from_timecode-15" {
  assert_true(@opentime.from_timecode("00:01:00;00", 0.0) is Err(_))
}

///|
test "codecs:from_timecode-16" {
  assert_true(@opentime.from_timecode("00:01:00;00", -1.0) is Err(_))
}

///|
test "codecs:from_timecode-17" {
  assert_true(@opentime.from_timecode("00:01:00;00", 24.0) is Err(_))
}

///|
test "codecs:from_timecode-18" {
  assert_true(@opentime.from_timecode("00:01:00;00", 29.97) is Err(_))
}

///|
test "codecs:from_timecode-19" {
  assert_true(@opentime.from_timecode("00:01:00;00", 60.0) is Err(_))
}

///|
test "codecs:from_timecode-20" {
  assert_true(@opentime.from_timecode("00:01:00;02", 0.0) is Err(_))
}

///|
test "codecs:from_timecode-21" {
  assert_true(@opentime.from_timecode("00:01:00;02", -1.0) is Err(_))
}

///|
test "codecs:from_timecode-22" {
  assert_true(@opentime.from_timecode("00:01:00;02", 24.0) is Err(_))
}

///|
test "codecs:from_timecode-23" {
  assert_true(@opentime.from_timecode("00:01:00;02", 29.97) is Err(_))
}

///|
test "codecs:from_timecode-24" {
  assert_true(@opentime.from_timecode("00:01:00;02", 60.0) is Err(_))
}

///|
test "codecs:from_timecode-25" {
  assert_true(@opentime.from_timecode("01:02:03:04", 0.0) is Err(_))
}

///|
test "codecs:from_timecode-26" {
  assert_true(@opentime.from_timecode("01:02:03:04", -1.0) is Err(_))
}

///|
test "codecs:from_timecode-27" {
  let actual = @opentime.from_timecode("01:02:03:04", 24.0).unwrap()
  api_number(actual.value, 89356.0)
  api_number(actual.rate, 24.0)
}

///|
test "codecs:from_timecode-28" {
  assert_true(@opentime.from_timecode("01:02:03:04", 29.97) is Err(_))
}

///|
test "codecs:from_timecode-29" {
  let actual = @opentime.from_timecode("01:02:03:04", 60.0).unwrap()
  api_number(actual.value, 223384.0)
  api_number(actual.rate, 60.0)
}

///|
test "codecs:from_timecode-30" {
  assert_true(@opentime.from_timecode("99:99:99:99", 0.0) is Err(_))
}

///|
test "codecs:from_timecode-31" {
  assert_true(@opentime.from_timecode("99:99:99:99", -1.0) is Err(_))
}

///|
test "codecs:from_timecode-32" {
  assert_true(@opentime.from_timecode("99:99:99:99", 24.0) is Err(_))
}

///|
test "codecs:from_timecode-33" {
  assert_true(@opentime.from_timecode("99:99:99:99", 29.97) is Err(_))
}

///|
test "codecs:from_timecode-34" {
  assert_true(@opentime.from_timecode("99:99:99:99", 60.0) is Err(_))
}

///|
test "codecs:from_timecode-35" {
  assert_true(@opentime.from_timecode("-01:00:00:00", 0.0) is Err(_))
}

///|
test "codecs:from_timecode-36" {
  assert_true(@opentime.from_timecode("-01:00:00:00", -1.0) is Err(_))
}

///|
test "codecs:from_timecode-37" {
  assert_true(@opentime.from_timecode("-01:00:00:00", 24.0) is Err(_))
}

///|
test "codecs:from_timecode-38" {
  assert_true(@opentime.from_timecode("-01:00:00:00", 29.97) is Err(_))
}

///|
test "codecs:from_timecode-39" {
  assert_true(@opentime.from_timecode("-01:00:00:00", 60.0) is Err(_))
}

///|
test "codecs:from_timecode-40" {
  assert_true(@opentime.from_timecode("1:2:3:4", 0.0) is Err(_))
}

///|
test "codecs:from_timecode-41" {
  assert_true(@opentime.from_timecode("1:2:3:4", -1.0) is Err(_))
}

///|
test "codecs:from_timecode-42" {
  assert_true(@opentime.from_timecode("1:2:3:4", 24.0) is Err(_))
}

///|
test "codecs:from_timecode-43" {
  assert_true(@opentime.from_timecode("1:2:3:4", 29.97) is Err(_))
}

///|
test "codecs:from_timecode-44" {
  assert_true(@opentime.from_timecode("1:2:3:4", 60.0) is Err(_))
}

///|
test "codecs:from_timecode-45" {
  assert_true(@opentime.from_timecode("00:00:00.00", 0.0) is Err(_))
}

///|
test "codecs:from_timecode-46" {
  assert_true(@opentime.from_timecode("00:00:00.00", -1.0) is Err(_))
}

///|
test "codecs:from_timecode-47" {
  let actual = @opentime.from_timecode("00:00:00.00", 24.0).unwrap()
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
}

///|
test "codecs:from_timecode-48" {
  assert_true(@opentime.from_timecode("00:00:00.00", 29.97) is Err(_))
}

///|
test "codecs:from_timecode-49" {
  let actual = @opentime.from_timecode("00:00:00.00", 60.0).unwrap()
  api_number(actual.value, 0.0)
  api_number(actual.rate, 60.0)
}

///|
test "codecs:from_timecode-50" {
  assert_true(@opentime.from_timecode("00:00:00:24", 0.0) is Err(_))
}

///|
test "codecs:from_timecode-51" {
  assert_true(@opentime.from_timecode("00:00:00:24", -1.0) is Err(_))
}

///|
test "codecs:from_timecode-52" {
  assert_true(@opentime.from_timecode("00:00:00:24", 24.0) is Err(_))
}

///|
test "codecs:from_timecode-53" {
  assert_true(@opentime.from_timecode("00:00:00:24", 29.97) is Err(_))
}

///|
test "codecs:from_timecode-54" {
  let actual = @opentime.from_timecode("00:00:00:24", 60.0).unwrap()
  api_number(actual.value, 24.0)
  api_number(actual.rate, 60.0)
}

///|
test "codecs:from_time_string-0" {
  let actual = @opentime.from_time_string("", 0.0).unwrap()
  api_number(actual.value, 0.0)
  api_number(actual.rate, 0.0)
}

///|
test "codecs:from_time_string-1" {
  assert_true(@opentime.from_time_string("", -1.0) is Err(_))
}

///|
test "codecs:from_time_string-2" {
  let actual = @opentime.from_time_string("", 24.0).unwrap()
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
}

///|
test "codecs:from_time_string-3" {
  assert_true(@opentime.from_time_string("", 29.97) is Err(_))
}

///|
test "codecs:from_time_string-4" {
  let actual = @opentime.from_time_string("", 60.0).unwrap()
  api_number(actual.value, 0.0)
  api_number(actual.rate, 60.0)
}

///|
test "codecs:from_time_string-5" {
  assert_true(@opentime.from_time_string("garbage", 0.0) is Err(_))
}

///|
test "codecs:from_time_string-6" {
  assert_true(@opentime.from_time_string("garbage", -1.0) is Err(_))
}

///|
test "codecs:from_time_string-7" {
  assert_true(@opentime.from_time_string("garbage", 24.0) is Err(_))
}

///|
test "codecs:from_time_string-8" {
  assert_true(@opentime.from_time_string("garbage", 29.97) is Err(_))
}

///|
test "codecs:from_time_string-9" {
  assert_true(@opentime.from_time_string("garbage", 60.0) is Err(_))
}

///|
test "codecs:from_time_string-10" {
  let actual = @opentime.from_time_string("0", 0.0).unwrap()
  api_number(actual.value, 0.0)
  api_number(actual.rate, 0.0)
}

///|
test "codecs:from_time_string-11" {
  assert_true(@opentime.from_time_string("0", -1.0) is Err(_))
}

///|
test "codecs:from_time_string-12" {
  let actual = @opentime.from_time_string("0", 24.0).unwrap()
  api_number(actual.value, 0.0)
  api_number(actual.rate, 24.0)
}

///|
test "codecs:from_time_string-13" {
  assert_true(@opentime.from_time_string("0", 29.97) is Err(_))
}

///|
test "codecs:from_time_string-14" {
  let actual = @opentime.from_time_string("0", 60.0).unwrap()
  api_number(actual.value, 0.0)
  api_number(actual.rate, 60.0)
}

///|
test "codecs:from_time_string-15" {
  let actual = @opentime.from_time_string("1.5", 0.0).unwrap()
  api_number(actual.value, 0.0)
  api_number(actual.rate, 0.0)
}

///|
test "codecs:from_time_string-16" {
  assert_true(@opentime.from_time_string("1.5", -1.0) is Err(_))
}

///|
test "codecs:from_time_string-17" {
  let actual = @opentime.from_time_string("1.5", 24.0).unwrap()
  api_number(actual.value, 36.0)
  api_number(actual.rate, 24.0)
}

///|
test "codecs:from_time_string-18" {
  assert_true(@opentime.from_time_string("1.5", 29.97) is Err(_))
}

///|
test "codecs:from_time_string-19" {
  let actual = @opentime.from_time_string("1.5", 60.0).unwrap()
  api_number(actual.value, 90.0)
  api_number(actual.rate, 60.0)
}

///|
test "codecs:from_time_string-20" {
  let actual = @opentime.from_time_string("01:02", 0.0).unwrap()
  api_number(actual.value, 0.0)
  api_number(actual.rate, 0.0)
}

///|
test "codecs:from_time_string-21" {
  assert_true(@opentime.from_time_string("01:02", -1.0) is Err(_))
}

///|
test "codecs:from_time_string-22" {
  let actual = @opentime.from_time_string("01:02", 24.0).unwrap()
  api_number(actual.value, 1488.0)
  api_number(actual.rate, 24.0)
}

///|
test "codecs:from_time_string-23" {
  assert_true(@opentime.from_time_string("01:02", 29.97) is Err(_))
}

///|
test "codecs:from_time_string-24" {
  let actual = @opentime.from_time_string("01:02", 60.0).unwrap()
  api_number(actual.value, 3720.0)
  api_number(actual.rate, 60.0)
}

///|
test "codecs:from_time_string-25" {
  let actual = @opentime.from_time_string("01:02:03.456", 0.0).unwrap()
  api_number(actual.value, 0.0)
  api_number(actual.rate, 0.0)
}

///|
test "codecs:from_time_string-26" {
  assert_true(@opentime.from_time_string("01:02:03.456", -1.0) is Err(_))
}

///|
test "codecs:from_time_string-27" {
  let actual = @opentime.from_time_string("01:02:03.456", 24.0).unwrap()
  api_number(actual.value, 89362.944)
  api_number(actual.rate, 24.0)
}

///|
test "codecs:from_time_string-28" {
  assert_true(@opentime.from_time_string("01:02:03.456", 29.97) is Err(_))
}

///|
test "codecs:from_time_string-29" {
  let actual = @opentime.from_time_string("01:02:03.456", 60.0).unwrap()
  api_number(actual.value, 223407.36000000002)
  api_number(actual.rate, 60.0)
}

///|
test "codecs:from_time_string-30" {
  assert_true(@opentime.from_time_string("-01:00:00", 0.0) is Err(_))
}

///|
test "codecs:from_time_string-31" {
  assert_true(@opentime.from_time_string("-01:00:00", -1.0) is Err(_))
}

///|
test "codecs:from_time_string-32" {
  assert_true(@opentime.from_time_string("-01:00:00", 24.0) is Err(_))
}

///|
test "codecs:from_time_string-33" {
  assert_true(@opentime.from_time_string("-01:00:00", 29.97) is Err(_))
}

///|
test "codecs:from_time_string-34" {
  assert_true(@opentime.from_time_string("-01:00:00", 60.0) is Err(_))
}

///|
test "codecs:from_time_string-35" {
  assert_true(@opentime.from_time_string("99:99:99", 0.0) is Err(_))
}

///|
test "codecs:from_time_string-36" {
  assert_true(@opentime.from_time_string("99:99:99", -1.0) is Err(_))
}

///|
test "codecs:from_time_string-37" {
  assert_true(@opentime.from_time_string("99:99:99", 24.0) is Err(_))
}

///|
test "codecs:from_time_string-38" {
  assert_true(@opentime.from_time_string("99:99:99", 29.97) is Err(_))
}

///|
test "codecs:from_time_string-39" {
  assert_true(@opentime.from_time_string("99:99:99", 60.0) is Err(_))
}

///|
test "codecs:from_time_string-40" {
  assert_true(@opentime.from_time_string("00:00:60", 0.0) is Err(_))
}

///|
test "codecs:from_time_string-41" {
  assert_true(@opentime.from_time_string("00:00:60", -1.0) is Err(_))
}

///|
test "codecs:from_time_string-42" {
  assert_true(@opentime.from_time_string("00:00:60", 24.0) is Err(_))
}

///|
test "codecs:from_time_string-43" {
  assert_true(@opentime.from_time_string("00:00:60", 29.97) is Err(_))
}

///|
test "codecs:from_time_string-44" {
  assert_true(@opentime.from_time_string("00:00:60", 60.0) is Err(_))
}

///|
test "codecs:from_time_string-45" {
  let actual = @opentime.from_time_string("1:2:3", 0.0).unwrap()
  api_number(actual.value, 0.0)
  api_number(actual.rate, 0.0)
}

///|
test "codecs:from_time_string-46" {
  assert_true(@opentime.from_time_string("1:2:3", -1.0) is Err(_))
}

///|
test "codecs:from_time_string-47" {
  let actual = @opentime.from_time_string("1:2:3", 24.0).unwrap()
  api_number(actual.value, 89352.0)
  api_number(actual.rate, 24.0)
}

///|
test "codecs:from_time_string-48" {
  assert_true(@opentime.from_time_string("1:2:3", 29.97) is Err(_))
}

///|
test "codecs:from_time_string-49" {
  let actual = @opentime.from_time_string("1:2:3", 60.0).unwrap()
  api_number(actual.value, 223380.0)
  api_number(actual.rate, 60.0)
}

///|
test "codecs:from_time_string-50" {
  let actual = @opentime.from_time_string("00:00:00.0000001", 0.0).unwrap()
  api_number(actual.value, 0.0)
  api_number(actual.rate, 0.0)
}

///|
test "codecs:from_time_string-51" {
  assert_true(@opentime.from_time_string("00:00:00.0000001", -1.0) is Err(_))
}

///|
test "codecs:from_time_string-52" {
  let actual = @opentime.from_time_string("00:00:00.0000001", 24.0).unwrap()
  api_number(actual.value, 2.400000000000001e-06)
  api_number(actual.rate, 24.0)
}

///|
test "codecs:from_time_string-53" {
  assert_true(@opentime.from_time_string("00:00:00.0000001", 29.97) is Err(_))
}

///|
test "codecs:from_time_string-54" {
  let actual = @opentime.from_time_string("00:00:00.0000001", 60.0).unwrap()
  api_number(actual.value, 6.000000000000003e-06)
  api_number(actual.rate, 60.0)
}
