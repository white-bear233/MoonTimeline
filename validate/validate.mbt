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
/// Validate structural and active media ranges without filesystem/network access.
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
  if t.tracks.source_range is Some(_) {
    issues.push({
      code: "composition_trimmed",
      severity: Info,
      path: "/tracks/source_range",
      message: "Stack trimming is preserved but layout is not computed",
    })
  }
  for ti = 0; ti < t.tracks.children.length(); ti = ti + 1 {
    let track = t.tracks.children[ti]
    if track.source_range is Some(_) {
      issues.push({
        code: "composition_trimmed",
        severity: Info,
        path: "/tracks/children/" + ti.to_string() + "/source_range",
        message: "Track trimming is preserved but layout is not computed",
      })
    }
    for ii = 0; ii < track.children.length(); ii = ii + 1 {
      let path = "/tracks/children/" +
        ti.to_string() +
        "/children/" +
        ii.to_string()
      let item = track.children[ii]
      if item is @model.Opaque(raw) {
        let tag = @timeline.opaque_schema(raw)
        if tag == "Transition.1" {
          issues.push({
            code: "opaque_transition",
            severity: Info,
            path,
            message: "Transition preserved verbatim; treated as zero duration",
          })
        } else {
          issues.push({
            code: "unsupported_item",
            severity: Error,
            path,
            message: "Preserved node is outside the computed subset: " + tag,
          })
        }
        continue
      }
      match @timeline.source_range(item) {
        Err(_) =>
          issues.push({
            code: "unknown_duration",
            severity: Warning,
            path: path + "/source_range",
            message: "Neither source nor available range determines duration",
          })
        Ok(r) =>
          if r.duration().value() == 0.0 {
            issues.push({
              code: "empty_item",
              severity: Info,
              path: path + "/source_range",
              message: "Zero-duration item",
            })
          }
      }
      match item {
        @model.Opaque(_) => () // Reported above and skipped.
        @model.Gap(_) => ()
        @model.Clip(c) =>
          match c.active_media() {
            Err(_) => () // Structural writer diagnostic already identifies the key.
            Ok(media) => {
              match media.kind {
                @model.Missing =>
                  issues.push({
                    code: "missing_media",
                    severity: Warning,
                    path: path + "/media_references",
                    message: "Active reference is explicitly missing",
                  })
                @model.External(url) =>
                  if url == "" {
                    issues.push({
                      code: "empty_media_url",
                      severity: Warning,
                      path: path + "/media_references",
                      message: "External media URL is empty",
                    })
                  }
                @model.Opaque(_) =>
                  issues.push({
                    code: "opaque_media",
                    severity: Info,
                    path: path + "/media_references",
                    message: "Media reference kind is preserved but not interpreted",
                  })
              }
              match media.available_range {
                None =>
                  issues.push({
                    code: "unknown_available_range",
                    severity: Info,
                    path: path + "/media_references",
                    message: "Media bounds cannot be verified",
                  })
                Some(available) =>
                  match c.effective_range() {
                    Err(_) => ()
                    Ok(source) =>
                      if source.start().to_seconds().unwrap() <
                        available.start().to_seconds().unwrap() ||
                        source.end_seconds() > available.end_seconds() {
                        issues.push({
                          code: "source_out_of_bounds",
                          severity: Error,
                          path: path + "/source_range",
                          message: "Source range exceeds active media availability",
                        })
                      }
                  }
              }
            }
          }
      }
    }
  }
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
