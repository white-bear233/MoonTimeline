///|
pub(all) struct Placement {
  path : String
  node : String
  track_index : Int32
  item_index : Int32
  start_seconds : Double
  end_seconds : Double
  start_inclusive : Bool
  end_inclusive : Bool
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
  cut_seconds : Double?
  visible_start_seconds : Double
  visible_end_seconds : Double
  start_inclusive : Bool
  end_inclusive : Bool
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
  duration_at_depth(item, 0)
}

///|
fn duration_at_depth(
  item : @model.Item,
  depth : Int32,
) -> Result[Double, String] {
  if depth > 64 {
    return Err("composition_limit_or_cycle")
  }
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
            match duration_at_depth(child, depth + 1) {
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
            match duration_at_depth(child, depth + 1) {
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
priv struct Window {
  start : Double
  end : Double
  start_inclusive : Bool
  end_inclusive : Bool
}

///|
fn Window::contains(self : Window, t : Double) -> Bool {
  (t > self.start || (self.start_inclusive && t == self.start)) &&
  (t < self.end || (self.end_inclusive && t == self.end))
}

///|
/// Intersect a root window with a child half-open interval under an affine map.
/// Reversing time changes which endpoint is closed; a freeze selects one sample.
fn project(
  window : Window,
  origin : Double,
  slope : Double,
  lo : Double,
  hi : Double,
) -> Result[Window?, String] {
  if hi <= lo {
    return Ok(None)
  }
  if slope == 0.0 {
    return Ok(if origin >= lo && origin < hi { Some(window) } else { None })
  }
  let a = window.start + (lo - origin) / slope
  let b = window.start + (hi - origin) / slope
  for v in [a, b] {
    match finite(v) {
      Err(e) => return Err(e)
      _ => ()
    }
  }
  let lower = if slope > 0.0 { a } else { b }
  let upper = if slope > 0.0 { b } else { a }
  let start = if lower > window.start { lower } else { window.start }
  let end = if upper < window.end { upper } else { window.end }
  let start_inclusive = (start != lower || slope > 0.0) &&
    (start != window.start || window.start_inclusive)
  let end_inclusive = (end != upper || slope < 0.0) &&
    (end != window.end || window.end_inclusive)
  Ok(
    if start < end || (start == end && start_inclusive && end_inclusive) {
      Some({ start, end, start_inclusive, end_inclusive, })
    } else {
      None
    },
  )
}

///|
fn visit(
  item : @model.Item,
  window : Window,
  local0 : Double,
  slope : Double,
  path : String,
  track_index : Int32,
  item_index : Int32,
  parent_enabled : Bool,
  out : Array[Placement],
  transitions : Array[TransitionPlacement],
  depth : Int32,
) -> Result[Unit, String] {
  if depth > 64 {
    return Err("composition_depth")
  }
  let attr = attributes(item)
  let enabled = parent_enabled && attr.enabled
  let scalar = match attr.playback_scalar() {
    Ok(v) => v
    Err(e) => return Err(e + ":" + path)
  }
  let mapped_slope = match finite(slope * scalar) {
    Ok(v) => v
    Err(e) => return Err(e)
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
        range_of(start, window.end - window.start, original.start().rate()) {
        Ok(v) => v
        Err(e) => return Err(e)
      }
      match finite(start + (window.end - window.start) * mapped_slope) {
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
        start_seconds: window.start,
        end_seconds: window.end,
        start_inclusive: window.start_inclusive,
        end_inclusive: window.end_inclusive,
        source,
        time_scalar: mapped_slope,
        enabled,
      })
    }
    Some((children, source_window, sequential)) => {
      match item {
        @model.Track(t) => {
          let issues = transition_issues(t)
          if issues.length() > 0 {
            return Err(
              issues[0].code +
              ":" +
              path +
              "/children/" +
              issues[0].index.to_string(),
            )
          }
        }
        _ => ()
      }
      let base = match source_window {
        Some(r) => r.start().to_seconds().unwrap()
        None => 0.0
      }
      let origin = match finite(base + local0 * scalar) {
        Ok(v) => v
        Err(e) => return Err(e)
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
            let visible = match
              project(window, origin, mapped_slope, cursor - a, cursor + b) {
              Ok(v) => v
              Err(e) => return Err(e)
            }
            match visible {
              Some(v) => {
                let full_a = if mapped_slope == 0.0 {
                  window.start
                } else {
                  window.start + (cursor - a - origin) / mapped_slope
                }
                let full_b = if mapped_slope == 0.0 {
                  window.end
                } else {
                  window.start + (cursor + b - origin) / mapped_slope
                }
                let cut = if mapped_slope == 0.0 {
                  None
                } else {
                  Some(window.start + (cursor - origin) / mapped_slope)
                }
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
                  start_seconds: if full_a < full_b {
                    full_a
                  } else {
                    full_b
                  },
                  end_seconds: if full_a > full_b {
                    full_a
                  } else {
                    full_b
                  },
                  cut_seconds: cut,
                  visible_start_seconds: v.start,
                  visible_end_seconds: v.end,
                  start_inclusive: v.start_inclusive,
                  end_inclusive: v.end_inclusive,
                  in_seconds: a,
                  out_seconds: b,
                  enabled,
                })
              }
              None => ()
            }
            continue
          }
          _ => ()
        }
        let duration = match duration_of(child) {
          Ok(v) => v
          Err(e) => return Err(e)
        }
        let lo = if sequential { cursor } else { 0.0 }
        let hi = match finite(lo + duration) {
          Ok(v) => v
          Err(e) => return Err(e)
        }
        if sequential {
          cursor = hi
        }
        let visible = match project(window, origin, mapped_slope, lo, hi) {
          Ok(v) => v
          Err(e) => return Err(e)
        }
        match visible {
          Some(v) =>
            match
              visit(
                child,
                v,
                origin + (v.start - window.start) * mapped_slope - lo,
                mapped_slope,
                child_path,
                index,
                i,
                enabled,
                out,
                transitions,
                depth + 1,
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
  match @model.check_tree(t) {
    Err(e) => return Err(e)
    _ => ()
  }
  let root = @model.Stack(t.tracks)
  let duration = match duration_of(root) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let items : Array[Placement] = []
  let transitions : Array[TransitionPlacement] = []
  match
    visit(
      root,
      {
        start: 0.0,
        end: duration,
        start_inclusive: true,
        end_inclusive: false,
      },
      0.0,
      1.0,
      "/tracks",
      -1,
      -1,
      true,
      items,
      transitions,
      0,
    ) {
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
      match
        project(
          {
            start: 0.0,
            end: duration,
            start_inclusive: true,
            end_inclusive: false,
          },
          w0,
          t.tracks.attributes.playback_scalar().unwrap(),
          0.0,
          d,
        ) {
        Ok(Some(v)) => v.end - v.start
        Ok(None) => 0.0
        Err(e) => return Err(e)
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
      Window::{
        start: p.start_seconds,
        end: p.end_seconds,
        start_inclusive: p.start_inclusive,
        end_inclusive: p.end_inclusive,
      }.contains(seconds)
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
      Window::{
        start: p.visible_start_seconds,
        end: p.visible_end_seconds,
        start_inclusive: p.start_inclusive,
        end_inclusive: p.end_inclusive,
      }.contains(seconds)
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
    !Window::{
      start: self.start_seconds,
      end: self.end_seconds,
      start_inclusive: self.start_inclusive,
      end_inclusive: self.end_inclusive,
    }.contains(seconds) {
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
