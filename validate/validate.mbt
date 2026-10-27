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
  check_attributes(stack.attributes, true, path, issues)
  for i = 0; i < stack.children.length(); i = i + 1 {
    match @model.transition_of(stack.children[i]) {
      Ok(Some(_)) =>
        push(
          issues,
          "transition_requires_track",
          Error,
          path + "/children/" + i.to_string(),
          "Transitions require sequential Track neighbors",
        )
      _ => ()
    }
  }
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
  check_attributes(track.attributes, true, path, issues)
  for problem in @timeline.transition_issues(track) {
    push(
      issues,
      problem.code,
      Error,
      path + "/children/" + problem.index.to_string(),
      "Invalid transition offsets or adjacent item constraints",
    )
  }
  for i = 0; i < track.children.length(); i = i + 1 {
    let child_path = path + "/children/" + i.to_string()
    let head = if i > 0 {
      match @model.transition_of(track.children[i - 1]) {
        Ok(Some(t)) => t.in_offset.to_seconds().unwrap()
        _ => 0.0
      }
    } else {
      0.0
    }
    let tail = if i + 1 < track.children.length() {
      match @model.transition_of(track.children[i + 1]) {
        Ok(Some(t)) => t.out_offset.to_seconds().unwrap()
        _ => 0.0
      }
    } else {
      0.0
    }
    if head > 0.0 || tail > 0.0 {
      match track.children[i] {
        @model.Clip(c) =>
          match c.check_media_bounds(head, tail) {
            Err("source_out_of_bounds") =>
              push(
                issues,
                "insufficient_transition_handles",
                Error,
                child_path,
                "Playback-mapped transition handles exceed active media availability",
              )
            Err("unknown_available_range") =>
              push(
                issues,
                "unknown_transition_handles",
                Warning,
                child_path,
                "Media availability is unknown; transition handles cannot be verified",
              )
            Err("source_overflow") =>
              push(
                issues,
                "source_overflow",
                Error,
                child_path,
                "Transition media mapping overflow",
              )
            _ => ()
          }
        @model.Track(_) | @model.Stack(_) =>
          match @timeline.check_media_handles(track.children[i], head, tail) {
            Err("source_out_of_bounds") =>
              push(
                issues,
                "insufficient_transition_handles",
                Error,
                child_path,
                "Nested playback-mapped handles exceed media availability",
              )
            Err("unknown_available_range") =>
              push(
                issues,
                "unknown_transition_handles",
                Warning,
                child_path,
                "Nested media availability is unknown",
              )
            Err(e) =>
              push(
                issues,
                e,
                Error,
                child_path,
                "Nested transition media mapping failed",
              )
            Ok(_) => ()
          }
        _ => ()
      }
    }
  }
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
    @model.Clip(c) => check_attributes(c.attributes, false, path, issues)
    @model.Gap(g) => check_attributes(g.attributes, false, path, issues)
    _ => ()
  }
  match item {
    @model.Stack(s) => walk_stack(s, path, issues)
    @model.Track(t) => walk_track(t, path, issues)
    @model.Opaque(raw) => {
      let tag = @timeline.opaque_schema(raw)
      if tag == "Transition.1" {
        push(
          issues,
          "transition",
          Info,
          path,
          "Transition range is computed without advancing the Track cursor",
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
            Some(_) =>
              match c.check_media_bounds(0.0, 0.0) {
                Err("source_out_of_bounds") =>
                  push(
                    issues,
                    "source_out_of_bounds",
                    Error,
                    path + "/source_range",
                    "Playback-mapped source exceeds active media availability",
                  )
                Err("source_overflow") =>
                  push(
                    issues,
                    "source_overflow",
                    Error,
                    path + "/source_range",
                    "Playback source overflow",
                  )
                _ => ()
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
  if has_errors(issues) {
    return issues
  }
  walk_stack(t.tracks, "/tracks", issues)
  match @timeline.layout(t) {
    Err(e) =>
      if !e.has_prefix("unknown_duration:") {
        issues.push({
          code: "layout_error",
          severity: Error,
          path: "/tracks",
          message: e,
        })
      }
    Ok(_) => ()
  }
  issues
}

///|
fn check_attributes(
  attr : @model.Attributes,
  _composition : Bool,
  path : String,
  issues : Array[Issue],
) -> Unit {
  match attr.playback_scalar() {
    Err(e) =>
      push(
        issues,
        e,
        Error,
        path + "/effects",
        "Effects are preserved but cannot be evaluated safely",
      )
    Ok(_) => ()
  }
  match attr.extra {
    Object(o) =>
      match o.get("markers") {
        Some(Array(markers)) =>
          for i = 0; i < markers.length(); i = i + 1 {
            match markers[i] {
              Object(_) => ()
              _ =>
                push(
                  issues,
                  "invalid_marker",
                  Error,
                  path + "/markers/" + i.to_string(),
                  "Marker must be an object; input retained unchanged",
                )
            }
          }
        None => ()
        _ =>
          push(
            issues,
            "invalid_markers",
            Error,
            path + "/markers",
            "Markers must be an array; input retained unchanged",
          )
      }
    _ => ()
  }
}
