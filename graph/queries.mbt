///|
pub fn Graph::children(
  self : Graph,
  path : Array[Int32],
) -> Result[Array[@schema.Object], String] {
  match self.at(path) {
    Ok(node) => children(node)
    Err(e) => Err(e)
  }
}

///|
pub fn Graph::insert(
  self : Graph,
  parent : Array[Int32],
  index : Int32,
  child : @schema.Object,
) -> Result[Graph, String] {
  let node = match self.at(parent) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let a = match children(node) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let index = if index < 0 {
    let adjusted = index + a.length()
    if adjusted < 0 {
      0
    } else {
      adjusted
    }
  } else if index > a.length() {
    a.length()
  } else {
    index
  }
  a.insert(index, child)
  match replace_children(node, a) {
    Ok(v) => self.replace(parent, v)
    Err(e) => Err(e)
  }
}

///|
pub fn Graph::remove(
  self : Graph,
  path : Array[Int32],
) -> Result[Graph, String] {
  if path.length() == 0 {
    return Err("cannot_remove_root")
  }
  let parent_path = prefix(path, path.length() - 1)
  let node = match self.at(parent_path) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let a = match children(node) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let index = path[path.length() - 1]
  if index < 0 || index >= a.length() {
    return Err("child_index")
  }
  a.remove(index) |> ignore
  match replace_children(node, a) {
    Ok(v) => self.replace(parent_path, v)
    Err(e) => Err(e)
  }
}

///|
/// Neighbors retain composition order. Optional implicit gaps model a fade at
/// a Track boundary; their durations equal the missing transition handles.
pub fn Graph::neighbors(
  self : Graph,
  path : Array[Int32],
  insert_gaps~ : Bool = false,
) -> Result[(@schema.Object?, @schema.Object?), String] {
  let node = match self.at(path) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let parent = match self.parent(path) {
    Ok(Some(v)) => v
    _ => return Err("root_has_no_parent")
  }
  if parent.schema_name() != "Track" {
    return Err("neighbors_require_track")
  }
  let a = children(parent).unwrap()
  let i = path[path.length() - 1]
  let mut left = if i > 0 { Some(a[i - 1]) } else { None }
  let mut right = if i + 1 < a.length() { Some(a[i + 1]) } else { None }
  if insert_gaps && node.schema_name() == "Transition" {
    for field in ["in_offset", "out_offset"] {
      let d = match offset_time(node, field) {
        Ok(v) => v
        Err(e) => return Err(e)
      }
      let range = match
        @range.TimeRange::new(
          @time.RationalTime::new(0.0, d.rate()).unwrap(),
          d,
        ) {
        Ok(v) => v
        Err(e) => return Err(e)
      }
      let gap = @schema.Object::new("Gap")
        .unwrap()
        .with_field("source_range", @schema.range_json(range))
        .unwrap()
      if field == "in_offset" && left is None {
        left = Some(gap)
      }
      if field == "out_offset" && right is None {
        right = Some(gap)
      }
    }
  }
  Ok((left, right))
}

///|
/// Range of a descendant in the requested ancestor's content coordinates.
pub fn Graph::range_of_descendant(
  self : Graph,
  path : Array[Int32],
  ancestor : Array[Int32],
  trimmed~ : Bool = false,
) -> Result[@range.TimeRange?, String] {
  if path.length() <= ancestor.length() ||
    prefix(path, ancestor.length()) != ancestor {
    return Err("not_a_descendant")
  }
  // OTIO 0.18.1's trimmed ancestor walk fails to advance its current child
  // after the second parent. Keep that observable error in this compatibility
  // query; transformed_range is the separate structural coordinate operation.
  if trimmed && path.length() - ancestor.length() > 2 {
    return Err("not_a_child")
  }
  let mut result : @range.TimeRange? = None
  for i = path.length(); i > ancestor.length(); i = i - 1 {
    let parent = match self.at(prefix(path, i - 1)) {
      Ok(v) => v
      Err(e) => return Err(e)
    }
    let r = match
      (if trimmed {
        trimmed_range_of_child_at_index(parent, path[i - 1])
      } else {
        range_of_child(parent, path[i - 1])
      }) {
      Ok(v) => v
      Err(e) => return Err(e)
    }
    result = Some(
      match result {
        None => r
        Some(old) => {
          let start = match add_time(old.start(), r.start()) {
            Ok(v) => v
            Err(e) => return Err(e)
          }
          match @range.TimeRange::new(start, old.duration()) {
            Ok(v) => v
            Err(e) => return Err(e)
          }
        }
      },
    )
  }
  let r = result.unwrap()
  if trimmed {
    clamp_child_result(self.at(ancestor).unwrap(), r)
  } else {
    Ok(Some(r))
  }
}

///|
pub fn Graph::children_at_time(
  self : Graph,
  path : Array[Int32],
  time : @time.RationalTime,
) -> Result[Array[Array[Int32]], String] {
  let node = match self.at(path) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let a = match children(node) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let out : Array[Array[Int32]] = []
  for i = 0; i < a.length(); i = i + 1 {
    let r = match range_of_child(node, i) {
      Ok(v) => v
      Err(e) => return Err(e)
    }
    if r.contains(time).unwrap() {
      let p = path.copy()
      p.push(i)
      out.push(p)
    }
  }
  Ok(out)
}

///|
pub fn Graph::markers_in_coordinates(
  self : Graph,
  path : Array[Int32],
  target : Array[Int32],
) -> Result[Array[@schema.Marker], String] {
  let node = match self.at(path) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let markers = match node.markers() {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let out : Array[@schema.Marker] = []
  for marker in markers {
    let r = match self.transformed_range(marker.marked_range(), path, target) {
      Ok(v) => v
      Err(e) => return Err(e)
    }
    out.push(marker.with_range(r))
  }
  Ok(out)
}
