///|
pub struct Graph {
  priv root : @schema.Object
}

///|
pub fn Graph::new(root : @schema.Object) -> Graph {
  { root, }
}

///|
pub fn Graph::root(self : Graph) -> @schema.Object {
  self.root
}

///|
fn children(object : @schema.Object) -> Result[Array[@schema.Object], String] {
  if object.schema_name() == "Timeline" {
    match object.get("tracks") {
      Some(j) =>
        match @schema.Object::from_json(j) {
          Ok(o) => Ok([o])
          Err(e) => Err(e)
        }
      None => Err("missing_tracks")
    }
  } else {
    object.children()
  }
}

///|
fn replace_children(
  object : @schema.Object,
  values : Array[@schema.Object],
) -> Result[@schema.Object, String] {
  if object.schema_name() == "Timeline" {
    if values.length() != 1 || values[0].schema_name() != "Stack" {
      return Err("timeline_requires_stack")
    }
    object.with_field("tracks", values[0].to_json().unwrap())
  } else {
    object.with_children(values)
  }
}

///|
pub fn Graph::at(
  self : Graph,
  path : Array[Int32],
) -> Result[@schema.Object, String] {
  let mut node = self.root
  for index in path {
    let a = match children(node) {
      Ok(a) => a
      Err(e) => return Err(e)
    }
    if index < 0 || index >= a.length() {
      return Err("child_index")
    }
    node = a[index]
  }
  Ok(node)
}

///|
fn prefix(path : Array[Int32], length : Int32) -> Array[Int32] {
  let a : Array[Int32] = []
  for i = 0; i < length; i = i + 1 {
    a.push(path[i])
  }
  a
}

///|
pub fn Graph::parent(
  self : Graph,
  path : Array[Int32],
) -> Result[@schema.Object?, String] {
  match self.at(path) {
    Err(e) => return Err(e)
    _ => ()
  }
  if path.length() == 0 {
    Ok(None)
  } else {
    match self.at(prefix(path, path.length() - 1)) {
      Ok(o) => Ok(Some(o))
      Err(e) => Err(e)
    }
  }
}

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
fn offset(object : @schema.Object, key : String) -> Result[Double, String] {
  let j = match object.get(key) {
    Some(j) => j
    None => return Err("missing_offset")
  }
  match @schema.parse_time(j) {
    Ok(t) =>
      match t.to_seconds() {
        Ok(n) => Ok(n)
        Err(_) => Err("time_overflow")
      }
    Err(e) => Err(e)
  }
}

///|
pub fn available_range(
  object : @schema.Object,
) -> Result[@range.TimeRange, String] {
  let kind = object.schema_name()
  if kind == "Clip" {
    let media = match object.active_media() {
      Ok(v) => v
      Err(e) => return Err(e)
    }
    match media.get("available_range") {
      Some(j) => @schema.parse_range(j)
      None => Err("unknown_available_range")
    }
  } else if kind == "Timeline" {
    let a = match children(object) {
      Ok(v) => v
      Err(e) => return Err(e)
    }
    trimmed_range(a[0])
  } else if kind == "Track" || kind == "Stack" {
    let a = match children(object) {
      Ok(v) => v
      Err(e) => return Err(e)
    }
    let mut extent = 0.0
    for child in a {
      if child.schema_name() == "Transition" {
        continue
      }
      let d = match duration(child) {
        Ok(v) => v
        Err(e) => return Err(e)
      }
      if kind == "Track" {
        extent += d
      } else if d > extent {
        extent = d
      }
    }
    if kind == "Track" && a.length() > 0 {
      if a[0].schema_name() == "Transition" {
        extent += match offset(a[0], "in_offset") {
          Ok(v) => v
          Err(e) => return Err(e)
        }
      }
      if a[a.length() - 1].schema_name() == "Transition" {
        extent += match offset(a[a.length() - 1], "out_offset") {
          Ok(v) => v
          Err(e) => return Err(e)
        }
      }
    }
    span(0.0, extent)
  } else if kind == "Gap" {
    match object.get("source_range") {
      Some(j) => @schema.parse_range(j)
      None => span(0.0, 0.0)
    }
  } else {
    match object.get("available_range") {
      Some(j) => @schema.parse_range(j)
      None => Err("unknown_available_range")
    }
  }
}

///|
pub fn trimmed_range(
  object : @schema.Object,
) -> Result[@range.TimeRange, String] {
  match object.get("source_range") {
    Some(Null) | None => available_range(object)
    Some(j) => @schema.parse_range(j)
  }
}

///|
pub fn duration(object : @schema.Object) -> Result[Double, String] {
  if object.schema_name() == "Transition" {
    let a = match offset(object, "in_offset") {
      Ok(v) => v
      Err(e) => return Err(e)
    }
    let b = match offset(object, "out_offset") {
      Ok(v) => v
      Err(e) => return Err(e)
    }
    if (a + b).is_inf() {
      Err("time_overflow")
    } else {
      Ok(a + b)
    }
  } else {
    match trimmed_range(object) {
      Ok(r) => Ok(r.duration().to_seconds().unwrap())
      Err(e) => Err(e)
    }
  }
}

///|
pub fn range_of_child(
  parent : @schema.Object,
  index : Int32,
) -> Result[@range.TimeRange, String] {
  let a = match children(parent) {
    Ok(a) => a
    Err(e) => return Err(e)
  }
  if index < 0 || index >= a.length() {
    return Err("child_index")
  }
  if !["Timeline", "Track", "Stack"].contains(parent.schema_name()) {
    return Err("not_a_composition")
  }
  let mut start = 0.0
  if parent.schema_name() == "Track" {
    for i = 0; i < index; i = i + 1 {
      if a[i].schema_name() != "Transition" {
        start += match duration(a[i]) {
          Ok(v) => v
          Err(e) => return Err(e)
        }
      }
    }
    if a[index].schema_name() == "Transition" {
      start -= match offset(a[index], "in_offset") {
        Ok(v) => v
        Err(e) => return Err(e)
      }
    }
  }
  let d = match duration(a[index]) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  span(start, d)
}

///|
pub fn Graph::range_in_parent(
  self : Graph,
  path : Array[Int32],
  trimmed~ : Bool = false,
) -> Result[@range.TimeRange?, String] {
  if path.length() == 0 {
    return Err("root_has_no_parent")
  }
  let p = match self.at(prefix(path, path.length() - 1)) {
    Ok(o) => o
    Err(e) => return Err(e)
  }
  let r = match range_of_child(p, path[path.length() - 1]) {
    Ok(r) => r
    Err(e) => return Err(e)
  }
  if !trimmed {
    Ok(Some(r))
  } else {
    let window = match trimmed_range(p) {
      Ok(v) => v
      Err(e) => return Err(e)
    }
    r.intersection(window)
  }
}

///|
/// Structural coordinate transform. TimeEffects deliberately do not participate.
pub fn Graph::transformed_time(
  self : Graph,
  time : @time.RationalTime,
  from : Array[Int32],
  to : Array[Int32],
) -> Result[@time.RationalTime, String] {
  let mut n = match time.to_seconds() {
    Ok(v) => v
    Err(_) => return Err("time_overflow")
  }
  for path in [from, to] {
    match self.at(path) {
      Err(e) => return Err(e)
      _ => ()
    }
  }
  for i = from.length(); i > 0; i = i - 1 {
    let item = self.at(prefix(from, i)).unwrap()
    let r = match self.range_in_parent(prefix(from, i)) {
      Ok(Some(r)) => r
      _ => return Err("invalid_parent_range")
    }
    let start = if item.schema_name() == "Transition" {
      0.0
    } else {
      match trimmed_range(item) {
        Ok(r) => r.start().to_seconds().unwrap()
        Err(e) => return Err(e)
      }
    }
    n = n - start + r.start().to_seconds().unwrap()
  }
  for i = 1; i <= to.length(); i = i + 1 {
    let item = self.at(prefix(to, i)).unwrap()
    let r = match self.range_in_parent(prefix(to, i)) {
      Ok(Some(r)) => r
      _ => return Err("invalid_parent_range")
    }
    let start = if item.schema_name() == "Transition" {
      0.0
    } else {
      match trimmed_range(item) {
        Ok(r) => r.start().to_seconds().unwrap()
        Err(e) => return Err(e)
      }
    }
    n = n - r.start().to_seconds().unwrap() + start
  }
  match @time.RationalTime::new(n * time.rate(), time.rate()) {
    Ok(t) => Ok(t)
    Err(_) => Err("time_overflow")
  }
}

///|
pub fn Graph::transformed_range(
  self : Graph,
  range : @range.TimeRange,
  from : Array[Int32],
  to : Array[Int32],
) -> Result[@range.TimeRange, String] {
  let start = match self.transformed_time(range.start(), from, to) {
    Ok(t) => t
    Err(e) => return Err(e)
  }
  @range.TimeRange::new(start, range.duration())
}

///|
pub fn Graph::handles(
  self : Graph,
  path : Array[Int32],
) -> Result[(Double, Double), String] {
  if path.length() == 0 {
    return Ok((0.0, 0.0))
  }
  let parent = match self.parent(path) {
    Ok(Some(o)) => o
    _ => return Err("invalid_parent")
  }
  if parent.schema_name() != "Track" {
    return Ok((0.0, 0.0))
  }
  let a = children(parent).unwrap()
  let i = path[path.length() - 1]
  let head = if i > 0 && a[i - 1].schema_name() == "Transition" {
    match offset(a[i - 1], "in_offset") {
      Ok(v) => v
      Err(e) => return Err(e)
    }
  } else {
    0.0
  }
  let tail = if i + 1 < a.length() && a[i + 1].schema_name() == "Transition" {
    match offset(a[i + 1], "out_offset") {
      Ok(v) => v
      Err(e) => return Err(e)
    }
  } else {
    0.0
  }
  Ok((head, tail))
}

///|
pub fn Graph::visible_range(
  self : Graph,
  path : Array[Int32],
) -> Result[@range.TimeRange, String] {
  let node = match self.at(path) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let r = match trimmed_range(node) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let (head, tail) = match self.handles(path) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  span(
    r.start().to_seconds().unwrap() - head,
    r.duration().to_seconds().unwrap() + head + tail,
  )
}

///|
pub fn Graph::replace(
  self : Graph,
  path : Array[Int32],
  replacement : @schema.Object,
) -> Result[Graph, String] {
  fn descend(
    node : @schema.Object,
    level : Int32,
  ) -> Result[@schema.Object, String] {
    if level == path.length() {
      return Ok(replacement)
    }
    let a = match children(node) {
      Ok(v) => v
      Err(e) => return Err(e)
    }
    let index = path[level]
    if index < 0 || index >= a.length() {
      return Err("child_index")
    }
    a[index] = match descend(a[index], level + 1) {
      Ok(v) => v
      Err(e) => return Err(e)
    }
    replace_children(node, a)
  }
  match descend(self.root, 0) {
    Ok(root) => Ok({ root, })
    Err(e) => Err(e)
  }
}

///|
pub fn Graph::find(
  self : Graph,
  schema~ : String = "",
  name~ : String = "",
  shallow~ : Bool = false,
) -> Array[Array[Int32]] {
  let result : Array[Array[Int32]] = []
  fn walk(node : @schema.Object, path : Array[Int32]) -> Unit {
    if path.length() > 0 &&
      (schema == "" || node.schema_name() == schema) &&
      (name == "" || node.get("name") == Some(Json::string(name))) {
      result.push(path)
    }
    if shallow && path.length() > 0 {
      return
    }
    match children(node) {
      Ok(a) =>
        for i = 0; i < a.length(); i = i + 1 {
          let p = path.copy()
          p.push(i)
          walk(a[i], p)
        }
      Err(_) => ()
    }
  }
  walk(self.root, [])
  result
}
