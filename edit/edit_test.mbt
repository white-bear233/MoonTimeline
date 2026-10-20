///|
fn sample() -> @model.Timeline {
  @otio.read(
    "{\n    \"OTIO_SCHEMA\": \"Timeline.1\",\n    \"metadata\": {},\n    \"name\": \"Gap and clip\",\n    \"global_start_time\": null,\n    \"tracks\": {\n        \"OTIO_SCHEMA\": \"Stack.1\",\n        \"metadata\": {},\n        \"name\": \"tracks\",\n        \"source_range\": null,\n        \"effects\": [],\n        \"markers\": [],\n        \"enabled\": true,\n        \"color\": null,\n        \"children\": [\n            {\n                \"OTIO_SCHEMA\": \"Track.1\",\n                \"metadata\": {},\n                \"name\": \"V1\",\n                \"source_range\": null,\n                \"effects\": [],\n                \"markers\": [],\n                \"enabled\": true,\n                \"color\": null,\n                \"children\": [\n                    {\n                        \"OTIO_SCHEMA\": \"Gap.1\",\n                        \"metadata\": {},\n                        \"name\": \"\",\n                        \"source_range\": {\n                            \"OTIO_SCHEMA\": \"TimeRange.1\",\n                            \"duration\": {\n                                \"OTIO_SCHEMA\": \"RationalTime.1\",\n                                \"rate\": 24.0,\n                                \"value\": 48.0\n                            },\n                            \"start_time\": {\n                                \"OTIO_SCHEMA\": \"RationalTime.1\",\n                                \"rate\": 24.0,\n                                \"value\": 0.0\n                            }\n                        },\n                        \"effects\": [],\n                        \"markers\": [],\n                        \"enabled\": true,\n                        \"color\": null\n                    },\n                    {\n                        \"OTIO_SCHEMA\": \"Clip.2\",\n                        \"metadata\": {\n                            \"moontimeline\": {\n                                \"fixture\": true\n                            }\n                        },\n                        \"name\": \"Example clip\",\n                        \"source_range\": {\n                            \"OTIO_SCHEMA\": \"TimeRange.1\",\n                            \"duration\": {\n                                \"OTIO_SCHEMA\": \"RationalTime.1\",\n                                \"rate\": 24.0,\n                                \"value\": 120.0\n                            },\n                            \"start_time\": {\n                                \"OTIO_SCHEMA\": \"RationalTime.1\",\n                                \"rate\": 24.0,\n                                \"value\": 240.0\n                            }\n                        },\n                        \"effects\": [],\n                        \"markers\": [],\n                        \"enabled\": true,\n                        \"color\": null,\n                        \"media_references\": {\n                            \"DEFAULT_MEDIA\": {\n                                \"OTIO_SCHEMA\": \"ExternalReference.1\",\n                                \"metadata\": {},\n                                \"name\": \"\",\n                                \"available_range\": {\n                                    \"OTIO_SCHEMA\": \"TimeRange.1\",\n                                    \"duration\": {\n                                        \"OTIO_SCHEMA\": \"RationalTime.1\",\n                                        \"rate\": 24.0,\n                                        \"value\": 480.0\n                                    },\n                                    \"start_time\": {\n                                        \"OTIO_SCHEMA\": \"RationalTime.1\",\n                                        \"rate\": 24.0,\n                                        \"value\": 0.0\n                                    }\n                                },\n                                \"available_image_bounds\": null,\n                                \"target_url\": \"media/example.mov\"\n                            }\n                        },\n                        \"active_media_reference_key\": \"DEFAULT_MEDIA\"\n                    }\n                ],\n                \"kind\": \"Video\"\n            }\n        ]\n    }\n}\n",
  ).unwrap()
}

///|
fn seconds(v : Double) -> @time.RationalTime {
  @time.RationalTime::new(v, 1.0).unwrap()
}

///|
test "split conserves duration and source continuity without mutating input" {
  let original = sample()
  let before = @otio.write(original).unwrap()
  let edited = @edit.split(original, 0, 1, seconds(2.0)).unwrap()
  let l = @timeline.layout(edited).unwrap()
  assert_eq(l.duration_seconds, 7.0)
  assert_eq(l.items.length(), 3)
  assert_eq(l.items[1].source.start().to_seconds().unwrap(), 10.0)
  assert_eq(l.items[1].source.end_seconds(), 12.0)
  assert_eq(l.items[2].source.start().to_seconds().unwrap(), 12.0)
  assert_eq(l.items[2].source.end_seconds(), 15.0)
  assert_eq(@otio.write(original).unwrap(), before)
  match edited.tracks.children[0].children[1] {
    @model.Clip(c) => c.media_references.clear()
    _ => fail("Expected clip")
  }
  match edited.tracks.children[0].children[2] {
    @model.Clip(c) => assert_eq(c.media_references.length(), 1)
    _ => fail("Expected clip")
  }
  assert_eq(@otio.write(original).unwrap(), before)
}

///|
test "ripple trim retains source subsection" {
  let t = @edit.trim(sample(), 0, 1, seconds(1.0), seconds(2.0)).unwrap()
  let l = @timeline.layout(t).unwrap()
  assert_eq(l.duration_seconds, 4.0)
  assert_eq(l.items[1].source.start().to_seconds().unwrap(), 11.0)
  assert_eq(l.items[1].source.end_seconds(), 13.0)
}

///|
test "invalid edit is atomic" {
  let t = sample()
  let before = @otio.write(t).unwrap()
  for at in [-1.0, 0.0, 5.0, 6.0] {
    assert_true(@edit.split(t, 0, 1, seconds(at)) is Err(_))
  }
  assert_true(@edit.split(t, -1, 0, seconds(1.0)) is Err(_))
  assert_true(@edit.split(t, 0, 99, seconds(1.0)) is Err(_))
  assert_true(@edit.trim(t, 0, 1, seconds(4.0), seconds(2.0)) is Err(_))
  assert_true(@edit.trim(t, 0, 1, seconds(0.0), seconds(0.0)) is Err(_))
  assert_eq(@otio.write(t).unwrap(), before)
}

///|
test "gap insertion supports front and append" {
  let t = sample()
  let inserted = @edit.insert_gap(t, 0, 0, seconds(1.0)).unwrap()
  assert_eq(@timeline.layout(inserted).unwrap().duration_seconds, 8.0)
  let appended = @edit.insert_gap(t, 0, 2, seconds(2.0)).unwrap()
  assert_eq(@timeline.layout(appended).unwrap().duration_seconds, 9.0)
  assert_true(@edit.insert_gap(t, 0, 3, seconds(1.0)) is Err(_))
  assert_true(@edit.insert_gap(t, 0, 0, seconds(0.0)) is Err(_))
  assert_eq(t.tracks.children[0].children.length(), 2)
}

///|
test "gap can split and mixed-rate offset is rescaled" {
  let t = @edit.split(
    sample(),
    0,
    0,
    @time.RationalTime::new(30.0, 30.0).unwrap(),
  ).unwrap()
  let l = @timeline.layout(t).unwrap()
  assert_eq(l.duration_seconds, 7.0)
  assert_eq(l.items[0].end_seconds, 1.0)
  assert_eq(l.items[1].end_seconds, 2.0)
}

///|
test "unknown range and structurally invalid inputs cannot edit" {
  let t = sample()
  match t.tracks.children[0].children[1] {
    @model.Clip(c) => {
      c.media_references["DEFAULT_MEDIA"] = {
        ..c.media_references["DEFAULT_MEDIA"],
        available_range: None,
      }
      t.tracks.children[0].children[1] = @model.Clip({
        ..c,
        source_range: None,
      })
      assert_true(@edit.split(t, 0, 1, seconds(1.0)) is Err(_))
      assert_true(@edit.trim(t, 0, 1, seconds(0.0), seconds(1.0)) is Err(_))
    }
    _ => fail("Expected clip")
  }
  let invalid : @model.Timeline = { ..t, metadata: Json::array([]), }
  assert_true(@edit.insert_gap(invalid, 0, 0, seconds(1.0)) is Err(_))
}

///|
test "trim shifts later items and keeps metadata independent" {
  let t = @edit.split(sample(), 0, 1, seconds(2.0)).unwrap()
  let edited = @edit.trim(t, 0, 1, seconds(0.0), seconds(1.0)).unwrap()
  let l = @timeline.layout(edited).unwrap()
  assert_eq(l.items[2].start_seconds, 3.0)
  assert_eq(l.duration_seconds, 6.0)
  match edited.tracks.children[0].children[1] {
    @model.Clip(c) =>
      match c.attributes.metadata {
        Object(o) => o.clear()
        _ => fail("Expected metadata")
      }
    _ => fail("Expected clip")
  }
  match t.tracks.children[0].children[1] {
    @model.Clip(c) =>
      match c.attributes.metadata {
        Object(o) => assert_eq(o.length(), 1)
        _ => fail("Expected metadata")
      }
    _ => fail("Expected clip")
  }
}
