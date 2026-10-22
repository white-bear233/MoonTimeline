///|
fn sample() -> @model.Timeline {
  @otio.read(
    "{\n    \"OTIO_SCHEMA\": \"Timeline.1\",\n    \"metadata\": {},\n    \"name\": \"Gap and clip\",\n    \"global_start_time\": null,\n    \"tracks\": {\n        \"OTIO_SCHEMA\": \"Stack.1\",\n        \"metadata\": {},\n        \"name\": \"tracks\",\n        \"source_range\": null,\n        \"effects\": [],\n        \"markers\": [],\n        \"enabled\": true,\n        \"color\": null,\n        \"children\": [\n            {\n                \"OTIO_SCHEMA\": \"Track.1\",\n                \"metadata\": {},\n                \"name\": \"V1\",\n                \"source_range\": null,\n                \"effects\": [],\n                \"markers\": [],\n                \"enabled\": true,\n                \"color\": null,\n                \"children\": [\n                    {\n                        \"OTIO_SCHEMA\": \"Gap.1\",\n                        \"metadata\": {},\n                        \"name\": \"\",\n                        \"source_range\": {\n                            \"OTIO_SCHEMA\": \"TimeRange.1\",\n                            \"duration\": {\n                                \"OTIO_SCHEMA\": \"RationalTime.1\",\n                                \"rate\": 24.0,\n                                \"value\": 48.0\n                            },\n                            \"start_time\": {\n                                \"OTIO_SCHEMA\": \"RationalTime.1\",\n                                \"rate\": 24.0,\n                                \"value\": 0.0\n                            }\n                        },\n                        \"effects\": [],\n                        \"markers\": [],\n                        \"enabled\": true,\n                        \"color\": null\n                    },\n                    {\n                        \"OTIO_SCHEMA\": \"Clip.2\",\n                        \"metadata\": {\n                            \"moontimeline\": {\n                                \"fixture\": true\n                            }\n                        },\n                        \"name\": \"Example clip\",\n                        \"source_range\": {\n                            \"OTIO_SCHEMA\": \"TimeRange.1\",\n                            \"duration\": {\n                                \"OTIO_SCHEMA\": \"RationalTime.1\",\n                                \"rate\": 24.0,\n                                \"value\": 120.0\n                            },\n                            \"start_time\": {\n                                \"OTIO_SCHEMA\": \"RationalTime.1\",\n                                \"rate\": 24.0,\n                                \"value\": 240.0\n                            }\n                        },\n                        \"effects\": [],\n                        \"markers\": [],\n                        \"enabled\": true,\n                        \"color\": null,\n                        \"media_references\": {\n                            \"DEFAULT_MEDIA\": {\n                                \"OTIO_SCHEMA\": \"ExternalReference.1\",\n                                \"metadata\": {},\n                                \"name\": \"\",\n                                \"available_range\": {\n                                    \"OTIO_SCHEMA\": \"TimeRange.1\",\n                                    \"duration\": {\n                                        \"OTIO_SCHEMA\": \"RationalTime.1\",\n                                        \"rate\": 24.0,\n                                        \"value\": 480.0\n                                    },\n                                    \"start_time\": {\n                                        \"OTIO_SCHEMA\": \"RationalTime.1\",\n                                        \"rate\": 24.0,\n                                        \"value\": 0.0\n                                    }\n                                },\n                                \"available_image_bounds\": null,\n                                \"target_url\": \"media/example.mov\"\n                            }\n                        },\n                        \"active_media_reference_key\": \"DEFAULT_MEDIA\"\n                    }\n                ],\n                \"kind\": \"Video\"\n            }\n        ]\n    }\n}\n",
  ).unwrap()
}

///|
test "layout and source coordinates differ" {
  let l = @timeline.layout(sample()).unwrap()
  assert_eq(l.duration_seconds, 7.0)
  assert_eq(l.items[1].start_seconds, 2.0)
  assert_eq(l.items[1].source_at(3.0).unwrap().to_seconds().unwrap(), 11.0)
  assert_eq(l.items_at(2.0).unwrap()[0].item_index, 1)
  assert_eq(l.items_at(7.0).unwrap().length(), 0)
  assert_eq(l.items_at(-1.0).unwrap().length(), 0)
  assert_true(l.items_at(0.0 / 0.0) is Err(_))
  assert_true(l.items[1].source_at(7.0) is Err(_))
}

///|
test "parallel tracks take max duration and return all hits" {
  let t = sample()
  t.tracks.children.push(t.tracks.children[0])
  let l = @timeline.layout(t).unwrap()
  assert_eq(l.duration_seconds, 7.0)
  assert_eq(l.items_at(3.0).unwrap().length(), 2)
  assert_eq(l.track_durations.length(), 2)
}

///|
test "empty timeline has zero duration" {
  let t = sample()
  t.tracks.children.clear()
  assert_eq(@timeline.layout(t).unwrap().duration_seconds, 0.0)
}

///|
test "unknown duration fails instead of treating it as zero" {
  let t = sample()
  match track_at(t, 0).children[1] {
    @model.Clip(c) => {
      let refs = c.media_references
      refs["DEFAULT_MEDIA"] = {
        ..refs["DEFAULT_MEDIA"],
        available_range: None,
      }
      track_at(t, 0).children[1] = @model.Clip({ ..c, source_range: None, })
      assert_true(@timeline.layout(t) is Err(_))
    }
    _ => fail("Expected clip")
  }
}

///|
test "mixed rates disabled items and global labels do not shift layout" {
  let t = sample()
  match track_at(t, 0).children[0] {
    @model.Gap(g) => {
      let r = @range.TimeRange::new(
        @time.RationalTime::new(0.0, 30.0).unwrap(),
        @time.RationalTime::new(60.0, 30.0).unwrap(),
      ).unwrap()
      track_at(t, 0).children[0] = @model.Gap({
        source_range: r,
        attributes: { ..g.attributes, enabled: false, },
      })
    }
    _ => fail("Expected gap")
  }
  let t : @model.Timeline = {
    ..t,
    global_start_time: Some(@time.RationalTime::new(86400.0, 24.0).unwrap()),
  }
  let l = @timeline.layout(t).unwrap()
  assert_eq(l.duration_seconds, 7.0)
  assert_true(!l.items_at(0.0).unwrap()[0].enabled)
  assert_eq(l.items[1].start_seconds, 2.0)
}

///|
test "transition keeps the cursor and stays out of placements" {
  let source = "{\"OTIO_SCHEMA\": \"Timeline.1\", \"metadata\": {}, \"name\": \"t\", \"global_start_time\": null, \"tracks\": {\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"tracks\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"V1\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"kind\": \"Video\", \"children\": [{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 24.0, \"value\": 48.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 24.0, \"value\": 0.0}}, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null}, {\"OTIO_SCHEMA\": \"Transition.1\", \"metadata\": {}, \"name\": \"t0\", \"transition_type\": \"SMPTE_Dissolve\", \"in_offset\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 24.0, \"value\": 10.0}, \"out_offset\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 24.0, \"value\": 10.0}}]}]}}"
  let timeline = @otio.read(source).unwrap()
  let l = @timeline.layout(timeline).unwrap()
  assert_eq(l.duration_seconds, 2.0)
  assert_eq(l.items.length(), 1)
}

///|
fn track_at(t : @model.Timeline, i : Int32) -> @model.Track {
  match t.tracks.children[i] {
    @model.Track(track) => track
    _ => abort("expected track")
  }
}
