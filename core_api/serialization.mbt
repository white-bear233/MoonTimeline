///|
pub fn deserialize_json_from_string(text : String) -> Result[Json, String] {
  let raw = match @otiojson.parse(text) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  @plugins.Registry::new().upgrade_document(raw)
}

///|
pub fn serialize_json_to_string(value : Json) -> Result[String, String] {
  @otiojson.stringify(value)
}

///|
pub fn instance_from_schema(
  name : String,
  version : Int32,
  fields : Json,
) -> Result[Json, String] {
  let fields = match @otiojson.clone(fields) {
    Ok(Object(v)) => v
    _ => return Err("TypeError:fields")
  }
  fields["OTIO_SCHEMA"] = Json::string(name + "." + version.to_string())
  // Core's object registry excludes opentime and spatial value types.
  if ["RationalTime", "TimeRange", "TimeTransform", "V2d", "Box2d", "Color"].contains(
      name,
    ) {
    return Ok(Json::object(fields))
  }
  match @schema.Object::from_json(Json::object(fields)) {
    Ok(v) => v.to_json()
    Err(e) => Err(e)
  }
}

///|
pub fn deserialize_json_from_file(
  path : String,
  read_file : (String) -> Result[String, String],
) -> Result[Json, String] {
  match read_file(path) {
    Ok(v) => deserialize_json_from_string(v)
    Err(e) => Err(e)
  }
}

///|
pub fn serialize_json_to_file(
  value : Json,
  path : String,
  write_file : (String, String) -> Result[Unit, String],
) -> Result[Bool, String] {
  let text = match serialize_json_to_string(value) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  match write_file(path, text) {
    Ok(_) => Ok(true)
    Err(e) => Err(e)
  }
}
