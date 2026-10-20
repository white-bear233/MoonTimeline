///|
fn media() -> @model.MediaReference {
  {
    name: "offline",
    metadata: Json::empty_object(),
    kind: @model.Missing,
    available_range: None,
    available_image_bounds: Json::null(),
  }
}

///|
test "missing media duration stays unknown" {
  let clip : @model.Clip = {
    attributes: @model.Attributes::new("clip"),
    source_range: None,
    media_references: { "DEFAULT_MEDIA": media() },
    active_media_reference_key: "DEFAULT_MEDIA",
  }
  assert_true(clip.active_media().unwrap().kind is @model.Missing)
  assert_true(clip.effective_range() is Err("unknown_source_range"))
}

///|
test "active reference must exist" {
  let clip : @model.Clip = {
    attributes: @model.Attributes::new("clip"),
    source_range: None,
    media_references: {},
    active_media_reference_key: "absent",
  }
  assert_true(clip.active_media() is Err("missing_active_media_reference"))
}

///|
test "source range is independent of media availability" {
  let source = @range.TimeRange::new(
    @time.RationalTime::new(240.0, 24.0).unwrap(),
    @time.RationalTime::new(120.0, 24.0).unwrap(),
  ).unwrap()
  let clip : @model.Clip = {
    attributes: @model.Attributes::new("clip"),
    source_range: Some(source),
    media_references: { "DEFAULT_MEDIA": media() },
    active_media_reference_key: "DEFAULT_MEDIA",
  }
  assert_eq(clip.effective_range().unwrap().start().to_seconds().unwrap(), 10.0)
  let timeline : @model.Timeline = {
    name: "two tracks",
    metadata: Json::empty_object(),
    global_start_time: None,
    tracks: {
      attributes: @model.Attributes::new("tracks"),
      children: [
        {
          attributes: @model.Attributes::new("V1"),
          kind: @model.Video,
          children: [@model.Clip(clip)],
        },
        {
          attributes: @model.Attributes::new("A1"),
          kind: @model.Audio,
          children: [],
        },
      ],
    },
  }
  assert_eq(timeline.tracks.children.length(), 2)
  assert_eq(timeline.tracks.children[0].children.length(), 1)
}

///|
test "available range is used only when source is absent" {
  let available = @range.TimeRange::new(
    @time.RationalTime::new(0.0, 24.0).unwrap(),
    @time.RationalTime::new(480.0, 24.0).unwrap(),
  ).unwrap()
  let reference : @model.MediaReference = {
    ..media(),
    available_range: Some(available),
  }
  let clip : @model.Clip = {
    attributes: @model.Attributes::new("clip"),
    source_range: None,
    media_references: { "x": reference },
    active_media_reference_key: "x",
  }
  assert_eq(
    clip.effective_range().unwrap().duration().to_seconds().unwrap(),
    20.0,
  )
}
