///|
pub struct Marker {
  priv object : Object
}

///|
pub fn Marker::from_json(raw : Json) -> Result[Marker, String] {
  let object = match Object::from_json(raw) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  if object.schema_name() != "Marker" {
    return Err("not_a_marker")
  }
  match object.get("marked_range") {
    Some(v) =>
      match parse_range(v) {
        Err(e) => return Err(e)
        _ => ()
      }
    None => return Err("missing_marker_range")
  }
  Ok({ object, })
}

///|
pub fn Marker::new(
  name : String,
  range : @range.TimeRange,
  color~ : String = "RED",
  comment~ : String = "",
  metadata~ : Json = Json::empty_object(),
) -> Result[Marker, String] {
  if !(metadata is Object(_)) {
    return Err("metadata_must_be_object")
  }
  let obj = Object::new("Marker").unwrap()
  let obj = obj
    .with_field("name", Json::string(name))
    .unwrap()
    .with_field("marked_range", range_json(range))
    .unwrap()
    .with_field("color", Json::string(color))
    .unwrap()
    .with_field("comment", Json::string(comment))
    .unwrap()
  match obj.with_field("metadata", metadata) {
    Ok(object) => Ok({ object, })
    Err(e) => Err(e)
  }
}

///|
pub fn Marker::to_object(self : Marker) -> Object {
  self.object
}

///|
pub fn Marker::marked_range(self : Marker) -> @range.TimeRange {
  parse_range(self.object.get("marked_range").unwrap()).unwrap()
}

///|
pub fn Marker::with_range(self : Marker, range : @range.TimeRange) -> Marker {
  {
    object: self.object.with_field("marked_range", range_json(range)).unwrap(),
  }
}

///|
pub fn Object::markers(self : Object) -> Result[Array[Marker], String] {
  let values = match self.get("markers") {
    Some(Array(a)) => a
    None => return Ok([])
    _ => return Err("invalid_markers")
  }
  let result : Array[Marker] = []
  for value in values {
    match Marker::from_json(value) {
      Ok(m) => result.push(m)
      Err(e) => return Err(e)
    }
  }
  Ok(result)
}

///|
pub fn Object::with_markers(
  self : Object,
  markers : Array[Marker],
) -> Result[Object, String] {
  if !self.fields.contains("markers") {
    return Err("not_an_item")
  }
  self.with_field(
    "markers",
    Json::array(markers.map(fn(m) { m.object.to_json().unwrap() })),
  )
}

///|
pub fn Object::markers_in_range(
  self : Object,
  bounds : @range.TimeRange,
) -> Result[Array[Marker], String] {
  let markers = match self.markers() {
    Ok(a) => a
    Err(e) => return Err(e)
  }
  Ok(
    markers.filter(fn(m) {
      let r = m.marked_range()
      if r.duration().value() == 0.0 {
        bounds.contains(r.start()).unwrap()
      } else {
        bounds.intersection(r).unwrap() is Some(_)
      }
    }),
  )
}

///|
pub struct Effect {
  priv object : Object
}

///|
pub fn Effect::from_json(raw : Json) -> Result[Effect, String] {
  let object = match Object::from_json(raw) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  if !["Effect", "TimeEffect", "LinearTimeWarp", "FreezeFrame"].contains(
      object.schema_name(),
    ) {
    return Err("unknown_effect")
  }
  Ok({ object, })
}

///|
pub fn Effect::linear(scalar : Double) -> Result[Effect, String] {
  if scalar.is_nan() || scalar.is_inf() {
    return Err("invalid_time_scalar")
  }
  Ok({
    object: Object::new("LinearTimeWarp")
    .unwrap()
    .with_field("time_scalar", Json::number(scalar))
    .unwrap(),
  })
}

///|
pub fn Effect::to_object(self : Effect) -> Object {
  self.object
}

///|
pub fn Effect::playback_scalar(self : Effect) -> Result[Double, String] {
  if self.object.get("enabled") is Some(False) {
    return Ok(1.0)
  }
  match self.object.schema_name() {
    "Effect" => Ok(1.0)
    "FreezeFrame" => Ok(0.0)
    "LinearTimeWarp" =>
      match self.object.get("time_scalar") {
        Some(Number(n, ..)) =>
          if n.is_nan() || n.is_inf() {
            Err("invalid_time_scalar")
          } else {
            Ok(n)
          }
        _ => Err("invalid_time_scalar")
      }
    _ => Err("unspecified_time_effect")
  }
}

///|
pub fn Object::children(self : Object) -> Result[Array[Object], String] {
  let values = match self.get("children") {
    Some(Array(a)) => a
    _ => return Err("not_a_collection")
  }
  let output : Array[Object] = []
  for raw in values {
    match Object::from_json(raw) {
      Ok(o) => output.push(o)
      Err(e) => return Err(e)
    }
  }
  Ok(output)
}

///|
/// Immutable update: children are copied, so no cycles, aliases or dual parents.
pub fn Object::with_children(
  self : Object,
  children : Array[Object],
) -> Result[Object, String] {
  if !self.fields.contains("children") {
    return Err("not_a_collection")
  }
  if self.schema_name() != "SerializableCollection" {
    for child in children {
      if !child.is_unknown() &&
        ![
          "Composable", "Item", "Composition", "Track", "Stack", "Clip", "Gap", "Transition",
        ].contains(child.schema_name()) {
        return Err("child_must_be_composable")
      }
    }
  }
  self.with_field(
    "children",
    Json::array(children.map(fn(c) { c.to_json().unwrap() })),
  )
}
