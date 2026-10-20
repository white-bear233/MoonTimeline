///|
pub(all) struct Response {
  code : Int32
  body : String
  output : String?
}

///|
fn error(message : String) -> Response {
  {
    code: 2,
    body: Json::object({ "error": Json::string(message) }).stringify(),
    output: None,
  }
}

///|
fn issues_json(t : @model.Timeline) -> Json {
  Json::array(
    @validate.validate(t).map(fn(i) {
      Json::object({
        "code": Json::string(i.code),
        "path": Json::string(i.path),
        "message": Json::string(i.message),
        "severity": Json::string(
          match i.severity {
            @validate.Error => "error"
            @validate.Warning => "warning"
            @validate.Info => "info"
          },
        ),
      })
    }),
  )
}

///|
fn describe(t : @model.Timeline) -> Json {
  let tracks = t.tracks.children.map(fn(track) {
    Json::object({
      "name": Json::string(track.attributes.name),
      "kind": Json::string(
        match track.kind {
          @model.Video => "Video"
          @model.Audio => "Audio"
        },
      ),
    })
  })
  let o = {
    "name": Json::string(t.name),
    "tracks": Json::array(tracks),
    "issues": issues_json(t),
  }
  match @timeline.layout(t) {
    Err(e) => {
      o["duration"] = Json::null()
      o["layout_error"] = Json::string(e)
      o["items"] = Json::array([])
    }
    Ok(l) => {
      o["duration"] = Json::number(l.duration_seconds)
      o["items"] = Json::array(
        l.items.map(fn(p) {
          let item = t.tracks.children[p.track_index].children[p.item_index]
          let (name, kind) = match item {
            @model.Clip(c) => (c.attributes.name, "clip")
            @model.Gap(g) => (g.attributes.name, "gap")
            @model.Opaque(raw) => (@timeline.opaque_schema(raw), "opaque")
          }
          Json::object({
            "track": Json::number(p.track_index.to_double()),
            "index": Json::number(p.item_index.to_double()),
            "name": Json::string(name),
            "kind": Json::string(kind),
            "start": Json::number(p.start_seconds),
            "end": Json::number(p.end_seconds),
            "source_start": Json::number(p.source.start().to_seconds().unwrap()),
            "enabled": Json::boolean(p.enabled),
          })
        }),
      )
    }
  }
  Json::object(o)
}

///|
/// Shared command engine for native CLI, Node adapter and browser.
pub fn run(
  source : String,
  action : String,
  track : Int32,
  item : Int32,
  at : Double,
  duration : Double,
  rate : Double,
) -> Response {
  let t = match @otio.read(source) {
    Ok(t) => t
    Err(e) => return error(e.code + " " + e.path + ": " + e.message)
  }
  if action == "inspect" {
    return { code: 0, body: describe(t).stringify(), output: None, }
  }
  if action == "validate" {
    return {
      code: if @validate.has_errors(@validate.validate(t)) {
        1
      } else {
        0
      },
      body: issues_json(t).stringify(),
      output: None,
    }
  }
  let result = if action == "export" {
    Ok(t)
  } else {
    let offset = match @time.RationalTime::new(at, rate) {
      Ok(v) => v
      Err(_) => return error("Invalid time/rate")
    }
    let length = match @time.RationalTime::new(duration, rate) {
      Ok(v) => v
      Err(_) => return error("Invalid duration/rate")
    }
    match action {
      "split" => @edit.split(t, track, item, offset)
      "trim" => @edit.trim(t, track, item, offset, length)
      "gap" => @edit.insert_gap(t, track, item, length)
      _ => return error("Unknown command")
    }
  }
  match result {
    Err(e) => error(e)
    Ok(t) =>
      match @otio.write(t) {
        Err(e) => error(e.code + " " + e.path)
        Ok(s) => { code: 0, body: describe(t).stringify(), output: Some(s), }
      }
  }
}

///|
pub fn response_json(r : Response) -> String {
  Json::object({
    "code": Json::number(r.code.to_double()),
    "body": Json::string(r.body),
    "output": match r.output {
      None => Json::null()
      Some(s) => Json::string(s)
    },
  }).stringify()
}
