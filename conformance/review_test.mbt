///|
fn seconds(n : Double) -> @time.RationalTime {
  @time.RationalTime::new(n, 1.0).unwrap()
}

///|
fn span(start : Double, duration : Double) -> @range.TimeRange {
  @range.TimeRange::new(seconds(start), seconds(duration)).unwrap()
}

///|
fn track(t : @model.Timeline) -> @model.Track {
  match t.tracks.children[0] {
    @model.Track(v) => v
    _ => abort("track")
  }
}

///|
fn clip(t : @model.Timeline, index : Int32) -> @model.Clip {
  match track(t).children[index] {
    @model.Clip(v) => v
    _ => abort("clip")
  }
}

///|
fn has_issue(t : @model.Timeline, code : String) -> Bool {
  @validate.validate(t).any(fn(i) { i.code == code })
}

///|
fn changed_offset(
  raw : @model.Item,
  field : String,
  value : Double,
) -> @model.Item {
  match raw {
    @model.Opaque(Object(o)) => {
      o[field] = Json::object({
        "OTIO_SCHEMA": Json::string("RationalTime.1"),
        "value": Json::number(value),
        "rate": Json::number(1.0),
      })
      raw
    }
    _ => abort("transition")
  }
}

///|
test "transition range duration and half-open query are distinct from advancement" {
  let t = review_fixture("internal")
  let tr = track(t)
  let r = @timeline.transition_range(tr, 1).unwrap()
  near(r.start().to_seconds().unwrap(), 3.0)
  near(r.duration().to_seconds().unwrap(), 1.5)
  near(@timeline.duration_of(tr.children[1]).unwrap(), 1.5)
  let l = @timeline.layout(t).unwrap()
  near(l.duration_seconds, 7.0)
  assert_eq(l.transitions_at(3.0).unwrap().length(), 1)
  assert_eq(l.transitions_at(4.5).unwrap().length(), 0)
  assert_true(l.transitions_at(0.0 / 0.0) is Err(_))
  assert_eq(l.transitions[0].left_path, Some("/tracks/children/0/children/0"))
  assert_eq(l.transitions[0].right_path, Some("/tracks/children/0/children/2"))
  assert_true(!@validate.has_errors(@validate.validate(t)))
}

///|
test "transition adjacency duration overlap and offset validation" {
  let t = review_fixture("internal")
  let tr = track(t)
  tr.children.insert(1, tr.children[1])
  assert_true(has_issue(t, "adjacent_transitions"))
  assert_true(@timeline.layout(t) is Err(_))
  let t = review_fixture("internal")
  track(t).children[1] = changed_offset(track(t).children[1], "in_offset", 4.1)
  assert_true(has_issue(t, "transition_exceeds_neighbor"))
  let t = review_fixture("internal")
  track(t).children[1] = changed_offset(track(t).children[1], "out_offset", 3.1)
  assert_true(has_issue(t, "transition_exceeds_neighbor"))
  let t = review_fixture("internal")
  track(t).children[1] = changed_offset(track(t).children[1], "in_offset", -1.0)
  assert_true(has_issue(t, "negative_transition_offset"))
  let t = review_fixture("both_edges")
  track(t).children[0] = changed_offset(track(t).children[0], "out_offset", 2.5)
  track(t).children[2] = changed_offset(track(t).children[2], "in_offset", 2.0)
  assert_true(has_issue(t, "overlapping_transitions"))
}

///|
test "boundary and zero-gap fades are valid but Stack transitions are not" {
  for name in ["leading", "trailing", "both_edges", "zero_gap"] {
    assert_true(!@validate.has_errors(@validate.validate(review_fixture(name))))
  }
  let t = review_fixture("internal")
  t.tracks.children.push(track(t).children[1])
  assert_true(has_issue(t, "transition_requires_track"))
  assert_true(@timeline.layout(t) is Err(_))
}

///|
test "transition handles use opposite neighbor offsets and media bounds" {
  let t = review_fixture("internal")
  let c = clip(t, 0)
  assert_true(c.check_media_bounds(-1.0, 0.0) is Err(_))
  assert_true(c.check_media_bounds(0.0 / 0.0, 0.0) is Err(_))
  let m = c.media_references["DEFAULT_MEDIA"]
  c.media_references["DEFAULT_MEDIA"] = {
    ..m,
    available_range: Some(span(0.0, 14.25)),
  }
  assert_true(has_issue(t, "insufficient_transition_handles"))
  assert_true(!has_issue(t, "source_out_of_bounds"))
  let t = review_fixture("internal")
  let c = clip(t, 2)
  let m = c.media_references["DEFAULT_MEDIA"]
  c.media_references["DEFAULT_MEDIA"] = {
    ..m,
    available_range: Some(span(19.5, 80.5)),
  }
  assert_true(has_issue(t, "insufficient_transition_handles"))
  c.media_references["DEFAULT_MEDIA"] = { ..m, available_range: None, }
  assert_true(has_issue(t, "unknown_transition_handles"))
  assert_true(!has_issue(t, "insufficient_transition_handles"))
}

///|
test "playback retime preserves duration and maps fast slow reverse freeze" {
  let cases = [
    ("double", 2.0),
    ("half", 0.5),
    ("reverse", -1.0),
    ("freeze", 0.0),
  ]
  for pair in cases {
    let t = review_fixture(pair.0)
    let l = @timeline.layout(t).unwrap()
    near(l.duration_seconds, 4.0)
    near(
      l.items[0].source_at(1.5).unwrap().to_seconds().unwrap(),
      10.0 + 1.5 * pair.1,
    )
    assert_true(l.items[0].source_at(4.0) is Err(_))
    assert_true(!@validate.has_errors(@validate.validate(t)))
    let split = @edit.split(t, 0, 0, seconds(1.5)).unwrap()
    near(
      clip(split, 1).source_range.unwrap().start().to_seconds().unwrap(),
      10.0 + 1.5 * pair.1,
    )
    let sl = @timeline.layout(split).unwrap()
    near(sl.duration_seconds, 4.0)
    near(
      sl.items[1].source_at(2.5).unwrap().to_seconds().unwrap(),
      10.0 + 2.5 * pair.1,
    )
    let trimmed = @edit.trim(t, 0, 0, seconds(1.5), seconds(1.0)).unwrap()
    let tl = @timeline.layout(trimmed).unwrap()
    near(tl.duration_seconds, 1.0)
    near(
      tl.items[0].source_at(0.5).unwrap().to_seconds().unwrap(),
      10.0 + 2.0 * pair.1,
    )
  }
}

///|
test "retime under a nonzero composition window uses playback offset" {
  let t = review_fixture("double")
  t.tracks.children[0] = @model.Track({
    ..track(t),
    source_range: Some(span(1.0, 2.0)),
  })
  let l = @timeline.layout(t).unwrap()
  near(l.items[0].source_at(0.5).unwrap().to_seconds().unwrap(), 13.0)
  near(l.items[0].source.duration().to_seconds().unwrap(), 2.0)
}

///|
test "retime bounds account for speed reverse freeze and transition handles" {
  let t = review_fixture("double")
  let c = clip(t, 0)
  let m = c.media_references["DEFAULT_MEDIA"]
  c.media_references["DEFAULT_MEDIA"] = {
    ..m,
    available_range: Some(span(0.0, 15.0)),
  }
  assert_true(has_issue(t, "source_out_of_bounds"))
  let t = review_fixture("reverse")
  let c = clip(t, 0)
  let m = c.media_references["DEFAULT_MEDIA"]
  c.media_references["DEFAULT_MEDIA"] = {
    ..m,
    available_range: Some(span(8.0, 10.0)),
  }
  assert_true(has_issue(t, "source_out_of_bounds"))
  let t = review_fixture("freeze")
  let c = clip(t, 0)
  let m = c.media_references["DEFAULT_MEDIA"]
  c.media_references["DEFAULT_MEDIA"] = {
    ..m,
    available_range: Some(span(10.0, 0.1)),
  }
  assert_true(!has_issue(t, "source_out_of_bounds"))
  c.media_references["DEFAULT_MEDIA"] = {
    ..m,
    available_range: Some(span(0.0, 10.0)),
  }
  assert_true(has_issue(t, "source_out_of_bounds"))
  let t = review_fixture("internal")
  let c = clip(review_fixture("double"), 0)
  track(t).children[0] = @model.Clip(c)
  let m = c.media_references["DEFAULT_MEDIA"]
  c.media_references["DEFAULT_MEDIA"] = {
    ..m,
    available_range: Some(span(0.0, 18.5)),
  }
  assert_true(!has_issue(t, "source_out_of_bounds"))
  assert_true(has_issue(t, "insufficient_transition_handles"))
}

///|
test "marker coordinates metadata effects and extensions survive edits independently" {
  let original = review_fixture("double")
  let c = clip(original, 0)
  match c.attributes.extra {
    Object(o) =>
      o["vendor_extension"] = Json::object({
        "nested": Json::array([Json::string("retain"), Json::null()]),
      })
    _ => abort("attributes")
  }
  let before = @otio.write(original).unwrap()
  let split = @edit.split(original, 0, 0, seconds(1.5)).unwrap()
  for i in [0, 1] {
    let piece = clip(split, i)
    assert_eq(
      piece.attributes.extra.stringify(),
      c.attributes.extra.stringify(),
    )
    assert_eq(
      piece.attributes.metadata.stringify(),
      c.attributes.metadata.stringify(),
    )
    assert_eq(
      piece.media_references["DEFAULT_MEDIA"].metadata.stringify(),
      c.media_references["DEFAULT_MEDIA"].metadata.stringify(),
    )
  }
  let trimmed = @edit.trim(original, 0, 0, seconds(1.0), seconds(2.0)).unwrap()
  assert_eq(
    clip(trimmed, 0).attributes.extra.stringify(),
    c.attributes.extra.stringify(),
  )
  let gap = @edit.insert_gap(original, 0, 0, seconds(2.0)).unwrap()
  assert_eq(
    clip(gap, 1).attributes.extra.stringify(),
    c.attributes.extra.stringify(),
  )
  for edited in [split, trimmed, gap] {
    assert_eq(edited.metadata.stringify(), original.metadata.stringify())
    assert_eq(
      edited.tracks.attributes.extra.stringify(),
      original.tracks.attributes.extra.stringify(),
    )
    assert_eq(
      track(edited).attributes.extra.stringify(),
      track(original).attributes.extra.stringify(),
    )
    assert_eq(
      track(edited).attributes.metadata.stringify(),
      track(original).attributes.metadata.stringify(),
    )
  }
  match clip(split, 0).attributes.extra {
    Object(o) =>
      match o["markers"] {
        Array(markers) => markers.clear()
        _ => abort("markers")
      }
    _ => abort("attributes")
  }
  assert_eq(
    clip(split, 1).attributes.extra.stringify(),
    c.attributes.extra.stringify(),
  )
  assert_eq(@otio.write(original).unwrap(), before)
}

///|
test "edits cannot invalidate transition neighbors and rejection is atomic" {
  let t = review_fixture("internal")
  let before = @otio.write(t).unwrap()
  assert_true(@edit.trim(t, 0, 0, seconds(0.0), seconds(0.5)) is Err(_))
  assert_true(@edit.split(t, 0, 0, seconds(3.5)) is Err(_))
  assert_true(@edit.split(t, 0, 1, seconds(0.5)) is Err(_))
  assert_true(@edit.insert_gap(t, 0, 1, seconds(2.0)) is Err(_))
  assert_true(@edit.insert_gap(t, 0, 2, seconds(2.0)) is Err(_))
  let split = @edit.split(t, 0, 0, seconds(2.0)).unwrap()
  match (track(t).children[1], track(split).children[2]) {
    (@model.Opaque(a), @model.Opaque(b)) =>
      assert_eq(a.stringify(), b.stringify())
    _ => abort("transition")
  }
  near(@timeline.layout(split).unwrap().transitions[0].start_seconds, 3.0)
  assert_eq(@otio.write(t).unwrap(), before)
}

///|
test "unknown and ambiguous time effects are retained but block editing" {
  for
    effects in [
      Json::array([
        Json::object({ "OTIO_SCHEMA": Json::string("TimeEffect.1") }),
      ]),
      Json::array([
        Json::object({ "OTIO_SCHEMA": Json::string("VendorTimeWarp.1") }),
      ]),
      Json::array([
        Json::object({ "OTIO_SCHEMA": Json::string("FreezeFrame.1") }),
        Json::object({ "OTIO_SCHEMA": Json::string("FreezeFrame.1") }),
      ]),
    ] {
    let t = review_fixture("plain")
    match clip(t, 0).attributes.extra {
      Object(o) => o["effects"] = effects
      _ => abort("effects")
    }
    let before = @otio.write(t).unwrap()
    assert_true(@validate.has_errors(@validate.validate(t)))
    assert_true(@timeline.layout(t) is Err(_))
    assert_true(@edit.trim(t, 0, 0, seconds(0.0), seconds(1.0)) is Err(_))
    assert_eq(@otio.write(t).unwrap(), before)
  }
}
