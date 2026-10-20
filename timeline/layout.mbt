///|
pub(all) struct Placement {
  track_index : Int32
  item_index : Int32
  start_seconds : Double
  end_seconds : Double
  source : @range.TimeRange
  enabled : Bool
}

///|
pub(all) struct Layout {
  items : Array[Placement]
  track_durations : Array[Double]
  duration_seconds : Double
}

///|
pub fn source_range(item : @model.Item) -> Result[@range.TimeRange, String] {
  match item {
    @model.Gap(g) => Ok(g.source_range)
    @model.Clip(c) => c.effective_range()
  }
}

///|
/// Structural layout includes disabled items. global_start_time is a label, not an offset.
pub fn layout(t : @model.Timeline) -> Result[Layout, String] {
  let items = []
  let durations = []
  let mut total = 0.0
  for ti = 0; ti < t.tracks.children.length(); ti = ti + 1 {
    let track = t.tracks.children[ti]
    let mut cursor = 0.0
    for ii = 0; ii < track.children.length(); ii = ii + 1 {
      let item = track.children[ii]
      let source = match source_range(item) {
        Ok(r) => r
        Err(e) =>
          return Err(
            "/tracks/children/" +
            ti.to_string() +
            "/children/" +
            ii.to_string() +
            ":" +
            e,
          )
      }
      let duration = source.duration().to_seconds().unwrap()
      let end = cursor + duration
      if end.is_inf() || (duration > 0.0 && end == cursor) {
        return Err("layout_overflow")
      }
      let enabled = match item {
        @model.Clip(c) => c.attributes.enabled
        @model.Gap(g) => g.attributes.enabled
      }
      items.push({
        track_index: ti,
        item_index: ii,
        start_seconds: cursor,
        end_seconds: end,
        source,
        enabled: enabled &&
        track.attributes.enabled &&
        t.tracks.attributes.enabled,
      })
      cursor = end
    }
    durations.push(cursor)
    if cursor > total {
      total = cursor
    }
  }
  Ok({ items, track_durations: durations, duration_seconds: total, })
}

///|
/// Query half-open intervals; simultaneous tracks may return multiple items.
pub fn Layout::items_at(
  self : Layout,
  seconds : Double,
) -> Result[Array[Placement], String] {
  if seconds.is_nan() || seconds.is_inf() {
    return Err("invalid_query_time")
  }
  Ok(
    self.items.filter(fn(p) {
      seconds >= p.start_seconds && seconds < p.end_seconds
    }),
  )
}

///|
/// Translate a track position into the original media coordinate.
pub fn Placement::source_at(
  self : Placement,
  seconds : Double,
) -> Result[@time.RationalTime, String] {
  if seconds.is_nan() ||
    seconds < self.start_seconds ||
    seconds >= self.end_seconds {
    return Err("outside_item")
  }
  let start = self.source.start()
  let value = start.value() + (seconds - self.start_seconds) * start.rate()
  match @time.RationalTime::new(value, start.rate()) {
    Ok(t) => Ok(t)
    Err(_) => Err("source_overflow")
  }
}
