///|
fn finish(t : @model.Timeline) -> Result[@model.Timeline, String] {
  if @validate.has_errors(@validate.validate(t)) {
    return Err("invalid_timeline")
  }
  match @otio.clone(t) {
    Ok(v) => Ok(v)
    Err(e) => Err(e.code + ":" + e.path)
  }
}

///|
fn with_range(item : @model.Item, range : @range.TimeRange) -> @model.Item {
  match item {
    @model.Clip(c) => @model.Clip({ ..c, source_range: Some(range), })
    @model.Gap(g) => @model.Gap({ ..g, source_range: range, })
    @model.Stack(s) => @model.Stack({ ..s, source_range: Some(range), })
    @model.Track(t) => @model.Track({ ..t, source_range: Some(range), })
    @model.Opaque(_) => item
  }
}

///|
fn subrange(
  source : @range.TimeRange,
  offset : Double,
  length : Double,
) -> Result[@range.TimeRange, String] {
  let start = match
    @time.RationalTime::new(
      source.start().value() + offset,
      source.start().rate(),
    ) {
    Ok(t) => t
    Err(_) => return Err("time_overflow")
  }
  let duration = match @time.RationalTime::new(length, source.start().rate()) {
    Ok(t) => t
    Err(_) => return Err("time_overflow")
  }
  @range.TimeRange::new(start, duration)
}

///|
fn tail(indices : Array[Int32]) -> Array[Int32] {
  let out : Array[Int32] = []
  for i = 1; i < indices.length(); i = i + 1 {
    out.push(indices[i])
  }
  out
}

///|
fn splice_children(
  children : Array[@model.Item],
  i : Int32,
  replacements : Array[@model.Item],
) -> Unit {
  let next : Array[@model.Item] = []
  for k = 0; k < children.length(); k = k + 1 {
    if k == i {
      for r in replacements {
        next.push(r)
      }
    } else {
      next.push(children[k])
    }
  }
  children.clear()
  for c in next {
    children.push(c)
  }
}

///|
fn splice(
  node : @model.Item,
  indices : Array[Int32],
  replacements : Array[@model.Item],
) -> Result[Unit, String] {
  let i = indices[0]
  match node {
    @model.Track(track) => {
      if i < 0 || i >= track.children.length() {
        return Err("item_index")
      }
      if indices.length() == 1 {
        splice_children(track.children, i, replacements)
        Ok(())
      } else {
        splice(track.children[i], tail(indices), replacements)
      }
    }
    @model.Stack(stack) => {
      if i < 0 || i >= stack.children.length() {
        return Err("track_index")
      }
      if indices.length() == 1 {
        splice_children(stack.children, i, replacements)
        Ok(())
      } else {
        splice(stack.children[i], tail(indices), replacements)
      }
    }
    _ => Err("not_a_composition")
  }
}

///|
fn replace_at(
  t : @model.Timeline,
  indices : Array[Int32],
  replacements : Array[@model.Item],
) -> Result[@model.Timeline, String] {
  let copy = match finish(t) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let i = indices[0]
  if i < 0 || i >= copy.tracks.children.length() {
    return Err("track_index")
  }
  if indices.length() == 1 {
    splice_children(copy.tracks.children, i, replacements)
  } else {
    match splice(copy.tracks.children[i], tail(indices), replacements) {
      Ok(_) => ()
      Err(e) => return Err(e)
    }
  }
  finish(copy)
}

///|
/// Editable window of a node: its source range, or the content span when a
/// composition has no explicit trim.
fn node_window(item : @model.Item) -> Result[@range.TimeRange, String] {
  let explicit = match item {
    @model.Clip(c) => c.effective_range()
    @model.Gap(g) => Ok(g.source_range)
    @model.Stack(s) =>
      match s.source_range {
        Some(r) => Ok(r)
        None => Err("no_explicit_range")
      }
    @model.Track(t) =>
      match t.source_range {
        Some(r) => Ok(r)
        None => Err("no_explicit_range")
      }
    @model.Opaque(_) => Err("opaque_item")
  }
  match explicit {
    Ok(r) => Ok(r)
    Err(_) => {
      let duration = match @timeline.duration_of(item) {
        Ok(v) => v
        Err(e) => return Err(e)
      }
      @range.TimeRange::new(
        @time.RationalTime::new(0.0, 24.0).unwrap(),
        @time.RationalTime::new(duration * 24.0, 24.0).unwrap(),
      )
    }
  }
}

///|
fn is_composition(item : @model.Item) -> Bool {
  match item {
    @model.Stack(_) | @model.Track(_) => true
    _ => false
  }
}

///|
/// Split a node addressed by child indices. Clips and gaps split their source
/// range; compositions split their trim window into two windows of the same
/// content, so no data is lost.
pub fn split_at(
  t : @model.Timeline,
  indices : Array[Int32],
  offset : @time.RationalTime,
) -> Result[@model.Timeline, String] {
  let copy = match finish(t) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let item = match @timeline.item_at(copy, indices) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let window = match node_window(item) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let rate = window.start().rate()
  let at = match offset.rescaled_to(rate) {
    Ok(v) => v.value()
    Err(_) => return Err("time_overflow")
  }
  let length = match window.duration().rescaled_to(rate) {
    Ok(v) => v.value()
    Err(_) => return Err("time_overflow")
  }
  if at <= 0.0 || at >= length {
    return Err("split_outside_item")
  }
  if is_composition(item) && indices.length() == 1 {
    return Err("cannot_split_root")
  }
  let left = match subrange(window, 0.0, at) {
    Ok(r) => r
    Err(e) => return Err(e)
  }
  let right = match subrange(window, at, length - at) {
    Ok(r) => r
    Err(e) => return Err(e)
  }
  replace_at(copy, indices, [with_range(item, left), with_range(item, right)])
}

///|
/// Trim any node to a sub-window, addressed by child indices. Compositions are
/// trimmed through their `source_range`; their content is not rewritten.
pub fn trim_at(
  t : @model.Timeline,
  indices : Array[Int32],
  offset : @time.RationalTime,
  duration : @time.RationalTime,
) -> Result[@model.Timeline, String] {
  let copy = match finish(t) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let item = match @timeline.item_at(copy, indices) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let window = match node_window(item) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let rate = window.start().rate()
  let at = match offset.rescaled_to(rate) {
    Ok(v) => v.value()
    Err(_) => return Err("time_overflow")
  }
  let length = match duration.rescaled_to(rate) {
    Ok(v) => v.value()
    Err(_) => return Err("time_overflow")
  }
  let available = match window.duration().rescaled_to(rate) {
    Ok(v) => v.value()
    Err(_) => return Err("time_overflow")
  }
  if at < 0.0 || length <= 0.0 || at + length > available {
    return Err("trim_outside_item")
  }
  let range = match subrange(window, at, length) {
    Ok(r) => r
    Err(e) => return Err(e)
  }
  replace_at(copy, indices, [with_range(item, range)])
}

///|
/// Insert a positive gap in a track addressed by child indices.
pub fn insert_gap_at(
  t : @model.Timeline,
  indices : Array[Int32],
  index : Int32,
  duration : @time.RationalTime,
) -> Result[@model.Timeline, String] {
  if duration.value() <= 0.0 {
    return Err("invalid_gap_duration")
  }
  let copy = match finish(t) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let node = match @timeline.item_at(copy, indices) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let track = match node {
    @model.Track(track) => track
    _ => return Err("not_a_track")
  }
  if index < 0 || index > track.children.length() {
    return Err("item_index")
  }
  let range = match
    @range.TimeRange::new(
      @time.RationalTime::new(0.0, duration.rate()).unwrap(),
      duration,
    ) {
    Ok(r) => r
    Err(e) => return Err(e)
  }
  track.children.insert(
    index,
    @model.Gap({ attributes: @model.Attributes::new(""), source_range: range, }),
  )
  finish(copy)
}

///|
/// Backwards-compatible entry points addressed by track and item index.
pub fn split(
  t : @model.Timeline,
  track_index : Int32,
  item_index : Int32,
  offset : @time.RationalTime,
) -> Result[@model.Timeline, String] {
  let indices : Array[Int32] = [track_index, item_index]
  split_at(t, indices, offset)
}

///|
pub fn trim(
  t : @model.Timeline,
  track_index : Int32,
  item_index : Int32,
  offset : @time.RationalTime,
  duration : @time.RationalTime,
) -> Result[@model.Timeline, String] {
  let indices : Array[Int32] = [track_index, item_index]
  trim_at(t, indices, offset, duration)
}

///|
pub fn insert_gap(
  t : @model.Timeline,
  track_index : Int32,
  index : Int32,
  duration : @time.RationalTime,
) -> Result[@model.Timeline, String] {
  let indices : Array[Int32] = [track_index]
  insert_gap_at(t, indices, index, duration)
}
