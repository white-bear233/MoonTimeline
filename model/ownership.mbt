///|
/// Bound legacy mutable model traversal before encoding or computing it. The
/// schema/Graph API owns immutable copies; this guard also rejects cycles built
/// through the legacy Array-based API without risking a stack overflow.
pub fn check_tree(timeline : Timeline) -> Result[Unit, String] {
  let mut remaining = 250000
  fn walk(item : Item, depth : Int32) -> Result[Unit, String] {
    if depth > 64 || remaining <= 0 {
      return Err("composition_limit_or_cycle")
    }
    remaining -= 1
    let children = match item {
      Track(t) => t.children
      Stack(s) => s.children
      _ => return Ok(())
    }
    for child in children {
      match walk(child, depth + 1) {
        Err(e) => return Err(e)
        _ => ()
      }
    }
    Ok(())
  }
  walk(Stack(timeline.tracks), 0)
}
