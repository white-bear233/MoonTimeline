///|
fn object_fixture(name : String) -> @schema.Object {
  @schema.read(@otio.write(review_fixture(name)).unwrap()).unwrap()
}

///|
test "graph parent handles visible range and immutable replacement" {
  let t = object_fixture("internal")
  let graph = @graph.Graph::new(t)
  let path = [0, 0, 0]
  assert_eq(graph.parent(path).unwrap().unwrap().schema_name(), "Track")
  let (head, tail) = graph.handles(path).unwrap()
  near(head, 0.0)
  near(tail, 0.5)
  let visible = graph.visible_range(path).unwrap()
  near(visible.start().to_seconds().unwrap(), 10.0)
  near(visible.duration().to_seconds().unwrap(), 4.5)
  let clip = graph.at(path).unwrap()
  let edited = graph
    .replace(path, clip.with_field("name", Json::string("changed")).unwrap())
    .unwrap()
  assert_eq(edited.at(path).unwrap().get("name"), Some(Json::string("changed")))
  assert_eq(graph.at(path).unwrap().get("name"), Some(Json::string("A")))
  assert_eq(graph.find(schema="Clip").length(), 2)
  assert_true(graph.at([0, 999]) is Err(_))
  assert_true(graph.replace([0, -1], clip) is Err(_))
}

///|
test "filter prunes subtrees preserves metadata and uses original neighbor context" {
  let track = @graph.Graph::new(object_fixture("internal")).at([0, 0]).unwrap()
  let filtered = @algorithms.filtered_composition(
      track,
      fn(node) { Ok([node]) },
      prune=["Transition"],
    ).unwrap()[0]
  assert_eq(filtered.children().unwrap().length(), 2)
  assert_eq(filtered.get("metadata"), track.get("metadata"))
  let changed = @algorithms.filtered_with_sequence_context(track, fn(
      previous,
      node,
      _next,
    ) {
      if previous is Some(p) && p.schema_name() == "Transition" {
        Ok([])
      } else {
        Ok([node])
      }
    }).unwrap()[0]
  assert_eq(changed.children().unwrap().length(), 2)
  assert_eq(track.children().unwrap().length(), 3)
  let empty = @algorithms.filtered_composition(track, fn(_node) { Ok([]) }).unwrap()
  assert_eq(empty.length(), 0)
}

///|
test "timeline trim and top clip preserve source project" {
  let t = object_fixture("plain")
  let before = @schema.write(t).unwrap()
  let trimmed = @algorithms.timeline_trimmed_to_range(t, span(1.0, 2.0)).unwrap()
  near(@graph.duration(trimmed).unwrap(), 2.0)
  let graph = @graph.Graph::new(trimmed)
  near(
    @graph.trimmed_range(graph.at([0, 0, 0]).unwrap())
    .unwrap()
    .start()
    .to_seconds()
    .unwrap(),
    11.0,
  )
  let stack = graph.at([0]).unwrap()
  assert_true(
    @algorithms.top_clip_at_time(stack, seconds(0.0)).unwrap() is Some(_),
  )
  assert_true(
    @algorithms.top_clip_at_time(stack, seconds(2.0)).unwrap() is None,
  )
  assert_eq(@schema.write(t).unwrap(), before)
}

///|
test "recursive graph time search ranges and image bounds" {
  let g = @graph.Graph::new(object_fixture("internal"))
  assert_eq(g.child_at_time([0], seconds(4.0)).unwrap(), Some([0, 0, 1]))
  assert_eq(
    g.child_at_time([0], seconds(4.0), shallow=true).unwrap(),
    Some([0, 0]),
  )
  assert_eq(g.children_in_range([0, 0], span(0.0, 1.0)).unwrap(), [[0, 0, 0]])
  assert_eq(g.ranges_of_all_children([0, 0]).unwrap().length(), 3)
  assert_eq(g.tracks("Video").unwrap().length(), 1)
  let clip = g.at([0, 0, 0]).unwrap()
  let box : @schema.Box2d = {
    min: { x: 0.0, y: 0.0, },
    max: { x: 1920.0, y: 1080.0, },
  }
  let media = clip.active_media().unwrap().with_image_bounds(Some(box)).unwrap()
  let changed = clip
    .with_media_references({ "DEFAULT_MEDIA": media }, "DEFAULT_MEDIA")
    .unwrap()
  let result = g.replace([0, 0, 0], changed).unwrap()
  assert_eq(
    @graph.available_image_bounds(result.at([0]).unwrap()).unwrap().unwrap().max.x,
    1920.0,
  )
  assert_true(
    @graph.available_image_bounds(g.at([0]).unwrap()).unwrap() is None,
  )
}
