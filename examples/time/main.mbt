///|
fn main {
  let time = @timeline_time.RationalTime::new(48.0, 24.0).unwrap()
  let converted = time.rescaled_to(30.0).unwrap()
  println("48 frames @ 24 fps = \{time.to_seconds().unwrap()} seconds")
  println("At 30 fps: \{converted.value()} frames")
  let half = @timeline_time.RationalTime::new(-1.5, 24.0).unwrap()
  println(
    "Round -1.5 away from zero: \{half.rounded_frames(24.0, NearestAway).unwrap()}",
  )
}
