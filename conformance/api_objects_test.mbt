// Generated from official OTIO 0.18.1 by tools/generate_api_tests.py.

///|
test "objects:Adapter" {
  let obj = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"Adapter.1\",\n    \"filepath\": null,\n    \"name\": null,\n    \"suffixes\": []\n}",
  ).unwrap()
  assert_eq(obj.schema_name(), "Adapter")
  assert_eq(obj.schema_version(), 1)
  assert_eq(obj.is_unknown(), false)
  let copy = @schema.Object::from_json(obj.to_json().unwrap()).unwrap()
  assert_eq(obj.equivalent(copy), true)
  assert_true(
    @schema.read(@schema.write(obj).unwrap()).unwrap().equivalent(obj),
  )
  let changed = copy.with_name("修改 / 🎞️").unwrap()
  assert_true(
    changed.equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"Adapter.1\",\n    \"filepath\": null,\n    \"name\": \"修改 / 🎞️\",\n    \"suffixes\": []\n}",
      ).unwrap(),
    ),
  )
  assert_eq(obj.get("name"), Some(@otiojson.parse("null").unwrap()))
}

///|
test "objects:Clip" {
  let obj = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"Clip.2\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"media_references\": {\n        \"DEFAULT_MEDIA\": {\n            \"OTIO_SCHEMA\": \"MissingReference.1\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"available_range\": null,\n            \"available_image_bounds\": null\n        }\n    },\n    \"active_media_reference_key\": \"DEFAULT_MEDIA\"\n}",
  ).unwrap()
  assert_eq(obj.schema_name(), "Clip")
  assert_eq(obj.schema_version(), 2)
  assert_eq(obj.is_unknown(), false)
  let copy = @schema.Object::from_json(obj.to_json().unwrap()).unwrap()
  assert_eq(obj.equivalent(copy), true)
  assert_true(
    @schema.read(@schema.write(obj).unwrap()).unwrap().equivalent(obj),
  )
  let changed = copy.with_name("修改 / 🎞️").unwrap()
  assert_true(
    changed.equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"Clip.2\",\n    \"metadata\": {},\n    \"name\": \"修改 / 🎞️\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"media_references\": {\n        \"DEFAULT_MEDIA\": {\n            \"OTIO_SCHEMA\": \"MissingReference.1\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"available_range\": null,\n            \"available_image_bounds\": null\n        }\n    },\n    \"active_media_reference_key\": \"DEFAULT_MEDIA\"\n}",
      ).unwrap(),
    ),
  )
  assert_eq(obj.get("name"), Some(@otiojson.parse("\"\"").unwrap()))
  let changed = obj
    .with_metadata(
      @otiojson.parse(
        "{\"nested\":{\"values\":[1,\"注释\",true,null]},\"user\":\"original\"}",
      ).unwrap(),
    )
    .unwrap()
  assert_true(
    changed.equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"Clip.2\",\n    \"metadata\": {\n        \"nested\": {\n            \"values\": [\n                1,\n                \"注释\",\n                true,\n                null\n            ]\n        },\n        \"user\": \"original\"\n    },\n    \"name\": \"\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"media_references\": {\n        \"DEFAULT_MEDIA\": {\n            \"OTIO_SCHEMA\": \"MissingReference.1\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"available_range\": null,\n            \"available_image_bounds\": null\n        }\n    },\n    \"active_media_reference_key\": \"DEFAULT_MEDIA\"\n}",
      ).unwrap(),
    ),
  )
  assert_true(obj.metadata().unwrap() == @otiojson.parse("{}").unwrap())
  assert_eq(obj.visible(), true)
  assert_eq(obj.overlapping(), false)
}

///|
test "objects:Clip-available_range" {
  let obj = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"Clip.2\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"media_references\": {\n        \"DEFAULT_MEDIA\": {\n            \"OTIO_SCHEMA\": \"MissingReference.1\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"available_range\": null,\n            \"available_image_bounds\": null\n        }\n    },\n    \"active_media_reference_key\": \"DEFAULT_MEDIA\"\n}",
  ).unwrap()
  assert_true(@graph.available_range(obj) is Err(_))
}

///|
test "objects:Clip-trimmed_range" {
  let obj = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"Clip.2\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"media_references\": {\n        \"DEFAULT_MEDIA\": {\n            \"OTIO_SCHEMA\": \"MissingReference.1\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"available_range\": null,\n            \"available_image_bounds\": null\n        }\n    },\n    \"active_media_reference_key\": \"DEFAULT_MEDIA\"\n}",
  ).unwrap()
  assert_true(@graph.trimmed_range(obj) is Err(_))
}

///|
test "objects:Clip-duration" {
  let obj = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"Clip.2\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"media_references\": {\n        \"DEFAULT_MEDIA\": {\n            \"OTIO_SCHEMA\": \"MissingReference.1\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"available_range\": null,\n            \"available_image_bounds\": null\n        }\n    },\n    \"active_media_reference_key\": \"DEFAULT_MEDIA\"\n}",
  ).unwrap()
  assert_true(@graph.duration_time(obj) is Err(_))
}

///|
test "objects:Clip-available_image_bounds" {
  let obj = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"Clip.2\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"media_references\": {\n        \"DEFAULT_MEDIA\": {\n            \"OTIO_SCHEMA\": \"MissingReference.1\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"available_range\": null,\n            \"available_image_bounds\": null\n        }\n    },\n    \"active_media_reference_key\": \"DEFAULT_MEDIA\"\n}",
  ).unwrap()
  assert_true(@graph.available_image_bounds(obj) is Err(_))
}

///|
test "objects:Composable" {
  let obj = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"Composable.1\",\n    \"metadata\": {},\n    \"name\": \"\"\n}",
  ).unwrap()
  assert_eq(obj.schema_name(), "Composable")
  assert_eq(obj.schema_version(), 1)
  assert_eq(obj.is_unknown(), false)
  let copy = @schema.Object::from_json(obj.to_json().unwrap()).unwrap()
  assert_eq(obj.equivalent(copy), true)
  assert_true(
    @schema.read(@schema.write(obj).unwrap()).unwrap().equivalent(obj),
  )
  let changed = copy.with_name("修改 / 🎞️").unwrap()
  assert_true(
    changed.equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"Composable.1\",\n    \"metadata\": {},\n    \"name\": \"修改 / 🎞️\"\n}",
      ).unwrap(),
    ),
  )
  assert_eq(obj.get("name"), Some(@otiojson.parse("\"\"").unwrap()))
  let changed = obj
    .with_metadata(
      @otiojson.parse(
        "{\"nested\":{\"values\":[1,\"注释\",true,null]},\"user\":\"original\"}",
      ).unwrap(),
    )
    .unwrap()
  assert_true(
    changed.equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"Composable.1\",\n    \"metadata\": {\n        \"nested\": {\n            \"values\": [\n                1,\n                \"注释\",\n                true,\n                null\n            ]\n        },\n        \"user\": \"original\"\n    },\n    \"name\": \"\"\n}",
      ).unwrap(),
    ),
  )
  assert_true(obj.metadata().unwrap() == @otiojson.parse("{}").unwrap())
  assert_eq(obj.visible(), true)
  assert_eq(obj.overlapping(), false)
}

///|
test "objects:Composition" {
  let obj = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"Composition.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"children\": []\n}",
  ).unwrap()
  assert_eq(obj.schema_name(), "Composition")
  assert_eq(obj.schema_version(), 1)
  assert_eq(obj.is_unknown(), false)
  let copy = @schema.Object::from_json(obj.to_json().unwrap()).unwrap()
  assert_eq(obj.equivalent(copy), true)
  assert_true(
    @schema.read(@schema.write(obj).unwrap()).unwrap().equivalent(obj),
  )
  let changed = copy.with_name("修改 / 🎞️").unwrap()
  assert_true(
    changed.equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"Composition.1\",\n    \"metadata\": {},\n    \"name\": \"修改 / 🎞️\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"children\": []\n}",
      ).unwrap(),
    ),
  )
  assert_eq(obj.get("name"), Some(@otiojson.parse("\"\"").unwrap()))
  let changed = obj
    .with_metadata(
      @otiojson.parse(
        "{\"nested\":{\"values\":[1,\"注释\",true,null]},\"user\":\"original\"}",
      ).unwrap(),
    )
    .unwrap()
  assert_true(
    changed.equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"Composition.1\",\n    \"metadata\": {\n        \"nested\": {\n            \"values\": [\n                1,\n                \"注释\",\n                true,\n                null\n            ]\n        },\n        \"user\": \"original\"\n    },\n    \"name\": \"\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"children\": []\n}",
      ).unwrap(),
    ),
  )
  assert_true(obj.metadata().unwrap() == @otiojson.parse("{}").unwrap())
  assert_eq(obj.visible(), true)
  assert_eq(obj.overlapping(), false)
}

///|
test "objects:Composition-available_range" {
  let obj = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"Composition.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"children\": []\n}",
  ).unwrap()
  assert_true(@graph.available_range(obj) is Err(_))
}

///|
test "objects:Composition-trimmed_range" {
  let obj = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"Composition.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"children\": []\n}",
  ).unwrap()
  assert_true(@graph.trimmed_range(obj) is Err(_))
}

///|
test "objects:Composition-duration" {
  let obj = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"Composition.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"children\": []\n}",
  ).unwrap()
  assert_true(@graph.duration_time(obj) is Err(_))
}

///|
test "objects:Composition-available_image_bounds" {
  let obj = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"Composition.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"children\": []\n}",
  ).unwrap()
  assert_true(@graph.available_image_bounds(obj) is Err(_))
}

///|
test "objects:Effect" {
  let obj = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"Effect.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"effect_name\": \"\",\n    \"enabled\": true\n}",
  ).unwrap()
  assert_eq(obj.schema_name(), "Effect")
  assert_eq(obj.schema_version(), 1)
  assert_eq(obj.is_unknown(), false)
  let copy = @schema.Object::from_json(obj.to_json().unwrap()).unwrap()
  assert_eq(obj.equivalent(copy), true)
  assert_true(
    @schema.read(@schema.write(obj).unwrap()).unwrap().equivalent(obj),
  )
  let changed = copy.with_name("修改 / 🎞️").unwrap()
  assert_true(
    changed.equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"Effect.1\",\n    \"metadata\": {},\n    \"name\": \"修改 / 🎞️\",\n    \"effect_name\": \"\",\n    \"enabled\": true\n}",
      ).unwrap(),
    ),
  )
  assert_eq(obj.get("name"), Some(@otiojson.parse("\"\"").unwrap()))
  let changed = obj
    .with_metadata(
      @otiojson.parse(
        "{\"nested\":{\"values\":[1,\"注释\",true,null]},\"user\":\"original\"}",
      ).unwrap(),
    )
    .unwrap()
  assert_true(
    changed.equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"Effect.1\",\n    \"metadata\": {\n        \"nested\": {\n            \"values\": [\n                1,\n                \"注释\",\n                true,\n                null\n            ]\n        },\n        \"user\": \"original\"\n    },\n    \"name\": \"\",\n    \"effect_name\": \"\",\n    \"enabled\": true\n}",
      ).unwrap(),
    ),
  )
  assert_true(obj.metadata().unwrap() == @otiojson.parse("{}").unwrap())
}

///|
test "objects:ExternalReference" {
  let obj = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"ExternalReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": null,\n    \"available_image_bounds\": null,\n    \"target_url\": \"\"\n}",
  ).unwrap()
  assert_eq(obj.schema_name(), "ExternalReference")
  assert_eq(obj.schema_version(), 1)
  assert_eq(obj.is_unknown(), false)
  let copy = @schema.Object::from_json(obj.to_json().unwrap()).unwrap()
  assert_eq(obj.equivalent(copy), true)
  assert_true(
    @schema.read(@schema.write(obj).unwrap()).unwrap().equivalent(obj),
  )
  let changed = copy.with_name("修改 / 🎞️").unwrap()
  assert_true(
    changed.equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"ExternalReference.1\",\n    \"metadata\": {},\n    \"name\": \"修改 / 🎞️\",\n    \"available_range\": null,\n    \"available_image_bounds\": null,\n    \"target_url\": \"\"\n}",
      ).unwrap(),
    ),
  )
  assert_eq(obj.get("name"), Some(@otiojson.parse("\"\"").unwrap()))
  let changed = obj
    .with_metadata(
      @otiojson.parse(
        "{\"nested\":{\"values\":[1,\"注释\",true,null]},\"user\":\"original\"}",
      ).unwrap(),
    )
    .unwrap()
  assert_true(
    changed.equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"ExternalReference.1\",\n    \"metadata\": {\n        \"nested\": {\n            \"values\": [\n                1,\n                \"注释\",\n                true,\n                null\n            ]\n        },\n        \"user\": \"original\"\n    },\n    \"name\": \"\",\n    \"available_range\": null,\n    \"available_image_bounds\": null,\n    \"target_url\": \"\"\n}",
      ).unwrap(),
    ),
  )
  assert_true(obj.metadata().unwrap() == @otiojson.parse("{}").unwrap())
  assert_eq(obj.is_missing_reference(), false)
}

///|
test "objects:ExternalReference-available_image_bounds" {
  let obj = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"ExternalReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": null,\n    \"available_image_bounds\": null,\n    \"target_url\": \"\"\n}",
  ).unwrap()
  assert_true(@graph.available_image_bounds(obj).unwrap() is None)
}

///|
test "objects:FreezeFrame" {
  let obj = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"FreezeFrame.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"effect_name\": \"FreezeFrame\",\n    \"enabled\": true,\n    \"time_scalar\": 0.0\n}",
  ).unwrap()
  assert_eq(obj.schema_name(), "FreezeFrame")
  assert_eq(obj.schema_version(), 1)
  assert_eq(obj.is_unknown(), false)
  let copy = @schema.Object::from_json(obj.to_json().unwrap()).unwrap()
  assert_eq(obj.equivalent(copy), true)
  assert_true(
    @schema.read(@schema.write(obj).unwrap()).unwrap().equivalent(obj),
  )
  let changed = copy.with_name("修改 / 🎞️").unwrap()
  assert_true(
    changed.equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"FreezeFrame.1\",\n    \"metadata\": {},\n    \"name\": \"修改 / 🎞️\",\n    \"effect_name\": \"FreezeFrame\",\n    \"enabled\": true,\n    \"time_scalar\": 0.0\n}",
      ).unwrap(),
    ),
  )
  assert_eq(obj.get("name"), Some(@otiojson.parse("\"\"").unwrap()))
  let changed = obj
    .with_metadata(
      @otiojson.parse(
        "{\"nested\":{\"values\":[1,\"注释\",true,null]},\"user\":\"original\"}",
      ).unwrap(),
    )
    .unwrap()
  assert_true(
    changed.equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"FreezeFrame.1\",\n    \"metadata\": {\n        \"nested\": {\n            \"values\": [\n                1,\n                \"注释\",\n                true,\n                null\n            ]\n        },\n        \"user\": \"original\"\n    },\n    \"name\": \"\",\n    \"effect_name\": \"FreezeFrame\",\n    \"enabled\": true,\n    \"time_scalar\": 0.0\n}",
      ).unwrap(),
    ),
  )
  assert_true(obj.metadata().unwrap() == @otiojson.parse("{}").unwrap())
}

///|
test "objects:Gap" {
  let obj = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"Gap.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"source_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 1.0,\n            \"value\": 0.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 1.0,\n            \"value\": 0.0\n        }\n    },\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null\n}",
  ).unwrap()
  assert_eq(obj.schema_name(), "Gap")
  assert_eq(obj.schema_version(), 1)
  assert_eq(obj.is_unknown(), false)
  let copy = @schema.Object::from_json(obj.to_json().unwrap()).unwrap()
  assert_eq(obj.equivalent(copy), true)
  assert_true(
    @schema.read(@schema.write(obj).unwrap()).unwrap().equivalent(obj),
  )
  let changed = copy.with_name("修改 / 🎞️").unwrap()
  assert_true(
    changed.equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"Gap.1\",\n    \"metadata\": {},\n    \"name\": \"修改 / 🎞️\",\n    \"source_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 1.0,\n            \"value\": 0.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 1.0,\n            \"value\": 0.0\n        }\n    },\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null\n}",
      ).unwrap(),
    ),
  )
  assert_eq(obj.get("name"), Some(@otiojson.parse("\"\"").unwrap()))
  let changed = obj
    .with_metadata(
      @otiojson.parse(
        "{\"nested\":{\"values\":[1,\"注释\",true,null]},\"user\":\"original\"}",
      ).unwrap(),
    )
    .unwrap()
  assert_true(
    changed.equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"Gap.1\",\n    \"metadata\": {\n        \"nested\": {\n            \"values\": [\n                1,\n                \"注释\",\n                true,\n                null\n            ]\n        },\n        \"user\": \"original\"\n    },\n    \"name\": \"\",\n    \"source_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 1.0,\n            \"value\": 0.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 1.0,\n            \"value\": 0.0\n        }\n    },\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null\n}",
      ).unwrap(),
    ),
  )
  assert_true(obj.metadata().unwrap() == @otiojson.parse("{}").unwrap())
  assert_eq(obj.visible(), false)
  assert_eq(obj.overlapping(), false)
}

///|
test "objects:Gap-available_range" {
  let obj = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"Gap.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"source_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 1.0,\n            \"value\": 0.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 1.0,\n            \"value\": 0.0\n        }\n    },\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null\n}",
  ).unwrap()
  assert_true(@graph.available_range(obj) is Err(_))
}

///|
test "objects:Gap-trimmed_range" {
  let obj = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"Gap.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"source_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 1.0,\n            \"value\": 0.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 1.0,\n            \"value\": 0.0\n        }\n    },\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null\n}",
  ).unwrap()
  let result_range = @graph.trimmed_range(obj).unwrap()
  let actual_time = result_range.start()
  api_number(actual_time.value(), 0.0)
  api_number(actual_time.rate(), 1.0)
  let actual_time = result_range.duration()
  api_number(actual_time.value(), 0.0)
  api_number(actual_time.rate(), 1.0)
}

///|
test "objects:Gap-duration" {
  let obj = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"Gap.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"source_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 1.0,\n            \"value\": 0.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 1.0,\n            \"value\": 0.0\n        }\n    },\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null\n}",
  ).unwrap()
  let actual_time = @graph.duration_time(obj).unwrap()
  api_number(actual_time.value(), 0.0)
  api_number(actual_time.rate(), 1.0)
}

///|
test "objects:Gap-available_image_bounds" {
  let obj = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"Gap.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"source_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 1.0,\n            \"value\": 0.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 1.0,\n            \"value\": 0.0\n        }\n    },\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null\n}",
  ).unwrap()
  assert_true(@graph.available_image_bounds(obj) is Err(_))
}

///|
test "objects:GeneratorReference" {
  let obj = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"GeneratorReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": null,\n    \"available_image_bounds\": null,\n    \"generator_kind\": \"\",\n    \"parameters\": {}\n}",
  ).unwrap()
  assert_eq(obj.schema_name(), "GeneratorReference")
  assert_eq(obj.schema_version(), 1)
  assert_eq(obj.is_unknown(), false)
  let copy = @schema.Object::from_json(obj.to_json().unwrap()).unwrap()
  assert_eq(obj.equivalent(copy), true)
  assert_true(
    @schema.read(@schema.write(obj).unwrap()).unwrap().equivalent(obj),
  )
  let changed = copy.with_name("修改 / 🎞️").unwrap()
  assert_true(
    changed.equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"GeneratorReference.1\",\n    \"metadata\": {},\n    \"name\": \"修改 / 🎞️\",\n    \"available_range\": null,\n    \"available_image_bounds\": null,\n    \"generator_kind\": \"\",\n    \"parameters\": {}\n}",
      ).unwrap(),
    ),
  )
  assert_eq(obj.get("name"), Some(@otiojson.parse("\"\"").unwrap()))
  let changed = obj
    .with_metadata(
      @otiojson.parse(
        "{\"nested\":{\"values\":[1,\"注释\",true,null]},\"user\":\"original\"}",
      ).unwrap(),
    )
    .unwrap()
  assert_true(
    changed.equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"GeneratorReference.1\",\n    \"metadata\": {\n        \"nested\": {\n            \"values\": [\n                1,\n                \"注释\",\n                true,\n                null\n            ]\n        },\n        \"user\": \"original\"\n    },\n    \"name\": \"\",\n    \"available_range\": null,\n    \"available_image_bounds\": null,\n    \"generator_kind\": \"\",\n    \"parameters\": {}\n}",
      ).unwrap(),
    ),
  )
  assert_true(obj.metadata().unwrap() == @otiojson.parse("{}").unwrap())
  assert_eq(obj.is_missing_reference(), false)
}

///|
test "objects:GeneratorReference-available_image_bounds" {
  let obj = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"GeneratorReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": null,\n    \"available_image_bounds\": null,\n    \"generator_kind\": \"\",\n    \"parameters\": {}\n}",
  ).unwrap()
  assert_true(@graph.available_image_bounds(obj).unwrap() is None)
}

///|
test "objects:HookScript" {
  let obj = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"HookScript.1\",\n    \"filepath\": null,\n    \"name\": null\n}",
  ).unwrap()
  assert_eq(obj.schema_name(), "HookScript")
  assert_eq(obj.schema_version(), 1)
  assert_eq(obj.is_unknown(), false)
  let copy = @schema.Object::from_json(obj.to_json().unwrap()).unwrap()
  assert_eq(obj.equivalent(copy), true)
  assert_true(
    @schema.read(@schema.write(obj).unwrap()).unwrap().equivalent(obj),
  )
  let changed = copy.with_name("修改 / 🎞️").unwrap()
  assert_true(
    changed.equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"HookScript.1\",\n    \"filepath\": null,\n    \"name\": \"修改 / 🎞️\"\n}",
      ).unwrap(),
    ),
  )
  assert_eq(obj.get("name"), Some(@otiojson.parse("null").unwrap()))
}

///|
test "objects:ImageSequenceReference" {
  let obj = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": null,\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"\",\n    \"name_prefix\": \"\",\n    \"name_suffix\": \"\",\n    \"start_frame\": 1,\n    \"frame_step\": 1,\n    \"rate\": 1.0,\n    \"frame_zero_padding\": 0,\n    \"missing_frame_policy\": \"error\"\n}",
  ).unwrap()
  assert_eq(obj.schema_name(), "ImageSequenceReference")
  assert_eq(obj.schema_version(), 1)
  assert_eq(obj.is_unknown(), false)
  let copy = @schema.Object::from_json(obj.to_json().unwrap()).unwrap()
  assert_eq(obj.equivalent(copy), true)
  assert_true(
    @schema.read(@schema.write(obj).unwrap()).unwrap().equivalent(obj),
  )
  let changed = copy.with_name("修改 / 🎞️").unwrap()
  assert_true(
    changed.equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"修改 / 🎞️\",\n    \"available_range\": null,\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"\",\n    \"name_prefix\": \"\",\n    \"name_suffix\": \"\",\n    \"start_frame\": 1,\n    \"frame_step\": 1,\n    \"rate\": 1.0,\n    \"frame_zero_padding\": 0,\n    \"missing_frame_policy\": \"error\"\n}",
      ).unwrap(),
    ),
  )
  assert_eq(obj.get("name"), Some(@otiojson.parse("\"\"").unwrap()))
  let changed = obj
    .with_metadata(
      @otiojson.parse(
        "{\"nested\":{\"values\":[1,\"注释\",true,null]},\"user\":\"original\"}",
      ).unwrap(),
    )
    .unwrap()
  assert_true(
    changed.equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {\n        \"nested\": {\n            \"values\": [\n                1,\n                \"注释\",\n                true,\n                null\n            ]\n        },\n        \"user\": \"original\"\n    },\n    \"name\": \"\",\n    \"available_range\": null,\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"\",\n    \"name_prefix\": \"\",\n    \"name_suffix\": \"\",\n    \"start_frame\": 1,\n    \"frame_step\": 1,\n    \"rate\": 1.0,\n    \"frame_zero_padding\": 0,\n    \"missing_frame_policy\": \"error\"\n}",
      ).unwrap(),
    ),
  )
  assert_true(obj.metadata().unwrap() == @otiojson.parse("{}").unwrap())
  assert_eq(obj.is_missing_reference(), false)
}

///|
test "objects:ImageSequenceReference-available_image_bounds" {
  let obj = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": null,\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"\",\n    \"name_prefix\": \"\",\n    \"name_suffix\": \"\",\n    \"start_frame\": 1,\n    \"frame_step\": 1,\n    \"rate\": 1.0,\n    \"frame_zero_padding\": 0,\n    \"missing_frame_policy\": \"error\"\n}",
  ).unwrap()
  assert_true(@graph.available_image_bounds(obj).unwrap() is None)
}

///|
test "objects:Item" {
  let obj = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"Item.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null\n}",
  ).unwrap()
  assert_eq(obj.schema_name(), "Item")
  assert_eq(obj.schema_version(), 1)
  assert_eq(obj.is_unknown(), false)
  let copy = @schema.Object::from_json(obj.to_json().unwrap()).unwrap()
  assert_eq(obj.equivalent(copy), true)
  assert_true(
    @schema.read(@schema.write(obj).unwrap()).unwrap().equivalent(obj),
  )
  let changed = copy.with_name("修改 / 🎞️").unwrap()
  assert_true(
    changed.equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"Item.1\",\n    \"metadata\": {},\n    \"name\": \"修改 / 🎞️\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null\n}",
      ).unwrap(),
    ),
  )
  assert_eq(obj.get("name"), Some(@otiojson.parse("\"\"").unwrap()))
  let changed = obj
    .with_metadata(
      @otiojson.parse(
        "{\"nested\":{\"values\":[1,\"注释\",true,null]},\"user\":\"original\"}",
      ).unwrap(),
    )
    .unwrap()
  assert_true(
    changed.equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"Item.1\",\n    \"metadata\": {\n        \"nested\": {\n            \"values\": [\n                1,\n                \"注释\",\n                true,\n                null\n            ]\n        },\n        \"user\": \"original\"\n    },\n    \"name\": \"\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null\n}",
      ).unwrap(),
    ),
  )
  assert_true(obj.metadata().unwrap() == @otiojson.parse("{}").unwrap())
  assert_eq(obj.visible(), true)
  assert_eq(obj.overlapping(), false)
}

///|
test "objects:Item-available_range" {
  let obj = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"Item.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null\n}",
  ).unwrap()
  assert_true(@graph.available_range(obj) is Err(_))
}

///|
test "objects:Item-trimmed_range" {
  let obj = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"Item.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null\n}",
  ).unwrap()
  assert_true(@graph.trimmed_range(obj) is Err(_))
}

///|
test "objects:Item-duration" {
  let obj = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"Item.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null\n}",
  ).unwrap()
  assert_true(@graph.duration_time(obj) is Err(_))
}

///|
test "objects:Item-available_image_bounds" {
  let obj = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"Item.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null\n}",
  ).unwrap()
  assert_true(@graph.available_image_bounds(obj) is Err(_))
}

///|
test "objects:LinearTimeWarp" {
  let obj = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"LinearTimeWarp.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"effect_name\": \"LinearTimeWarp\",\n    \"enabled\": true,\n    \"time_scalar\": 1.0\n}",
  ).unwrap()
  assert_eq(obj.schema_name(), "LinearTimeWarp")
  assert_eq(obj.schema_version(), 1)
  assert_eq(obj.is_unknown(), false)
  let copy = @schema.Object::from_json(obj.to_json().unwrap()).unwrap()
  assert_eq(obj.equivalent(copy), true)
  assert_true(
    @schema.read(@schema.write(obj).unwrap()).unwrap().equivalent(obj),
  )
  let changed = copy.with_name("修改 / 🎞️").unwrap()
  assert_true(
    changed.equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"LinearTimeWarp.1\",\n    \"metadata\": {},\n    \"name\": \"修改 / 🎞️\",\n    \"effect_name\": \"LinearTimeWarp\",\n    \"enabled\": true,\n    \"time_scalar\": 1.0\n}",
      ).unwrap(),
    ),
  )
  assert_eq(obj.get("name"), Some(@otiojson.parse("\"\"").unwrap()))
  let changed = obj
    .with_metadata(
      @otiojson.parse(
        "{\"nested\":{\"values\":[1,\"注释\",true,null]},\"user\":\"original\"}",
      ).unwrap(),
    )
    .unwrap()
  assert_true(
    changed.equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"LinearTimeWarp.1\",\n    \"metadata\": {\n        \"nested\": {\n            \"values\": [\n                1,\n                \"注释\",\n                true,\n                null\n            ]\n        },\n        \"user\": \"original\"\n    },\n    \"name\": \"\",\n    \"effect_name\": \"LinearTimeWarp\",\n    \"enabled\": true,\n    \"time_scalar\": 1.0\n}",
      ).unwrap(),
    ),
  )
  assert_true(obj.metadata().unwrap() == @otiojson.parse("{}").unwrap())
}

///|
test "objects:Marker" {
  let obj = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"Marker.2\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"color\": \"RED\",\n    \"marked_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 1.0,\n            \"value\": 0.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 1.0,\n            \"value\": 0.0\n        }\n    },\n    \"comment\": \"\"\n}",
  ).unwrap()
  assert_eq(obj.schema_name(), "Marker")
  assert_eq(obj.schema_version(), 2)
  assert_eq(obj.is_unknown(), false)
  let copy = @schema.Object::from_json(obj.to_json().unwrap()).unwrap()
  assert_eq(obj.equivalent(copy), true)
  assert_true(
    @schema.read(@schema.write(obj).unwrap()).unwrap().equivalent(obj),
  )
  let changed = copy.with_name("修改 / 🎞️").unwrap()
  assert_true(
    changed.equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"Marker.2\",\n    \"metadata\": {},\n    \"name\": \"修改 / 🎞️\",\n    \"color\": \"RED\",\n    \"marked_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 1.0,\n            \"value\": 0.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 1.0,\n            \"value\": 0.0\n        }\n    },\n    \"comment\": \"\"\n}",
      ).unwrap(),
    ),
  )
  assert_eq(obj.get("name"), Some(@otiojson.parse("\"\"").unwrap()))
  let changed = obj
    .with_metadata(
      @otiojson.parse(
        "{\"nested\":{\"values\":[1,\"注释\",true,null]},\"user\":\"original\"}",
      ).unwrap(),
    )
    .unwrap()
  assert_true(
    changed.equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"Marker.2\",\n    \"metadata\": {\n        \"nested\": {\n            \"values\": [\n                1,\n                \"注释\",\n                true,\n                null\n            ]\n        },\n        \"user\": \"original\"\n    },\n    \"name\": \"\",\n    \"color\": \"RED\",\n    \"marked_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 1.0,\n            \"value\": 0.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 1.0,\n            \"value\": 0.0\n        }\n    },\n    \"comment\": \"\"\n}",
      ).unwrap(),
    ),
  )
  assert_true(obj.metadata().unwrap() == @otiojson.parse("{}").unwrap())
}

///|
test "objects:MediaLinker" {
  let obj = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"MediaLinker.1\",\n    \"filepath\": null,\n    \"name\": null\n}",
  ).unwrap()
  assert_eq(obj.schema_name(), "MediaLinker")
  assert_eq(obj.schema_version(), 1)
  assert_eq(obj.is_unknown(), false)
  let copy = @schema.Object::from_json(obj.to_json().unwrap()).unwrap()
  assert_eq(obj.equivalent(copy), true)
  assert_true(
    @schema.read(@schema.write(obj).unwrap()).unwrap().equivalent(obj),
  )
  let changed = copy.with_name("修改 / 🎞️").unwrap()
  assert_true(
    changed.equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"MediaLinker.1\",\n    \"filepath\": null,\n    \"name\": \"修改 / 🎞️\"\n}",
      ).unwrap(),
    ),
  )
  assert_eq(obj.get("name"), Some(@otiojson.parse("null").unwrap()))
}

///|
test "objects:MediaReference" {
  let obj = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"MediaReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": null,\n    \"available_image_bounds\": null\n}",
  ).unwrap()
  assert_eq(obj.schema_name(), "MediaReference")
  assert_eq(obj.schema_version(), 1)
  assert_eq(obj.is_unknown(), false)
  let copy = @schema.Object::from_json(obj.to_json().unwrap()).unwrap()
  assert_eq(obj.equivalent(copy), true)
  assert_true(
    @schema.read(@schema.write(obj).unwrap()).unwrap().equivalent(obj),
  )
  let changed = copy.with_name("修改 / 🎞️").unwrap()
  assert_true(
    changed.equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"MediaReference.1\",\n    \"metadata\": {},\n    \"name\": \"修改 / 🎞️\",\n    \"available_range\": null,\n    \"available_image_bounds\": null\n}",
      ).unwrap(),
    ),
  )
  assert_eq(obj.get("name"), Some(@otiojson.parse("\"\"").unwrap()))
  let changed = obj
    .with_metadata(
      @otiojson.parse(
        "{\"nested\":{\"values\":[1,\"注释\",true,null]},\"user\":\"original\"}",
      ).unwrap(),
    )
    .unwrap()
  assert_true(
    changed.equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"MediaReference.1\",\n    \"metadata\": {\n        \"nested\": {\n            \"values\": [\n                1,\n                \"注释\",\n                true,\n                null\n            ]\n        },\n        \"user\": \"original\"\n    },\n    \"name\": \"\",\n    \"available_range\": null,\n    \"available_image_bounds\": null\n}",
      ).unwrap(),
    ),
  )
  assert_true(obj.metadata().unwrap() == @otiojson.parse("{}").unwrap())
  assert_eq(obj.is_missing_reference(), false)
}

///|
test "objects:MediaReference-available_image_bounds" {
  let obj = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"MediaReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": null,\n    \"available_image_bounds\": null\n}",
  ).unwrap()
  assert_true(@graph.available_image_bounds(obj).unwrap() is None)
}

///|
test "objects:MissingReference" {
  let obj = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"MissingReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": null,\n    \"available_image_bounds\": null\n}",
  ).unwrap()
  assert_eq(obj.schema_name(), "MissingReference")
  assert_eq(obj.schema_version(), 1)
  assert_eq(obj.is_unknown(), false)
  let copy = @schema.Object::from_json(obj.to_json().unwrap()).unwrap()
  assert_eq(obj.equivalent(copy), true)
  assert_true(
    @schema.read(@schema.write(obj).unwrap()).unwrap().equivalent(obj),
  )
  let changed = copy.with_name("修改 / 🎞️").unwrap()
  assert_true(
    changed.equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"MissingReference.1\",\n    \"metadata\": {},\n    \"name\": \"修改 / 🎞️\",\n    \"available_range\": null,\n    \"available_image_bounds\": null\n}",
      ).unwrap(),
    ),
  )
  assert_eq(obj.get("name"), Some(@otiojson.parse("\"\"").unwrap()))
  let changed = obj
    .with_metadata(
      @otiojson.parse(
        "{\"nested\":{\"values\":[1,\"注释\",true,null]},\"user\":\"original\"}",
      ).unwrap(),
    )
    .unwrap()
  assert_true(
    changed.equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"MissingReference.1\",\n    \"metadata\": {\n        \"nested\": {\n            \"values\": [\n                1,\n                \"注释\",\n                true,\n                null\n            ]\n        },\n        \"user\": \"original\"\n    },\n    \"name\": \"\",\n    \"available_range\": null,\n    \"available_image_bounds\": null\n}",
      ).unwrap(),
    ),
  )
  assert_true(obj.metadata().unwrap() == @otiojson.parse("{}").unwrap())
  assert_eq(obj.is_missing_reference(), true)
}

///|
test "objects:MissingReference-available_image_bounds" {
  let obj = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"MissingReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": null,\n    \"available_image_bounds\": null\n}",
  ).unwrap()
  assert_true(@graph.available_image_bounds(obj).unwrap() is None)
}

///|
test "objects:SchemaDef" {
  let obj = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"SchemaDef.1\",\n    \"filepath\": null,\n    \"name\": null\n}",
  ).unwrap()
  assert_eq(obj.schema_name(), "SchemaDef")
  assert_eq(obj.schema_version(), 1)
  assert_eq(obj.is_unknown(), false)
  let copy = @schema.Object::from_json(obj.to_json().unwrap()).unwrap()
  assert_eq(obj.equivalent(copy), true)
  assert_true(
    @schema.read(@schema.write(obj).unwrap()).unwrap().equivalent(obj),
  )
  let changed = copy.with_name("修改 / 🎞️").unwrap()
  assert_true(
    changed.equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"SchemaDef.1\",\n    \"filepath\": null,\n    \"name\": \"修改 / 🎞️\"\n}",
      ).unwrap(),
    ),
  )
  assert_eq(obj.get("name"), Some(@otiojson.parse("null").unwrap()))
}

///|
test "objects:SerializableCollection" {
  let obj = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"SerializableCollection.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"children\": []\n}",
  ).unwrap()
  assert_eq(obj.schema_name(), "SerializableCollection")
  assert_eq(obj.schema_version(), 1)
  assert_eq(obj.is_unknown(), false)
  let copy = @schema.Object::from_json(obj.to_json().unwrap()).unwrap()
  assert_eq(obj.equivalent(copy), true)
  assert_true(
    @schema.read(@schema.write(obj).unwrap()).unwrap().equivalent(obj),
  )
  let changed = copy.with_name("修改 / 🎞️").unwrap()
  assert_true(
    changed.equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"SerializableCollection.1\",\n    \"metadata\": {},\n    \"name\": \"修改 / 🎞️\",\n    \"children\": []\n}",
      ).unwrap(),
    ),
  )
  assert_eq(obj.get("name"), Some(@otiojson.parse("\"\"").unwrap()))
  let changed = obj
    .with_metadata(
      @otiojson.parse(
        "{\"nested\":{\"values\":[1,\"注释\",true,null]},\"user\":\"original\"}",
      ).unwrap(),
    )
    .unwrap()
  assert_true(
    changed.equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"SerializableCollection.1\",\n    \"metadata\": {\n        \"nested\": {\n            \"values\": [\n                1,\n                \"注释\",\n                true,\n                null\n            ]\n        },\n        \"user\": \"original\"\n    },\n    \"name\": \"\",\n    \"children\": []\n}",
      ).unwrap(),
    ),
  )
  assert_true(obj.metadata().unwrap() == @otiojson.parse("{}").unwrap())
}

///|
test "objects:SerializableObject" {
  let obj = @schema.read("{\n    \"OTIO_SCHEMA\": \"SerializableObject.1\"\n}").unwrap()
  assert_eq(obj.schema_name(), "SerializableObject")
  assert_eq(obj.schema_version(), 1)
  assert_eq(obj.is_unknown(), false)
  let copy = @schema.Object::from_json(obj.to_json().unwrap()).unwrap()
  assert_eq(obj.equivalent(copy), true)
  assert_true(
    @schema.read(@schema.write(obj).unwrap()).unwrap().equivalent(obj),
  )
}

///|
test "objects:SerializableObjectWithMetadata" {
  let obj = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"SerializableObjectWithMetadata.1\",\n    \"metadata\": {},\n    \"name\": \"\"\n}",
  ).unwrap()
  assert_eq(obj.schema_name(), "SerializableObjectWithMetadata")
  assert_eq(obj.schema_version(), 1)
  assert_eq(obj.is_unknown(), false)
  let copy = @schema.Object::from_json(obj.to_json().unwrap()).unwrap()
  assert_eq(obj.equivalent(copy), true)
  assert_true(
    @schema.read(@schema.write(obj).unwrap()).unwrap().equivalent(obj),
  )
  let changed = copy.with_name("修改 / 🎞️").unwrap()
  assert_true(
    changed.equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"SerializableObjectWithMetadata.1\",\n    \"metadata\": {},\n    \"name\": \"修改 / 🎞️\"\n}",
      ).unwrap(),
    ),
  )
  assert_eq(obj.get("name"), Some(@otiojson.parse("\"\"").unwrap()))
  let changed = obj
    .with_metadata(
      @otiojson.parse(
        "{\"nested\":{\"values\":[1,\"注释\",true,null]},\"user\":\"original\"}",
      ).unwrap(),
    )
    .unwrap()
  assert_true(
    changed.equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"SerializableObjectWithMetadata.1\",\n    \"metadata\": {\n        \"nested\": {\n            \"values\": [\n                1,\n                \"注释\",\n                true,\n                null\n            ]\n        },\n        \"user\": \"original\"\n    },\n    \"name\": \"\"\n}",
      ).unwrap(),
    ),
  )
  assert_true(obj.metadata().unwrap() == @otiojson.parse("{}").unwrap())
}

///|
test "objects:Stack" {
  let obj = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"Stack.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"children\": []\n}",
  ).unwrap()
  assert_eq(obj.schema_name(), "Stack")
  assert_eq(obj.schema_version(), 1)
  assert_eq(obj.is_unknown(), false)
  let copy = @schema.Object::from_json(obj.to_json().unwrap()).unwrap()
  assert_eq(obj.equivalent(copy), true)
  assert_true(
    @schema.read(@schema.write(obj).unwrap()).unwrap().equivalent(obj),
  )
  let changed = copy.with_name("修改 / 🎞️").unwrap()
  assert_true(
    changed.equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"Stack.1\",\n    \"metadata\": {},\n    \"name\": \"修改 / 🎞️\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"children\": []\n}",
      ).unwrap(),
    ),
  )
  assert_eq(obj.get("name"), Some(@otiojson.parse("\"\"").unwrap()))
  let changed = obj
    .with_metadata(
      @otiojson.parse(
        "{\"nested\":{\"values\":[1,\"注释\",true,null]},\"user\":\"original\"}",
      ).unwrap(),
    )
    .unwrap()
  assert_true(
    changed.equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"Stack.1\",\n    \"metadata\": {\n        \"nested\": {\n            \"values\": [\n                1,\n                \"注释\",\n                true,\n                null\n            ]\n        },\n        \"user\": \"original\"\n    },\n    \"name\": \"\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"children\": []\n}",
      ).unwrap(),
    ),
  )
  assert_true(obj.metadata().unwrap() == @otiojson.parse("{}").unwrap())
  assert_eq(obj.visible(), true)
  assert_eq(obj.overlapping(), false)
}

///|
test "objects:Stack-available_range" {
  let obj = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"Stack.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"children\": []\n}",
  ).unwrap()
  let result_range = @graph.available_range(obj).unwrap()
  let actual_time = result_range.start()
  api_number(actual_time.value(), 0.0)
  api_number(actual_time.rate(), 1.0)
  let actual_time = result_range.duration()
  api_number(actual_time.value(), 0.0)
  api_number(actual_time.rate(), 1.0)
}

///|
test "objects:Stack-trimmed_range" {
  let obj = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"Stack.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"children\": []\n}",
  ).unwrap()
  let result_range = @graph.trimmed_range(obj).unwrap()
  let actual_time = result_range.start()
  api_number(actual_time.value(), 0.0)
  api_number(actual_time.rate(), 1.0)
  let actual_time = result_range.duration()
  api_number(actual_time.value(), 0.0)
  api_number(actual_time.rate(), 1.0)
}

///|
test "objects:Stack-duration" {
  let obj = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"Stack.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"children\": []\n}",
  ).unwrap()
  let actual_time = @graph.duration_time(obj).unwrap()
  api_number(actual_time.value(), 0.0)
  api_number(actual_time.rate(), 1.0)
}

///|
test "objects:Stack-available_image_bounds" {
  let obj = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"Stack.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"children\": []\n}",
  ).unwrap()
  assert_true(@graph.available_image_bounds(obj).unwrap() is None)
}

///|
test "objects:TimeEffect" {
  let obj = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"TimeEffect.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"effect_name\": \"\",\n    \"enabled\": true\n}",
  ).unwrap()
  assert_eq(obj.schema_name(), "TimeEffect")
  assert_eq(obj.schema_version(), 1)
  assert_eq(obj.is_unknown(), false)
  let copy = @schema.Object::from_json(obj.to_json().unwrap()).unwrap()
  assert_eq(obj.equivalent(copy), true)
  assert_true(
    @schema.read(@schema.write(obj).unwrap()).unwrap().equivalent(obj),
  )
  let changed = copy.with_name("修改 / 🎞️").unwrap()
  assert_true(
    changed.equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"TimeEffect.1\",\n    \"metadata\": {},\n    \"name\": \"修改 / 🎞️\",\n    \"effect_name\": \"\",\n    \"enabled\": true\n}",
      ).unwrap(),
    ),
  )
  assert_eq(obj.get("name"), Some(@otiojson.parse("\"\"").unwrap()))
  let changed = obj
    .with_metadata(
      @otiojson.parse(
        "{\"nested\":{\"values\":[1,\"注释\",true,null]},\"user\":\"original\"}",
      ).unwrap(),
    )
    .unwrap()
  assert_true(
    changed.equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"TimeEffect.1\",\n    \"metadata\": {\n        \"nested\": {\n            \"values\": [\n                1,\n                \"注释\",\n                true,\n                null\n            ]\n        },\n        \"user\": \"original\"\n    },\n    \"name\": \"\",\n    \"effect_name\": \"\",\n    \"enabled\": true\n}",
      ).unwrap(),
    ),
  )
  assert_true(obj.metadata().unwrap() == @otiojson.parse("{}").unwrap())
}

///|
test "objects:Timeline" {
  let obj = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"Timeline.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"global_start_time\": null,\n    \"tracks\": {\n        \"OTIO_SCHEMA\": \"Stack.1\",\n        \"metadata\": {},\n        \"name\": \"tracks\",\n        \"source_range\": null,\n        \"effects\": [],\n        \"markers\": [],\n        \"enabled\": true,\n        \"color\": null,\n        \"children\": []\n    }\n}",
  ).unwrap()
  assert_eq(obj.schema_name(), "Timeline")
  assert_eq(obj.schema_version(), 1)
  assert_eq(obj.is_unknown(), false)
  let copy = @schema.Object::from_json(obj.to_json().unwrap()).unwrap()
  assert_eq(obj.equivalent(copy), true)
  assert_true(
    @schema.read(@schema.write(obj).unwrap()).unwrap().equivalent(obj),
  )
  let changed = copy.with_name("修改 / 🎞️").unwrap()
  assert_true(
    changed.equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"Timeline.1\",\n    \"metadata\": {},\n    \"name\": \"修改 / 🎞️\",\n    \"global_start_time\": null,\n    \"tracks\": {\n        \"OTIO_SCHEMA\": \"Stack.1\",\n        \"metadata\": {},\n        \"name\": \"tracks\",\n        \"source_range\": null,\n        \"effects\": [],\n        \"markers\": [],\n        \"enabled\": true,\n        \"color\": null,\n        \"children\": []\n    }\n}",
      ).unwrap(),
    ),
  )
  assert_eq(obj.get("name"), Some(@otiojson.parse("\"\"").unwrap()))
  let changed = obj
    .with_metadata(
      @otiojson.parse(
        "{\"nested\":{\"values\":[1,\"注释\",true,null]},\"user\":\"original\"}",
      ).unwrap(),
    )
    .unwrap()
  assert_true(
    changed.equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"Timeline.1\",\n    \"metadata\": {\n        \"nested\": {\n            \"values\": [\n                1,\n                \"注释\",\n                true,\n                null\n            ]\n        },\n        \"user\": \"original\"\n    },\n    \"name\": \"\",\n    \"global_start_time\": null,\n    \"tracks\": {\n        \"OTIO_SCHEMA\": \"Stack.1\",\n        \"metadata\": {},\n        \"name\": \"tracks\",\n        \"source_range\": null,\n        \"effects\": [],\n        \"markers\": [],\n        \"enabled\": true,\n        \"color\": null,\n        \"children\": []\n    }\n}",
      ).unwrap(),
    ),
  )
  assert_true(obj.metadata().unwrap() == @otiojson.parse("{}").unwrap())
}

///|
test "objects:Timeline-duration" {
  let obj = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"Timeline.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"global_start_time\": null,\n    \"tracks\": {\n        \"OTIO_SCHEMA\": \"Stack.1\",\n        \"metadata\": {},\n        \"name\": \"tracks\",\n        \"source_range\": null,\n        \"effects\": [],\n        \"markers\": [],\n        \"enabled\": true,\n        \"color\": null,\n        \"children\": []\n    }\n}",
  ).unwrap()
  let actual_time = @graph.duration_time(obj).unwrap()
  api_number(actual_time.value(), 0.0)
  api_number(actual_time.rate(), 1.0)
}

///|
test "objects:Track" {
  let obj = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"Track.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"children\": [],\n    \"kind\": \"Video\"\n}",
  ).unwrap()
  assert_eq(obj.schema_name(), "Track")
  assert_eq(obj.schema_version(), 1)
  assert_eq(obj.is_unknown(), false)
  let copy = @schema.Object::from_json(obj.to_json().unwrap()).unwrap()
  assert_eq(obj.equivalent(copy), true)
  assert_true(
    @schema.read(@schema.write(obj).unwrap()).unwrap().equivalent(obj),
  )
  let changed = copy.with_name("修改 / 🎞️").unwrap()
  assert_true(
    changed.equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"Track.1\",\n    \"metadata\": {},\n    \"name\": \"修改 / 🎞️\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"children\": [],\n    \"kind\": \"Video\"\n}",
      ).unwrap(),
    ),
  )
  assert_eq(obj.get("name"), Some(@otiojson.parse("\"\"").unwrap()))
  let changed = obj
    .with_metadata(
      @otiojson.parse(
        "{\"nested\":{\"values\":[1,\"注释\",true,null]},\"user\":\"original\"}",
      ).unwrap(),
    )
    .unwrap()
  assert_true(
    changed.equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"Track.1\",\n    \"metadata\": {\n        \"nested\": {\n            \"values\": [\n                1,\n                \"注释\",\n                true,\n                null\n            ]\n        },\n        \"user\": \"original\"\n    },\n    \"name\": \"\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"children\": [],\n    \"kind\": \"Video\"\n}",
      ).unwrap(),
    ),
  )
  assert_true(obj.metadata().unwrap() == @otiojson.parse("{}").unwrap())
  assert_eq(obj.visible(), true)
  assert_eq(obj.overlapping(), false)
}

///|
test "objects:Track-available_range" {
  let obj = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"Track.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"children\": [],\n    \"kind\": \"Video\"\n}",
  ).unwrap()
  let result_range = @graph.available_range(obj).unwrap()
  let actual_time = result_range.start()
  api_number(actual_time.value(), 0.0)
  api_number(actual_time.rate(), 1.0)
  let actual_time = result_range.duration()
  api_number(actual_time.value(), 0.0)
  api_number(actual_time.rate(), 1.0)
}

///|
test "objects:Track-trimmed_range" {
  let obj = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"Track.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"children\": [],\n    \"kind\": \"Video\"\n}",
  ).unwrap()
  let result_range = @graph.trimmed_range(obj).unwrap()
  let actual_time = result_range.start()
  api_number(actual_time.value(), 0.0)
  api_number(actual_time.rate(), 1.0)
  let actual_time = result_range.duration()
  api_number(actual_time.value(), 0.0)
  api_number(actual_time.rate(), 1.0)
}

///|
test "objects:Track-duration" {
  let obj = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"Track.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"children\": [],\n    \"kind\": \"Video\"\n}",
  ).unwrap()
  let actual_time = @graph.duration_time(obj).unwrap()
  api_number(actual_time.value(), 0.0)
  api_number(actual_time.rate(), 1.0)
}

///|
test "objects:Track-available_image_bounds" {
  let obj = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"Track.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"children\": [],\n    \"kind\": \"Video\"\n}",
  ).unwrap()
  assert_true(@graph.available_image_bounds(obj).unwrap() is None)
}

///|
test "objects:Transition" {
  let obj = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"Transition.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"in_offset\": {\n        \"OTIO_SCHEMA\": \"RationalTime.1\",\n        \"rate\": 1.0,\n        \"value\": 0.0\n    },\n    \"out_offset\": {\n        \"OTIO_SCHEMA\": \"RationalTime.1\",\n        \"rate\": 1.0,\n        \"value\": 0.0\n    },\n    \"transition_type\": \"\"\n}",
  ).unwrap()
  assert_eq(obj.schema_name(), "Transition")
  assert_eq(obj.schema_version(), 1)
  assert_eq(obj.is_unknown(), false)
  let copy = @schema.Object::from_json(obj.to_json().unwrap()).unwrap()
  assert_eq(obj.equivalent(copy), true)
  assert_true(
    @schema.read(@schema.write(obj).unwrap()).unwrap().equivalent(obj),
  )
  let changed = copy.with_name("修改 / 🎞️").unwrap()
  assert_true(
    changed.equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"Transition.1\",\n    \"metadata\": {},\n    \"name\": \"修改 / 🎞️\",\n    \"in_offset\": {\n        \"OTIO_SCHEMA\": \"RationalTime.1\",\n        \"rate\": 1.0,\n        \"value\": 0.0\n    },\n    \"out_offset\": {\n        \"OTIO_SCHEMA\": \"RationalTime.1\",\n        \"rate\": 1.0,\n        \"value\": 0.0\n    },\n    \"transition_type\": \"\"\n}",
      ).unwrap(),
    ),
  )
  assert_eq(obj.get("name"), Some(@otiojson.parse("\"\"").unwrap()))
  let changed = obj
    .with_metadata(
      @otiojson.parse(
        "{\"nested\":{\"values\":[1,\"注释\",true,null]},\"user\":\"original\"}",
      ).unwrap(),
    )
    .unwrap()
  assert_true(
    changed.equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"Transition.1\",\n    \"metadata\": {\n        \"nested\": {\n            \"values\": [\n                1,\n                \"注释\",\n                true,\n                null\n            ]\n        },\n        \"user\": \"original\"\n    },\n    \"name\": \"\",\n    \"in_offset\": {\n        \"OTIO_SCHEMA\": \"RationalTime.1\",\n        \"rate\": 1.0,\n        \"value\": 0.0\n    },\n    \"out_offset\": {\n        \"OTIO_SCHEMA\": \"RationalTime.1\",\n        \"rate\": 1.0,\n        \"value\": 0.0\n    },\n    \"transition_type\": \"\"\n}",
      ).unwrap(),
    ),
  )
  assert_true(obj.metadata().unwrap() == @otiojson.parse("{}").unwrap())
  assert_eq(obj.visible(), true)
  assert_eq(obj.overlapping(), true)
}

///|
test "objects:Transition-duration" {
  let obj = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"Transition.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"in_offset\": {\n        \"OTIO_SCHEMA\": \"RationalTime.1\",\n        \"rate\": 1.0,\n        \"value\": 0.0\n    },\n    \"out_offset\": {\n        \"OTIO_SCHEMA\": \"RationalTime.1\",\n        \"rate\": 1.0,\n        \"value\": 0.0\n    },\n    \"transition_type\": \"\"\n}",
  ).unwrap()
  let actual_time = @graph.duration_time(obj).unwrap()
  api_number(actual_time.value(), 0.0)
  api_number(actual_time.rate(), 1.0)
}

///|
test "objects:PluginManifest" {
  let obj = @schema.read(
    "{\n    \"OTIO_SCHEMA\": \"PluginManifest.1\",\n    \"adapters\": [],\n    \"hook_scripts\": [],\n    \"hooks\": {},\n    \"media_linkers\": [],\n    \"schemadefs\": [],\n    \"version_manifests\": {}\n}",
  ).unwrap()
  assert_eq(obj.schema_name(), "PluginManifest")
  assert_eq(obj.schema_version(), 1)
  assert_eq(obj.is_unknown(), false)
  let copy = @schema.Object::from_json(obj.to_json().unwrap()).unwrap()
  assert_eq(obj.equivalent(copy), true)
  assert_true(
    @schema.read(@schema.write(obj).unwrap()).unwrap().equivalent(obj),
  )
}
