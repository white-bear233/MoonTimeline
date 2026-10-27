///|
fn span(start : Double, duration : Double) -> Result[@range.TimeRange, String] {
  let a = match @time.RationalTime::new(start, 1.0) {
    Ok(v) => v
    Err(_) => return Err("time_overflow")
  }
  let b = match @time.RationalTime::new(duration, 1.0) {
    Ok(v) => v
    Err(_) => return Err("time_overflow")
  }
  @range.TimeRange::new(a, b)
}

///|
fn set_range(
  item : @schema.Object,
  start : Double,
  duration : Double,
) -> Result[@schema.Object, String] {
  let r = match span(start, duration) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let rate = match @graph.trimmed_range(item) {
    Ok(v) => v.start().rate()
    Err(_) => 1.0
  }
  let converted = @range.TimeRange::new(
    r.start().rescaled_to(rate).unwrap(),
    r.duration().rescaled_to(rate).unwrap(),
  ).unwrap()
  item.with_field("source_range", @schema.range_json(converted))
}

///|
/// Structural OTIO algorithm: TimeEffects remain metadata, as in upstream.
/// Playback-aware editing is provided separately by the edit package.
pub fn track_trimmed_to_range(
  track : @schema.Object,
  bounds : @range.TimeRange,
) -> Result[@schema.Object, String] {
  if track.schema_name() != "Track" {
    return Err("not_a_track")
  }
  let children = match track.children() {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let out : Array[@schema.Object] = []
  let lo = bounds.start().to_seconds().unwrap()
  let hi = bounds.end_seconds()
  for i = 0; i < children.length(); i = i + 1 {
    let item = children[i]
    let range = match @graph.range_of_child(track, i) {
      Ok(v) => v
      Err(e) => return Err(e)
    }
    let a = range.start().to_seconds().unwrap()
    let b = range.end_seconds()
    if !bounds.relates(range, @range.Intersects) {
      continue
    }
    if bounds.relates(range, @range.Contains) {
      out.push(item)
      continue
    }
    if item.schema_name() == "Transition" {
      return Err("cannot_trim_transition")
    }
    let source = match @graph.trimmed_range(item) {
      Ok(v) => v
      Err(e) => return Err(e)
    }
    let start = if lo > a { lo } else { a }
    let end = if hi < b { hi } else { b }
    let trimmed = match
      set_range(
        item,
        source.start().to_seconds().unwrap() + start - a,
        end - start,
      ) {
      Ok(v) => v
      Err(e) => return Err(e)
    }
    out.push(trimmed)
  }
  track.with_children(out)
}

///|
pub fn timeline_trimmed_to_range(
  timeline : @schema.Object,
  bounds : @range.TimeRange,
) -> Result[@schema.Object, String] {
  if timeline.schema_name() != "Timeline" {
    return Err("not_a_timeline")
  }
  let stack = match timeline.get("tracks") {
    Some(j) => @schema.Object::from_json(j).unwrap()
    None => return Err("missing_tracks")
  }
  let tracks = match stack.children() {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let out : Array[@schema.Object] = []
  for track in tracks {
    match track_trimmed_to_range(track, bounds) {
      Ok(v) => out.push(v)
      Err(e) => return Err(e)
    }
  }
  timeline.with_field(
    "tracks",
    stack.with_children(out).unwrap().to_json().unwrap(),
  )
}

///|
pub(all) enum Expanded {
  Item(@schema.Object)
  Transition(@schema.Object, @schema.Object, @schema.Object)
}

///|
fn time_offset(
  t : @schema.Object,
  field : String,
) -> Result[@time.RationalTime, String] {
  let j = match t.get(field) {
    Some(j) => j
    None => return Err("missing_offset")
  }
  match @schema.parse_time(j) {
    Ok(v) => if v.value() < 0.0 { Err("negative_offset") } else { Ok(v) }
    Err(e) => Err(e)
  }
}

///|
fn timed_item(
  item : @schema.Object,
  start : @time.RationalTime,
  duration : @time.RationalTime,
) -> Result[@schema.Object, String] {
  match @range.TimeRange::new(start, duration) {
    Ok(r) => item.with_field("source_range", @schema.range_json(r))
    Err(e) => Err(e)
  }
}

///|
pub fn track_with_expanded_transitions(
  track : @schema.Object,
) -> Result[Array[Expanded], String] {
  if track.schema_name() != "Track" {
    return Err("not_a_track")
  }
  let children = match track.children() {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let out : Array[Expanded] = []
  for i = 0; i < children.length(); i = i + 1 {
    let item = children[i]
    if item.schema_name() == "Transition" {
      let a = match time_offset(item, "in_offset") {
        Ok(v) => v
        Err(e) => return Err(e)
      }
      let b = match time_offset(item, "out_offset") {
        Ok(v) => v
        Err(e) => return Err(e)
      }
      let total = match a.add(b) {
        Ok(v) => v
        Err(_) => return Err("time_overflow")
      }
      let left = if i > 0 {
        children[i - 1]
      } else {
        timed_item(
          @schema.Object::new("Gap").unwrap(),
          @time.RationalTime::new(0.0, a.rate()).unwrap(),
          a,
        ).unwrap()
      }
      let right = if i + 1 < children.length() {
        children[i + 1]
      } else {
        timed_item(
          @schema.Object::new("Gap").unwrap(),
          @time.RationalTime::new(0.0, b.rate()).unwrap(),
          b,
        ).unwrap()
      }
      if left.schema_name() == "Transition" ||
        right.schema_name() == "Transition" {
        return Err("adjacent_transitions")
      }
      let lr = match @graph.trimmed_range(left) {
        Ok(v) => v
        Err(e) => return Err(e)
      }
      let rr = match @graph.trimmed_range(right) {
        Ok(v) => v
        Err(e) => return Err(e)
      }
      let prestart = lr.end_time_exclusive().unwrap().subtract(a).unwrap()
      let poststart = rr
        .start()
        .subtract(a)
        .unwrap()
        .rescaled_to(rr.start().rate())
        .unwrap()
      let pre = match
        timed_item(
          left,
          prestart,
          total.rescaled_to(lr.start().rate()).unwrap(),
        ) {
        Ok(v) => v
        Err(e) => return Err(e)
      }
      let post = match
        timed_item(
          right,
          poststart,
          total.rescaled_to(rr.start().rate()).unwrap(),
        ) {
        Ok(v) => v
        Err(e) => return Err(e)
      }
      let lname = match pre.get("name") {
        Some(String(s)) => s
        _ => ""
      }
      let rname = match post.get("name") {
        Some(String(s)) => s
        _ => ""
      }
      out.push(
        Transition(
          pre
          .with_field("name", Json::string(lname + "_transition_pre"))
          .unwrap(),
          item,
          post
          .with_field("name", Json::string(rname + "_transition_post"))
          .unwrap(),
        ),
      )
    } else {
      let r = match @graph.trimmed_range(item) {
        Ok(v) => v
        Err(e) => return Err(e)
      }
      let mut start = r.start()
      let mut duration = r.duration()
      if i > 0 && children[i - 1].schema_name() == "Transition" {
        let a = match time_offset(children[i - 1], "out_offset") {
          Ok(v) => v
          Err(e) => return Err(e)
        }
        start = start.add(a).unwrap()
        duration = duration.subtract(a).unwrap()
      }
      if i + 1 < children.length() &&
        children[i + 1].schema_name() == "Transition" {
        let b = match time_offset(children[i + 1], "in_offset") {
          Ok(v) => v
          Err(e) => return Err(e)
        }
        duration = duration.subtract(b).unwrap()
      }
      match timed_item(item, start, duration) {
        Ok(v) => out.push(Item(v))
        Err(e) => return Err(e)
      }
    }
  }
  Ok(out)
}

///|
fn visible(item : @schema.Object) -> Bool {
  item.schema_name() != "Gap" &&
  item.get("enabled") != Some(Json::boolean(false))
}

///|
pub fn top_clip_at_time(
  stack : @schema.Object,
  time : @time.RationalTime,
) -> Result[@schema.Object?, String] {
  if stack.schema_name() != "Stack" {
    return Err("not_a_stack")
  }
  let tracks = match stack.children() {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  for i = tracks.length() - 1; i >= 0; i = i - 1 {
    let track = tracks[i]
    let items = match track.children() {
      Ok(v) => v
      Err(_) => continue
    }
    for k = 0; k < items.length(); k = k + 1 {
      if items[k].schema_name() != "Clip" || !visible(items[k]) {
        continue
      }
      let r = match @graph.range_of_child(track, k) {
        Ok(v) => v
        Err(e) => return Err(e)
      }
      if r.contains(time).unwrap() {
        return Ok(Some(items[k]))
      }
    }
  }
  Ok(None)
}

///|
/// Transparent gaps/disabled items reveal the next lower enabled track.
pub fn flatten_stack(stack : @schema.Object) -> Result[@schema.Object, String] {
  if stack.schema_name() != "Stack" {
    return Err("not_a_stack")
  }
  let children = match stack.children() {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let tracks : Array[@schema.Object] = []
  let mut longest = 0.0
  for track in children {
    if track.schema_name() != "Track" {
      return Err("not_a_track")
    }
    if !visible(track) {
      continue
    }
    let d = match @graph.duration(track) {
      Ok(v) => v
      Err(e) => return Err(e)
    }
    if d > longest {
      longest = d
    }
    tracks.push(track)
  }
  for i = 0; i < tracks.length(); i = i + 1 {
    let d = @graph.duration(tracks[i]).unwrap()
    if d < longest {
      let a = tracks[i].children().unwrap()
      a.push(
        set_range(@schema.Object::new("Gap").unwrap(), 0.0, longest - d).unwrap(),
      )
      tracks[i] = tracks[i].with_children(a).unwrap()
    }
  }
  let out : Array[@schema.Object] = []
  fn collect(
    index : Int32,
    bounds : @range.TimeRange?,
  ) -> Result[Unit, String] {
    if index < 0 {
      return Ok(())
    }
    let track = match bounds {
      Some(r) =>
        match track_trimmed_to_range(tracks[index], r) {
          Ok(v) => v
          Err(e) => return Err(e)
        }
      None => tracks[index]
    }
    let a = track.children().unwrap()
    for i = 0; i < a.length(); i = i + 1 {
      if a[i].schema_name() == "Transition" || visible(a[i]) || index == 0 {
        out.push(a[i])
      } else {
        let range = match @graph.range_of_child(track, i) {
          Ok(v) => v
          Err(e) => return Err(e)
        }
        let origin = match bounds {
          Some(r) => r.start().to_seconds().unwrap()
          None => 0.0
        }
        let next = span(
          range.start().to_seconds().unwrap() + origin,
          range.duration().to_seconds().unwrap(),
        ).unwrap()
        match collect(index - 1, Some(next)) {
          Err(e) => return Err(e)
          _ => ()
        }
      }
    }
    Ok(())
  }
  match collect(tracks.length() - 1, None) {
    Err(e) => return Err(e)
    _ => ()
  }
  @schema.Object::new("Track")
  .unwrap()
  .with_field("name", Json::string("Flattened"))
  .unwrap()
  .with_children(out)
}

///|
/// Callback receives original sibling context. Empty output prunes a subtree;
/// multiple outputs replace a child. Expanded output is not recursively refiltered.
pub fn filtered_with_sequence_context(
  root : @schema.Object,
  filter : (@schema.Object?, @schema.Object, @schema.Object?) -> Result[
    Array[@schema.Object],
    String,
  ],
  prune~ : Array[String] = [],
) -> Result[Array[@schema.Object], String] {
  fn walk(
    previous : @schema.Object?,
    node : @schema.Object,
    next : @schema.Object?,
    depth : Int32,
  ) -> Result[Array[@schema.Object], String] {
    if depth > 64 {
      return Err("input_limit")
    }
    if prune.contains(node.schema_name()) {
      return Ok([])
    }
    let replacements = match filter(previous, node, next) {
      Ok(v) => v
      Err(e) => return Err(e)
    }
    if replacements.length() != 1 {
      return Ok(replacements)
    }
    let node = replacements[0]
    if node.schema_name() == "Timeline" {
      let stack = match node.get("tracks") {
        Some(j) => @schema.Object::from_json(j).unwrap()
        None => return Err("missing_tracks")
      }
      let result = match walk(None, stack, None, depth + 1) {
        Ok(v) => v
        Err(e) => return Err(e)
      }
      if result.length() != 1 || result[0].schema_name() != "Stack" {
        return Err("timeline_requires_stack")
      }
      return Ok([
        node.with_field("tracks", result[0].to_json().unwrap()).unwrap(),
      ])
    }
    let a = match node.children() {
      Ok(v) => v
      Err(_) => return Ok(replacements)
    }
    let out : Array[@schema.Object] = []
    for i = 0; i < a.length(); i = i + 1 {
      let prev = if i > 0 { Some(a[i - 1]) } else { None }
      let next = if i + 1 < a.length() { Some(a[i + 1]) } else { None }
      let values = match walk(prev, a[i], next, depth + 1) {
        Ok(v) => v
        Err(e) => return Err(e)
      }
      for value in values {
        out.push(value)
      }
    }
    Ok([node.with_children(out).unwrap()])
  }
  walk(None, root, None, 0)
}

///|
pub fn filtered_composition(
  root : @schema.Object,
  filter : (@schema.Object) -> Result[Array[@schema.Object], String],
  prune~ : Array[String] = [],
) -> Result[Array[@schema.Object], String] {
  filtered_with_sequence_context(
    root,
    fn(_previous, node, _next) { filter(node) },
    prune~,
  )
}
