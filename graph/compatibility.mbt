///|
/// Preserve the optional handle and its frame rate, unlike the seconds-only
/// convenience query. Paths identify a child in this immutable graph.
pub fn Graph::handles_time(
  self : Graph,
  path : Array[Int32],
) -> Result[(@time.RationalTime?, @time.RationalTime?), String] {
  let parent = match self.parent(path) {
    Ok(Some(v)) => v
    Ok(None) => return Err("not_a_child")
    Err(e) => return Err(e)
  }
  if parent.schema_name() != "Track" {
    return Ok((None, None))
  }
  let children = match children(parent) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let i = path[path.length() - 1]
  let head = if i > 0 && children[i - 1].schema_name() == "Transition" {
    match offset_time(children[i - 1], "in_offset") {
      Ok(v) => Some(v)
      Err(e) => return Err(e)
    }
  } else {
    None
  }
  let tail = if i + 1 < children.length() &&
    children[i + 1].schema_name() == "Transition" {
    match offset_time(children[i + 1], "out_offset") {
      Ok(v) => Some(v)
      Err(e) => return Err(e)
    }
  } else {
    None
  }
  Ok((head, tail))
}

///|
pub fn trim_child_range(
  parent : @schema.Object,
  r : @range.TimeRange,
) -> Result[@range.TimeRange?, String] {
  let window = match parent.source_range() {
    Ok(Some(v)) => v
    Ok(None) => return Ok(Some(r))
    Err(e) => return Err(e)
  }
  if window.start().to_seconds().unwrap() >=
    r.end_time_exclusive().unwrap().to_seconds().unwrap() ||
    window.end_time_exclusive().unwrap().to_seconds().unwrap() <=
    r.start().to_seconds().unwrap() {
    return Ok(None)
  }
  let mut result = r
  if result.start().to_seconds().unwrap() < window.start().to_seconds().unwrap() {
    result = @range.from_start_end(
      window.start(),
      result.end_time_exclusive().unwrap(),
    ).unwrap()
  }
  if result.end_time_exclusive().unwrap().to_seconds().unwrap() >
    window.end_time_exclusive().unwrap().to_seconds().unwrap() {
    result = @range.from_start_end(
      result.start(),
      window.end_time_exclusive().unwrap(),
    ).unwrap()
  }
  Ok(Some(result))
}

///|
pub fn trimmed_range_of_child_at_index(
  parent : @schema.Object,
  index : Int32,
) -> Result[@range.TimeRange, String] {
  let r = match range_of_child(parent, index) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  if parent.schema_name() == "Stack" {
    let window = match parent.source_range() {
      Ok(Some(v)) => v
      Ok(None) => return Ok(r)
      Err(e) => return Err(e)
    }
    let d = if window.duration().to_seconds().unwrap() <
      r.duration().to_seconds().unwrap() {
      window.duration()
    } else {
      r.duration()
    }
    return @range.TimeRange::new(window.start(), d)
  }
  match trim_child_range(parent, r) {
    Ok(Some(v)) => Ok(v)
    Ok(None) => Err("invalid_time_range")
    Err(e) => Err(e)
  }
}

///|
fn clamp_child_result(
  parent : @schema.Object,
  r : @range.TimeRange,
) -> Result[@range.TimeRange?, String] {
  let window = match parent.source_range() {
    Ok(Some(v)) => v
    Ok(None) => return Ok(Some(r))
    Err(e) => return Err(e)
  }
  let start = if r.start().to_seconds().unwrap() >
    window.start().to_seconds().unwrap() {
    r.start()
  } else {
    window.start()
  }
  if start.to_seconds().unwrap() >
    r.end_time_exclusive().unwrap().to_seconds().unwrap() {
    return Ok(None)
  }
  let a = r.end_time_exclusive().unwrap()
  let b = window.end_time_exclusive().unwrap()
  let end = if b.to_seconds().unwrap() < a.to_seconds().unwrap() {
    b
  } else {
    a
  }
  let d = match sub_time(end, start) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  if d.value() < 0.0 {
    return Ok(None)
  }
  match @range.TimeRange::new(start, d) {
    Ok(v) => Ok(Some(v))
    Err(e) => Err(e)
  }
}

///|
pub fn Graph::pop(
  self : Graph,
  parent : Array[Int32],
  index~ : Int32 = -1,
) -> Result[(Graph, @schema.Object), String] {
  let a = match self.children(parent) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let index = if index < 0 { index + a.length() } else { index }
  if index < 0 || index >= a.length() {
    return Err("child_index")
  }
  let path = parent.copy()
  path.push(index)
  match self.remove(path) {
    Ok(g) => Ok((g, a[index]))
    Err(e) => Err(e)
  }
}

///|
/// Compatibility with OTIO 0.18.1's inherited MutableSequence.reverse: swapping
/// parented children raises ValueError. For a functional reversal use
/// Object.with_children(Object.children().rev()) instead.
pub fn Graph::reversed_children(
  self : Graph,
  parent : Array[Int32],
) -> Result[Graph, String] {
  let node = match self.at(parent) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let a = match node.children() {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  if node.is_a("Composition") && a.length() > 1 {
    return Err("child_already_parent")
  }
  match node.with_children(a.rev()) {
    Ok(v) => self.replace(parent, v)
    Err(e) => Err(e)
  }
}

///|
/// Index/count address an occurrence by path, never by JSON value equality.
pub fn Graph::index_of_child(
  self : Graph,
  parent : Array[Int32],
  child : Array[Int32],
  start~ : Int32 = 0,
  stop~ : Int32? = None,
) -> Result[Int32, String] {
  let a = match self.children(parent) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  if child.length() != parent.length() + 1 ||
    prefix(child, parent.length()) != parent {
    return Err("not_a_child")
  }
  match self.at(child) {
    Err(_) => return Err("not_a_child")
    _ => ()
  }
  let low = if start < 0 { start + a.length() } else { start }
  let end = stop.unwrap_or(a.length())
  let high = if end < 0 { end + a.length() } else { end }
  let i = child[child.length() - 1]
  if i < low || i >= high {
    return Err("not_a_child")
  }
  Ok(i)
}

///|
pub fn Graph::count_child(
  self : Graph,
  parent : Array[Int32],
  child : Array[Int32],
) -> Result[Int32, String] {
  match self.children(parent) {
    Err(e) => return Err(e)
    _ => ()
  }
  Ok(if self.index_of_child(parent, child) is Ok(_) { 1 } else { 0 })
}
