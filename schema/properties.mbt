///|
pub fn Object::name(self : Object) -> Result[String, String] {
  text(self, "name")
}

///|
pub fn Object::visible(self : Object) -> Bool {
  self.schema_name() != "Gap" &&
  self.get("enabled") != Some(Json::boolean(false))
}

///|
pub fn Object::overlapping(self : Object) -> Bool {
  self.schema_name() == "Transition"
}

///|
pub fn Object::with_name(
  self : Object,
  name : String,
) -> Result[Object, String] {
  self.with_field("name", Json::string(name))
}

///|
pub fn Object::metadata(self : Object) -> Result[Json, String] {
  match self.get("metadata") {
    Some(Object(_)) as j => Ok(j.unwrap())
    _ => Err("metadata_must_be_object")
  }
}

///|
pub fn Object::with_metadata(
  self : Object,
  metadata : Json,
) -> Result[Object, String] {
  if !(metadata is Object(_)) {
    return Err("metadata_must_be_object")
  }
  self.with_field("metadata", metadata)
}

///|
pub fn Object::source_range(self : Object) -> Result[@range.TimeRange?, String] {
  match self.get("source_range") {
    Some(Null) => Ok(None)
    Some(j) =>
      match parse_range(j) {
        Ok(v) => Ok(Some(v))
        Err(e) => Err(e)
      }
    None => Err("not_an_item")
  }
}

///|
pub fn Object::with_source_range(
  self : Object,
  range : @range.TimeRange?,
) -> Result[Object, String] {
  if !self.fields.contains("source_range") {
    return Err("not_an_item")
  }
  self.with_field(
    "source_range",
    match range {
      Some(r) => range_json(r)
      None => Json::null()
    },
  )
}

///|
pub fn Object::effects(self : Object) -> Result[Array[Effect], String] {
  let a = match self.get("effects") {
    Some(Array(a)) => a
    _ => return Err("not_an_item")
  }
  let out : Array[Effect] = []
  for j in a {
    match Effect::from_json(j) {
      Ok(v) => out.push(v)
      Err(e) => return Err(e)
    }
  }
  Ok(out)
}

///|
pub fn Object::with_effects(
  self : Object,
  effects : Array[Effect],
) -> Result[Object, String] {
  if !self.fields.contains("effects") {
    return Err("not_an_item")
  }
  self.with_field(
    "effects",
    Json::array(effects.map(fn(e) { e.to_object().to_json().unwrap() })),
  )
}

///|
pub fn Object::image_bounds(self : Object) -> Result[Box2d?, String] {
  match self.get("available_image_bounds") {
    Some(Null) => Ok(None)
    Some(j) =>
      match Box2d::from_json(j) {
        Ok(v) => Ok(Some(v))
        Err(e) => Err(e)
      }
    None => Err("not_a_media_reference")
  }
}

///|
pub fn Object::with_image_bounds(
  self : Object,
  bounds : Box2d?,
) -> Result[Object, String] {
  if !self.fields.contains("available_image_bounds") {
    return Err("not_a_media_reference")
  }
  self.with_field(
    "available_image_bounds",
    match bounds {
      Some(b) => b.to_json()
      None => Json::null()
    },
  )
}

///|
pub fn Object::generator_parameters(self : Object) -> Result[Json, String] {
  if self.schema_name() != "GeneratorReference" {
    return Err("not_a_generator")
  }
  match self.get("parameters") {
    Some(Object(_)) as j => Ok(j.unwrap())
    _ => Err("invalid_generator_parameters")
  }
}

///|
pub fn Object::with_generator_parameters(
  self : Object,
  parameters : Json,
) -> Result[Object, String] {
  if self.schema_name() != "GeneratorReference" || !(parameters is Object(_)) {
    return Err("invalid_generator_parameters")
  }
  self.with_field("parameters", parameters)
}

///|
pub fn Object::is_missing_reference(self : Object) -> Bool {
  self.schema_name() == "MissingReference"
}
