///|
pub struct ImageSequence {
  priv object : Object
}

///|
fn number(object : Object, key : String) -> Result[Double, String] {
  match object.get(key) {
    Some(Number(n, ..)) =>
      if n.is_inf() || n.is_nan() {
        Err("invalid_number:" + key)
      } else {
        Ok(n)
      }
    _ => Err("missing_number:" + key)
  }
}

///|
fn integer(object : Object, key : String) -> Result[Int32, String] {
  let n = match number(object, key) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  if n < -2147483647.0 || n > 2147483647.0 || n.to_int().to_double() != n {
    Err("invalid_integer:" + key)
  } else {
    Ok(n.to_int())
  }
}

///|
fn text(object : Object, key : String) -> Result[String, String] {
  match object.get(key) {
    Some(String(s)) => Ok(s)
    _ => Err("missing_string:" + key)
  }
}

///|
pub fn ImageSequence::from_object(
  object : Object,
) -> Result[ImageSequence, String] {
  if object.schema_name() != "ImageSequenceReference" {
    return Err("not_an_image_sequence")
  }
  for key in ["start_frame", "frame_step", "frame_zero_padding"] {
    match integer(object, key) {
      Err(e) => return Err(e)
      _ => ()
    }
  }
  for key in ["target_url_base", "name_prefix", "name_suffix"] {
    match text(object, key) {
      Err(e) => return Err(e)
      _ => ()
    }
  }
  let rate = match number(object, "rate") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  if rate <= 0.0 ||
    integer(object, "frame_step").unwrap() <= 0 ||
    integer(object, "frame_zero_padding").unwrap() < 0 ||
    integer(object, "frame_zero_padding").unwrap() > 1024 {
    return Err("invalid_sequence_parameters")
  }
  match text(object, "missing_frame_policy") {
    Ok("error") | Ok("hold") | Ok("black") => ()
    _ => return Err("invalid_missing_frame_policy")
  }
  match object.get("available_range") {
    None | Some(Null) => ()
    Some(j) => {
      let r = match parse_range(j) {
        Ok(v) => v
        Err(e) => return Err(e)
      }
      let n = match
        r
        .duration()
        .to_frames(
          rate=rate / integer(object, "frame_step").unwrap().to_double(),
        ) {
        Ok(v) => v
        Err(_) => return Err("frame_overflow")
      }
      if n > 2147483647.0 {
        return Err("frame_overflow")
      }
    }
  }
  Ok({ object, })
}

///|
pub fn ImageSequence::to_object(self : ImageSequence) -> Object {
  self.object
}

///|
pub fn ImageSequence::abstract_target_url(
  self : ImageSequence,
  symbol : String,
) -> String {
  let base = text(self.object, "target_url_base").unwrap()
  base +
  (if base != "" && !base.has_suffix("/") { "/" } else { "" }) +
  text(self.object, "name_prefix").unwrap() +
  symbol +
  text(self.object, "name_suffix").unwrap()
}

///|
pub fn ImageSequence::frame_range(
  self : ImageSequence,
  range : @range.TimeRange,
) -> Result[(Double, Double), String] {
  let end = match range.end_time_inclusive() {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let first = match self.frame_for_time(range.start()) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  match self.frame_for_time(end) {
    Ok(last) => Ok((first, last))
    Err(e) => Err(e)
  }
}

///|
pub fn ImageSequence::available_range(
  self : ImageSequence,
) -> Result[@range.TimeRange, String] {
  match self.object.get("available_range") {
    Some(j) => parse_range(j)
    _ => Err("unknown_available_range")
  }
}

///|
pub fn ImageSequence::frame_duration(
  self : ImageSequence,
) -> @time.RationalTime {
  @time.RationalTime::new(
    integer(self.object, "frame_step").unwrap().to_double(),
    number(self.object, "rate").unwrap(),
  ).unwrap()
}

///|
pub fn ImageSequence::number_of_images(self : ImageSequence) -> Int32 {
  match self.available_range() {
    Ok(r) =>
      r
      .duration()
      .to_frames(
        rate=number(self.object, "rate").unwrap() /
          integer(self.object, "frame_step").unwrap().to_double(),
      )
      .unwrap()
      .to_int()
    Err(_) => 0
  }
}

///|
pub fn ImageSequence::end_frame(self : ImageSequence) -> Result[Double, String] {
  let start = integer(self.object, "start_frame").unwrap().to_double()
  match self.available_range() {
    Ok(r) =>
      match r.duration().to_frames(rate=number(self.object, "rate").unwrap()) {
        Ok(n) => Ok(start + n - 1.0)
        Err(_) => Err("frame_overflow")
      }
    Err(_) => Ok(start)
  }
}

///|
pub fn ImageSequence::frame_for_time(
  self : ImageSequence,
  time : @time.RationalTime,
) -> Result[Double, String] {
  let available = match self.available_range() {
    Ok(r) => r
    Err(e) => return Err(e)
  }
  if !(match available.contains(time) {
      Ok(v) => v
      Err(e) => return Err(e)
    }) {
    return Err("outside_sequence")
  }
  let delta = match time.subtract(available.start()) {
    Ok(v) => v
    Err(_) => return Err("time_overflow")
  }
  match delta.to_frames(rate=number(self.object, "rate").unwrap()) {
    Ok(n) => Ok(integer(self.object, "start_frame").unwrap().to_double() + n)
    Err(_) => Err("frame_overflow")
  }
}

///|
pub fn ImageSequence::target_url(
  self : ImageSequence,
  index : Int32,
) -> Result[String, String] {
  if index < 0 || index >= self.number_of_images() {
    return Err("image_index")
  }
  let frame = integer(self.object, "start_frame").unwrap().to_double() +
    index.to_double() * integer(self.object, "frame_step").unwrap().to_double()
  if frame < -2147483647.0 || frame > 2147483647.0 {
    return Err("frame_overflow")
  }
  let digits = frame.abs().to_int().to_string()
  let out = StringBuilder()
  let base = text(self.object, "target_url_base").unwrap()
  out.write_string(base)
  if base != "" && !base.has_suffix("/") {
    out.write_char('/')
  }
  out.write_string(text(self.object, "name_prefix").unwrap())
  if frame < 0.0 {
    out.write_char('-')
  }
  for i = digits.length()
      i < integer(self.object, "frame_zero_padding").unwrap()
      i = i + 1 {
    out.write_char('0')
  }
  out.write_string(digits)
  out.write_string(text(self.object, "name_suffix").unwrap())
  Ok(out.to_string())
}

///|
pub fn ImageSequence::presentation_time(
  self : ImageSequence,
  index : Int32,
) -> Result[@time.RationalTime, String] {
  if index < 0 || index >= self.number_of_images() {
    return Err("image_index")
  }
  let available = match self.available_range() {
    Ok(r) => r
    Err(e) => return Err(e)
  }
  match
    self
    .frame_duration()
    .multiply(index.to_double())
    .unwrap()
    .add(available.start()) {
    Ok(t) => Ok(t)
    Err(_) => Err("time_overflow")
  }
}

///|
pub fn Object::active_media(self : Object) -> Result[Object, String] {
  if self.schema_name() != "Clip" {
    return Err("not_a_clip")
  }
  let key = match text(self, "active_media_reference_key") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  match self.get("media_references") {
    Some(Object(m)) =>
      match m.get(key) {
        Some(v) => Object::from_json(v)
        None => Err("missing_active_media")
      }
    _ => Err("invalid_media_map")
  }
}

///|
pub fn Object::with_media_references(
  self : Object,
  media : Map[String, Object],
  active : String,
) -> Result[Object, String] {
  if self.schema_name() != "Clip" {
    return Err("not_a_clip")
  }
  if media.contains("") || !media.contains(active) {
    return Err("invalid_media_key")
  }
  let refs : Map[String, Json] = Map([])
  for key, obj in media {
    if ![
        "MediaReference", "ExternalReference", "MissingReference", "ImageSequenceReference",
        "GeneratorReference",
      ].contains(obj.schema_name()) &&
      !obj.is_unknown() {
      return Err("not_a_media_reference")
    }
    refs[key] = obj.to_json().unwrap()
  }
  let obj = self.with_field("media_references", Json::object(refs)).unwrap()
  obj.with_field("active_media_reference_key", Json::string(active))
}
