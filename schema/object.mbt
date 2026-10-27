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
              None =>
                result[key] = if current_name == "Marker" && key == "color" {
                  Json::string("GREEN")
                } else {
                  default
                }
              Some(value) => {
                let plugin_any = [
                  "Adapter", "HookScript", "MediaLinker", "SchemaDef", "PluginManifest",
                ].contains(current_name)
                if plugin_any {
                  continue
                }
                if current_name == "ImageSequenceReference" &&
                  ["start_frame", "frame_step", "frame_zero_padding"].contains(
                    key,
                  ) {
                  let text = match value {
                    Number(n, repr~) =>
                      match repr {
                        Some(s) => s
                        None => n.to_string()
                      }
                    _ => return Err("invalid_integer:" + key)
                  }
                  let integer = if text.has_prefix("-") {
                    let n = @string.parse_int64(text) catch {
                      _ => return Err("invalid_integer:" + key)
                    }
                    n.to_int()
                  } else {
                    let n = @string.parse_uint64(text) catch {
                      _ => return Err("invalid_integer:" + key)
                    }
                    n.to_int()
                  }
                  result[key] = Json::number(integer.to_double())
                  continue
                }
                let elements : Array[Json] = match (key, value) {
                  ("children" | "effects" | "markers", Array(a)) => a
                  ("media_references", Object(m)) => m.values().to_array()
                  _ => []
                }
                for element in elements {
                  let child_name = match split_tag(tag(element)) {
                    Ok((n, _)) => n
                    Err(_) => return Err("invalid_element:" + key)
                  }
                  let valid = match key {
                    "effects" =>
                      ["Effect", "TimeEffect", "LinearTimeWarp", "FreezeFrame"].contains(
                        child_name,
                      )
                    "markers" => child_name == "Marker"
                    "media_references" =>
                      [
                        "MediaReference", "ExternalReference", "MissingReference",
                        "GeneratorReference", "ImageSequenceReference",
                      ].contains(child_name)
                    "children" =>
                      if current_name == "SerializableCollection" {
                        ![
                          "RationalTime", "TimeRange", "TimeTransform", "V2d", "Box2d",
                          "Color",
                        ].contains(child_name)
                      } else {
                        [
                          "Composable", "Item", "Composition", "Clip", "Gap", "Track",
                          "Stack", "Transition",
                        ].contains(child_name)
                      }
                    _ => true
                  }
                  if !valid {
                    return Err("invalid_element:" + key + ":" + child_name)
                  }
                }
                if default is String(_) &&
                  value is Null &&
                  current_name != "Color" &&
                  key != "missing_frame_policy" {
                  result[key] = Json::string("")
                  continue
                }
                let expected_tag = match key {
                  "source_range" | "available_range" | "marked_range" =>
                    "TimeRange.1"
                  "global_start_time"
                  | "offset"
                  | "in_offset"
                  | "out_offset"
                  | "start_time"
                  | "duration" => "RationalTime.1"
                  "available_image_bounds" => "Box2d.1"
                  "min" | "max" =>
                    if current_name == "Box2d" {
                      "V2d.1"
                    } else {
                      ""
                    }
                  "tracks" => "Stack.1"
                  "color" =>
                    if current_name == "Marker" {
                      ""
                    } else {
                      "Color.1"
                    }
                  _ => ""
                }
                let nullable = [
                  "source_range", "available_range", "global_start_time", "available_image_bounds",
                  "tracks", "color",
                ].contains(key)
                if expected_tag != "" {
                  if nullable && value is Null {
                    continue
                  }
                  if tag(value) != expected_tag {
                    return Err("invalid_field_type:" + current_name + "." + key)
                  }
                }
                if current_name == "ImageSequenceReference" &&
                  key == "missing_frame_policy" {
                  if !(value is String(policy) &&
                    ["error", "hold", "black"].contains(policy)) {
                    return Err("invalid_missing_frame_policy")
                  }
                }
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
