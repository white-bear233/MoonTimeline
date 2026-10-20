///|
fn sample() -> @model.Timeline {
  @otio.read(
    "{\n    \"OTIO_SCHEMA\": \"Timeline.1\",\n    \"metadata\": {},\n    \"name\": \"Gap and clip\",\n    \"global_start_time\": null,\n    \"tracks\": {\n        \"OTIO_SCHEMA\": \"Stack.1\",\n        \"metadata\": {},\n        \"name\": \"tracks\",\n        \"source_range\": null,\n        \"effects\": [],\n        \"markers\": [],\n        \"enabled\": true,\n        \"color\": null,\n        \"children\": [\n            {\n                \"OTIO_SCHEMA\": \"Track.1\",\n                \"metadata\": {},\n                \"name\": \"V1\",\n                \"source_range\": null,\n                \"effects\": [],\n                \"markers\": [],\n                \"enabled\": true,\n                \"color\": null,\n                \"children\": [\n                    {\n                        \"OTIO_SCHEMA\": \"Gap.1\",\n                        \"metadata\": {},\n                        \"name\": \"\",\n                        \"source_range\": {\n                            \"OTIO_SCHEMA\": \"TimeRange.1\",\n                            \"duration\": {\n                                \"OTIO_SCHEMA\": \"RationalTime.1\",\n                                \"rate\": 24.0,\n                                \"value\": 48.0\n                            },\n                            \"start_time\": {\n                                \"OTIO_SCHEMA\": \"RationalTime.1\",\n                                \"rate\": 24.0,\n                                \"value\": 0.0\n                            }\n                        },\n                        \"effects\": [],\n                        \"markers\": [],\n                        \"enabled\": true,\n                        \"color\": null\n                    },\n                    {\n                        \"OTIO_SCHEMA\": \"Clip.2\",\n                        \"metadata\": {\n                            \"moontimeline\": {\n                                \"fixture\": true\n                            }\n                        },\n                        \"name\": \"Example clip\",\n                        \"source_range\": {\n                            \"OTIO_SCHEMA\": \"TimeRange.1\",\n                            \"duration\": {\n                                \"OTIO_SCHEMA\": \"RationalTime.1\",\n                                \"rate\": 24.0,\n                                \"value\": 120.0\n                            },\n                            \"start_time\": {\n                                \"OTIO_SCHEMA\": \"RationalTime.1\",\n                                \"rate\": 24.0,\n                                \"value\": 240.0\n                            }\n                        },\n                        \"effects\": [],\n                        \"markers\": [],\n                        \"enabled\": true,\n                        \"color\": null,\n                        \"media_references\": {\n                            \"DEFAULT_MEDIA\": {\n                                \"OTIO_SCHEMA\": \"ExternalReference.1\",\n                                \"metadata\": {},\n                                \"name\": \"\",\n                                \"available_range\": {\n                                    \"OTIO_SCHEMA\": \"TimeRange.1\",\n                                    \"duration\": {\n                                        \"OTIO_SCHEMA\": \"RationalTime.1\",\n                                        \"rate\": 24.0,\n                                        \"value\": 480.0\n                                    },\n                                    \"start_time\": {\n                                        \"OTIO_SCHEMA\": \"RationalTime.1\",\n                                        \"rate\": 24.0,\n                                        \"value\": 0.0\n                                    }\n                                },\n                                \"available_image_bounds\": null,\n                                \"target_url\": \"media/example.mov\"\n                            }\n                        },\n                        \"active_media_reference_key\": \"DEFAULT_MEDIA\"\n                    }\n                ],\n                \"kind\": \"Video\"\n            }\n        ]\n    }\n}\n",
  ).unwrap()
}

///|
test "valid fixture has no diagnostics" {
  assert_eq(@validate.validate(sample()).length(), 0)
}

///|
test "unknown availability is informational not out of bounds" {
  let t = sample()
  match t.tracks.children[0].children[1] {
    @model.Clip(c) => {
      c.media_references["DEFAULT_MEDIA"] = {
        ..c.media_references["DEFAULT_MEDIA"],
        available_range: None,
      }
      let issues = @validate.validate(t)
      assert_true(!@validate.has_errors(issues))
      assert_true(issues.any(fn(i) { i.code == "unknown_available_range" }))
      assert_true(!issues.any(fn(i) { i.code == "source_out_of_bounds" }))
    }
    _ => fail("Expected clip")
  }
}

///|
test "known bounds violation has path and error severity" {
  let t = sample()
  match t.tracks.children[0].children[1] {
    @model.Clip(c) => {
      let short = match t.tracks.children[0].children[0] {
        @model.Gap(g) => g.source_range
        _ => fail("Expected gap")
      }
      c.media_references["DEFAULT_MEDIA"] = {
        ..c.media_references["DEFAULT_MEDIA"],
        available_range: Some(short),
      }
      let issues = @validate.validate(t)
      assert_true(@validate.has_errors(issues))
      assert_true(
        issues.any(fn(i) {
          i.code == "source_out_of_bounds" &&
          i.path == "/tracks/children/0/children/1/source_range" &&
          i.severity is @validate.Error
        }),
      )
    }
    _ => fail("Expected clip")
  }
}

///|
test "unknown duration and missing media are distinct warnings" {
  let t = sample()
  match t.tracks.children[0].children[1] {
    @model.Clip(c) => {
      c.media_references["DEFAULT_MEDIA"] = {
        ..c.media_references["DEFAULT_MEDIA"],
        kind: @model.Missing,
        available_range: None,
      }
      t.tracks.children[0].children[1] = @model.Clip({
        ..c,
        source_range: None,
      })
      let issues = @validate.validate(t)
      assert_true(!@validate.has_errors(issues))
      assert_true(issues.any(fn(i) { i.code == "unknown_duration" }))
      assert_true(issues.any(fn(i) { i.code == "missing_media" }))
    }
    _ => fail("Expected clip")
  }
}

///|
test "invalid active key is an error" {
  let t = sample()
  match t.tracks.children[0].children[1] {
    @model.Clip(c) =>
      t.tracks.children[0].children[1] = @model.Clip({
        ..c,
        active_media_reference_key: "bad",
      })
    _ => fail("Expected clip")
  }
  assert_true(@validate.has_errors(@validate.validate(t)))
}
