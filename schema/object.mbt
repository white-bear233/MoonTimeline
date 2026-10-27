///|
/// Immutable schema object. Constructors and getters own independent JSON.
pub struct Object {
  priv fields : Map[String, Json]
}

///|
pub fn tag(raw : Json) -> String {
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
fn split_tag(text : String) -> Result[(String, Int32), String] {
  let parts = text.split(".").to_array()
  if parts.length() != 2 {
    return Err("invalid_schema_tag")
  }
  let version = @string.parse_int(parts[1]) catch {
    _ => return Err("invalid_schema_version")
  }
  if version < 1 || parts[0].length() == 0 {
    return Err("invalid_schema_tag")
  }
  Ok((parts[0].to_owned(), version))
}

///|
/// Convert supported historical schemas recursively. Unknown schema fields survive.
fn upgrade(raw : Json, depth : Int32) -> Result[Json, String] {
  if depth > 64 {
    return Err("input_limit")
  }
  match raw {
    Array(a) => {
      let output : Array[Json] = []
      for child in a {
        match upgrade(child, depth + 1) {
          Ok(v) => output.push(v)
          Err(e) => return Err(e)
        }
      }
      Ok(Json::array(output))
    }
    Object(o) => {
      let result : Map[String, Json] = Map([])
      for k, v in o {
        match upgrade(v, depth + 1) {
          Ok(v) => result[k] = v
          Err(e) => return Err(e)
        }
      }
      let original = tag(raw)
      if original == "" {
        return Ok(Json::object(result))
      }
      let (name, version) = match split_tag(original) {
        Ok(v) => v
        Err(e) => return Err(e)
      }
      if original == "Sequence.1" {
        result["OTIO_SCHEMA"] = Json::string("Track.1")
      }
      if original == "SerializeableCollection.1" {
        result["OTIO_SCHEMA"] = Json::string("SerializableCollection.1")
      }
      if original == "Marker.1" {
        match result.get("range") {
          Some(r) => result["marked_range"] = r
          None => return Err("missing_marker_range")
        }
        result.remove("range")
        result["OTIO_SCHEMA"] = Json::string("Marker.2")
      }
      if original == "Clip.1" {
        let media = match result.get("media_reference") {
          Some(Object(_)) as m => m.unwrap()
          _ => default_json("MissingReference").unwrap()
        }
        result["media_references"] = Json::object({ "DEFAULT_MEDIA": media })
        result["active_media_reference_key"] = Json::string("DEFAULT_MEDIA")
        result.remove("media_reference")
        result["OTIO_SCHEMA"] = Json::string("Clip.2")
      }
      match default_json(name) {
        Ok(defaults) => {
          let (_, current) = split_tag(tag(defaults)).unwrap()
          if version > current {
            return Err("unsupported_schema_version:" + original)
          }
        }
        Err(_) => ()
      }
      let (current_name, _) = split_tag(tag(Json::object(result))).unwrap()
      match default_json(current_name) {
        Ok(Object(defaults)) => {
          for field in required_fields(current_name) {
            if !result.contains(field) {
              return Err("missing_field:" + current_name + "." + field)
            }
          }
          for key, default in defaults {
            match result.get(key) {
              None => result[key] = default
              Some(value) => {
                let valid = match (default, value) {
                  (Null, _) => true
                  (String(_), String(_))
                  | (Number(_, ..), Number(_, ..))
                  | (Array(_), Array(_))
                  | (Object(_), Object(_))
                  | (True, True)
                  | (True, False)
                  | (False, True)
                  | (False, False) => true
                  _ => false
                }
                if !valid {
                  return Err("invalid_field_type:" + current_name + "." + key)
                }
              }
            }
          }
        }
        _ => ()
      }
      Ok(Json::object(result))
    }
    _ => Ok(raw)
  }
}

///|
pub fn Object::from_json(raw : Json) -> Result[Object, String] {
  let copy = match @otiojson.clone(raw) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let value = match upgrade(copy, 0) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  match value {
    Object(fields) => {
      match split_tag(tag(value)) {
        Err(e) => return Err(e)
        _ => ()
      }
      Ok({ fields, })
    }
    _ => Err("schema_object_required")
  }
}

///|
pub fn Object::new(name : String) -> Result[Object, String] {
  match default_json(name) {
    Ok(j) => Object::from_json(j)
    Err(e) => Err(e)
  }
}

///|
pub fn Object::schema_name(self : Object) -> String {
  split_tag(tag(Json::object(self.fields))).unwrap().0
}

///|
pub fn Object::schema_version(self : Object) -> Int32 {
  split_tag(tag(Json::object(self.fields))).unwrap().1
}

///|
pub fn Object::is_unknown(self : Object) -> Bool {
  !registered_schemas().contains(self.schema_name())
}

///|
pub fn Object::to_json(self : Object) -> Result[Json, String] {
  @otiojson.clone(Json::object(self.fields))
}

///|
pub fn Object::get(self : Object, key : String) -> Json? {
  match self.fields.get(key) {
    Some(v) => Some(@otiojson.clone(v).unwrap())
    None => None
  }
}

///|
pub fn Object::with_field(
  self : Object,
  key : String,
  value : Json,
) -> Result[Object, String] {
  if key == "OTIO_SCHEMA" {
    return Err("immutable_schema_tag")
  }
  let fields = match self.to_json() {
    Ok(Object(o)) => o
    _ => return Err("invalid_object")
  }
  fields[key] = value
  Object::from_json(Json::object(fields))
}

///|
pub fn Object::equivalent(self : Object, other : Object) -> Bool {
  @otiojson.equivalent(Json::object(self.fields), Json::object(other.fields))
}

///|
pub fn read(source : String) -> Result[Object, String] {
  match @otiojson.parse(source) {
    Ok(j) => Object::from_json(j)
    Err(e) => Err(e)
  }
}

///|
pub fn write(object : Object) -> Result[String, String] {
  @otiojson.stringify(Json::object(object.fields))
}

///|
/// Explicit lossy Clip downgrade follows OTIO: only the active reference survives.
pub fn Object::to_version(
  self : Object,
  version : Int32,
) -> Result[Json, String] {
  if version == self.schema_version() {
    return self.to_json()
  }
  if self.schema_name() != "Clip" || version != 1 {
    return Err("no_downgrade_registered")
  }
  let o = match self.to_json() {
    Ok(Object(o)) => o
    _ => return Err("invalid_object")
  }
  let key = match o.get("active_media_reference_key") {
    Some(String(s)) => s
    _ => return Err("missing_active_key")
  }
  let media = match o.get("media_references") {
    Some(Object(m)) => m.get(key)
    _ => None
  }
  match media {
    Some(v) => o["media_reference"] = v
    None => return Err("missing_active_media")
  }
  o.remove("media_references")
  o.remove("active_media_reference_key")
  o["OTIO_SCHEMA"] = Json::string("Clip.1")
  Ok(Json::object(o))
}

///|
pub fn time_json(t : @time.RationalTime) -> Json {
  Json::object({
    "OTIO_SCHEMA": Json::string("RationalTime.1"),
    "value": Json::number(t.value()),
    "rate": Json::number(t.rate()),
  })
}

///|
pub fn range_json(r : @range.TimeRange) -> Json {
  Json::object({
    "OTIO_SCHEMA": Json::string("TimeRange.1"),
    "start_time": time_json(r.start()),
    "duration": time_json(r.duration()),
  })
}

///|
pub fn parse_time(j : Json) -> Result[@time.RationalTime, String] {
  if tag(j) != "RationalTime.1" {
    return Err("invalid_time_schema")
  }
  match j {
    Object(o) =>
      match (o.get("value"), o.get("rate")) {
        (Some(Number(v, ..)), Some(Number(r, ..))) =>
          match @time.RationalTime::new(v, r) {
            Ok(t) => Ok(t)
            Err(_) => Err("invalid_time")
          }
        _ => Err("invalid_time")
      }
    _ => Err("invalid_time")
  }
}

///|
pub fn parse_range(j : Json) -> Result[@range.TimeRange, String] {
  if tag(j) != "TimeRange.1" {
    return Err("invalid_range_schema")
  }
  match j {
    Object(o) =>
      match (o.get("start_time"), o.get("duration")) {
        (Some(a), Some(b)) => {
          let start = match parse_time(a) {
            Ok(v) => v
            Err(e) => return Err(e)
          }
          let duration = match parse_time(b) {
            Ok(v) => v
            Err(e) => return Err(e)
          }
          @range.TimeRange::new(start, duration)
        }
        _ => Err("invalid_range")
      }
    _ => Err("invalid_range")
  }
}
