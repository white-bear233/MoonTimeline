///|
pub fn Graph::is_parent_of(
  self : Graph,
  parent : Array[Int32],
  child : Array[Int32],
) -> Result[Bool, String] {
  let object = match self.at(parent) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  match self.at(child) {
    Err(e) => return Err(e)
    _ => ()
  }
  if !object.is_a("Composition") {
    return Err("not_a_composition")
  }
  Ok(
    child.length() > parent.length() && prefix(child, parent.length()) == parent,
  )
}

///|
pub fn Graph::find_children(
  self : Graph,
  schema~ : String = "SerializableObject",
  shallow~ : Bool = false,
  search_range~ : @range.TimeRange? = None,
) -> Result[Array[Array[Int32]], String] {
  let result : Array[Array[Int32]] = []
  fn walk(
    path : Array[Int32],
    window : @range.TimeRange?,
  ) -> Result[Unit, String] {
    let object = match self.at(path) {
      Ok(v) => v
      Err(e) => return Err(e)
    }
    if object.schema_name() == "Timeline" {
      let next = path.copy()
      next.push(0)
      return walk(next, window)
    }
    let a = match object.children() {
      Ok(v) => v
      Err(e) => return Err(e)
    }
    let paths = if object.is_a("Composition") && window is Some(r) {
      match self.children_in_range(path, r) {
        Ok(v) => v
        Err(e) => return Err(e)
      }
    } else {
      let all : Array[Array[Int32]] = []
      for i = 0; i < a.length(); i = i + 1 {
        let p = path.copy()
        p.push(i)
        all.push(p)
      }
      all
    }
    let mut remaining_window = window
    for p in paths {
      let child = self.at(p).unwrap()
      // Python OTIO 0.18.1 specializes these eight filters; every other
      // descended_from_type falls back to Composable in its native binding.
      let filter = if [
          "Clip", "Composition", "Gap", "Item", "Stack", "Timeline", "Track", "Transition",
        ].contains(schema) {
        schema
      } else {
        "Composable"
      }
      if child.is_a(filter) {
        result.push(p)
      }
      if !shallow &&
        (
          child.is_a("Composition") ||
          child.schema_name() == "SerializableCollection" ||
          child.schema_name() == "Timeline"
        ) {
        if object.is_a("Composition") && remaining_window is Some(r) {
          remaining_window = Some(
            match self.transformed_range(r, path, p) {
              Ok(v) => v
              Err(e) => return Err(e)
            },
          )
        }
        match walk(p, remaining_window) {
          Err(e) => return Err(e)
          _ => ()
        }
      }
    }
    Ok(())
  }
  match walk([], search_range) {
    Ok(_) => Ok(result)
    Err(e) => Err(e)
  }
}

///|
pub fn Graph::find_clips(
  self : Graph,
  shallow~ : Bool = false,
  search_range~ : @range.TimeRange? = None,
) -> Result[Array[Array[Int32]], String] {
  if self.root.schema_name() == "Clip" {
    return Ok([[]])
  }
  self.find_children(schema="Clip", shallow~, search_range~)
}

///|
pub fn Graph::has_clips(self : Graph) -> Bool {
  self.root.schema_name() == "Clip" || self.find(schema="Clip").length() > 0
}
