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
fn selected(
  t : @model.Timeline,
  ti : Int32,
  ii : Int32,
) -> Result[@model.Item, String] {
  if ti < 0 || ti >= t.tracks.children.length() {
    return Err("track_index")
  }
  let track = t.tracks.children[ti]
  if ii < 0 || ii >= track.children.length() {
    return Err("item_index")
  }
  Ok(track.children[ii])
}

///|
fn with_range(item : @model.Item, range : @range.TimeRange) -> @model.Item {
  match item {
    @model.Clip(c) => @model.Clip({ ..c, source_range: Some(range), })
    @model.Gap(g) => @model.Gap({ ..g, source_range: range, })
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
fn replace(
  t : @model.Timeline,
  ti : Int32,
  ii : Int32,
  replacements : Array[@model.Item],
) -> Result[@model.Timeline, String] {
  let copy = match finish(t) {
    Ok(t) => t
    Err(e) => return Err(e)
  }
  let track = copy.tracks.children[ti]
  let children = []
  for i = 0; i < track.children.length(); i = i + 1 {
    if i == ii {
      for replacement in replacements {
        children.push(replacement)
      }
    } else {
      children.push(track.children[i])
    }
  }
  copy.tracks.children[ti] = { ..track, children, }
  // Re-clone so replacements and sibling pieces cannot share mutable containers.
  finish(copy)
}

///|
/// Offset is relative to the item, not source time or track time. Endpoints are rejected.
pub fn split(
  t : @model.Timeline,
  track_index : Int32,
  item_index : Int32,
  offset : @time.RationalTime,
) -> Result[@model.Timeline, String] {
  let item = match selected(t, track_index, item_index) {
    Ok(i) => i
    Err(e) => return Err(e)
  }
  let source = match @timeline.source_range(item) {
    Ok(r) => r
    Err(e) => return Err(e)
  }
  let at = match offset.rescaled_to(source.start().rate()) {
    Ok(v) => v.value()
    Err(_) => return Err("time_overflow")
  }
  let length = match source.duration().rescaled_to(source.start().rate()) {
    Ok(v) => v.value()
    Err(_) => return Err("time_overflow")
  }
  if at <= 0.0 || at >= length {
    return Err("split_outside_item")
  }
  let left = match subrange(source, 0.0, at) {
    Ok(r) => r
    Err(e) => return Err(e)
  }
  let right = match subrange(source, at, length - at) {
    Ok(r) => r
    Err(e) => return Err(e)
  }
  replace(t, track_index, item_index, [
    with_range(item, left),
    with_range(item, right),
  ])
}

///|
/// Ripple trim: keep the requested relative segment and shift subsequent items earlier.
pub fn trim(
  t : @model.Timeline,
  track_index : Int32,
  item_index : Int32,
  offset : @time.RationalTime,
  duration : @time.RationalTime,
) -> Result[@model.Timeline, String] {
  let item = match selected(t, track_index, item_index) {
    Ok(i) => i
    Err(e) => return Err(e)
  }
  let source = match @timeline.source_range(item) {
    Ok(r) => r
    Err(e) => return Err(e)
  }
  let rate = source.start().rate()
  let at = match offset.rescaled_to(rate) {
    Ok(v) => v.value()
    Err(_) => return Err("time_overflow")
  }
  let length = match duration.rescaled_to(rate) {
    Ok(v) => v.value()
    Err(_) => return Err("time_overflow")
  }
  let available = match source.duration().rescaled_to(rate) {
    Ok(v) => v.value()
    Err(_) => return Err("time_overflow")
  }
  if at < 0.0 ||
    length <= 0.0 ||
    at + length > available ||
    (at + length).is_inf() {
    return Err("trim_outside_item")
  }
  let range = match subrange(source, at, length) {
    Ok(r) => r
    Err(e) => return Err(e)
  }
  replace(t, track_index, item_index, [with_range(item, range)])
}

///|
/// Insert a positive gap before index (length means append), shifting later items.
pub fn insert_gap(
  t : @model.Timeline,
  track_index : Int32,
  index : Int32,
  duration : @time.RationalTime,
) -> Result[@model.Timeline, String] {
  if track_index < 0 || track_index >= t.tracks.children.length() {
    return Err("track_index")
  }
  let track = t.tracks.children[track_index]
  if index < 0 || index > track.children.length() {
    return Err("item_index")
  }
  if duration.value() <= 0.0 {
    return Err("invalid_gap_duration")
  }
  let range = match
    @range.TimeRange::new(
      @time.RationalTime::new(0.0, duration.rate()).unwrap(),
      duration,
    ) {
    Ok(r) => r
    Err(e) => return Err(e)
  }
  let copy = match finish(t) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let children = []
  for i = 0; i <= track.children.length(); i = i + 1 {
    if i == index {
      children.push(
        @model.Gap({
          attributes: @model.Attributes::new(""),
          source_range: range,
        }),
      )
    }
    if i < track.children.length() {
      children.push(track.children[i])
    }
  }
  copy.tracks.children[track_index] = { ..track, children, }
  finish(copy)
}
