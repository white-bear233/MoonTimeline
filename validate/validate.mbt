///|
pub(all) enum Severity {
  Error
  Warning
  Info
}

///|
pub(all) struct Issue {
  code : String
  severity : Severity
  path : String
  message : String
}

///|
pub fn has_errors(issues : Array[Issue]) -> Bool {
  issues.any(fn(i) { i.severity is Error })
}

///|
fn push(
  issues : Array[Issue],
  code : String,
  severity : Severity,
  path : String,
  message : String,
) -> Unit {
  issues.push({ code, severity, path, message, })
}

///|
fn walk_stack(
  stack : @model.Stack,
  path : String,
  issues : Array[Issue],
) -> Unit {
  if stack.source_range is Some(_) {
    push(
      issues,
      "composition_trimmed",
      Info,
      path + "/source_range",
      "Stack window is trimmed; layout reports clipped coordinates",
    )
  }
  match @timeline.duration_of(@model.Stack(stack)) {
    Err(e) =>
      push(
        issues,
        "unknown_duration",
        Warning,
        path,
        "Composition duration cannot be determined: " + e,
      )
    Ok(_) => ()
  }
  for i = 0; i < stack.children.length(); i = i + 1 {
    walk_item(stack.children[i], path + "/children/" + i.to_string(), issues)
  }
}

///|
fn walk_track(
  track : @model.Track,
  path : String,
  issues : Array[Issue],
) -> Unit {
  if track.source_range is Some(_) {
    push(
      issues,
      "composition_trimmed",
      Info,
      path + "/source_range",
      "Track window is trimmed; layout reports clipped coordinates",
    )
  }
  for i = 0; i < track.children.length(); i = i + 1 {
    walk_item(track.children[i], path + "/children/" + i.to_string(), issues)
  }
}

///|
fn walk_item(item : @model.Item, path : String, issues : Array[Issue]) -> Unit {
  match item {
    @model.Stack(s) => walk_stack(s, path, issues)
    @model.Track(t) => walk_track(t, path, issues)
    @model.Opaque(raw) => {
      let tag = @timeline.opaque_schema(raw)
      if tag == "Transition.1" {
        push(
          issues,
          "opaque_transition",
          Info,
          path,
          "Transition preserved verbatim; treated as zero duration",
        )
      } else {
        push(
          issues,
          "unsupported_item",
          Error,
          path,
          "Preserved node is outside the computed subset: " + tag,
        )
      }
    }
    _ =>
      match @timeline.source_range(item) {
        Err(_) =>
          push(
            issues,
            "unknown_duration",
            Warning,
            path + "/source_range",
            "Neither source nor available range determines duration",
          )
        Ok(r) =>
          if r.duration().value() == 0.0 {
            push(
              issues,
              "empty_item",
              Info,
              path + "/source_range",
              "Zero-duration item",
            )
          }
      }
  }
  match item {
    @model.Clip(c) =>
      match c.active_media() {
        Err(_) => ()
        Ok(media) => {
          match media.kind {
            @model.Missing =>
              push(
                issues,
                "missing_media",
                Warning,
                path + "/media_references",
                "Active reference is explicitly missing",
              )
            @model.External(url) =>
              if url == "" {
                push(
                  issues,
                  "empty_media_url",
                  Warning,
                  path + "/media_references",
                  "External media URL is empty",
                )
              }
            @model.Opaque(_) =>
              push(
                issues,
                "opaque_media",
                Info,
                path + "/media_references",
                "Media reference kind is preserved but not interpreted",
              )
          }
          match media.available_range {
            None =>
              push(
                issues,
                "unknown_available_range",
                Info,
                path + "/media_references",
                "Media bounds cannot be verified",
              )
            Some(available) =>
              match c.effective_range() {
                Err(_) => ()
                Ok(source) =>
                  if source.start().to_seconds().unwrap() <
                    available.start().to_seconds().unwrap() ||
                    source.end_seconds() > available.end_seconds() {
                    push(
                      issues,
                      "source_out_of_bounds",
                      Error,
                      path + "/source_range",
                      "Source range exceeds active media availability",
                    )
                  }
              }
          }
        }
      }
    _ => ()
  }
}

///|
/// Validate structural ranges, media bounds and preserved nodes without
/// filesystem or network access.
pub fn validate(t : @model.Timeline) -> Array[Issue] {
  let issues : Array[Issue] = []
  match @otio.write(t) {
    Err(e) =>
      issues.push({
        code: e.code,
        severity: Error,
        path: e.path,
        message: e.message,
      })
    Ok(_) => ()
  }
  walk_stack(t.tracks, "/tracks", issues)
  match @timeline.layout(t) {
    Err(e) =>
      if e == "layout_overflow" {
        issues.push({
          code: "layout_overflow",
          severity: Error,
          path: "/tracks",
          message: "Timeline duration cannot be represented",
        })
      }
    Ok(_) => ()
  }
  issues
}
