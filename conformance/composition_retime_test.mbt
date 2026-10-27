///|
fn two_clips() -> @model.Timeline {
  let t = review_fixture("internal")
  track(t).children.remove(1) |> ignore
  t
}

///|
fn set_speed(attributes : @model.Attributes, scalar : Double) -> Unit {
  match attributes.extra {
    Object(o) =>
      o["effects"] = Json::array([
        Json::object({
          "OTIO_SCHEMA": Json::string("LinearTimeWarp.1"),
          "time_scalar": Json::number(scalar),
        }),
      ])
    _ => abort("attributes")
  }
}

///|
test "composition retime propagates product slopes without changing presentation duration" {
  let t = two_clips()
  set_speed(track(t).attributes, 2.0)
  set_speed(clip(t, 0).attributes, 3.0)
  let l = @timeline.layout(t).unwrap()
  near(l.duration_seconds, 7.0)
  let first = l.items_at(1.0).unwrap()[0]
  near(first.time_scalar, 6.0)
  near(first.source_at(1.0).unwrap().to_seconds().unwrap(), 16.0)
  near(
    l.items_at(2.0).unwrap()[0].source_at(2.0).unwrap().to_seconds().unwrap(),
    20.0,
  )
  assert_eq(l.items_at(3.5).unwrap().length(), 0)
}

///|
test "reverse composition retains closed cut endpoint and excludes opposite endpoint" {
  let t = two_clips()
  let tr = track(t)
  t.tracks.children[0] = @model.Track({
    ..tr,
    source_range: Some(span(6.0, 6.0)),
  })
  set_speed(track(t).attributes, -1.0)
  let l = @timeline.layout(t).unwrap()
  near(
    l.items_at(0.0).unwrap()[0].source_at(0.0).unwrap().to_seconds().unwrap(),
    22.0,
  )
  let at_cut = l.items_at(2.0).unwrap()
  assert_eq(at_cut.length(), 1)
  assert_eq(at_cut[0].item_index, 1)
  assert_eq(l.items_at(2.0001).unwrap()[0].item_index, 0)
  assert_eq(l.items_at(6.0).unwrap().length(), 0)
}

///|
test "frozen composition holds media and transition without fabricating a cut time" {
  let t = review_fixture("internal")
  let tr = track(t)
  t.tracks.children[0] = @model.Track({
    ..tr,
    source_range: Some(span(4.0, 5.0)),
  })
  set_speed(track(t).attributes, 0.0)
  let l = @timeline.layout(t).unwrap()
  for time in [0.0, 2.0, 4.999] {
    let p = l.items_at(time).unwrap()[0]
    near(p.source_at(time).unwrap().to_seconds().unwrap(), 20.0)
    near(p.time_scalar, 0.0)
    assert_eq(l.transitions_at(time).unwrap()[0].cut_seconds, None)
  }
  assert_eq(l.items_at(5.0).unwrap().length(), 0)
}

///|
test "enabled affine chains multiply and disabled unknown effects do not change mapping" {
  let t = two_clips()
  match clip(t, 0).attributes.extra {
    Object(o) =>
      o["effects"] = Json::array([
        Json::object({
          "OTIO_SCHEMA": Json::string("LinearTimeWarp.1"),
          "time_scalar": Json::number(2.0),
        }),
        Json::object({
          "OTIO_SCHEMA": Json::string("LinearTimeWarp.1"),
          "time_scalar": Json::number(0.5),
        }),
        Json::object({
          "OTIO_SCHEMA": Json::string("CustomCurve.1"),
          "enabled": Json::boolean(false),
        }),
      ])
    _ => abort("attributes")
  }
  near(
    @timeline.layout(t).unwrap().items_at(1.0).unwrap()[0]
    .source_at(1.0)
    .unwrap()
    .to_seconds()
    .unwrap(),
    11.0,
  )
}

///|
test "graph sequence edits descendant ranges and changed-parent filtering" {
  let t = @schema.read(@otio.write(two_clips()).unwrap()).unwrap()
  let g = @graph.Graph::new(t)
  let child = g.at([0, 0, 0]).unwrap()
  let inserted = g.insert([0, 0], 0, child).unwrap()
  assert_eq(inserted.children([0, 0]).unwrap().length(), 3)
  assert_true(inserted.remove([0, 0, 0]).unwrap().root().equivalent(t))
  near(
    g
    .range_of_descendant([0, 0, 1], [])
    .unwrap()
    .unwrap()
    .start()
    .to_seconds()
    .unwrap(),
    4.0,
  )
  assert_eq(g.children_at_time([0, 0], seconds(4.0)).unwrap(), [[0, 0, 1]])
  let changed = @algorithms.filtered_composition(t, fn(n) {
      Ok([n.with_name("changed").unwrap()])
    }).unwrap()[0]
  assert_eq(
    @graph.Graph::new(changed).at([0, 0, 0]).unwrap().name().unwrap(),
    "changed",
  )
}

///|
test "transition direct edits are atomic and preserve annotations" {
  let t = review_fixture("internal")
  let before = @otio.write(t).unwrap()
  let changed = @edit.set_transition_offsets(
    t,
    [0, 1],
    seconds(0.25),
    seconds(0.25),
  ).unwrap()
  near(@timeline.layout(changed).unwrap().transitions[0].start_seconds, 3.75)
  assert_true(
    @edit.set_transition_offsets(t, [0, 1], seconds(20.0), seconds(0.25))
    is Err(_),
  )
  let removed = @edit.remove_transition(t, [0, 1]).unwrap()
  assert_eq(track(removed).children.length(), 2)
  let raw = match track(t).children[1] {
    @model.Opaque(j) => j
    _ => abort("transition")
  }
  let restored = @edit.insert_transition(removed, [0], 1, raw).unwrap()
  assert_eq(@otio.write(restored).unwrap(), before)
  assert_eq(@otio.write(t).unwrap(), before)
}

///|
test "nested transition media handles inspect real descendant availability" {
  let t = two_clips()
  let tr = track(t)
  let nested : @model.Item = @model.Track({
    ..tr,
    source_range: Some(span(1.0, 2.0)),
  })
  assert_true(@timeline.check_media_handles(nested, 1.0, 1.0) is Ok(_))
  let c = clip(t, 0)
  let media = c.media_references["DEFAULT_MEDIA"]
  c.media_references["DEFAULT_MEDIA"] = {
    ..media,
    available_range: Some(span(10.5, 3.5)),
  }
  assert_true(
    @timeline.check_media_handles(nested, 1.0, 1.0)
    is Err("source_out_of_bounds"),
  )
}

///|
test "root Stack retiming changes visible track spans and legacy cycles fail safely" {
  let t = two_clips()
  set_speed(t.tracks.attributes, 2.0)
  let layout = @timeline.layout(t).unwrap()
  near(layout.track_durations[0], 3.5)
  assert_eq(layout.items_at(3.5).unwrap().length(), 0)
  let cyclic = two_clips()
  cyclic.tracks.children.push(@model.Stack(cyclic.tracks))
  assert_true(@otio.write(cyclic) is Err(_))
  assert_true(@timeline.layout(cyclic) is Err(_))
  assert_true(@validate.has_errors(@validate.validate(cyclic)))
}
