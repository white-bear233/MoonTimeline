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
/// OTIO optional strings are null in some writers; treat them as empty and keep
/// the original null in `extra` so a round trip stays faithful.
fn name(o : Map[String, Json], path : String) -> String raise Decode {
  match o.get("name") {
    None | Some(Null) => ""
    Some(v) => string(v, path + "/name")
  }
}

///|
fn metadata(o : Map[String, Json], path : String) -> Json raise Decode {
  match o.get("metadata") {
    None | Some(Null) => Json::empty_object()
    Some(v) => {
      let _ = object(v, path + "/metadata")
      v
    }
  }
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
/// Leaf values keep a strict field set: an unknown key there cannot be preserved
/// without changing the value's meaning.
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
/// Keys the model computes. Everything else moves to `extra` and is written back
/// verbatim, so vendor extensions and newer OTIO fields survive a round trip.
fn extra_fields(
  o : Map[String, Json],
  consumed : Array[String],
) -> Map[String, Json] {
  let m : Map[String, Json] = Map([])
  for key, value in o {
    if !consumed.contains(key) {
      m[key] = value
    }
  }
  m
}

///|
/// Keep null name/metadata exactly as written; the model uses empty defaults.
fn keep_null(
  o : Map[String, Json],
  key : String,
  extra : Map[String, Json],
) -> Unit {
  if o.get(key) is Some(Null) {
    extra[key] = Json::null()
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
  structural : Array[String],
) -> @model.Attributes raise Decode {
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
  let consumed = ["OTIO_SCHEMA", "name", "metadata", "enabled", "color"]
  for key in structural {
    consumed.push(key)
  }
  let extra = extra_fields(o, consumed)
  keep_null(o, "name", extra)
  keep_null(o, "metadata", extra)
  {
    name: name(o, path),
    metadata: metadata(o, path),
    enabled,
    color,
    extra: Json::object(extra),
  }
}

///|
fn media(j : Json, path : String) -> @model.MediaReference raise Decode {
  let o = object(j, path)
  let tag = string(field(o, "OTIO_SCHEMA", path), path + "/OTIO_SCHEMA")
  let available = maybe_range(
    optional(o, "available_range"),
    path + "/available_range",
  )
  let bounds = optional(o, "available_image_bounds")
  let consumed = [
    "OTIO_SCHEMA", "name", "metadata", "available_range", "available_image_bounds",
  ]
  let kind = match tag {
    "ExternalReference.1" => {
      consumed.push("target_url")
      @model.External(
        string(field(o, "target_url", path), path + "/target_url"),
      )
    }
    "MissingReference.1" => @model.Missing
    _ => @model.Opaque(Json::object(o))
  }
  let extra = extra_fields(o, consumed)
  keep_null(o, "name", extra)
  keep_null(o, "metadata", extra)
  {
    name: name(o, path),
    metadata: metadata(o, path),
    kind,
    available_range: available,
    available_image_bounds: bounds,
    extra: Json::object(extra),
  }
}

///|
/// Clip.1 may carry a null media_reference: the clip simply has no media.
fn missing_reference() -> @model.MediaReference {
  {
    name: "",
    metadata: Json::empty_object(),
    kind: @model.Missing,
    available_range: None,
    available_image_bounds: Json::null(),
    extra: Json::empty_object(),
  }
}

///|
fn item(j : Json, path : String) -> @model.Item raise Decode {
  let o = object(j, path)
  let tag = string(field(o, "OTIO_SCHEMA", path), path + "/OTIO_SCHEMA")
  if tag != "Clip.1" && tag != "Clip.2" && tag != "Gap.1" {
    return @model.Opaque(Json::object(o))
  }
  let structural = [
    "source_range", "media_references", "media_reference", "active_media_reference_key",
  ]
  let attrs = attributes(o, path, structural)
  if tag == "Gap.1" {
    return @model.Gap({
      attributes: attrs,
      source_range: range(
        field(o, "source_range", path),
        path + "/source_range",
      ),
    })
  }
  let refs : Map[String, @model.MediaReference] = Map([])
  let active = if tag == "Clip.1" {
    refs["DEFAULT_MEDIA"] = match field(o, "media_reference", path) {
      Null => missing_reference()
      v => media(v, path + "/media_reference")
    }
    "DEFAULT_MEDIA"
  } else {
    let raw = object(
      field(o, "media_references", path),
      path + "/media_references",
    )
    for key, value in raw {
      refs[key] = media(value, child(path + "/media_references", key))
    }
    let key = string(
      field(o, "active_media_reference_key", path),
      path + "/active_media_reference_key",
    )
    if refs.get(key) is None {
      fail(
        "missing_media",
        path + "/active_media_reference_key",
        "Active reference does not exist",
      )
    }
    key
  }
  @model.Clip({
    attributes: attrs,
    source_range: maybe_range(
      optional(o, "source_range"),
      path + "/source_range",
    ),
    media_references: refs,
    active_media_reference_key: active,
  })
}

///|
/// Stack and Track share their fields; Sequence.1 is the historical Track name.
fn composition(
  o : Map[String, Json],
  expected : String,
  path : String,
) -> (@model.Attributes, @range.TimeRange?) raise Decode {
  let actual = string(field(o, "OTIO_SCHEMA", path), path + "/OTIO_SCHEMA")
  let accepted = actual == expected ||
    (expected == "Track.1" && actual == "Sequence.1")
  if !accepted {
    fail(
      "unsupported_schema",
      path + "/OTIO_SCHEMA",
      "Expected " + expected + ", got " + actual,
    )
  }
  let structural = ["children", "kind", "source_range"]
  let attrs = attributes(o, path, structural)
  let source = maybe_range(optional(o, "source_range"), path + "/source_range")
  (attrs, source)
}

///|
fn track(j : Json, path : String) -> @model.Track raise Decode {
  let o = object(j, path)
  let (attrs, source) = composition(o, "Track.1", path)
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
  { attributes: attrs, kind, source_range: source, children: items, }
}

///|
fn timeline(j : Json) -> @model.Timeline raise Decode {
  let o = object(j, "")
  schema(o, "Timeline.1", "")
  let stack = object(field(o, "tracks", ""), "/tracks")
  let (attrs, stack_range) = composition(stack, "Stack.1", "/tracks")
  let children = array(field(stack, "children", "/tracks"), "/tracks/children")
  let tracks = []
  for i = 0; i < children.length(); i = i + 1 {
    tracks.push(track(children[i], "/tracks/children/" + i.to_string()))
  }
  let global = match optional(o, "global_start_time") {
    Null => None
    v => Some(time(v, "/global_start_time"))
  }
  let extra = extra_fields(o, [
    "OTIO_SCHEMA", "name", "metadata", "global_start_time", "tracks",
  ])
  keep_null(o, "name", extra)
  keep_null(o, "metadata", extra)
  {
    name: name(o, ""),
    metadata: metadata(o, ""),
    global_start_time: global,
    tracks: { attributes: attrs, source_range: stack_range, children: tracks, },
    extra: Json::object(extra),
  }
}

///|
fn is_word_char(c : Char) -> Bool {
  (c >= 'a' && c <= 'z') ||
  (c >= 'A' && c <= 'Z') ||
  (c >= '0' && c <= '9') ||
  c == '_'
}

///|
fn matches_at(chars : Array[Char], i : Int32, token : String) -> Bool {
  let t = token.to_array()
  if i + t.length() > chars.length() {
    return false
  }
  for k = 0; k < t.length(); k = k + 1 {
    if chars[i + k] != t[k] {
      return false
    }
  }
  true
}

///|
/// Python's json module writes Infinity and NaN by default, so real OTIO exports
/// can contain them. JSON cannot represent those values, so the literal becomes
/// null; the rest of the document still reads. Strings are left untouched.
fn coerce_nonfinite(source : String) -> String {
  let chars = source.to_array()
  let n = chars.length()
  let out = StringBuilder()
  let mut i = 0
  let mut in_string = false
  while i < n {
    let c = chars[i]
    if in_string {
      out.write_char(c)
      if c == '\\' && i + 1 < n {
        out.write_char(chars[i + 1])
        i = i + 2
        continue
      }
      if c == '"' {
        in_string = false
      }
      i = i + 1
      continue
    }
    if c == '"' {
      in_string = true
      out.write_char(c)
      i = i + 1
      continue
    }
    if i == 0 || !is_word_char(chars[i - 1]) {
      let token = if matches_at(chars, i, "-Infinity") {
        "-Infinity"
      } else if matches_at(chars, i, "Infinity") {
        "Infinity"
      } else if matches_at(chars, i, "Inf") {
        "Inf"
      } else if matches_at(chars, i, "NaN") {
        "NaN"
      } else {
        ""
      }
      if token != "" {
        let after = i + token.to_array().length()
        if after >= n || !is_word_char(chars[after]) {
          out.write_string("null")
          i = after
          continue
        }
      }
    }
    out.write_char(c)
    i = i + 1
  }
  out.to_string()
}

///|
/// Parse OTIO. Unknown nodes are preserved instead of rejected; paths are JSON
/// Pointers and the root is "".
pub fn read(source : String) -> Result[@model.Timeline, Diagnostic] {
  if source.length() > 16000000 {
    return Err({
      code: "input_limit",
      path: "",
      message: "Input exceeds 16 million UTF-16 code units",
    })
  }
  let parsed = @json.parse(
    source,
    max_nesting_depth=64,
    reject_duplicate_keys=true,
  ) catch {
    _ =>
      @json.parse(
        coerce_nonfinite(source),
        max_nesting_depth=64,
        reject_duplicate_keys=true,
      ) catch {
        error =>
          return Err({
            code: "invalid_json",
            path: "",
            message: error.to_string(),
          })
      }
  }
  Ok(timeline(parsed)) catch {
    Decode(error) => Err(error)
  }
}
