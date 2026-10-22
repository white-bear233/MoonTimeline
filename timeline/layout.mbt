///|
pub(all) struct Placement {
  path : String
  node : String
  track_index : Int32
  item_index : Int32
  start_seconds : Double
  end_seconds : Double
  source : @range.TimeRange
  enabled : Bool
}

///|
pub(all) struct Layout {
  items : Array[Placement]
  track_durations : Array[Double]
  duration_seconds : Double
}

///|
/// Content range of a clip or gap. Compositions have no single source range.
pub fn source_range(item : @model.Item) -> Result[@range.TimeRange, String] {
  match item {
    @model.Gap(g) => Ok(g.source_range)
    @model.Clip(c) => c.effective_range()
    @model.Stack(_) | @model.Track(_) => Err("composition_range")
    @model.Opaque(_) => Err("opaque_item")
  }
}

///|
/// Schema tag of a preserved node. Transitions are zero-duration in OTIO: they
/// sit at a cut and do not advance the track cursor.
pub fn opaque_schema(j : Json) -> String {
  match j {
    Object(o) =>
      match o.get("OTIO_SCHEMA") {
        Some(String(s)) => s
        _ => ""
      }
    _ => ""
  }
}

///|
fn span(range : @range.TimeRange) -> (Double, Double) {
  let start = range.start().to_seconds().unwrap()
  (start, start + range.duration().to_seconds().unwrap())
}

///|
fn range_of(
  start : Double,
  duration : Double,
  rate : Double,
) -> Result[@range.TimeRange, String] {
  let rt = match @time.RationalTime::new(start * rate, rate) {
    Ok(v) => v
    Err(_) => return Err("time_overflow")
  }
  let d = match @time.RationalTime::new(duration * rate, rate) {
    Ok(v) => v
    Err(_) => return Err("time_overflow")
  }
  @range.TimeRange::new(rt, d)
}

///|
fn shift_range(
  range : @range.TimeRange,
  offset : Double,
) -> Result[@range.TimeRange, String] {
  let (start, end) = span(range)
  range_of(start + offset, end - start, range.start().rate())
}

///|
/// Natural duration in seconds: `source_range` wins, otherwise content extent.
fn item_duration(item : @model.Item) -> Result[Double, String] {
  match item {
    @model.Clip(c) =>
      match c.effective_range() {
        Ok(r) => {
          let (start, end) = span(r)
          Ok(end - start)
        }
        Err(e) => Err("unknown_duration:" + e)
      }
    @model.Gap(g) => {
      let (start, end) = span(g.source_range)
      Ok(end - start)
    }
    @model.Stack(s) => stack_duration(s)
    @model.Track(t) => track_duration(t)
    @model.Opaque(raw) =>
      if opaque_schema(raw) == "Transition.1" {
        Ok(0.0)
      } else {
        Err("unsupported_item:" + opaque_schema(raw))
      }
  }
}

///|
fn track_duration(track : @model.Track) -> Result[Double, String] {
  match track.source_range {
    Some(r) => {
      let (start, end) = span(r)
      Ok(end - start)
    }
    None => {
      let mut total = 0.0
      for item in track.children {
        match item_duration(item) {
          Ok(d) => total = total + d
          Err(e) => return Err(e)
        }
      }
      Ok(total)
    }
  }
}

///|
fn stack_duration(stack : @model.Stack) -> Result[Double, String] {
  match stack.source_range {
    Some(r) => {
      let (start, end) = span(r)
      Ok(end - start)
    }
    None => {
      let mut total = 0.0
      for child in stack.children {
        match item_duration(child) {
          Ok(d) => if d > total { total = d }
          Err(e) => return Err(e)
        }
      }
      Ok(total)
    }
  }
}

///|
fn window(source : @range.TimeRange?, content : Double) -> (Double, Double) {
  match source {
    Some(r) => span(r)
    None => (0.0, content)
  }
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
fn item_enabled(item : @model.Item) -> Bool {
  match item {
    @model.Clip(c) => c.attributes.enabled
    @model.Gap(g) => g.attributes.enabled
    @model.Stack(s) => s.attributes.enabled
    @model.Track(t) => t.attributes.enabled
    @model.Opaque(_) => true
  }
}

///|
fn layout_track(
  track : @model.Track,
  offset : Double,
  clip0 : Double,
  clip1 : Double,
  path : String,
  track_index : Int32,
  enabled : Bool,
  out : Array[Placement],
) -> Result[Unit, String] {
  let content = match track_duration(track) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let (w0, w1) = window(track.source_range, content)
  let visible = match intersect(w0, w1, clip0, clip1) {
    Some(v) => v
    None => return Ok(())
  }
  let (e0, e1) = visible
  let mut cursor = 0.0
  for i = 0; i < track.children.length(); i = i + 1 {
    let child = track.children[i]
    let duration = match item_duration(child) {
      Ok(v) => v
      Err(e) => return Err(e)
    }
    let b0 = cursor
    let b1 = cursor + duration
    cursor = b1
    let piece = match intersect(b0, b1, e0, e1) {
      Some(v) => v
      None => continue
    }
    let (v0, v1) = piece
    let child_offset = offset + (v0 - e0)
    let child_path = path + "/children/" + i.to_string()
    let child_enabled = enabled && item_enabled(child)
    match child {
      @model.Stack(s) =>
        match
          layout_stack(
            s,
            child_offset,
            v0 - b0,
            v1 - b0,
            child_path,
            track_index,
            child_enabled,
            out,
          ) {
          Ok(_) => ()
          Err(e) => return Err(e)
        }
      @model.Track(t) =>
        match
          layout_track(
            t,
            child_offset,
            v0 - b0,
            v1 - b0,
            child_path,
            track_index,
            child_enabled,
            out,
          ) {
          Ok(_) => ()
          Err(e) => return Err(e)
        }
      @model.Opaque(raw) =>
        if !(opaque_schema(raw) == "Transition.1") {
          return Err("unsupported_item:" + child_path)
        }
      _ => {
        let original = match source_range(child) {
          Ok(v) => v
          Err(e) => return Err(e)
        }
        let shifted = match shift_range(original, v0 - b0) {
          Ok(v) => v
          Err(e) => return Err(e)
        }
        out.push({
          path: child_path,
          node: if child is @model.Clip(_) {
            "clip"
          } else {
            "gap"
          },
          track_index,
          item_index: i,
          start_seconds: child_offset,
          end_seconds: child_offset + (v1 - v0),
          source: shifted,
          enabled: child_enabled,
        })
      }
    }
  }
  Ok(())
}

///|
fn layout_stack(
  stack : @model.Stack,
  offset : Double,
  clip0 : Double,
  clip1 : Double,
  path : String,
  track_index : Int32,
  enabled : Bool,
  out : Array[Placement],
) -> Result[Unit, String] {
  let content = match stack_duration(stack) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let (w0, w1) = window(stack.source_range, content)
  let visible = match intersect(w0, w1, clip0, clip1) {
    Some(v) => v
    None => return Ok(())
  }
  let (e0, e1) = visible
  for i = 0; i < stack.children.length(); i = i + 1 {
    let child = stack.children[i]
    let duration = match item_duration(child) {
      Ok(v) => v
      Err(e) => return Err(e)
    }
    let piece = match intersect(0.0, duration, e0, e1) {
      Some(v) => v
      None => continue
    }
    let (v0, v1) = piece
    let child_offset = offset + (v0 - e0)
    let child_path = path + "/children/" + i.to_string()
    let index = if track_index < 0 { i } else { track_index }
    let child_enabled = enabled &&
      stack.attributes.enabled &&
      item_enabled(child)
    match child {
      @model.Track(t) =>
        match
          layout_track(
            t, child_offset, v0, v1, child_path, index, child_enabled, out,
          ) {
          Ok(_) => ()
          Err(e) => return Err(e)
        }
      @model.Stack(s) =>
        match
          layout_stack(
            s, child_offset, v0, v1, child_path, index, child_enabled, out,
          ) {
          Ok(_) => ()
          Err(e) => return Err(e)
        }
      @model.Opaque(raw) =>
        if !(opaque_schema(raw) == "Transition.1") {
          return Err("unsupported_item:" + child_path)
        }
      _ => {
        let original = match source_range(child) {
          Ok(v) => v
          Err(e) => return Err(e)
        }
        let shifted = match shift_range(original, v0) {
          Ok(v) => v
          Err(e) => return Err(e)
        }
        out.push({
          path: child_path,
          node: if child is @model.Clip(_) {
            "clip"
          } else {
            "gap"
          },
          track_index: index,
          item_index: i,
          start_seconds: child_offset,
          end_seconds: child_offset + (v1 - v0),
          source: shifted,
          enabled: child_enabled,
        })
      }
    }
  }
  Ok(())
}

///|
/// Recursive layout with composition trimming: each composition exposes the
/// intersection of its `source_range` window and the window its parent sees.
pub fn layout(t : @model.Timeline) -> Result[Layout, String] {
  let items : Array[Placement] = []
  let durations : Array[Double] = []
  let content = match stack_duration(t.tracks) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let (w0, w1) = window(t.tracks.source_range, content)
  for i = 0; i < t.tracks.children.length(); i = i + 1 {
    let child = t.tracks.children[i]
    let duration = match item_duration(child) {
      Ok(v) => v
      Err(e) => return Err(e)
    }
    let visible = match intersect(0.0, duration, w0, w1) {
      Some(v) => v
      None => (0.0, 0.0)
    }
    durations.push(visible.1 - visible.0)
  }
  match layout_stack(t.tracks, 0.0, w0, w1, "/tracks", -1, true, items) {
    Ok(_) => ()
    Err(e) => return Err(e)
  }
  Ok({ items, track_durations: durations, duration_seconds: w1 - w0, })
}

///|
/// Public duration probe for callers that only need the span of one node.
pub fn duration_of(item : @model.Item) -> Result[Double, String] {
  item_duration(item)
}

///|
/// Query half-open intervals; simultaneous tracks may return multiple items.
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
/// Translate a track position into the original media coordinate.
pub fn Placement::source_at(
  self : Placement,
  seconds : Double,
) -> Result[@time.RationalTime, String] {
  if seconds.is_nan() ||
    seconds < self.start_seconds ||
    seconds >= self.end_seconds {
    return Err("outside_item")
  }
  let start = self.source.start()
  let value = start.value() + (seconds - self.start_seconds) * start.rate()
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
