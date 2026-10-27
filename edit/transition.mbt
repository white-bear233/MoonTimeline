///|
/// Update offsets while retaining every transition annotation and vendor field.
pub fn set_transition_offsets(
  t : @model.Timeline,
  path : Array[Int32],
  in_offset : @time.RationalTime,
  out_offset : @time.RationalTime,
) -> Result[@model.Timeline, String] {
  if path.length() == 0 {
    return Err("empty_path")
  }
  let copy = match @otio.clone(t) {
    Ok(v) => v
    Err(e) => return Err(e.code)
  }
  let node = match @timeline.item_at(copy, path) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  match @model.transition_of(node) {
    Ok(Some(_)) => ()
    _ => return Err("not_a_transition")
  }
  match node {
    @model.Opaque(Object(o)) =>
      for (key, value) in [("in_offset", in_offset), ("out_offset", out_offset)] {
        o[key] = Json::object({
          "OTIO_SCHEMA": Json::string("RationalTime.1"),
          "value": Json::number(value.value()),
          "rate": Json::number(value.rate()),
        })
      }
    _ => return Err("not_a_transition")
  }
  finish(copy)
}

///|
pub fn remove_transition(
  t : @model.Timeline,
  path : Array[Int32],
) -> Result[@model.Timeline, String] {
  if path.length() == 0 {
    return Err("empty_path")
  }
  let node = match @timeline.item_at(t, path) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  match @model.transition_of(node) {
    Ok(Some(_)) => replace_at(t, path, [])
    _ => Err("not_a_transition")
  }
}

///|
pub fn insert_transition(
  t : @model.Timeline,
  track_path : Array[Int32],
  index : Int32,
  transition : Json,
) -> Result[@model.Timeline, String] {
  let copy = match @otio.clone(t) {
    Ok(v) => v
    Err(e) => return Err(e.code)
  }
  let node = match @timeline.item_at(copy, track_path) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let tr = match node {
    @model.Track(v) => v
    _ => return Err("transition_requires_track")
  }
  if index < 0 || index > tr.children.length() {
    return Err("child_index")
  }
  let item : @model.Item = @model.Opaque(transition)
  match @model.transition_of(item) {
    Ok(Some(_)) => ()
    _ => return Err("not_a_transition")
  }
  tr.children.insert(index, item)
  finish(copy)
}
