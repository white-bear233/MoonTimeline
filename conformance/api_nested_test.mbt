// Generated from official OTIO 0.18.1 by tools/generate_api_tests.py.

///|
test "nested:Clip-effects-0" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [null], \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Clip-effects-1" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [{}], \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Clip-effects-2" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [1], \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Clip-effects-3" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [\"invalid\"], \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Clip-effects-4" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}], \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Clip-effects-5" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null}], \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Clip-effects-6" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [{\"OTIO_SCHEMA\": \"Marker.2\", \"metadata\": {}, \"name\": \"\", \"color\": \"RED\", \"marked_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"comment\": \"\"}], \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Clip-effects-7" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [{\"OTIO_SCHEMA\": \"Effect.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": \"\", \"enabled\": true}], \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  assert_true(
    @otiojson.equivalent(
      result.unwrap().to_json().unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"Clip.2\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"source_range\": null,\n    \"effects\": [\n        {\n            \"OTIO_SCHEMA\": \"Effect.1\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"effect_name\": \"\",\n            \"enabled\": true\n        }\n    ],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"media_references\": {\n        \"DEFAULT_MEDIA\": {\n            \"OTIO_SCHEMA\": \"MissingReference.1\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"available_range\": null,\n            \"available_image_bounds\": null\n        }\n    },\n    \"active_media_reference_key\": \"DEFAULT_MEDIA\"\n}",
      ).unwrap(),
    ),
  )
}

///|
test "nested:Clip-effects-8" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [{\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}], \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Clip-effects-9" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [{\"OTIO_SCHEMA\": \"SerializableObject.1\"}], \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Clip-effects-10" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [{\"OTIO_SCHEMA\": \"FutureType.1\", \"custom\": 42}], \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Clip-markers-0" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [null], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Clip-markers-1" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [{}], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Clip-markers-2" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [1], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Clip-markers-3" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [\"invalid\"], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Clip-markers-4" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Clip-markers-5" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null}], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Clip-markers-6" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [{\"OTIO_SCHEMA\": \"Marker.2\", \"metadata\": {}, \"name\": \"\", \"color\": \"RED\", \"marked_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"comment\": \"\"}], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  assert_true(
    @otiojson.equivalent(
      result.unwrap().to_json().unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"Clip.2\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [\n        {\n            \"OTIO_SCHEMA\": \"Marker.2\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"color\": \"RED\",\n            \"marked_range\": {\n                \"OTIO_SCHEMA\": \"TimeRange.1\",\n                \"duration\": {\n                    \"OTIO_SCHEMA\": \"RationalTime.1\",\n                    \"rate\": 1.0,\n                    \"value\": 0.0\n                },\n                \"start_time\": {\n                    \"OTIO_SCHEMA\": \"RationalTime.1\",\n                    \"rate\": 1.0,\n                    \"value\": 0.0\n                }\n            },\n            \"comment\": \"\"\n        }\n    ],\n    \"enabled\": true,\n    \"color\": null,\n    \"media_references\": {\n        \"DEFAULT_MEDIA\": {\n            \"OTIO_SCHEMA\": \"MissingReference.1\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"available_range\": null,\n            \"available_image_bounds\": null\n        }\n    },\n    \"active_media_reference_key\": \"DEFAULT_MEDIA\"\n}",
      ).unwrap(),
    ),
  )
}

///|
test "nested:Clip-markers-7" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [{\"OTIO_SCHEMA\": \"Effect.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": \"\", \"enabled\": true}], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Clip-markers-8" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [{\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Clip-markers-9" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [{\"OTIO_SCHEMA\": \"SerializableObject.1\"}], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Clip-markers-10" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [{\"OTIO_SCHEMA\": \"FutureType.1\", \"custom\": 42}], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Clip-media_references-0" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": null}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Clip-media_references-1" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Clip-media_references-2" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": 1}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Clip-media_references-3" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": \"invalid\"}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Clip-media_references-4" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Clip-media_references-5" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Clip-media_references-6" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"Marker.2\", \"metadata\": {}, \"name\": \"\", \"color\": \"RED\", \"marked_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"comment\": \"\"}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Clip-media_references-7" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"Effect.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": \"\", \"enabled\": true}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Clip-media_references-8" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  assert_true(
    @otiojson.equivalent(
      result.unwrap().to_json().unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"Clip.2\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"media_references\": {\n        \"DEFAULT_MEDIA\": {\n            \"OTIO_SCHEMA\": \"MissingReference.1\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"available_range\": null,\n            \"available_image_bounds\": null\n        }\n    },\n    \"active_media_reference_key\": \"DEFAULT_MEDIA\"\n}",
      ).unwrap(),
    ),
  )
}

///|
test "nested:Clip-media_references-9" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"SerializableObject.1\"}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Clip-media_references-10" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"FutureType.1\", \"custom\": 42}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Composition-children-0" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [null]}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Composition-children-1" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [{}]}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Composition-children-2" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [1]}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Composition-children-3" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [\"invalid\"]}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Composition-children-4" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}]}",
  )
  assert_true(
    @otiojson.equivalent(
      result.unwrap().to_json().unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"Composition.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"children\": [\n        {\n            \"OTIO_SCHEMA\": \"Clip.2\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"source_range\": null,\n            \"effects\": [],\n            \"markers\": [],\n            \"enabled\": true,\n            \"color\": null,\n            \"media_references\": {\n                \"DEFAULT_MEDIA\": {\n                    \"OTIO_SCHEMA\": \"MissingReference.1\",\n                    \"metadata\": {},\n                    \"name\": \"\",\n                    \"available_range\": null,\n                    \"available_image_bounds\": null\n                }\n            },\n            \"active_media_reference_key\": \"DEFAULT_MEDIA\"\n        }\n    ]\n}",
      ).unwrap(),
    ),
  )
}

///|
test "nested:Composition-children-5" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null}]}",
  )
  assert_true(
    @otiojson.equivalent(
      result.unwrap().to_json().unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"Composition.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"children\": [\n        {\n            \"OTIO_SCHEMA\": \"Gap.1\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"source_range\": {\n                \"OTIO_SCHEMA\": \"TimeRange.1\",\n                \"duration\": {\n                    \"OTIO_SCHEMA\": \"RationalTime.1\",\n                    \"rate\": 1.0,\n                    \"value\": 0.0\n                },\n                \"start_time\": {\n                    \"OTIO_SCHEMA\": \"RationalTime.1\",\n                    \"rate\": 1.0,\n                    \"value\": 0.0\n                }\n            },\n            \"effects\": [],\n            \"markers\": [],\n            \"enabled\": true,\n            \"color\": null\n        }\n    ]\n}",
      ).unwrap(),
    ),
  )
}

///|
test "nested:Composition-children-6" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [{\"OTIO_SCHEMA\": \"Marker.2\", \"metadata\": {}, \"name\": \"\", \"color\": \"RED\", \"marked_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"comment\": \"\"}]}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Composition-children-7" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [{\"OTIO_SCHEMA\": \"Effect.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": \"\", \"enabled\": true}]}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Composition-children-8" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [{\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}]}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Composition-children-9" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [{\"OTIO_SCHEMA\": \"SerializableObject.1\"}]}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Composition-children-10" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [{\"OTIO_SCHEMA\": \"FutureType.1\", \"custom\": 42}]}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Composition-effects-0" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [null], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Composition-effects-1" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [{}], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Composition-effects-2" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [1], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Composition-effects-3" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [\"invalid\"], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Composition-effects-4" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Composition-effects-5" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null}], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Composition-effects-6" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [{\"OTIO_SCHEMA\": \"Marker.2\", \"metadata\": {}, \"name\": \"\", \"color\": \"RED\", \"marked_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"comment\": \"\"}], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Composition-effects-7" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [{\"OTIO_SCHEMA\": \"Effect.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": \"\", \"enabled\": true}], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(
    @otiojson.equivalent(
      result.unwrap().to_json().unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"Composition.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"source_range\": null,\n    \"effects\": [\n        {\n            \"OTIO_SCHEMA\": \"Effect.1\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"effect_name\": \"\",\n            \"enabled\": true\n        }\n    ],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"children\": []\n}",
      ).unwrap(),
    ),
  )
}

///|
test "nested:Composition-effects-8" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [{\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Composition-effects-9" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [{\"OTIO_SCHEMA\": \"SerializableObject.1\"}], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Composition-effects-10" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [{\"OTIO_SCHEMA\": \"FutureType.1\", \"custom\": 42}], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Composition-markers-0" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [null], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Composition-markers-1" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [{}], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Composition-markers-2" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [1], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Composition-markers-3" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [\"invalid\"], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Composition-markers-4" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Composition-markers-5" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null}], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Composition-markers-6" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [{\"OTIO_SCHEMA\": \"Marker.2\", \"metadata\": {}, \"name\": \"\", \"color\": \"RED\", \"marked_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"comment\": \"\"}], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(
    @otiojson.equivalent(
      result.unwrap().to_json().unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"Composition.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [\n        {\n            \"OTIO_SCHEMA\": \"Marker.2\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"color\": \"RED\",\n            \"marked_range\": {\n                \"OTIO_SCHEMA\": \"TimeRange.1\",\n                \"duration\": {\n                    \"OTIO_SCHEMA\": \"RationalTime.1\",\n                    \"rate\": 1.0,\n                    \"value\": 0.0\n                },\n                \"start_time\": {\n                    \"OTIO_SCHEMA\": \"RationalTime.1\",\n                    \"rate\": 1.0,\n                    \"value\": 0.0\n                }\n            },\n            \"comment\": \"\"\n        }\n    ],\n    \"enabled\": true,\n    \"color\": null,\n    \"children\": []\n}",
      ).unwrap(),
    ),
  )
}

///|
test "nested:Composition-markers-7" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [{\"OTIO_SCHEMA\": \"Effect.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": \"\", \"enabled\": true}], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Composition-markers-8" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [{\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Composition-markers-9" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [{\"OTIO_SCHEMA\": \"SerializableObject.1\"}], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Composition-markers-10" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [{\"OTIO_SCHEMA\": \"FutureType.1\", \"custom\": 42}], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Gap-effects-0" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"effects\": [null], \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Gap-effects-1" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"effects\": [{}], \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Gap-effects-2" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"effects\": [1], \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Gap-effects-3" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"effects\": [\"invalid\"], \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Gap-effects-4" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"effects\": [{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}], \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Gap-effects-5" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"effects\": [{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null}], \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Gap-effects-6" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"effects\": [{\"OTIO_SCHEMA\": \"Marker.2\", \"metadata\": {}, \"name\": \"\", \"color\": \"RED\", \"marked_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"comment\": \"\"}], \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Gap-effects-7" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"effects\": [{\"OTIO_SCHEMA\": \"Effect.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": \"\", \"enabled\": true}], \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  assert_true(
    @otiojson.equivalent(
      result.unwrap().to_json().unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"Gap.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"source_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 1.0,\n            \"value\": 0.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 1.0,\n            \"value\": 0.0\n        }\n    },\n    \"effects\": [\n        {\n            \"OTIO_SCHEMA\": \"Effect.1\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"effect_name\": \"\",\n            \"enabled\": true\n        }\n    ],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null\n}",
      ).unwrap(),
    ),
  )
}

///|
test "nested:Gap-effects-8" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"effects\": [{\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}], \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Gap-effects-9" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"effects\": [{\"OTIO_SCHEMA\": \"SerializableObject.1\"}], \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Gap-effects-10" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"effects\": [{\"OTIO_SCHEMA\": \"FutureType.1\", \"custom\": 42}], \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Gap-markers-0" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"effects\": [], \"markers\": [null], \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Gap-markers-1" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"effects\": [], \"markers\": [{}], \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Gap-markers-2" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"effects\": [], \"markers\": [1], \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Gap-markers-3" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"effects\": [], \"markers\": [\"invalid\"], \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Gap-markers-4" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"effects\": [], \"markers\": [{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}], \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Gap-markers-5" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"effects\": [], \"markers\": [{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null}], \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Gap-markers-6" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"effects\": [], \"markers\": [{\"OTIO_SCHEMA\": \"Marker.2\", \"metadata\": {}, \"name\": \"\", \"color\": \"RED\", \"marked_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"comment\": \"\"}], \"enabled\": true, \"color\": null}",
  )
  assert_true(
    @otiojson.equivalent(
      result.unwrap().to_json().unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"Gap.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"source_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 1.0,\n            \"value\": 0.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 1.0,\n            \"value\": 0.0\n        }\n    },\n    \"effects\": [],\n    \"markers\": [\n        {\n            \"OTIO_SCHEMA\": \"Marker.2\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"color\": \"RED\",\n            \"marked_range\": {\n                \"OTIO_SCHEMA\": \"TimeRange.1\",\n                \"duration\": {\n                    \"OTIO_SCHEMA\": \"RationalTime.1\",\n                    \"rate\": 1.0,\n                    \"value\": 0.0\n                },\n                \"start_time\": {\n                    \"OTIO_SCHEMA\": \"RationalTime.1\",\n                    \"rate\": 1.0,\n                    \"value\": 0.0\n                }\n            },\n            \"comment\": \"\"\n        }\n    ],\n    \"enabled\": true,\n    \"color\": null\n}",
      ).unwrap(),
    ),
  )
}

///|
test "nested:Gap-markers-7" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"effects\": [], \"markers\": [{\"OTIO_SCHEMA\": \"Effect.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": \"\", \"enabled\": true}], \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Gap-markers-8" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"effects\": [], \"markers\": [{\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}], \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Gap-markers-9" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"effects\": [], \"markers\": [{\"OTIO_SCHEMA\": \"SerializableObject.1\"}], \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Gap-markers-10" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"effects\": [], \"markers\": [{\"OTIO_SCHEMA\": \"FutureType.1\", \"custom\": 42}], \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Item-effects-0" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Item.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [null], \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Item-effects-1" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Item.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [{}], \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Item-effects-2" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Item.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [1], \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Item-effects-3" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Item.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [\"invalid\"], \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Item-effects-4" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Item.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}], \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Item-effects-5" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Item.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null}], \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Item-effects-6" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Item.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [{\"OTIO_SCHEMA\": \"Marker.2\", \"metadata\": {}, \"name\": \"\", \"color\": \"RED\", \"marked_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"comment\": \"\"}], \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Item-effects-7" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Item.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [{\"OTIO_SCHEMA\": \"Effect.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": \"\", \"enabled\": true}], \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  assert_true(
    @otiojson.equivalent(
      result.unwrap().to_json().unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"Item.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"source_range\": null,\n    \"effects\": [\n        {\n            \"OTIO_SCHEMA\": \"Effect.1\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"effect_name\": \"\",\n            \"enabled\": true\n        }\n    ],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null\n}",
      ).unwrap(),
    ),
  )
}

///|
test "nested:Item-effects-8" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Item.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [{\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}], \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Item-effects-9" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Item.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [{\"OTIO_SCHEMA\": \"SerializableObject.1\"}], \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Item-effects-10" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Item.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [{\"OTIO_SCHEMA\": \"FutureType.1\", \"custom\": 42}], \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Item-markers-0" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Item.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [null], \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Item-markers-1" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Item.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [{}], \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Item-markers-2" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Item.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [1], \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Item-markers-3" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Item.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [\"invalid\"], \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Item-markers-4" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Item.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}], \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Item-markers-5" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Item.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null}], \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Item-markers-6" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Item.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [{\"OTIO_SCHEMA\": \"Marker.2\", \"metadata\": {}, \"name\": \"\", \"color\": \"RED\", \"marked_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"comment\": \"\"}], \"enabled\": true, \"color\": null}",
  )
  assert_true(
    @otiojson.equivalent(
      result.unwrap().to_json().unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"Item.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [\n        {\n            \"OTIO_SCHEMA\": \"Marker.2\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"color\": \"RED\",\n            \"marked_range\": {\n                \"OTIO_SCHEMA\": \"TimeRange.1\",\n                \"duration\": {\n                    \"OTIO_SCHEMA\": \"RationalTime.1\",\n                    \"rate\": 1.0,\n                    \"value\": 0.0\n                },\n                \"start_time\": {\n                    \"OTIO_SCHEMA\": \"RationalTime.1\",\n                    \"rate\": 1.0,\n                    \"value\": 0.0\n                }\n            },\n            \"comment\": \"\"\n        }\n    ],\n    \"enabled\": true,\n    \"color\": null\n}",
      ).unwrap(),
    ),
  )
}

///|
test "nested:Item-markers-7" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Item.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [{\"OTIO_SCHEMA\": \"Effect.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": \"\", \"enabled\": true}], \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Item-markers-8" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Item.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [{\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}], \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Item-markers-9" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Item.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [{\"OTIO_SCHEMA\": \"SerializableObject.1\"}], \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Item-markers-10" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Item.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [{\"OTIO_SCHEMA\": \"FutureType.1\", \"custom\": 42}], \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:SerializableCollection-children-0" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"SerializableCollection.1\", \"metadata\": {}, \"name\": \"\", \"children\": [null]}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:SerializableCollection-children-1" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"SerializableCollection.1\", \"metadata\": {}, \"name\": \"\", \"children\": [{}]}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:SerializableCollection-children-2" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"SerializableCollection.1\", \"metadata\": {}, \"name\": \"\", \"children\": [1]}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:SerializableCollection-children-3" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"SerializableCollection.1\", \"metadata\": {}, \"name\": \"\", \"children\": [\"invalid\"]}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:SerializableCollection-children-4" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"SerializableCollection.1\", \"metadata\": {}, \"name\": \"\", \"children\": [{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}]}",
  )
  assert_true(
    @otiojson.equivalent(
      result.unwrap().to_json().unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"SerializableCollection.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"children\": [\n        {\n            \"OTIO_SCHEMA\": \"Clip.2\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"source_range\": null,\n            \"effects\": [],\n            \"markers\": [],\n            \"enabled\": true,\n            \"color\": null,\n            \"media_references\": {\n                \"DEFAULT_MEDIA\": {\n                    \"OTIO_SCHEMA\": \"MissingReference.1\",\n                    \"metadata\": {},\n                    \"name\": \"\",\n                    \"available_range\": null,\n                    \"available_image_bounds\": null\n                }\n            },\n            \"active_media_reference_key\": \"DEFAULT_MEDIA\"\n        }\n    ]\n}",
      ).unwrap(),
    ),
  )
}

///|
test "nested:SerializableCollection-children-5" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"SerializableCollection.1\", \"metadata\": {}, \"name\": \"\", \"children\": [{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null}]}",
  )
  assert_true(
    @otiojson.equivalent(
      result.unwrap().to_json().unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"SerializableCollection.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"children\": [\n        {\n            \"OTIO_SCHEMA\": \"Gap.1\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"source_range\": {\n                \"OTIO_SCHEMA\": \"TimeRange.1\",\n                \"duration\": {\n                    \"OTIO_SCHEMA\": \"RationalTime.1\",\n                    \"rate\": 1.0,\n                    \"value\": 0.0\n                },\n                \"start_time\": {\n                    \"OTIO_SCHEMA\": \"RationalTime.1\",\n                    \"rate\": 1.0,\n                    \"value\": 0.0\n                }\n            },\n            \"effects\": [],\n            \"markers\": [],\n            \"enabled\": true,\n            \"color\": null\n        }\n    ]\n}",
      ).unwrap(),
    ),
  )
}

///|
test "nested:SerializableCollection-children-6" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"SerializableCollection.1\", \"metadata\": {}, \"name\": \"\", \"children\": [{\"OTIO_SCHEMA\": \"Marker.2\", \"metadata\": {}, \"name\": \"\", \"color\": \"RED\", \"marked_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"comment\": \"\"}]}",
  )
  assert_true(
    @otiojson.equivalent(
      result.unwrap().to_json().unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"SerializableCollection.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"children\": [\n        {\n            \"OTIO_SCHEMA\": \"Marker.2\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"color\": \"RED\",\n            \"marked_range\": {\n                \"OTIO_SCHEMA\": \"TimeRange.1\",\n                \"duration\": {\n                    \"OTIO_SCHEMA\": \"RationalTime.1\",\n                    \"rate\": 1.0,\n                    \"value\": 0.0\n                },\n                \"start_time\": {\n                    \"OTIO_SCHEMA\": \"RationalTime.1\",\n                    \"rate\": 1.0,\n                    \"value\": 0.0\n                }\n            },\n            \"comment\": \"\"\n        }\n    ]\n}",
      ).unwrap(),
    ),
  )
}

///|
test "nested:SerializableCollection-children-7" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"SerializableCollection.1\", \"metadata\": {}, \"name\": \"\", \"children\": [{\"OTIO_SCHEMA\": \"Effect.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": \"\", \"enabled\": true}]}",
  )
  assert_true(
    @otiojson.equivalent(
      result.unwrap().to_json().unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"SerializableCollection.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"children\": [\n        {\n            \"OTIO_SCHEMA\": \"Effect.1\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"effect_name\": \"\",\n            \"enabled\": true\n        }\n    ]\n}",
      ).unwrap(),
    ),
  )
}

///|
test "nested:SerializableCollection-children-8" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"SerializableCollection.1\", \"metadata\": {}, \"name\": \"\", \"children\": [{\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}]}",
  )
  assert_true(
    @otiojson.equivalent(
      result.unwrap().to_json().unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"SerializableCollection.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"children\": [\n        {\n            \"OTIO_SCHEMA\": \"MissingReference.1\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"available_range\": null,\n            \"available_image_bounds\": null\n        }\n    ]\n}",
      ).unwrap(),
    ),
  )
}

///|
test "nested:SerializableCollection-children-9" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"SerializableCollection.1\", \"metadata\": {}, \"name\": \"\", \"children\": [{\"OTIO_SCHEMA\": \"SerializableObject.1\"}]}",
  )
  assert_true(
    @otiojson.equivalent(
      result.unwrap().to_json().unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"SerializableCollection.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"children\": [\n        {\n            \"OTIO_SCHEMA\": \"SerializableObject.1\"\n        }\n    ]\n}",
      ).unwrap(),
    ),
  )
}

///|
test "nested:SerializableCollection-children-10" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"SerializableCollection.1\", \"metadata\": {}, \"name\": \"\", \"children\": [{\"OTIO_SCHEMA\": \"FutureType.1\", \"custom\": 42}]}",
  )
  assert_true(
    @otiojson.equivalent(
      result.unwrap().to_json().unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"SerializableCollection.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"children\": [\n        {\n            \"OTIO_SCHEMA\": \"FutureType.1\",\n            \"custom\": 42\n        }\n    ]\n}",
      ).unwrap(),
    ),
  )
}

///|
test "nested:Stack-children-0" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [null]}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Stack-children-1" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [{}]}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Stack-children-2" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [1]}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Stack-children-3" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [\"invalid\"]}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Stack-children-4" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}]}",
  )
  assert_true(
    @otiojson.equivalent(
      result.unwrap().to_json().unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"Stack.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"children\": [\n        {\n            \"OTIO_SCHEMA\": \"Clip.2\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"source_range\": null,\n            \"effects\": [],\n            \"markers\": [],\n            \"enabled\": true,\n            \"color\": null,\n            \"media_references\": {\n                \"DEFAULT_MEDIA\": {\n                    \"OTIO_SCHEMA\": \"MissingReference.1\",\n                    \"metadata\": {},\n                    \"name\": \"\",\n                    \"available_range\": null,\n                    \"available_image_bounds\": null\n                }\n            },\n            \"active_media_reference_key\": \"DEFAULT_MEDIA\"\n        }\n    ]\n}",
      ).unwrap(),
    ),
  )
}

///|
test "nested:Stack-children-5" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null}]}",
  )
  assert_true(
    @otiojson.equivalent(
      result.unwrap().to_json().unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"Stack.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"children\": [\n        {\n            \"OTIO_SCHEMA\": \"Gap.1\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"source_range\": {\n                \"OTIO_SCHEMA\": \"TimeRange.1\",\n                \"duration\": {\n                    \"OTIO_SCHEMA\": \"RationalTime.1\",\n                    \"rate\": 1.0,\n                    \"value\": 0.0\n                },\n                \"start_time\": {\n                    \"OTIO_SCHEMA\": \"RationalTime.1\",\n                    \"rate\": 1.0,\n                    \"value\": 0.0\n                }\n            },\n            \"effects\": [],\n            \"markers\": [],\n            \"enabled\": true,\n            \"color\": null\n        }\n    ]\n}",
      ).unwrap(),
    ),
  )
}

///|
test "nested:Stack-children-6" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [{\"OTIO_SCHEMA\": \"Marker.2\", \"metadata\": {}, \"name\": \"\", \"color\": \"RED\", \"marked_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"comment\": \"\"}]}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Stack-children-7" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [{\"OTIO_SCHEMA\": \"Effect.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": \"\", \"enabled\": true}]}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Stack-children-8" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [{\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}]}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Stack-children-9" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [{\"OTIO_SCHEMA\": \"SerializableObject.1\"}]}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Stack-children-10" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [{\"OTIO_SCHEMA\": \"FutureType.1\", \"custom\": 42}]}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Stack-effects-0" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [null], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Stack-effects-1" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [{}], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Stack-effects-2" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [1], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Stack-effects-3" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [\"invalid\"], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Stack-effects-4" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Stack-effects-5" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null}], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Stack-effects-6" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [{\"OTIO_SCHEMA\": \"Marker.2\", \"metadata\": {}, \"name\": \"\", \"color\": \"RED\", \"marked_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"comment\": \"\"}], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Stack-effects-7" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [{\"OTIO_SCHEMA\": \"Effect.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": \"\", \"enabled\": true}], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(
    @otiojson.equivalent(
      result.unwrap().to_json().unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"Stack.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"source_range\": null,\n    \"effects\": [\n        {\n            \"OTIO_SCHEMA\": \"Effect.1\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"effect_name\": \"\",\n            \"enabled\": true\n        }\n    ],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"children\": []\n}",
      ).unwrap(),
    ),
  )
}

///|
test "nested:Stack-effects-8" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [{\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Stack-effects-9" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [{\"OTIO_SCHEMA\": \"SerializableObject.1\"}], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Stack-effects-10" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [{\"OTIO_SCHEMA\": \"FutureType.1\", \"custom\": 42}], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Stack-markers-0" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [null], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Stack-markers-1" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [{}], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Stack-markers-2" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [1], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Stack-markers-3" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [\"invalid\"], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Stack-markers-4" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Stack-markers-5" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null}], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Stack-markers-6" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [{\"OTIO_SCHEMA\": \"Marker.2\", \"metadata\": {}, \"name\": \"\", \"color\": \"RED\", \"marked_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"comment\": \"\"}], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(
    @otiojson.equivalent(
      result.unwrap().to_json().unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"Stack.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [\n        {\n            \"OTIO_SCHEMA\": \"Marker.2\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"color\": \"RED\",\n            \"marked_range\": {\n                \"OTIO_SCHEMA\": \"TimeRange.1\",\n                \"duration\": {\n                    \"OTIO_SCHEMA\": \"RationalTime.1\",\n                    \"rate\": 1.0,\n                    \"value\": 0.0\n                },\n                \"start_time\": {\n                    \"OTIO_SCHEMA\": \"RationalTime.1\",\n                    \"rate\": 1.0,\n                    \"value\": 0.0\n                }\n            },\n            \"comment\": \"\"\n        }\n    ],\n    \"enabled\": true,\n    \"color\": null,\n    \"children\": []\n}",
      ).unwrap(),
    ),
  )
}

///|
test "nested:Stack-markers-7" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [{\"OTIO_SCHEMA\": \"Effect.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": \"\", \"enabled\": true}], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Stack-markers-8" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [{\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Stack-markers-9" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [{\"OTIO_SCHEMA\": \"SerializableObject.1\"}], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Stack-markers-10" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [{\"OTIO_SCHEMA\": \"FutureType.1\", \"custom\": 42}], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Track-children-0" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [null], \"kind\": \"Video\"}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Track-children-1" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [{}], \"kind\": \"Video\"}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Track-children-2" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [1], \"kind\": \"Video\"}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Track-children-3" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [\"invalid\"], \"kind\": \"Video\"}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Track-children-4" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}], \"kind\": \"Video\"}",
  )
  assert_true(
    @otiojson.equivalent(
      result.unwrap().to_json().unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"Track.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"children\": [\n        {\n            \"OTIO_SCHEMA\": \"Clip.2\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"source_range\": null,\n            \"effects\": [],\n            \"markers\": [],\n            \"enabled\": true,\n            \"color\": null,\n            \"media_references\": {\n                \"DEFAULT_MEDIA\": {\n                    \"OTIO_SCHEMA\": \"MissingReference.1\",\n                    \"metadata\": {},\n                    \"name\": \"\",\n                    \"available_range\": null,\n                    \"available_image_bounds\": null\n                }\n            },\n            \"active_media_reference_key\": \"DEFAULT_MEDIA\"\n        }\n    ],\n    \"kind\": \"Video\"\n}",
      ).unwrap(),
    ),
  )
}

///|
test "nested:Track-children-5" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null}], \"kind\": \"Video\"}",
  )
  assert_true(
    @otiojson.equivalent(
      result.unwrap().to_json().unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"Track.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"children\": [\n        {\n            \"OTIO_SCHEMA\": \"Gap.1\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"source_range\": {\n                \"OTIO_SCHEMA\": \"TimeRange.1\",\n                \"duration\": {\n                    \"OTIO_SCHEMA\": \"RationalTime.1\",\n                    \"rate\": 1.0,\n                    \"value\": 0.0\n                },\n                \"start_time\": {\n                    \"OTIO_SCHEMA\": \"RationalTime.1\",\n                    \"rate\": 1.0,\n                    \"value\": 0.0\n                }\n            },\n            \"effects\": [],\n            \"markers\": [],\n            \"enabled\": true,\n            \"color\": null\n        }\n    ],\n    \"kind\": \"Video\"\n}",
      ).unwrap(),
    ),
  )
}

///|
test "nested:Track-children-6" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [{\"OTIO_SCHEMA\": \"Marker.2\", \"metadata\": {}, \"name\": \"\", \"color\": \"RED\", \"marked_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"comment\": \"\"}], \"kind\": \"Video\"}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Track-children-7" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [{\"OTIO_SCHEMA\": \"Effect.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": \"\", \"enabled\": true}], \"kind\": \"Video\"}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Track-children-8" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [{\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}], \"kind\": \"Video\"}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Track-children-9" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [{\"OTIO_SCHEMA\": \"SerializableObject.1\"}], \"kind\": \"Video\"}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Track-children-10" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [{\"OTIO_SCHEMA\": \"FutureType.1\", \"custom\": 42}], \"kind\": \"Video\"}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Track-effects-0" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [null], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [], \"kind\": \"Video\"}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Track-effects-1" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [{}], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [], \"kind\": \"Video\"}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Track-effects-2" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [1], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [], \"kind\": \"Video\"}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Track-effects-3" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [\"invalid\"], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [], \"kind\": \"Video\"}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Track-effects-4" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [], \"kind\": \"Video\"}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Track-effects-5" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null}], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [], \"kind\": \"Video\"}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Track-effects-6" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [{\"OTIO_SCHEMA\": \"Marker.2\", \"metadata\": {}, \"name\": \"\", \"color\": \"RED\", \"marked_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"comment\": \"\"}], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [], \"kind\": \"Video\"}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Track-effects-7" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [{\"OTIO_SCHEMA\": \"Effect.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": \"\", \"enabled\": true}], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [], \"kind\": \"Video\"}",
  )
  assert_true(
    @otiojson.equivalent(
      result.unwrap().to_json().unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"Track.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"source_range\": null,\n    \"effects\": [\n        {\n            \"OTIO_SCHEMA\": \"Effect.1\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"effect_name\": \"\",\n            \"enabled\": true\n        }\n    ],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"children\": [],\n    \"kind\": \"Video\"\n}",
      ).unwrap(),
    ),
  )
}

///|
test "nested:Track-effects-8" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [{\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [], \"kind\": \"Video\"}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Track-effects-9" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [{\"OTIO_SCHEMA\": \"SerializableObject.1\"}], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [], \"kind\": \"Video\"}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Track-effects-10" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [{\"OTIO_SCHEMA\": \"FutureType.1\", \"custom\": 42}], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [], \"kind\": \"Video\"}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Track-markers-0" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [null], \"enabled\": true, \"color\": null, \"children\": [], \"kind\": \"Video\"}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Track-markers-1" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [{}], \"enabled\": true, \"color\": null, \"children\": [], \"kind\": \"Video\"}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Track-markers-2" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [1], \"enabled\": true, \"color\": null, \"children\": [], \"kind\": \"Video\"}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Track-markers-3" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [\"invalid\"], \"enabled\": true, \"color\": null, \"children\": [], \"kind\": \"Video\"}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Track-markers-4" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}], \"enabled\": true, \"color\": null, \"children\": [], \"kind\": \"Video\"}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Track-markers-5" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null}], \"enabled\": true, \"color\": null, \"children\": [], \"kind\": \"Video\"}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Track-markers-6" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [{\"OTIO_SCHEMA\": \"Marker.2\", \"metadata\": {}, \"name\": \"\", \"color\": \"RED\", \"marked_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"comment\": \"\"}], \"enabled\": true, \"color\": null, \"children\": [], \"kind\": \"Video\"}",
  )
  assert_true(
    @otiojson.equivalent(
      result.unwrap().to_json().unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"Track.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [\n        {\n            \"OTIO_SCHEMA\": \"Marker.2\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"color\": \"RED\",\n            \"marked_range\": {\n                \"OTIO_SCHEMA\": \"TimeRange.1\",\n                \"duration\": {\n                    \"OTIO_SCHEMA\": \"RationalTime.1\",\n                    \"rate\": 1.0,\n                    \"value\": 0.0\n                },\n                \"start_time\": {\n                    \"OTIO_SCHEMA\": \"RationalTime.1\",\n                    \"rate\": 1.0,\n                    \"value\": 0.0\n                }\n            },\n            \"comment\": \"\"\n        }\n    ],\n    \"enabled\": true,\n    \"color\": null,\n    \"children\": [],\n    \"kind\": \"Video\"\n}",
      ).unwrap(),
    ),
  )
}

///|
test "nested:Track-markers-7" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [{\"OTIO_SCHEMA\": \"Effect.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": \"\", \"enabled\": true}], \"enabled\": true, \"color\": null, \"children\": [], \"kind\": \"Video\"}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Track-markers-8" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [{\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}], \"enabled\": true, \"color\": null, \"children\": [], \"kind\": \"Video\"}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Track-markers-9" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [{\"OTIO_SCHEMA\": \"SerializableObject.1\"}], \"enabled\": true, \"color\": null, \"children\": [], \"kind\": \"Video\"}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:Track-markers-10" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [{\"OTIO_SCHEMA\": \"FutureType.1\", \"custom\": 42}], \"enabled\": true, \"color\": null, \"children\": [], \"kind\": \"Video\"}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:integer-start_frame-0" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1.0, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:integer-start_frame-1" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1.5, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:integer-start_frame-2" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": -1, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(
    @otiojson.equivalent(
      result.unwrap().to_json().unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": null,\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"\",\n    \"name_prefix\": \"\",\n    \"name_suffix\": \"\",\n    \"start_frame\": -1,\n    \"frame_step\": 1,\n    \"rate\": 1.0,\n    \"frame_zero_padding\": 0,\n    \"missing_frame_policy\": \"error\"\n}",
      ).unwrap(),
    ),
  )
}

///|
test "nested:integer-start_frame-3" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 2147483648, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(
    @otiojson.equivalent(
      result.unwrap().to_json().unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": null,\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"\",\n    \"name_prefix\": \"\",\n    \"name_suffix\": \"\",\n    \"start_frame\": -2147483648,\n    \"frame_step\": 1,\n    \"rate\": 1.0,\n    \"frame_zero_padding\": 0,\n    \"missing_frame_policy\": \"error\"\n}",
      ).unwrap(),
    ),
  )
}

///|
test "nested:integer-start_frame-4" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 9007199254740993, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(
    @otiojson.equivalent(
      result.unwrap().to_json().unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": null,\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"\",\n    \"name_prefix\": \"\",\n    \"name_suffix\": \"\",\n    \"start_frame\": 1,\n    \"frame_step\": 1,\n    \"rate\": 1.0,\n    \"frame_zero_padding\": 0,\n    \"missing_frame_policy\": \"error\"\n}",
      ).unwrap(),
    ),
  )
}

///|
test "nested:integer-start_frame-5" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 9223372036854775807, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(
    @otiojson.equivalent(
      result.unwrap().to_json().unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": null,\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"\",\n    \"name_prefix\": \"\",\n    \"name_suffix\": \"\",\n    \"start_frame\": -1,\n    \"frame_step\": 1,\n    \"rate\": 1.0,\n    \"frame_zero_padding\": 0,\n    \"missing_frame_policy\": \"error\"\n}",
      ).unwrap(),
    ),
  )
}

///|
test "nested:integer-start_frame-6" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 9223372036854775808, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(
    @otiojson.equivalent(
      result.unwrap().to_json().unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": null,\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"\",\n    \"name_prefix\": \"\",\n    \"name_suffix\": \"\",\n    \"start_frame\": 0,\n    \"frame_step\": 1,\n    \"rate\": 1.0,\n    \"frame_zero_padding\": 0,\n    \"missing_frame_policy\": \"error\"\n}",
      ).unwrap(),
    ),
  )
}

///|
test "nested:integer-start_frame-7" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": -9223372036854775809, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:integer-start_frame-8" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 18446744073709551615, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(
    @otiojson.equivalent(
      result.unwrap().to_json().unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": null,\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"\",\n    \"name_prefix\": \"\",\n    \"name_suffix\": \"\",\n    \"start_frame\": -1,\n    \"frame_step\": 1,\n    \"rate\": 1.0,\n    \"frame_zero_padding\": 0,\n    \"missing_frame_policy\": \"error\"\n}",
      ).unwrap(),
    ),
  )
}

///|
test "nested:integer-start_frame-9" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 18446744073709551616, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:integer-start_frame-10" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": NaN, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:integer-start_frame-11" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": Infinity, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:integer-frame_step-0" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 1.0, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:integer-frame_step-1" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 1.5, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:integer-frame_step-2" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": -1, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(
    @otiojson.equivalent(
      result.unwrap().to_json().unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": null,\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"\",\n    \"name_prefix\": \"\",\n    \"name_suffix\": \"\",\n    \"start_frame\": 1,\n    \"frame_step\": -1,\n    \"rate\": 1.0,\n    \"frame_zero_padding\": 0,\n    \"missing_frame_policy\": \"error\"\n}",
      ).unwrap(),
    ),
  )
}

///|
test "nested:integer-frame_step-3" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 2147483648, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(
    @otiojson.equivalent(
      result.unwrap().to_json().unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": null,\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"\",\n    \"name_prefix\": \"\",\n    \"name_suffix\": \"\",\n    \"start_frame\": 1,\n    \"frame_step\": -2147483648,\n    \"rate\": 1.0,\n    \"frame_zero_padding\": 0,\n    \"missing_frame_policy\": \"error\"\n}",
      ).unwrap(),
    ),
  )
}

///|
test "nested:integer-frame_step-4" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 9007199254740993, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(
    @otiojson.equivalent(
      result.unwrap().to_json().unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": null,\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"\",\n    \"name_prefix\": \"\",\n    \"name_suffix\": \"\",\n    \"start_frame\": 1,\n    \"frame_step\": 1,\n    \"rate\": 1.0,\n    \"frame_zero_padding\": 0,\n    \"missing_frame_policy\": \"error\"\n}",
      ).unwrap(),
    ),
  )
}

///|
test "nested:integer-frame_step-5" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 9223372036854775807, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(
    @otiojson.equivalent(
      result.unwrap().to_json().unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": null,\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"\",\n    \"name_prefix\": \"\",\n    \"name_suffix\": \"\",\n    \"start_frame\": 1,\n    \"frame_step\": -1,\n    \"rate\": 1.0,\n    \"frame_zero_padding\": 0,\n    \"missing_frame_policy\": \"error\"\n}",
      ).unwrap(),
    ),
  )
}

///|
test "nested:integer-frame_step-6" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 9223372036854775808, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(
    @otiojson.equivalent(
      result.unwrap().to_json().unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": null,\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"\",\n    \"name_prefix\": \"\",\n    \"name_suffix\": \"\",\n    \"start_frame\": 1,\n    \"frame_step\": 0,\n    \"rate\": 1.0,\n    \"frame_zero_padding\": 0,\n    \"missing_frame_policy\": \"error\"\n}",
      ).unwrap(),
    ),
  )
}

///|
test "nested:integer-frame_step-7" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": -9223372036854775809, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:integer-frame_step-8" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 18446744073709551615, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(
    @otiojson.equivalent(
      result.unwrap().to_json().unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": null,\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"\",\n    \"name_prefix\": \"\",\n    \"name_suffix\": \"\",\n    \"start_frame\": 1,\n    \"frame_step\": -1,\n    \"rate\": 1.0,\n    \"frame_zero_padding\": 0,\n    \"missing_frame_policy\": \"error\"\n}",
      ).unwrap(),
    ),
  )
}

///|
test "nested:integer-frame_step-9" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 18446744073709551616, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:integer-frame_step-10" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": NaN, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:integer-frame_step-11" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": Infinity, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:integer-frame_zero_padding-0" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 1.0, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:integer-frame_zero_padding-1" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 1.5, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:integer-frame_zero_padding-2" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": -1, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(
    @otiojson.equivalent(
      result.unwrap().to_json().unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": null,\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"\",\n    \"name_prefix\": \"\",\n    \"name_suffix\": \"\",\n    \"start_frame\": 1,\n    \"frame_step\": 1,\n    \"rate\": 1.0,\n    \"frame_zero_padding\": -1,\n    \"missing_frame_policy\": \"error\"\n}",
      ).unwrap(),
    ),
  )
}

///|
test "nested:integer-frame_zero_padding-3" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 2147483648, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(
    @otiojson.equivalent(
      result.unwrap().to_json().unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": null,\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"\",\n    \"name_prefix\": \"\",\n    \"name_suffix\": \"\",\n    \"start_frame\": 1,\n    \"frame_step\": 1,\n    \"rate\": 1.0,\n    \"frame_zero_padding\": -2147483648,\n    \"missing_frame_policy\": \"error\"\n}",
      ).unwrap(),
    ),
  )
}

///|
test "nested:integer-frame_zero_padding-4" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 9007199254740993, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(
    @otiojson.equivalent(
      result.unwrap().to_json().unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": null,\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"\",\n    \"name_prefix\": \"\",\n    \"name_suffix\": \"\",\n    \"start_frame\": 1,\n    \"frame_step\": 1,\n    \"rate\": 1.0,\n    \"frame_zero_padding\": 1,\n    \"missing_frame_policy\": \"error\"\n}",
      ).unwrap(),
    ),
  )
}

///|
test "nested:integer-frame_zero_padding-5" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 9223372036854775807, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(
    @otiojson.equivalent(
      result.unwrap().to_json().unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": null,\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"\",\n    \"name_prefix\": \"\",\n    \"name_suffix\": \"\",\n    \"start_frame\": 1,\n    \"frame_step\": 1,\n    \"rate\": 1.0,\n    \"frame_zero_padding\": -1,\n    \"missing_frame_policy\": \"error\"\n}",
      ).unwrap(),
    ),
  )
}

///|
test "nested:integer-frame_zero_padding-6" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 9223372036854775808, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(
    @otiojson.equivalent(
      result.unwrap().to_json().unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": null,\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"\",\n    \"name_prefix\": \"\",\n    \"name_suffix\": \"\",\n    \"start_frame\": 1,\n    \"frame_step\": 1,\n    \"rate\": 1.0,\n    \"frame_zero_padding\": 0,\n    \"missing_frame_policy\": \"error\"\n}",
      ).unwrap(),
    ),
  )
}

///|
test "nested:integer-frame_zero_padding-7" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": -9223372036854775809, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:integer-frame_zero_padding-8" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 18446744073709551615, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(
    @otiojson.equivalent(
      result.unwrap().to_json().unwrap(),
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": null,\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"\",\n    \"name_prefix\": \"\",\n    \"name_suffix\": \"\",\n    \"start_frame\": 1,\n    \"frame_step\": 1,\n    \"rate\": 1.0,\n    \"frame_zero_padding\": -1,\n    \"missing_frame_policy\": \"error\"\n}",
      ).unwrap(),
    ),
  )
}

///|
test "nested:integer-frame_zero_padding-9" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 18446744073709551616, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:integer-frame_zero_padding-10" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": NaN, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(result is Err(_))
}

///|
test "nested:integer-frame_zero_padding-11" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": Infinity, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(result is Err(_))
}
