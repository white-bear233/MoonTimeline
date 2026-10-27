///|
fn entries(raw : Json) -> Result[Map[String, Bytes], String] {
  let fields = match raw {
    Object(o) => o
    _ => return Err("entries_must_be_object")
  }
  let out : Map[String, Bytes] = Map([])
  for k, v in fields {
    let text = match v {
      String(s) => s
      _ => return Err("entry_must_be_base64")
    }
    out[k] = @base64.decode(text) catch { _ => return Err("invalid_base64") }
  }
  Ok(out)
}

///|
fn bundle_response(bundle : @adapters.Bundle) -> Result[Json, String] {
  let files : Map[String, Json] = Map([])
  for name, bytes in bundle.entries() {
    files[name] = Json::string(@base64.encode(bytes))
  }
  let source = match @otiojson.stringify(bundle.document()) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  Ok(
    Json::object({
      "source": Json::string(source),
      "entries": Json::object(files),
    }),
  )
}

///|
fn execute_otio(
  source : String,
  action : String,
  options : Json,
) -> Result[Json, String] {
  let opts = match options {
    Object(o) => o
    _ => return Err("options_must_be_object")
  }
  if action == "schemas" {
    return Ok(Json::array(@schema.registered_schemas().map(Json::string)))
  }
  if action == "unpack" {
    let bytes = @base64.decode(source) catch {
      _ => return Err("invalid_base64")
    }
    let bundle = match @adapters.read_otioz(bytes) {
      Ok(v) => v
      Err(e) => return Err(e)
    }
    return bundle_response(bundle)
  }
  if action == "read-directory" {
    let files = match entries(options) {
      Ok(v) => v
      Err(e) => return Err(e)
    }
    let bundle = match @adapters.read_otiod(files) {
      Ok(v) => v
      Err(e) => return Err(e)
    }
    return bundle_response(bundle)
  }
  let raw = match @otiojson.parse(source) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  if action == "media-urls" {
    let urls : Array[String] = []
    fn walk(j : Json) -> Unit {
      match j {
        Object(o) => {
          if @schema.tag(j) == "ExternalReference.1" {
            match o.get("target_url") {
              Some(String(s)) => if !urls.contains(s) { urls.push(s) }
              _ => ()
            }
          }
          for _, v in o {
            walk(v)
          }
        }
        Array(a) =>
          for v in a {
            walk(v)
          }
        _ => ()
      }
    }
    walk(raw)
    return Ok(Json::array(urls.map(Json::string)))
  }
  if action == "pack" || action == "directory" {
    let media = match
      entries(opts.get("media").unwrap_or(Json::empty_object())) {
      Ok(v) => v
      Err(e) => return Err(e)
    }
    let policy = match opts.get("policy") {
      None | Some(String("error")) => @adapters.ErrorIfNotFile
      Some(String("missing")) => @adapters.MissingIfNotFile
      Some(String("all-missing")) => @adapters.AllMissing
      _ => return Err("invalid_media_policy")
    }
    let bundle = match @adapters.bundle(raw, media, policy~) {
      Ok(v) => v
      Err(e) => return Err(e)
    }
    if action == "directory" {
      return bundle_response(bundle)
    }
    return match bundle.to_otioz() {
      Ok(bytes) =>
        Ok(Json::object({ "archive": Json::string(@base64.encode(bytes)) }))
      Err(e) => Err(e)
    }
  }
  if action == "convert" && @schema.tag(raw) == "" {
    return match @otiojson.stringify(raw) {
      Ok(s) => Ok(Json::object({ "source": Json::string(s) }))
      Err(e) => Err(e)
    }
  }
  let obj = match @schema.Object::from_json(raw) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let mut output = obj.to_json().unwrap()
  match action {
    "convert" => ()
    "flatten" => {
      let stack = if obj.schema_name() == "Timeline" {
        match obj.get("tracks") {
          Some(j) =>
            match @schema.Object::from_json(j) {
              Ok(v) => v
              Err(e) => return Err(e)
            }
          None => return Err("missing_tracks")
        }
      } else {
        obj
      }
      output = match @algorithms.flatten_stack(stack) {
        Ok(v) => v.to_json().unwrap()
        Err(e) => return Err(e)
      }
    }
    "filter" => {
      let prune = match opts.get("prune") {
        Some(Array(a)) => {
          let names : Array[String] = []
          for j in a {
            match j {
              String(s) => names.push(s)
              _ => return Err("invalid_prune")
            }
          }
          names
        }
        None => []
        _ => return Err("invalid_prune")
      }
      let results = match
        @algorithms.filtered_composition(obj, fn(n) { Ok([n]) }, prune~) {
        Ok(v) => v
        Err(e) => return Err(e)
      }
      output = if results.length() == 1 {
        results[0].to_json().unwrap()
      } else {
        Json::array(results.map(fn(n) { n.to_json().unwrap() }))
      }
    }
    "trim-range" => {
      let start = match opts.get("start") {
        Some(Number(n, ..)) => n
        _ => return Err("missing_start")
      }
      let duration = match opts.get("duration") {
        Some(Number(n, ..)) => n
        _ => return Err("missing_duration")
      }
      let a = match @time.RationalTime::new(start, 1.0) {
        Ok(v) => v
        Err(_) => return Err("invalid_start")
      }
      let b = match @time.RationalTime::new(duration, 1.0) {
        Ok(v) => v
        Err(_) => return Err("invalid_duration")
      }
      let r = match @range.TimeRange::new(a, b) {
        Ok(v) => v
        Err(e) => return Err(e)
      }
      let trimmed = if obj.schema_name() == "Timeline" {
        @algorithms.timeline_trimmed_to_range(obj, r)
      } else {
        @algorithms.track_trimmed_to_range(obj, r)
      }
      output = match trimmed {
        Ok(v) => v.to_json().unwrap()
        Err(e) => return Err(e)
      }
    }
    "find" => {
      let name = match opts.get("schema") {
        Some(String(s)) => s
        None => ""
        _ => return Err("invalid_schema_filter")
      }
      return Ok(
        Json::array(
          @graph.Graph::new(obj)
          .find(schema=name)
          .map(fn(path) {
            Json::array(path.map(fn(n) { Json::number(n.to_double()) }))
          }),
        ),
      )
    }
    "expand-transitions" => {
      let expanded = match @algorithms.track_with_expanded_transitions(obj) {
        Ok(v) => v
        Err(e) => return Err(e)
      }
      output = Json::array(
        expanded.map(fn(e) {
          match e {
            @algorithms.Item(n) => n.to_json().unwrap()
            @algorithms.Transition(a, b, c) =>
              Json::array([
                a.to_json().unwrap(),
                b.to_json().unwrap(),
                c.to_json().unwrap(),
              ])
          }
        }),
      )
    }
    _ => return Err("unknown_otio_action")
  }
  match @otiojson.stringify(output) {
    Ok(s) => Ok(Json::object({ "source": Json::string(s) }))
    Err(e) => Err(e)
  }
}

///|
/// String envelopes avoid JS JSON coercing OTIO NaN/Inf or 64-bit integers.
pub fn otio(source : String, action : String, options : String) -> String {
  let result = match @otiojson.parse(options) {
    Ok(o) => execute_otio(source, action, o)
    Err(e) => Err(e)
  }
  match result {
    Ok(value) => Json::object({ "ok": value }).stringify()
    Err(error) => Json::object({ "error": Json::string(error) }).stringify()
  }
}
