///|
pub fn Graph::child_at_time(
  self : Graph,
  path : Array[Int32],
  time : @time.RationalTime,
  shallow~ : Bool = false,
) -> Result[Array[Int32]?, String] {
  let ranges = match self.ranges_of_all_children(path) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let first = bisect(ranges, time, ending=true, right=false)
  let last = bisect(ranges, time, ending=false, right=true, lower=first)
  let mut index : Int32? = None
  for i = first; i < last; i = i + 1 {
    if ranges[i].unwrap().contains(time).unwrap() {
      index = Some(i)
      break
    }
  }
  let i = match index {
    Some(v) => v
    None => return Ok(None)
  }
  let chosen = path.copy()
  chosen.push(i)
  let node = self.at(chosen).unwrap()
  if shallow || !["Track", "Stack", "Composition"].contains(node.schema_name()) {
    return Ok(Some(chosen))
  }
  let time = match self.transformed_time(time, path, chosen) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  self.child_at_time(chosen, time)
}

///|
pub fn Graph::children_in_range(
  self : Graph,
  path : Array[Int32],
  range : @range.TimeRange,
) -> Result[Array[Array[Int32]], String] {
  let node = match self.at(path) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let children = match children(node) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let out : Array[Array[Int32]] = []
  if node.schema_name() == "Stack" {
    for i = 0; i < children.length(); i = i + 1 {
      if children[i].schema_name() == "Transition" {
        continue
      }
      let p = path.copy()
      p.push(i)
      let r = match self.range_in_parent(p, trimmed=true) {
        Ok(Some(v)) => v
        Ok(None) => continue
        Err(e) => return Err(e)
      }
      if r.relates(range, @range.Intersects) {
        out.push(p)
      }
    }
  } else {
    let ranges = match self.ranges_of_all_children(path) {
      Ok(v) => v
      Err(e) => return Err(e)
    }
    let first = bisect(
      ranges,
      range.start(),
      ending=true,
      inclusive=true,
      right=false,
    )
    let last = bisect(
      ranges,
      range.end_time_inclusive().unwrap(),
      ending=false,
      right=true,
      lower=first,
    )
    for i = first; i < last; i = i + 1 {
      let p = path.copy()
      p.push(i)
      out.push(p)
    }
  }
  Ok(out)
}

///|
pub fn Graph::ranges_of_all_children(
  self : Graph,
  path : Array[Int32],
  trimmed~ : Bool = false,
) -> Result[Array[@range.TimeRange?], String] {
  let a = match self.children(path) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let out : Array[@range.TimeRange?] = []
  let parent = self.at(path).unwrap()
  if !trimmed && parent.schema_name() == "Track" && a.length() > 0 {
    let first = if a[0].schema_name() == "Transition" {
      offset_time(a[0], "in_offset")
    } else {
      duration_time(a[0])
    }
    let first = match first {
      Ok(v) => v
      Err(e) => return Err(e)
    }
    let mut end = @time.RationalTime::new(0.0, first.rate()).unwrap()
    for child in a {
      let d = match duration_time(child) {
        Ok(v) => v
        Err(e) => return Err(e)
      }
      let start = if child.schema_name() == "Transition" {
        let head = match offset_time(child, "in_offset") {
          Ok(v) => v
          Err(e) => return Err(e)
        }
        match sub_time(end, head) {
          Ok(v) => v
          Err(e) => return Err(e)
        }
      } else {
        end
      }
      let r = match @range.TimeRange::new(start, d) {
        Ok(v) => v
        Err(e) => return Err(e)
      }
      out.push(Some(r))
      if child.schema_name() != "Transition" {
        end = r.end_time_exclusive().unwrap()
      }
    }
  } else {
    for i = 0; i < a.length(); i = i + 1 {
      let p = path.copy()
      p.push(i)
      match self.range_in_parent(p, trimmed~) {
        Ok(v) => out.push(v)
        Err(e) => return Err(e)
      }
    }
  }
  Ok(out)
}

///|
pub fn Graph::tracks(
  self : Graph,
  kind : String,
) -> Result[Array[@schema.Object], String] {
  if self.root.schema_name() != "Timeline" {
    return Err("not_a_timeline")
  }
  let tracks = match self.children([0]) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  Ok(
    tracks.filter(fn(t) {
      t.schema_name() == "Track" && t.get("kind") == Some(Json::string(kind))
    }),
  )
}

///|
/// Mirrors upstream: Track unions its direct clips; Stack unions descendants.
pub fn available_image_bounds(
  object : @schema.Object,
) -> Result[@schema.Box2d?, String] {
  if object.schema_name() == "Clip" {
    return match object.active_media() {
      Ok(m) =>
        match m.image_bounds() {
          Ok(None) => Err("cannot_compute_image_bounds")
          other => other
        }
      Err(e) => Err(e)
    }
  }
  if ["Composition", "Item", "Gap"].contains(object.schema_name()) {
    return Err("not_implemented:available_image_bounds")
  }
  if object.schema_name() != "Track" && object.schema_name() != "Stack" {
    return Ok(None)
  }
  let graph = Graph::new(object)
  let paths = graph.find(schema="Clip", shallow=object.schema_name() == "Track")
  let mut bounds : @schema.Box2d? = None
  for path in paths {
    match available_image_bounds(graph.at(path).unwrap()) {
      Ok(Some(box)) =>
        bounds = Some(
          match bounds {
            Some(old) => old.extended_by(box)
            None => box
          },
        )
      Ok(None) => ()
      Err(e) => return Err(e)
    }
  }
  Ok(bounds)
}

///|
/// Upstream composition searches use bisect even for overlapping stacks.
fn bisect(
  ranges : Array[@range.TimeRange?],
  time : @time.RationalTime,
  ending~ : Bool = false,
  inclusive~ : Bool = false,
  right~ : Bool = false,
  lower~ : Int32 = 0,
) -> Int32 {
  let mut low = lower
  let mut high = ranges.length()
  while low < high {
    let mid = (low + high) / 2
    let r = ranges[mid].unwrap()
    let key = if ending {
      if inclusive {
        r.end_time_inclusive().unwrap()
      } else {
        r.end_time_exclusive().unwrap()
      }
    } else {
      r.start()
    }
    let left = if right {
      time.to_seconds().unwrap() < key.to_seconds().unwrap()
    } else {
      key.to_seconds().unwrap() >= time.to_seconds().unwrap()
    }
    if left {
      high = mid
    } else {
      low = mid + 1
    }
  }
  low
}
