///|
pub fn Graph::child_at_time(
  self : Graph,
  path : Array[Int32],
  time : @time.RationalTime,
  shallow~ : Bool = false,
) -> Result[Array[Int32]?, String] {
  let matches = match self.children_at_time(path, time) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  if matches.length() == 0 {
    return Ok(None)
  }
  let chosen = matches[0]
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
  for i = 0; i < children.length(); i = i + 1 {
    let r = match range_of_child(node, i) {
      Ok(v) => v
      Err(e) => return Err(e)
    }
    let intersects = if range.duration().value() == 0.0 {
      r.contains(range.start()).unwrap()
    } else {
      r.intersection(range).unwrap() is Some(_)
    }
    if intersects {
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
  for i = 0; i < a.length(); i = i + 1 {
    let p = path.copy()
    p.push(i)
    match self.range_in_parent(p, trimmed~) {
      Ok(v) => out.push(v)
      Err(e) => return Err(e)
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
      Ok(m) => m.image_bounds()
      Err(e) => Err(e)
    }
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
