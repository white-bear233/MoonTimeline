///|
pub(all) struct Diagnostic {
  code : String
  path : String
  message : String
} derive(Debug)

///|
pub extend Diagnostic with @debug.Debug::{to_repr}

///|
priv suberror Decode {
  Decode(Diagnostic)
}

///|
fn[T] fail(code : String, path : String, message : String) -> T raise Decode {
  raise Decode({ code, path, message, })
}

///|
fn object(j : Json, path : String) -> Map[String, Json] raise Decode {
  match j {
    Object(o) => o
    _ => fail("type", path, "Expected object")
  }
}

///|
fn field(
  o : Map[String, Json],
  key : String,
  path : String,
) -> Json raise Decode {
  match o.get(key) {
    Some(v) => v
    None => fail("missing_field", path + "/" + key, "Required field missing")
  }
}

///|
fn string(j : Json, path : String) -> String raise Decode {
  match j {
    String(v) => v
    _ => fail("type", path, "Expected string")
  }
}

///|
fn number(j : Json, path : String) -> Double raise Decode {
  match j {
    Number(v, ..) => v
    _ => fail("type", path, "Expected number")
  }
}

///|
fn array(j : Json, path : String) -> Array[Json] raise Decode {
  match j {
    Array(v) => v
    _ => fail("type", path, "Expected array")
  }
}

///|
fn optional(o : Map[String, Json], key : String) -> Json {
  o.get(key).unwrap_or(Json::null())
}

///|
fn name(o : Map[String, Json], path : String) -> String raise Decode {
  match o.get("name") {
    None => ""
    Some(v) => string(v, path + "/name")
  }
}

///|
fn metadata(o : Map[String, Json], path : String) -> Json raise Decode {
  let j = o.get("metadata").unwrap_or(Json::empty_object())
  let _ = object(j, path + "/metadata")
  j
}

///|
/// JSON Pointer paths escape arbitrary map keys.
fn child(path : String, key : String) -> String {
  path + "/" + key.replace_all(old="~", new="~0").replace_all(old="/", new="~1")
}

///|
fn schema(
  o : Map[String, Json],
  expected : String,
  path : String,
) -> Unit raise Decode {
  let actual = string(field(o, "OTIO_SCHEMA", path), path + "/OTIO_SCHEMA")
  if actual != expected {
    fail(
      "unsupported_schema",
      path + "/OTIO_SCHEMA",
      "Expected " + expected + ", got " + actual,
    )
  }
}

///|
fn fields(
  o : Map[String, Json],
  allowed : Array[String],
  path : String,
) -> Unit raise Decode {
  for key, _ in o {
    if !allowed.contains(key) {
      fail(
        "unsupported_field",
        child(path, key),
        "Field is outside the supported subset",
      )
    }
  }
}

///|
fn time(j : Json, path : String) -> @time.RationalTime raise Decode {
  let o = object(j, path)
  schema(o, "RationalTime.1", path)
  fields(o, ["OTIO_SCHEMA", "value", "rate"], path)
  let v = number(field(o, "value", path), path + "/value")
  let r = number(field(o, "rate", path), path + "/rate")
  match @time.RationalTime::new(v, r) {
    Ok(t) => t
    Err(InvalidRate) =>
      fail("invalid_time", path + "/rate", "Rate must be finite and positive")
    Err(_) => fail("invalid_time", path + "/value", "Value must be finite")
  }
}

///|
fn range(j : Json, path : String) -> @range.TimeRange raise Decode {
  let o = object(j, path)
  schema(o, "TimeRange.1", path)
  fields(o, ["OTIO_SCHEMA", "start_time", "duration"], path)
  let start = time(field(o, "start_time", path), path + "/start_time")
  let duration = time(field(o, "duration", path), path + "/duration")
  match @range.TimeRange::new(start, duration) {
    Ok(r) => r
    Err(e) => fail("invalid_range", path, e)
  }
}

///|
fn maybe_range(j : Json, path : String) -> @range.TimeRange? raise Decode {
  match j {
    Null => None
    _ => Some(range(j, path))
  }
}

///|
fn attributes(
  o : Map[String, Json],
  path : String,
) -> @model.Attributes raise Decode {
  for key in ["effects", "markers"] {
    match o.get(key) {
      None => ()
      Some(v) =>
        if array(v, path + "/" + key).length() != 0 {
          fail(
            "unsupported_feature",
            path + "/" + key,
            "Nonempty effects/markers are not supported",
          )
        }
    }
  }
  let enabled = match o.get("enabled") {
    None | Some(True) => true
    Some(False) => false
    _ => fail("type", path + "/enabled", "Expected boolean")
  }
  let color = optional(o, "color")
  match color {
    Null | String(_) => ()
    _ => fail("type", path + "/color", "Expected string or null")
  }
  { name: name(o, path), metadata: metadata(o, path), enabled, color, }
}

///|
fn media(j : Json, path : String) -> @model.MediaReference raise Decode {
  let o = object(j, path)
  let tag = string(field(o, "OTIO_SCHEMA", path), path + "/OTIO_SCHEMA")
  let kind = match tag {
    "ExternalReference.1" =>
      @model.External(
        string(field(o, "target_url", path), path + "/target_url"),
      )
    "MissingReference.1" => @model.Missing
    _ => fail("unsupported_schema", path + "/OTIO_SCHEMA", tag)
  }
  let allowed = [
    "OTIO_SCHEMA", "name", "metadata", "available_range", "available_image_bounds",
  ]
  if tag == "ExternalReference.1" {
    allowed.push("target_url")
  }
  fields(o, allowed, path)
  {
    name: name(o, path),
    metadata: metadata(o, path),
    kind,
    available_range: maybe_range(
      optional(o, "available_range"),
      path + "/available_range",
    ),
    available_image_bounds: optional(o, "available_image_bounds"),
  }
}

///|
fn item(j : Json, path : String) -> @model.Item raise Decode {
  let o = object(j, path)
  let tag = string(field(o, "OTIO_SCHEMA", path), path + "/OTIO_SCHEMA")
  if tag != "Clip.2" && tag != "Gap.1" {
    fail("unsupported_schema", path + "/OTIO_SCHEMA", tag)
  }
  let allowed = [
    "OTIO_SCHEMA", "name", "metadata", "source_range", "effects", "markers", "enabled",
    "color",
  ]
  if tag == "Clip.2" {
    allowed.push("media_references")
    allowed.push("active_media_reference_key")
  }
  fields(o, allowed, path)
  let attrs = attributes(o, path)
  if tag == "Gap.1" {
    return @model.Gap({
      attributes: attrs,
      source_range: range(
        field(o, "source_range", path),
        path + "/source_range",
      ),
    })
  }
  let refs = object(
    field(o, "media_references", path),
    path + "/media_references",
  )
  let parsed : Map[String, @model.MediaReference] = Map([])
  for key, value in refs {
    parsed[key] = media(value, child(path + "/media_references", key))
  }
  let active = string(
    field(o, "active_media_reference_key", path),
    path + "/active_media_reference_key",
  )
  if parsed.get(active) is None {
    fail(
      "missing_media",
      path + "/active_media_reference_key",
      "Active reference does not exist",
    )
  }
  @model.Clip({
    attributes: attrs,
    source_range: maybe_range(
      optional(o, "source_range"),
      path + "/source_range",
    ),
    media_references: parsed,
    active_media_reference_key: active,
  })
}

///|
fn composition(
  o : Map[String, Json],
  tag : String,
  path : String,
) -> @model.Attributes raise Decode {
  schema(o, tag, path)
  let allowed = [
    "OTIO_SCHEMA", "name", "metadata", "source_range", "effects", "markers", "enabled",
    "color", "children",
  ]
  if tag == "Track.1" {
    allowed.push("kind")
  }
  fields(o, allowed, path)
  if !(optional(o, "source_range") is Null) {
    fail(
      "unsupported_feature",
      path + "/source_range",
      "Composition trimming is not supported",
    )
  }
  attributes(o, path)
}

///|
fn track(j : Json, path : String) -> @model.Track raise Decode {
  let o = object(j, path)
  let attrs = composition(o, "Track.1", path)
  let kind = match string(field(o, "kind", path), path + "/kind") {
    "Video" => @model.Video
    "Audio" => @model.Audio
    _ => fail("unsupported_feature", path + "/kind", "Expected Video or Audio")
  }
  let children = array(field(o, "children", path), path + "/children")
  let items = []
  for i = 0; i < children.length(); i = i + 1 {
    items.push(item(children[i], path + "/children/" + i.to_string()))
  }
  { attributes: attrs, kind, children: items, }
}

///|
fn timeline(j : Json) -> @model.Timeline raise Decode {
  let o = object(j, "")
  schema(o, "Timeline.1", "")
  fields(
    o,
    ["OTIO_SCHEMA", "name", "metadata", "global_start_time", "tracks"],
    "",
  )
  let stack = object(field(o, "tracks", ""), "/tracks")
  let attrs = composition(stack, "Stack.1", "/tracks")
  let children = array(field(stack, "children", "/tracks"), "/tracks/children")
  let tracks = []
  for i = 0; i < children.length(); i = i + 1 {
    tracks.push(track(children[i], "/tracks/children/" + i.to_string()))
  }
  let global = match optional(o, "global_start_time") {
    Null => None
    v => Some(time(v, "/global_start_time"))
  }
  {
    name: name(o, ""),
    metadata: metadata(o, ""),
    global_start_time: global,
    tracks: { attributes: attrs, children: tracks, },
  }
}

///|
/// Parse a bounded OTIO subset. Paths are JSON Pointers; the root is "".
pub fn read(source : String) -> Result[@model.Timeline, Diagnostic] {
  if source.length() > 4000000 {
    return Err({
      code: "input_limit",
      path: "",
      message: "Input exceeds 4 million UTF-16 code units",
    })
  }
  let parsed = @json.parse(
    source,
    max_nesting_depth=64,
    reject_duplicate_keys=true,
  ) catch {
    error =>
      return Err({ code: "invalid_json", path: "", message: error.to_string(), })
  }
  Ok(timeline(parsed)) catch {
    Decode(error) => Err(error)
  }
}
