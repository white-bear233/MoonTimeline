///|
/// Typed view over a losslessly retained Transition.1 object.
pub(all) struct Transition {
  in_offset : @time.RationalTime
  out_offset : @time.RationalTime
}

///|
pub fn schema_name(raw : Json) -> String {
  match raw {
    Object(o) =>
      match o.get("OTIO_SCHEMA") {
        Some(String(s)) => s
        _ => ""
      }
    _ => ""
  }
}

///|
fn offset(raw : Json?) -> Result[@time.RationalTime, String] {
  match raw {
    Some(Object(o)) => {
      if schema_name(Json::object(o)) != "RationalTime.1" {
        return Err("invalid_transition_offset")
      }
      match (o.get("value"), o.get("rate")) {
        (Some(Number(v, ..)), Some(Number(r, ..))) => {
          if v < 0.0 {
            return Err("negative_transition_offset")
          }
          match @time.RationalTime::new(v, r) {
            Ok(t) =>
              match t.to_seconds() {
                Ok(_) => Ok(t)
                Err(_) => Err("invalid_transition_offset")
              }
            Err(_) => Err("invalid_transition_offset")
          }
        }
        _ => Err("invalid_transition_offset")
      }
    }
    _ => Err("invalid_transition_offset")
  }
}

///|
pub fn transition_of(item : Item) -> Result[Transition?, String] {
  match item {
    Opaque(Object(o)) => {
      if schema_name(Json::object(o)) != "Transition.1" {
        return Ok(None)
      }
      let a = match offset(o.get("in_offset")) {
        Ok(v) => v
        Err(e) => return Err(e)
      }
      let b = match offset(o.get("out_offset")) {
        Ok(v) => v
        Err(e) => return Err(e)
      }
      let sum = a.to_seconds().unwrap() + b.to_seconds().unwrap()
      if sum.is_inf() {
        return Err("transition_overflow")
      }
      Ok(Some({ in_offset: a, out_offset: b, }))
    }
    _ => Ok(None)
  }
}

///|
/// Playback slope, not a change to OTIO's presentation duration. Multiple
/// timing effects and unknown effects are preserved but cannot be evaluated.
pub fn Attributes::playback_scalar(self : Attributes) -> Result[Double, String] {
  let effects = match self.extra {
    Object(o) =>
      match o.get("effects") {
        None => return Ok(1.0)
        Some(Array(a)) => a
        _ => return Err("invalid_effects")
      }
    _ => return Err("invalid_attributes")
  }
  let mut scalar = 1.0
  let mut seen = false
  for effect in effects {
    let tag = schema_name(effect)
    if tag == "Effect.1" {
      continue
    }
    if tag != "LinearTimeWarp.1" && tag != "FreezeFrame.1" {
      return Err("unsupported_time_effect")
    }
    if seen {
      return Err("ambiguous_time_effects")
    }
    seen = true
    let value = match effect {
      Object(o) =>
        match o.get("time_scalar") {
          Some(Number(n, ..)) => n
          None => if tag == "FreezeFrame.1" { 0.0 } else { 1.0 }
          _ => return Err("invalid_time_scalar")
        }
      _ => return Err("invalid_time_effect")
    }
    if value.is_nan() || value.is_inf() {
      return Err("invalid_time_scalar")
    }
    if tag == "FreezeFrame.1" && value != 0.0 {
      return Err("invalid_freeze_frame")
    }
    scalar = value
  }
  Ok(scalar)
}

///|
pub fn Item::playback_scalar(self : Item) -> Result[Double, String] {
  match self {
    Clip(c) => c.attributes.playback_scalar()
    Gap(g) => g.attributes.playback_scalar()
    Stack(s) => s.attributes.playback_scalar()
    Track(t) => t.attributes.playback_scalar()
    Opaque(_) => Err("opaque_item")
  }
}

///|
/// Validate the continuous playback envelope, including transition handles.
/// The starting sample must be inside [available.start, available.end); an
/// exclusive end may meet the boundary. Reverse playback is anchored at start.
pub fn Clip::check_media_bounds(
  self : Clip,
  head : Double,
  tail : Double,
) -> Result[Unit, String] {
  if head.is_nan() ||
    head.is_inf() ||
    tail.is_nan() ||
    tail.is_inf() ||
    head < 0.0 ||
    tail < 0.0 {
    return Err("invalid_transition_handle")
  }
  let scalar = match self.attributes.playback_scalar() {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let source = match self.effective_range() {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let media = match self.active_media() {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let available = match media.available_range {
    Some(v) => v
    None => return Err("unknown_available_range")
  }
  let start = source.start().to_seconds().unwrap()
  let duration = source.duration().to_seconds().unwrap()
  let a = start - head * scalar
  let b = start + (duration + tail) * scalar
  if a.is_inf() || b.is_inf() || a.is_nan() || b.is_nan() {
    return Err("source_overflow")
  }
  let lo = available.start().to_seconds().unwrap()
  let hi = available.end_seconds()
  let epsilon = 1.0e-9
  if duration + head + tail > 0.0 &&
    (a < lo - epsilon || a >= hi || b < lo - epsilon || b > hi + epsilon) {
    Err("source_out_of_bounds")
  } else {
    Ok(())
  }
}
