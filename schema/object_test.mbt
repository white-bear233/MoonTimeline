///|
fn seconds(n : Double) -> @time.RationalTime {
  @time.RationalTime::new(n, 1.0).unwrap()
}

///|
fn range(start : Double, duration : Double) -> @range.TimeRange {
  @range.TimeRange::new(seconds(start), seconds(duration)).unwrap()
}

///|
test "unknown schema collection fields and special values survive immutable edits" {
  let unknown = @schema.read(
    "{\"OTIO_SCHEMA\":\"Vendor.7\",\"data\":{\"a\":NaN,\"b\":9223372036854775807}}",
  ).unwrap()
  assert_true(unknown.is_unknown())
  let collection = @schema.Object::new("SerializableCollection")
    .unwrap()
    .with_children([unknown])
    .unwrap()
  assert_true(collection.children().unwrap()[0].equivalent(unknown))
  let copy = unknown.get("data").unwrap()
  match copy {
    Object(o) => o.clear()
    _ => abort("object")
  }
  assert_true(@schema.write(unknown).unwrap().contains("9223372036854775807"))
  assert_true(@schema.read("{\"OTIO_SCHEMA\":\"Clip.99\"}") is Err(_))
}

///|
test "legacy marker and clip migrations and explicit reference downgrade" {
  let marker = @schema.Marker::from_json(
    @otiojson.parse(
      "{\"OTIO_SCHEMA\":\"Marker.1\",\"range\":{\"OTIO_SCHEMA\":\"TimeRange.1\",\"start_time\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"value\":12,\"rate\":24},\"duration\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"value\":0,\"rate\":24}},\"vendor\":true}",
    ).unwrap(),
  ).unwrap()
  assert_eq(marker.to_object().schema_version(), 2)
  assert_eq(marker.marked_range().start().value(), 12.0)
  assert_true(marker.to_object().get("vendor") is Some(True))
  let old = @schema.read(
    "{\"OTIO_SCHEMA\":\"Clip.1\",\"media_reference\":null}",
  ).unwrap()
  assert_eq(old.active_media().unwrap().schema_name(), "MissingReference")
  let downgraded = old.to_version(1).unwrap()
  assert_eq(@schema.tag(downgraded), "Clip.1")
  assert_true(@schema.Object::from_json(downgraded).unwrap().equivalent(old))
}

///|
test "typed marker updates preserve unrelated fields and point boundaries" {
  let a = @schema.Marker::new(
    "point",
    range(1.0, 0.0),
    comment="review",
    metadata=Json::object({ "tag": Json::string("x") }),
  ).unwrap()
  let b = @schema.Marker::new("range", range(2.0, 2.0)).unwrap()
  let clip = @schema.Object::new("Clip").unwrap().with_markers([a, b]).unwrap()
  assert_eq(clip.markers_in_range(range(1.0, 1.0)).unwrap().length(), 1)
  assert_eq(clip.markers_in_range(range(0.0, 1.0)).unwrap().length(), 0)
  let changed = a.with_range(range(5.0, 0.0))
  assert_eq(changed.to_object().get("comment"), Some(Json::string("review")))
  assert_eq(a.marked_range().start().value(), 1.0)
  let edited = clip.with_markers([changed]).unwrap()
  assert_eq(edited.markers().unwrap().length(), 1)
  assert_eq(clip.markers().unwrap().length(), 2)
}

///|
test "typed effects and media replacement validate keys" {
  let effect = @schema.Effect::linear(-2.0).unwrap()
  assert_eq(effect.playback_scalar().unwrap(), -2.0)
  let disabled = effect
    .to_object()
    .with_field("enabled", Json::boolean(false))
    .unwrap()
  assert_eq(
    @schema.Effect::from_json(disabled.to_json().unwrap())
    .unwrap()
    .playback_scalar()
    .unwrap(),
    1.0,
  )
  let clip = @schema.Object::new("Clip").unwrap()
  let refs : Map[String, @schema.Object] = {
    "proxy": @schema.Object::new("ExternalReference").unwrap(),
    "full": @schema.Object::new("ImageSequenceReference").unwrap(),
  }
  let changed = clip.with_media_references(refs, "full").unwrap()
  assert_eq(
    changed.active_media().unwrap().schema_name(),
    "ImageSequenceReference",
  )
  assert_true(clip.with_media_references(refs, "missing") is Err(_))
  assert_eq(clip.active_media().unwrap().schema_name(), "MissingReference")
}

///|
test "image sequence overflow and noncomposable ownership are explicit errors" {
  let sequence = @schema.Object::new("ImageSequenceReference")
    .unwrap()
    .with_field("rate", Json::number(24.0))
    .unwrap()
    .with_field("available_range", @schema.range_json(range(0.0, 1.0e12)))
    .unwrap()
  assert_true(
    @schema.ImageSequence::from_object(sequence) is Err("frame_overflow"),
  )
  assert_true(
    @schema.Object::new("Track")
    .unwrap()
    .with_children([@schema.Object::new("ExternalReference").unwrap()])
    is Err(_),
  )
  assert_eq(@schema.Color::named("RED").unwrap().name, "Red")
}
