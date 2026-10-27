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
  let tracks = t.tracks.children.map(fn(child) {
    match child {
      @model.Track(track) =>
        Json::object({
          "name": Json::string(track.attributes.name),
          "kind": Json::string(
            match track.kind {
              @model.Video => "Video"
              @model.Audio => "Audio"
            },
          ),
        })
      @model.Stack(stack) =>
        Json::object({
          "name": Json::string(stack.attributes.name),
          "kind": Json::string("Stack"),
        })
      _ =>
        Json::object({ "name": Json::string(""), "kind": Json::string("item") })
    }
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
      o["transitions"] = Json::array([])
    }
    Ok(l) => {
      o["duration"] = Json::number(l.duration_seconds)
      o["transitions"] = Json::array(
        l.transitions.map(fn(p) {
          Json::object({
            "path": Json::string(p.path),
            "left_path": match p.left_path {
              Some(s) => Json::string(s)
              None => Json::null()
            },
            "right_path": match p.right_path {
              Some(s) => Json::string(s)
              None => Json::null()
            },
            "start": Json::number(p.start_seconds),
            "end": Json::number(p.end_seconds),
            "cut": match p.cut_seconds {
              Some(n) => Json::number(n)
              None => Json::null()
            },
            "visible_start": Json::number(p.visible_start_seconds),
            "visible_end": Json::number(p.visible_end_seconds),
            "in_offset": Json::number(p.in_seconds),
            "out_offset": Json::number(p.out_seconds),
            "enabled": Json::boolean(p.enabled),
          })
        }),
      )
      o["items"] = Json::array(
        l.items.map(fn(p) {
          let name = match @timeline.indices_of(p.path) {
            Ok(indices) =>
              match @timeline.item_at(t, indices) {
                Ok(item) =>
                  match item {
                    @model.Clip(c) => c.attributes.name
                    @model.Gap(g) => g.attributes.name
                    @model.Stack(s) => s.attributes.name
                    @model.Track(tr) => tr.attributes.name
                    @model.Opaque(_) => ""
                  }
                Err(_) => ""
              }
            Err(_) => ""
          }
          Json::object({
            "path": Json::string(p.path),
            "track": Json::number(p.track_index.to_double()),
            "index": Json::number(p.item_index.to_double()),
            "name": Json::string(name),
            "kind": Json::string(p.node),
            "start": Json::number(p.start_seconds),
            "end": Json::number(p.end_seconds),
            "source_start": Json::number(p.source.start().to_seconds().unwrap()),
            "time_scalar": Json::number(p.time_scalar),
            "enabled": Json::boolean(p.enabled),
          })
        }),
      )
    }
  }
  Json::object(o)
}

///|
fn indices_for(path : String) -> Result[Array[Int32]?, String] {
  if path == "" {
    return Ok(None)
  }
  match @timeline.indices_of(path) {
    Ok(v) => Ok(Some(v))
    Err(e) => Err(e)
  }
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
  path : String,
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
  let indices = match indices_for(path) {
    Ok(v) => v
    Err(e) => return error(e)
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
      "split" =>
        match indices {
          Some(ix) => @edit.split_at(t, ix, offset)
          None => @edit.split(t, track, item, offset)
        }
      "trim" =>
        match indices {
          Some(ix) => @edit.trim_at(t, ix, offset, length)
          None => @edit.trim(t, track, item, offset, length)
        }
      "gap" =>
        match indices {
          Some(ix) => @edit.insert_gap_at(t, ix, item, length)
          None => @edit.insert_gap(t, track, item, length)
        }
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
