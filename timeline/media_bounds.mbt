///|
/// Verify an extended composition window recursively, including media beyond
/// the first/last cut needed by a parent's transition. No filesystem lookup.
pub fn check_media_handles(
  item : @model.Item,
  head : Double,
  tail : Double,
) -> Result[Unit, String] {
  if head < 0.0 ||
    tail < 0.0 ||
    head.is_inf() ||
    tail.is_inf() ||
    head.is_nan() ||
    tail.is_nan() {
    return Err("invalid_transition_handle")
  }
  let d = match duration_of(item) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  fn check(
    node : @model.Item,
    first : Double,
    last : Double,
    depth : Int32,
  ) -> Result[Unit, String] {
    if depth > 64 {
      return Err("composition_depth")
    }
    let scalar = match node.playback_scalar() {
      Ok(v) => v
      Err(e) => return Err(e)
    }
    match node {
      @model.Gap(_) => Ok(())
      @model.Clip(c) => {
        let r = match c.effective_range() {
          Ok(v) => v
          Err(e) => return Err(e)
        }
        let m = match c.active_media() {
          Ok(v) => v
          Err(e) => return Err(e)
        }
        let available = match m.available_range {
          Some(v) => v
          None => return Err("unknown_available_range")
        }
        let a = r.start().to_seconds().unwrap() + first * scalar
        let b = r.start().to_seconds().unwrap() + last * scalar
        if a.is_inf() || b.is_inf() || a.is_nan() || b.is_nan() {
          return Err("source_overflow")
        }
        let lo = available.start().to_seconds().unwrap()
        let hi = available.end_seconds()
        if a < lo - 1.0e-9 || a >= hi || b < lo - 1.0e-9 || b > hi + 1.0e-9 {
          Err("source_out_of_bounds")
        } else {
          Ok(())
        }
      }
      @model.Track(_) | @model.Stack(_) => {
        let (children, range, sequential) = match node {
          @model.Track(t) => (t.children, t.source_range, true)
          @model.Stack(s) => (s.children, s.source_range, false)
          _ => abort("composition")
        }
        let base = match range {
          Some(r) => r.start().to_seconds().unwrap()
          None => 0.0
        }
        let a = base + first * scalar
        let b = base + last * scalar
        if a.is_inf() || b.is_inf() || a.is_nan() || b.is_nan() {
          return Err("source_overflow")
        }
        let lo = if a < b { a } else { b }
        let hi = if a > b { a } else { b }
        let active : Array[@model.Item] = children.filter(fn(c) {
          !is_transition(c)
        })
        if active.length() == 0 {
          return Err("unknown_available_range")
        }
        let mut cursor = 0.0
        for i = 0; i < active.length(); i = i + 1 {
          let duration = match duration_of(active[i]) {
            Ok(v) => v
            Err(e) => return Err(e)
          }
          let begin = if sequential { cursor } else { 0.0 }
          let end = begin + duration
          if sequential {
            cursor = end
          }
          let v0 = if lo < begin && sequential && i > 0 { begin } else { lo }
          let v1 = if hi > end && sequential && i + 1 < active.length() {
            end
          } else {
            hi
          }
          if v0 > v1 || (v0 == v1 && (a != b || v0 < begin || v0 >= end)) {
            continue
          }
          let p0 = if a <= b { v0 } else { v1 }
          let p1 = if a <= b { v1 } else { v0 }
          match check(active[i], p0 - begin, p1 - begin, depth + 1) {
            Err(e) => return Err(e)
            _ => ()
          }
        }
        Ok(())
      }
      _ => Err("unknown_available_range")
    }
  }
  check(item, -head, d + tail, 0)
}
