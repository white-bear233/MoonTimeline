///|
pub(all) struct Placement {
  path : String
  node : String
  track_index : Int32
  item_index : Int32
  start_seconds : Double
  end_seconds : Double
  /// Start in media coordinates; duration remains presentation duration.
  source : @range.TimeRange
  time_scalar : Double
  enabled : Bool
}

///|
pub(all) struct TransitionPlacement {
  path : String
  left_path : String?
  right_path : String?
  /// Full range in timeline coordinates, before composition clipping.
  start_seconds : Double
  end_seconds : Double
  cut_seconds : Double
  visible_start_seconds : Double
  visible_end_seconds : Double
  in_seconds : Double
  out_seconds : Double
  enabled : Bool
}

///|
pub(all) struct Layout {
  items : Array[Placement]
  transitions : Array[TransitionPlacement]
  track_durations : Array[Double]
  duration_seconds : Double
}

///|
pub fn source_range(item : @model.Item) -> Result[@range.TimeRange, String] {
  match item {
    @model.Gap(g) => Ok(g.source_range)
    @model.Clip(c) => c.effective_range()
    @model.Stack(_) | @model.Track(_) => Err("composition_range")
    @model.Opaque(_) => Err("opaque_item")
  }
}

///|
pub fn opaque_schema(j : Json) -> String {
  @model.schema_name(j)
}

///|
fn finite(n : Double) -> Result[Double, String] {
  if n.is_inf() || n.is_nan() {
    Err("layout_overflow")
  } else {
    Ok(n)
  }
}

///|
fn range_of(
  start : Double,
  duration : Double,
  rate : Double,
) -> Result[@range.TimeRange, String] {
  let a = match @time.RationalTime::new(start * rate, rate) {
    Ok(v) => v
    Err(_) => return Err("source_overflow")
  }
  let b = match @time.RationalTime::new(duration * rate, rate) {
    Ok(v) => v
    Err(_) => return Err("source_overflow")
  }
  @range.TimeRange::new(a, b)
}

///|
fn is_transition(item : @model.Item) -> Bool {
  match item {
    @model.Opaque(raw) => opaque_schema(raw) == "Transition.1"
    _ => false
  }
}

///|
/// OTIO duration, not sequential advancement. A transition has nonzero duration.
pub fn duration_of(item : @model.Item) -> Result[Double, String] {
  match item {
    @model.Clip(c) =>
      match c.effective_range() {
        Ok(r) => Ok(r.duration().to_seconds().unwrap())
        Err(e) => Err("unknown_duration:" + e)
      }
    @model.Gap(g) => Ok(g.source_range.duration().to_seconds().unwrap())
    @model.Track(t) =>
      match t.source_range {
        Some(r) => Ok(r.duration().to_seconds().unwrap())
        None => {
          let mut total = 0.0
          for child in t.children {
            if is_transition(child) {
              continue
            }
            match duration_of(child) {
              Ok(d) => total = total + d
              Err(e) => return Err(e)
            }
          }
          if t.children.length() > 0 {
            match @model.transition_of(t.children[0]) {
              Ok(Some(tr)) => total = total + tr.in_offset.to_seconds().unwrap()
              Err(e) => return Err(e)
              _ => ()
            }
            match @model.transition_of(t.children[t.children.length() - 1]) {
              Ok(Some(tr)) =>
                total = total + tr.out_offset.to_seconds().unwrap()
              Err(e) => return Err(e)
              _ => ()
            }
          }
          finite(total)
        }
      }
    @model.Stack(s) =>
      match s.source_range {
        Some(r) => Ok(r.duration().to_seconds().unwrap())
        None => {
          let mut total = 0.0
          for child in s.children {
            if is_transition(child) {
              return Err("transition_requires_track")
            }
            match duration_of(child) {
              Ok(d) => if d > total { total = d }
              Err(e) => return Err(e)
            }
          }
          finite(total)
        }
      }
    @model.Opaque(raw) =>
      match @model.transition_of(item) {
        Ok(Some(tr)) =>
          finite(
            tr.in_offset.to_seconds().unwrap() +
            tr.out_offset.to_seconds().unwrap(),
          )
        Err(e) => Err(e)
        _ => Err("unsupported_item:" + opaque_schema(raw))
      }
  }
}

///|
pub(all) struct TransitionIssue {
  index : Int32
  code : String
}

///|
/// Structural constraints from OTIO's timeline-structure specification.
/// Boundary transitions use implicit gaps; zero-duration gaps are valid fades.
pub fn transition_issues(track : @model.Track) -> Array[TransitionIssue] {
  let issues : Array[TransitionIssue] = []
  let children = track.children
  for i = 0; i < children.length(); i = i + 1 {
    match @model.transition_of(children[i]) {
      Err(e) => issues.push({ index: i, code: e, })
      Ok(Some(tr)) => {
        let a = tr.in_offset.to_seconds().unwrap()
        let b = tr.out_offset.to_seconds().unwrap()
        for side in [0, 1] {
          let n = if side == 0 { i - 1 } else { i + 1 }
          if n < 0 || n >= children.length() {
            continue
          }
          if is_transition(children[n]) {
            issues.push({ index: i, code: "adjacent_transitions", })
            continue
          }
          match duration_of(children[n]) {
            Ok(d) => {
              let zero_gap = children[n] is @model.Gap(_) && d == 0.0
              if !zero_gap && (if side == 0 { a } else { b }) > d + 1.0e-9 {
                issues.push({ index: i, code: "transition_exceeds_neighbor", })
              }
            }
            Err(_) =>
              issues.push({ index: i, code: "unknown_transition_neighbor", })
          }
        }
      }
      _ => ()
    }
    if i > 0 && i + 1 < children.length() && !is_transition(children[i]) {
      match
        (
          @model.transition_of(children[i - 1]),
          @model.transition_of(children[i + 1]),
          duration_of(children[i]),
        ) {
        (Ok(Some(a)), Ok(Some(b)), Ok(d)) =>
          if a.out_offset.to_seconds().unwrap() +
            b.in_offset.to_seconds().unwrap() >
            d + 1.0e-9 {
            issues.push({ index: i, code: "overlapping_transitions", })
          }
        _ => ()
      }
    }
  }
  issues
}

///|
/// Full transition range in its Track coordinates, even outside the trim window.
pub fn transition_range(
  track : @model.Track,
  index : Int32,
) -> Result[@range.TimeRange, String] {
  if index < 0 || index >= track.children.length() {
    return Err("item_index")
  }
  let tr = match @model.transition_of(track.children[index]) {
    Ok(Some(v)) => v
    Err(e) => return Err(e)
    _ => return Err("not_a_transition")
  }
  let mut cursor = 0.0
  for i = 0; i < index; i = i + 1 {
    if is_transition(track.children[i]) {
      continue
    }
    match duration_of(track.children[i]) {
      Ok(d) => cursor = cursor + d
      Err(e) => return Err(e)
    }
  }
  let a = tr.in_offset.to_seconds().unwrap()
  let b = tr.out_offset.to_seconds().unwrap()
  range_of(cursor - a, a + b, tr.in_offset.rate())
}

///|
fn intersect(
  a0 : Double,
  a1 : Double,
  b0 : Double,
  b1 : Double,
) -> (Double, Double)? {
  let lo = if a0 > b0 { a0 } else { b0 }
  let hi = if a1 < b1 { a1 } else { b1 }
  if hi > lo {
    Some((lo, hi))
  } else {
    None
  }
}

///|
fn attributes(item : @model.Item) -> @model.Attributes {
  match item {
    @model.Clip(c) => c.attributes
    @model.Gap(g) => g.attributes
    @model.Track(t) => t.attributes
    @model.Stack(s) => s.attributes
    @model.Opaque(_) => @model.Attributes::new("")
  }
}

///|
/// local0/local1 are presentation offsets into the already-trimmed item.
/// Add each composition's source start exactly once when descending.
fn visit(
  item : @model.Item,
  local0 : Double,
  local1 : Double,
  offset : Double,
  path : String,
  track_index : Int32,
  item_index : Int32,
  parent_enabled : Bool,
  out : Array[Placement],
  transitions : Array[TransitionPlacement],
) -> Result[Unit, String] {
  let attr = attributes(item)
  let enabled = parent_enabled && attr.enabled
  let scalar = match attr.playback_scalar() {
    Ok(v) => v
    Err(e) => return Err(e + ":" + path)
  }
  let composition = match item {
    @model.Track(t) => Some((t.children, t.source_range, true))
    @model.Stack(s) => Some((s.children, s.source_range, false))
    _ => None
  }
  match composition {
    None => {
      let original = match source_range(item) {
        Ok(v) => v
        Err(e) => return Err(e)
      }
      let start = original.start().to_seconds().unwrap() + local0 * scalar
      let source = match
        range_of(start, local1 - local0, original.start().rate()) {
        Ok(v) => v
        Err(e) => return Err(e)
      }
      match finite(start + (local1 - local0) * scalar) {
        Err(e) => return Err(e)
        _ => ()
      }
      out.push({
        path,
        node: if item is @model.Clip(_) {
          "clip"
        } else {
          "gap"
        },
        track_index,
        item_index,
        start_seconds: offset,
        end_seconds: offset + local1 - local0,
        source,
        time_scalar: scalar,
        enabled,
      })
    }
    Some((children, window, sequential)) => {
      if scalar != 1.0 {
        return Err("unsupported_composition_retime:" + path)
      }
      match item {
        @model.Track(t) => {
          let problems = transition_issues(t)
          if problems.length() > 0 {
            return Err(
              problems[0].code +
              ":" +
              path +
              "/children/" +
              problems[0].index.to_string(),
            )
          }
        }
        _ => ()
      }
      let w0 = match window {
        Some(r) => r.start().to_seconds().unwrap()
        None => 0.0
      }
      let e0 = w0 + local0
      let e1 = w0 + local1
      match finite(e1) {
        Err(e) => return Err(e)
        _ => ()
      }
      let mut cursor = 0.0
      for i = 0; i < children.length(); i = i + 1 {
        let child = children[i]
        let child_path = path + "/children/" + i.to_string()
        let index = if track_index < 0 { i } else { track_index }
        match @model.transition_of(child) {
          Err(e) => return Err(e + ":" + child_path)
          Ok(Some(tr)) => {
            if !sequential {
              return Err("transition_requires_track:" + child_path)
            }
            let a = tr.in_offset.to_seconds().unwrap()
            let b = tr.out_offset.to_seconds().unwrap()
            let start = cursor - a
            let end = cursor + b
            for
              point in [start, end, offset + (start - e0), offset + (end - e0)] {
              match finite(point) {
                Err(e) => return Err(e)
                Ok(_) => ()
              }
            }
            match intersect(start, end, e0, e1) {
              Some((v0, v1)) =>
                transitions.push({
                  path: child_path,
                  left_path: if i > 0 {
                    Some(path + "/children/" + (i - 1).to_string())
                  } else {
                    None
                  },
                  right_path: if i + 1 < children.length() {
                    Some(path + "/children/" + (i + 1).to_string())
                  } else {
                    None
                  },
                  start_seconds: offset + (start - e0),
                  end_seconds: offset + (end - e0),
                  cut_seconds: offset + (cursor - e0),
                  visible_start_seconds: offset + (v0 - e0),
                  visible_end_seconds: offset + (v1 - e0),
                  in_seconds: a,
                  out_seconds: b,
                  enabled,
                })
              None => ()
            }
            continue
          }
          _ => ()
        }
        let d = match duration_of(child) {
          Ok(v) => v
          Err(e) => return Err(e)
        }
        let b0 = if sequential { cursor } else { 0.0 }
        let b1 = match finite(b0 + d) {
          Ok(v) => v
          Err(e) => return Err(e)
        }
        if sequential {
          cursor = b1
        }
        match intersect(b0, b1, e0, e1) {
          Some((v0, v1)) =>
            match
              visit(
                child,
                v0 - b0,
                v1 - b0,
                offset + (v0 - e0),
                child_path,
                index,
                i,
                enabled,
                out,
                transitions,
              ) {
              Err(e) => return Err(e)
              _ => ()
            }
          None => ()
        }
      }
    }
  }
  Ok(())
}

///|
pub fn layout(t : @model.Timeline) -> Result[Layout, String] {
  let root = @model.Stack(t.tracks)
  let duration = match duration_of(root) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let items : Array[Placement] = []
  let transitions : Array[TransitionPlacement] = []
  match
    visit(root, 0.0, duration, 0.0, "/tracks", -1, -1, true, items, transitions) {
    Err(e) => return Err(e)
    _ => ()
  }
  let durations : Array[Double] = []
  let w0 = match t.tracks.source_range {
    Some(r) => r.start().to_seconds().unwrap()
    None => 0.0
  }
  for child in t.tracks.children {
    let d = match duration_of(child) {
      Ok(v) => v
      Err(e) => return Err(e)
    }
    durations.push(
      match intersect(0.0, d, w0, w0 + duration) {
        Some((a, b)) => b - a
        None => 0.0
      },
    )
  }
  Ok({
    items,
    transitions,
    track_durations: durations,
    duration_seconds: duration,
  })
}

///|
pub fn Layout::items_at(
  self : Layout,
  seconds : Double,
) -> Result[Array[Placement], String] {
  if seconds.is_nan() || seconds.is_inf() {
    return Err("invalid_query_time")
  }
  Ok(
    self.items.filter(fn(p) {
      seconds >= p.start_seconds && seconds < p.end_seconds
    }),
  )
}

///|
pub fn Layout::transitions_at(
  self : Layout,
  seconds : Double,
) -> Result[Array[TransitionPlacement], String] {
  if seconds.is_nan() || seconds.is_inf() {
    return Err("invalid_query_time")
  }
  Ok(
    self.transitions.filter(fn(p) {
      seconds >= p.visible_start_seconds && seconds < p.visible_end_seconds
    }),
  )
}

///|
/// Playback mapping; OTIO's structural transformed_time ignores TimeEffects.
pub fn Placement::source_at(
  self : Placement,
  seconds : Double,
) -> Result[@time.RationalTime, String] {
  if seconds.is_nan() ||
    seconds.is_inf() ||
    seconds < self.start_seconds ||
    seconds >= self.end_seconds {
    return Err("outside_item")
  }
  let start = self.source.start()
  let value = start.value() +
    (seconds - self.start_seconds) * start.rate() * self.time_scalar
  match @time.RationalTime::new(value, start.rate()) {
    Ok(t) => Ok(t)
    Err(_) => Err("source_overflow")
  }
}

///|
/// Path of an index sequence: /tracks/children/0/children/2/children/1.
pub fn path_of(indices : Array[Int32]) -> String {
  let mut out = "/tracks"
  for i in indices {
    out = out + "/children/" + i.to_string()
  }
  out
}

///|
fn split_path(path : String) -> Array[String] {
  let parts : Array[String] = []
  let mut current = StringBuilder()
  for c in path {
    if c == '/' {
      parts.push(current.to_string())
      current = StringBuilder()
    } else {
      current.write_char(c)
    }
  }
  parts.push(current.to_string())
  parts
}

///|
fn parse_index(text : String) -> Result[Int32, String] {
  if text.length() == 0 {
    return Err("empty_index")
  }
  let mut value : Int32 = 0
  for c in text {
    if c < '0' || c > '9' {
      return Err("bad_index")
    }
    value = value * 10 + (c.to_int() - 48)
  }
  Ok(value)
}

///|
/// Parse a layout path into child indices. Keywords are accepted but optional;
/// the path must start at /tracks.
pub fn indices_of(path : String) -> Result[Array[Int32], String] {
  let segments = split_path(path)
  let indices : Array[Int32] = []
  for i = 0; i < segments.length(); i = i + 1 {
    let part = segments[i]
    if part == "" || part == "tracks" || part == "children" {
      continue
    }
    match parse_index(part) {
      Ok(v) => indices.push(v)
      Err(e) => return Err(e)
    }
  }
  if indices.length() == 0 {
    return Err("empty_path")
  }
  Ok(indices)
}

///|
/// Resolve an item by child indices. Index 0 selects a root track.
pub fn item_at(
  t : @model.Timeline,
  indices : Array[Int32],
) -> Result[@model.Item, String] {
  if indices.length() == 0 {
    return Err("empty_path")
  }
  let first = indices[0]
  if first < 0 || first >= t.tracks.children.length() {
    return Err("track_index")
  }
  let mut node : @model.Item = t.tracks.children[first]
  let mut k = 1
  while k < indices.length() {
    let index = indices[k]
    node = match node {
      @model.Track(track) =>
        if index < 0 || index >= track.children.length() {
          return Err("item_index")
        } else {
          track.children[index]
        }
      @model.Stack(stack) =>
        if index < 0 || index >= stack.children.length() {
          return Err("track_index")
        } else {
          stack.children[index]
        }
      _ => return Err("not_a_composition")
    }
    k = k + 1
  }
  Ok(node)
}
