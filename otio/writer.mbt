///|
fn encode_time(t : @time.RationalTime) -> Json {
  Json::object({
    "OTIO_SCHEMA": Json::string("RationalTime.1"),
    "value": Json::number(t.value()),
    "rate": Json::number(t.rate()),
  })
}

///|
fn encode_range(r : @range.TimeRange) -> Json {
  Json::object({
    "OTIO_SCHEMA": Json::string("TimeRange.1"),
    "start_time": encode_time(r.start()),
    "duration": encode_time(r.duration()),
  })
}

///|
fn encode_optional_range(r : @range.TimeRange?) -> Json {
  match r {
    None => Json::null()
    Some(v) => encode_range(v)
  }
}

///|
/// Preserved fields win over defaults: a non-empty markers/effects array read
/// from upstream must be written back unchanged.
fn merge_extra(base : Map[String, Json], extra : Json) -> Unit {
  match extra {
    Object(m) =>
      for key, value in m {
        base[key] = value
      }
    _ => ()
  }
}

///|
fn encode_attributes(a : @model.Attributes, tag : String) -> Map[String, Json] {
  let o = {
    "OTIO_SCHEMA": Json::string(tag),
    "name": Json::string(a.name),
    "metadata": a.metadata,
    "enabled": Json::boolean(a.enabled),
    "color": a.color,
    "effects": Json::array([]),
    "markers": Json::array([]),
  }
  merge_extra(o, a.extra)
  o
}

///|
fn encode_media(m : @model.MediaReference) -> Json {
  match m.kind {
    @model.Opaque(raw) => raw
    _ => {
      let o = {
        "name": Json::string(m.name),
        "metadata": m.metadata,
        "available_range": encode_optional_range(m.available_range),
        "available_image_bounds": m.available_image_bounds,
      }
      match m.kind {
        @model.External(url) => {
          o["OTIO_SCHEMA"] = Json::string("ExternalReference.1")
          o["target_url"] = Json::string(url)
        }
        @model.Missing => o["OTIO_SCHEMA"] = Json::string("MissingReference.1")
        @model.Opaque(_) => ()
      }
      merge_extra(o, m.extra)
      Json::object(o)
    }
  }
}

///|
fn encode_item(item : @model.Item) -> Json {
  match item {
    @model.Opaque(raw) => raw
    @model.Gap(g) => {
      let o = encode_attributes(g.attributes, "Gap.1")
      o["source_range"] = encode_range(g.source_range)
      Json::object(o)
    }
    @model.Clip(c) => {
      let o = encode_attributes(c.attributes, "Clip.2")
      o["source_range"] = encode_optional_range(c.source_range)
      let refs : Map[String, Json] = Map([])
      for key, value in c.media_references {
        refs[key] = encode_media(value)
      }
      o["media_references"] = Json::object(refs)
      o["active_media_reference_key"] = Json::string(
        c.active_media_reference_key,
      )
      Json::object(o)
    }
  }
}

///|
fn encode_timeline(t : @model.Timeline) -> Json {
  let tracks = t.tracks.children.map(fn(track) {
    let o = encode_attributes(track.attributes, "Track.1")
    o["kind"] = Json::string(
      match track.kind {
        @model.Video => "Video"
        @model.Audio => "Audio"
      },
    )
    o["source_range"] = encode_optional_range(track.source_range)
    o["children"] = Json::array(track.children.map(encode_item))
    Json::object(o)
  })
  let stack = encode_attributes(t.tracks.attributes, "Stack.1")
  stack["source_range"] = encode_optional_range(t.tracks.source_range)
  stack["children"] = Json::array(tracks)
  let root = {
    "OTIO_SCHEMA": Json::string("Timeline.1"),
    "name": Json::string(t.name),
    "metadata": t.metadata,
    "global_start_time": match t.global_start_time {
      None => Json::null()
      Some(v) => encode_time(v)
    },
    "tracks": Json::object(stack),
  }
  merge_extra(root, t.extra)
  Json::object(root)
}

///|
/// Validate opaque JSON before stringify (NaN, infinity and cycles cannot be serialized safely).
fn check_json(
  j : Json,
  path : String,
  depth : Int32,
  budget : Ref[Int32],
) -> Unit raise Decode {
  budget.val = budget.val - 1
  if depth > 64 || budget.val < 0 {
    fail("input_limit", path, "JSON depth/node limit exceeded")
  }
  match j {
    Number(v, ..) =>
      if v.is_nan() || v.is_inf() {
        fail("invalid_number", path, "Nonfinite JSON number")
      }
    Object(o) =>
      for k, v in o {
        check_json(v, child(path, k), depth + 1, budget)
      }
    Array(a) =>
      for i = 0; i < a.length(); i = i + 1 {
        check_json(a[i], path + "/" + i.to_string(), depth + 1, budget)
      }
    _ => ()
  }
}

///|
/// Serialize the computed subset plus preserved fields; validate public mutable
/// models before returning output.
pub fn write(timeline : @model.Timeline) -> Result[String, Diagnostic] {
  let j = encode_timeline(timeline)
  check_json(j, "", 0, Ref(2000000)) catch {
    Decode(e) => return Err(e)
  }
  let source = j.stringify()
  match read(source) {
    Err(e) => Err(e)
    Ok(_) => Ok(source)
  }
}

///|
/// Independent model copy, including all mutable Array/Map/Json containers.
pub fn clone(timeline : @model.Timeline) -> Result[@model.Timeline, Diagnostic] {
  match write(timeline) {
    Err(e) => Err(e)
    Ok(s) => read(s)
  }
}
