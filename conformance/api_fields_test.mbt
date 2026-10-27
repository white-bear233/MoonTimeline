// Generated from official OTIO 0.18.1 by tools/generate_api_tests.py.

///|
test "fields:Adapter.filepath.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Adapter.1\", \"name\": null, \"suffixes\": []}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Adapter.1\",\"filepath\":null,\"name\":null,\"suffixes\":[]}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Adapter.filepath.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Adapter.1\", \"filepath\": null, \"name\": null, \"suffixes\": []}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Adapter.1\",\"filepath\":null,\"name\":null,\"suffixes\":[]}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Adapter.filepath.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Adapter.1\", \"filepath\": true, \"name\": null, \"suffixes\": []}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Adapter.1\",\"filepath\":true,\"name\":null,\"suffixes\":[]}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Adapter.filepath.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Adapter.1\", \"filepath\": 1, \"name\": null, \"suffixes\": []}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Adapter.1\",\"filepath\":1,\"name\":null,\"suffixes\":[]}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Adapter.filepath.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Adapter.1\", \"filepath\": \"sample\", \"name\": null, \"suffixes\": []}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Adapter.1\",\"filepath\":\"sample\",\"name\":null,\"suffixes\":[]}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Adapter.filepath.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Adapter.1\", \"filepath\": [], \"name\": null, \"suffixes\": []}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Adapter.1\",\"filepath\":[],\"name\":null,\"suffixes\":[]}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Adapter.filepath.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Adapter.1\", \"filepath\": {}, \"name\": null, \"suffixes\": []}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Adapter.1\",\"filepath\":{},\"name\":null,\"suffixes\":[]}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Adapter.name.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Adapter.1\", \"filepath\": null, \"suffixes\": []}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Adapter.1\",\"filepath\":null,\"name\":null,\"suffixes\":[]}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Adapter.name.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Adapter.1\", \"filepath\": null, \"name\": null, \"suffixes\": []}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Adapter.1\",\"filepath\":null,\"name\":null,\"suffixes\":[]}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Adapter.name.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Adapter.1\", \"filepath\": null, \"name\": true, \"suffixes\": []}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Adapter.1\",\"filepath\":null,\"name\":true,\"suffixes\":[]}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Adapter.name.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Adapter.1\", \"filepath\": null, \"name\": 1, \"suffixes\": []}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Adapter.1\",\"filepath\":null,\"name\":1,\"suffixes\":[]}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Adapter.name.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Adapter.1\", \"filepath\": null, \"name\": \"sample\", \"suffixes\": []}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Adapter.1\",\"filepath\":null,\"name\":\"sample\",\"suffixes\":[]}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Adapter.name.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Adapter.1\", \"filepath\": null, \"name\": [], \"suffixes\": []}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Adapter.1\",\"filepath\":null,\"name\":[],\"suffixes\":[]}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Adapter.name.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Adapter.1\", \"filepath\": null, \"name\": {}, \"suffixes\": []}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Adapter.1\",\"filepath\":null,\"name\":{},\"suffixes\":[]}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Adapter.suffixes.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Adapter.1\", \"filepath\": null, \"name\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Adapter.1\",\"filepath\":null,\"name\":null,\"suffixes\":[]}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Adapter.suffixes.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Adapter.1\", \"filepath\": null, \"name\": null, \"suffixes\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Adapter.1\",\"filepath\":null,\"name\":null,\"suffixes\":null}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Adapter.suffixes.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Adapter.1\", \"filepath\": null, \"name\": null, \"suffixes\": true}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Adapter.1\",\"filepath\":null,\"name\":null,\"suffixes\":true}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Adapter.suffixes.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Adapter.1\", \"filepath\": null, \"name\": null, \"suffixes\": 1}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Adapter.1\",\"filepath\":null,\"name\":null,\"suffixes\":1}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Adapter.suffixes.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Adapter.1\", \"filepath\": null, \"name\": null, \"suffixes\": \"sample\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Adapter.1\",\"filepath\":null,\"name\":null,\"suffixes\":\"sample\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Adapter.suffixes.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Adapter.1\", \"filepath\": null, \"name\": null, \"suffixes\": []}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Adapter.1\",\"filepath\":null,\"name\":null,\"suffixes\":[]}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Adapter.suffixes.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Adapter.1\", \"filepath\": null, \"name\": null, \"suffixes\": {}}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Adapter.1\",\"filepath\":null,\"name\":null,\"suffixes\":{}}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Clip.metadata.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Clip.2\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"media_references\":{\"DEFAULT_MEDIA\":{\"OTIO_SCHEMA\":\"MissingReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null}},\"active_media_reference_key\":\"DEFAULT_MEDIA\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Clip.metadata.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": null, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Clip.metadata.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": true, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Clip.metadata.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": 1, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Clip.metadata.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": \"sample\", \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Clip.metadata.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": [], \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Clip.metadata.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Clip.2\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"media_references\":{\"DEFAULT_MEDIA\":{\"OTIO_SCHEMA\":\"MissingReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null}},\"active_media_reference_key\":\"DEFAULT_MEDIA\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Clip.name.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Clip.2\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"media_references\":{\"DEFAULT_MEDIA\":{\"OTIO_SCHEMA\":\"MissingReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null}},\"active_media_reference_key\":\"DEFAULT_MEDIA\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Clip.name.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": null, \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Clip.2\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"media_references\":{\"DEFAULT_MEDIA\":{\"OTIO_SCHEMA\":\"MissingReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null}},\"active_media_reference_key\":\"DEFAULT_MEDIA\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Clip.name.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": true, \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Clip.name.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": 1, \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Clip.name.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"sample\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Clip.2\",\"metadata\":{},\"name\":\"sample\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"media_references\":{\"DEFAULT_MEDIA\":{\"OTIO_SCHEMA\":\"MissingReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null}},\"active_media_reference_key\":\"DEFAULT_MEDIA\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Clip.name.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": [], \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Clip.name.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": {}, \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Clip.source_range.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Clip.2\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"media_references\":{\"DEFAULT_MEDIA\":{\"OTIO_SCHEMA\":\"MissingReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null}},\"active_media_reference_key\":\"DEFAULT_MEDIA\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Clip.source_range.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Clip.2\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"media_references\":{\"DEFAULT_MEDIA\":{\"OTIO_SCHEMA\":\"MissingReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null}},\"active_media_reference_key\":\"DEFAULT_MEDIA\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Clip.source_range.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": true, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Clip.source_range.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": 1, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Clip.source_range.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": \"sample\", \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Clip.source_range.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": [], \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Clip.source_range.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": {}, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Clip.effects.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Clip.2\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"media_references\":{\"DEFAULT_MEDIA\":{\"OTIO_SCHEMA\":\"MissingReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null}},\"active_media_reference_key\":\"DEFAULT_MEDIA\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Clip.effects.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": null, \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Clip.effects.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": true, \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Clip.effects.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": 1, \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Clip.effects.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": \"sample\", \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Clip.effects.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Clip.2\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"media_references\":{\"DEFAULT_MEDIA\":{\"OTIO_SCHEMA\":\"MissingReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null}},\"active_media_reference_key\":\"DEFAULT_MEDIA\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Clip.effects.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": {}, \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Clip.markers.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Clip.2\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"media_references\":{\"DEFAULT_MEDIA\":{\"OTIO_SCHEMA\":\"MissingReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null}},\"active_media_reference_key\":\"DEFAULT_MEDIA\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Clip.markers.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": null, \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Clip.markers.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": true, \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Clip.markers.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": 1, \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Clip.markers.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": \"sample\", \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Clip.markers.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Clip.2\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"media_references\":{\"DEFAULT_MEDIA\":{\"OTIO_SCHEMA\":\"MissingReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null}},\"active_media_reference_key\":\"DEFAULT_MEDIA\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Clip.markers.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": {}, \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Clip.enabled.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Clip.2\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"media_references\":{\"DEFAULT_MEDIA\":{\"OTIO_SCHEMA\":\"MissingReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null}},\"active_media_reference_key\":\"DEFAULT_MEDIA\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Clip.enabled.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": null, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Clip.enabled.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Clip.2\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"media_references\":{\"DEFAULT_MEDIA\":{\"OTIO_SCHEMA\":\"MissingReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null}},\"active_media_reference_key\":\"DEFAULT_MEDIA\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Clip.enabled.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": 1, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Clip.enabled.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": \"sample\", \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Clip.enabled.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": [], \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Clip.enabled.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": {}, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Clip.color.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Clip.2\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"media_references\":{\"DEFAULT_MEDIA\":{\"OTIO_SCHEMA\":\"MissingReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null}},\"active_media_reference_key\":\"DEFAULT_MEDIA\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Clip.color.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Clip.2\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"media_references\":{\"DEFAULT_MEDIA\":{\"OTIO_SCHEMA\":\"MissingReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null}},\"active_media_reference_key\":\"DEFAULT_MEDIA\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Clip.color.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": true, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Clip.color.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": 1, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Clip.color.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": \"sample\", \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Clip.color.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": [], \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Clip.color.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": {}, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Clip.media_references.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Clip.media_references.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": null, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Clip.media_references.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": true, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Clip.media_references.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": 1, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Clip.media_references.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": \"sample\", \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Clip.media_references.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": [], \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Clip.media_references.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": {}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Clip.2\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"media_references\":{},\"active_media_reference_key\":\"DEFAULT_MEDIA\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Clip.active_media_reference_key.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Clip.active_media_reference_key.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Clip.2\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"media_references\":{\"DEFAULT_MEDIA\":{\"OTIO_SCHEMA\":\"MissingReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null}},\"active_media_reference_key\":\"\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Clip.active_media_reference_key.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": true}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Clip.active_media_reference_key.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": 1}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Clip.active_media_reference_key.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"sample\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Clip.2\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"media_references\":{\"DEFAULT_MEDIA\":{\"OTIO_SCHEMA\":\"MissingReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null}},\"active_media_reference_key\":\"sample\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Clip.active_media_reference_key.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Clip.active_media_reference_key.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": {}}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Composable.metadata.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composable.1\", \"name\": \"\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Composable.1\",\"metadata\":{},\"name\":\"\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Composable.metadata.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composable.1\", \"metadata\": null, \"name\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Composable.metadata.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composable.1\", \"metadata\": true, \"name\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Composable.metadata.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composable.1\", \"metadata\": 1, \"name\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Composable.metadata.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composable.1\", \"metadata\": \"sample\", \"name\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Composable.metadata.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composable.1\", \"metadata\": [], \"name\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Composable.metadata.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composable.1\", \"metadata\": {}, \"name\": \"\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Composable.1\",\"metadata\":{},\"name\":\"\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Composable.name.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composable.1\", \"metadata\": {}}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Composable.1\",\"metadata\":{},\"name\":\"\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Composable.name.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composable.1\", \"metadata\": {}, \"name\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Composable.1\",\"metadata\":{},\"name\":\"\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Composable.name.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composable.1\", \"metadata\": {}, \"name\": true}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Composable.name.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composable.1\", \"metadata\": {}, \"name\": 1}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Composable.name.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composable.1\", \"metadata\": {}, \"name\": \"sample\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Composable.1\",\"metadata\":{},\"name\":\"sample\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Composable.name.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composable.1\", \"metadata\": {}, \"name\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Composable.name.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composable.1\", \"metadata\": {}, \"name\": {}}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Composition.metadata.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Composition.1\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"children\":[]}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Composition.metadata.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": null, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Composition.metadata.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": true, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Composition.metadata.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": 1, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Composition.metadata.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": \"sample\", \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Composition.metadata.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": [], \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Composition.metadata.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Composition.1\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"children\":[]}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Composition.name.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Composition.1\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"children\":[]}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Composition.name.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": null, \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Composition.1\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"children\":[]}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Composition.name.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": true, \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Composition.name.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": 1, \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Composition.name.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": \"sample\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Composition.1\",\"metadata\":{},\"name\":\"sample\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"children\":[]}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Composition.name.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": [], \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Composition.name.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": {}, \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Composition.source_range.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": \"\", \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Composition.1\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"children\":[]}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Composition.source_range.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Composition.1\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"children\":[]}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Composition.source_range.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": true, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Composition.source_range.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": 1, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Composition.source_range.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": \"sample\", \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Composition.source_range.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": [], \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Composition.source_range.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": {}, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Composition.effects.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Composition.1\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"children\":[]}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Composition.effects.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": null, \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Composition.effects.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": true, \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Composition.effects.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": 1, \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Composition.effects.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": \"sample\", \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Composition.effects.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Composition.1\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"children\":[]}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Composition.effects.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": {}, \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Composition.markers.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Composition.1\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"children\":[]}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Composition.markers.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": null, \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Composition.markers.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": true, \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Composition.markers.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": 1, \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Composition.markers.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": \"sample\", \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Composition.markers.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Composition.1\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"children\":[]}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Composition.markers.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": {}, \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Composition.enabled.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"color\": null, \"children\": []}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Composition.1\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"children\":[]}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Composition.enabled.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": null, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Composition.enabled.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Composition.1\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"children\":[]}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Composition.enabled.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": 1, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Composition.enabled.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": \"sample\", \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Composition.enabled.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": [], \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Composition.enabled.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": {}, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Composition.color.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"children\": []}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Composition.1\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"children\":[]}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Composition.color.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Composition.1\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"children\":[]}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Composition.color.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": true, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Composition.color.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": 1, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Composition.color.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": \"sample\", \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Composition.color.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": [], \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Composition.color.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": {}, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Composition.children.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Composition.children.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Composition.children.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": true}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Composition.children.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": 1}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Composition.children.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": \"sample\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Composition.children.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Composition.1\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"children\":[]}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Composition.children.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Composition.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": {}}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Effect.metadata.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Effect.1\", \"name\": \"\", \"effect_name\": \"\", \"enabled\": true}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Effect.1\",\"metadata\":{},\"name\":\"\",\"effect_name\":\"\",\"enabled\":true}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Effect.metadata.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Effect.1\", \"metadata\": null, \"name\": \"\", \"effect_name\": \"\", \"enabled\": true}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Effect.metadata.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Effect.1\", \"metadata\": true, \"name\": \"\", \"effect_name\": \"\", \"enabled\": true}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Effect.metadata.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Effect.1\", \"metadata\": 1, \"name\": \"\", \"effect_name\": \"\", \"enabled\": true}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Effect.metadata.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Effect.1\", \"metadata\": \"sample\", \"name\": \"\", \"effect_name\": \"\", \"enabled\": true}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Effect.metadata.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Effect.1\", \"metadata\": [], \"name\": \"\", \"effect_name\": \"\", \"enabled\": true}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Effect.metadata.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Effect.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": \"\", \"enabled\": true}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Effect.1\",\"metadata\":{},\"name\":\"\",\"effect_name\":\"\",\"enabled\":true}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Effect.name.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Effect.1\", \"metadata\": {}, \"effect_name\": \"\", \"enabled\": true}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Effect.1\",\"metadata\":{},\"name\":\"\",\"effect_name\":\"\",\"enabled\":true}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Effect.name.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Effect.1\", \"metadata\": {}, \"name\": null, \"effect_name\": \"\", \"enabled\": true}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Effect.1\",\"metadata\":{},\"name\":\"\",\"effect_name\":\"\",\"enabled\":true}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Effect.name.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Effect.1\", \"metadata\": {}, \"name\": true, \"effect_name\": \"\", \"enabled\": true}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Effect.name.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Effect.1\", \"metadata\": {}, \"name\": 1, \"effect_name\": \"\", \"enabled\": true}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Effect.name.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Effect.1\", \"metadata\": {}, \"name\": \"sample\", \"effect_name\": \"\", \"enabled\": true}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Effect.1\",\"metadata\":{},\"name\":\"sample\",\"effect_name\":\"\",\"enabled\":true}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Effect.name.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Effect.1\", \"metadata\": {}, \"name\": [], \"effect_name\": \"\", \"enabled\": true}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Effect.name.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Effect.1\", \"metadata\": {}, \"name\": {}, \"effect_name\": \"\", \"enabled\": true}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Effect.effect_name.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Effect.1\", \"metadata\": {}, \"name\": \"\", \"enabled\": true}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Effect.effect_name.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Effect.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": null, \"enabled\": true}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Effect.1\",\"metadata\":{},\"name\":\"\",\"effect_name\":\"\",\"enabled\":true}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Effect.effect_name.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Effect.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": true, \"enabled\": true}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Effect.effect_name.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Effect.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": 1, \"enabled\": true}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Effect.effect_name.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Effect.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": \"sample\", \"enabled\": true}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Effect.1\",\"metadata\":{},\"name\":\"\",\"effect_name\":\"sample\",\"enabled\":true}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Effect.effect_name.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Effect.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": [], \"enabled\": true}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Effect.effect_name.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Effect.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": {}, \"enabled\": true}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Effect.enabled.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Effect.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": \"\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Effect.1\",\"metadata\":{},\"name\":\"\",\"effect_name\":\"\",\"enabled\":true}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Effect.enabled.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Effect.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": \"\", \"enabled\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Effect.enabled.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Effect.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": \"\", \"enabled\": true}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Effect.1\",\"metadata\":{},\"name\":\"\",\"effect_name\":\"\",\"enabled\":true}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Effect.enabled.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Effect.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": \"\", \"enabled\": 1}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Effect.enabled.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Effect.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": \"\", \"enabled\": \"sample\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Effect.enabled.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Effect.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": \"\", \"enabled\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Effect.enabled.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Effect.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": \"\", \"enabled\": {}}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ExternalReference.metadata.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ExternalReference.1\", \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url\": \"\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"ExternalReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null,\"target_url\":\"\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:ExternalReference.metadata.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ExternalReference.1\", \"metadata\": null, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ExternalReference.metadata.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ExternalReference.1\", \"metadata\": true, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ExternalReference.metadata.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ExternalReference.1\", \"metadata\": 1, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ExternalReference.metadata.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ExternalReference.1\", \"metadata\": \"sample\", \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ExternalReference.metadata.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ExternalReference.1\", \"metadata\": [], \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ExternalReference.metadata.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ExternalReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url\": \"\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"ExternalReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null,\"target_url\":\"\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:ExternalReference.name.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ExternalReference.1\", \"metadata\": {}, \"available_range\": null, \"available_image_bounds\": null, \"target_url\": \"\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"ExternalReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null,\"target_url\":\"\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:ExternalReference.name.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ExternalReference.1\", \"metadata\": {}, \"name\": null, \"available_range\": null, \"available_image_bounds\": null, \"target_url\": \"\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"ExternalReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null,\"target_url\":\"\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:ExternalReference.name.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ExternalReference.1\", \"metadata\": {}, \"name\": true, \"available_range\": null, \"available_image_bounds\": null, \"target_url\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ExternalReference.name.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ExternalReference.1\", \"metadata\": {}, \"name\": 1, \"available_range\": null, \"available_image_bounds\": null, \"target_url\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ExternalReference.name.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ExternalReference.1\", \"metadata\": {}, \"name\": \"sample\", \"available_range\": null, \"available_image_bounds\": null, \"target_url\": \"\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"ExternalReference.1\",\"metadata\":{},\"name\":\"sample\",\"available_range\":null,\"available_image_bounds\":null,\"target_url\":\"\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:ExternalReference.name.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ExternalReference.1\", \"metadata\": {}, \"name\": [], \"available_range\": null, \"available_image_bounds\": null, \"target_url\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ExternalReference.name.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ExternalReference.1\", \"metadata\": {}, \"name\": {}, \"available_range\": null, \"available_image_bounds\": null, \"target_url\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ExternalReference.available_range.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ExternalReference.1\", \"metadata\": {}, \"name\": \"\", \"available_image_bounds\": null, \"target_url\": \"\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"ExternalReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null,\"target_url\":\"\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:ExternalReference.available_range.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ExternalReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url\": \"\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"ExternalReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null,\"target_url\":\"\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:ExternalReference.available_range.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ExternalReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": true, \"available_image_bounds\": null, \"target_url\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ExternalReference.available_range.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ExternalReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": 1, \"available_image_bounds\": null, \"target_url\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ExternalReference.available_range.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ExternalReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": \"sample\", \"available_image_bounds\": null, \"target_url\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ExternalReference.available_range.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ExternalReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": [], \"available_image_bounds\": null, \"target_url\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ExternalReference.available_range.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ExternalReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": {}, \"available_image_bounds\": null, \"target_url\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ExternalReference.available_image_bounds.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ExternalReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"target_url\": \"\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"ExternalReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null,\"target_url\":\"\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:ExternalReference.available_image_bounds.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ExternalReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url\": \"\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"ExternalReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null,\"target_url\":\"\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:ExternalReference.available_image_bounds.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ExternalReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": true, \"target_url\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ExternalReference.available_image_bounds.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ExternalReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": 1, \"target_url\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ExternalReference.available_image_bounds.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ExternalReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": \"sample\", \"target_url\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ExternalReference.available_image_bounds.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ExternalReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": [], \"target_url\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ExternalReference.available_image_bounds.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ExternalReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": {}, \"target_url\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ExternalReference.target_url.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ExternalReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ExternalReference.target_url.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ExternalReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"ExternalReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null,\"target_url\":\"\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:ExternalReference.target_url.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ExternalReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url\": true}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ExternalReference.target_url.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ExternalReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url\": 1}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ExternalReference.target_url.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ExternalReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url\": \"sample\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"ExternalReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null,\"target_url\":\"sample\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:ExternalReference.target_url.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ExternalReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ExternalReference.target_url.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ExternalReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url\": {}}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:FreezeFrame.metadata.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"FreezeFrame.1\", \"name\": \"\", \"effect_name\": \"FreezeFrame\", \"enabled\": true, \"time_scalar\": 0.0}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"FreezeFrame.1\",\"metadata\":{},\"name\":\"\",\"effect_name\":\"FreezeFrame\",\"enabled\":true,\"time_scalar\":0.0}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:FreezeFrame.metadata.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"FreezeFrame.1\", \"metadata\": null, \"name\": \"\", \"effect_name\": \"FreezeFrame\", \"enabled\": true, \"time_scalar\": 0.0}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:FreezeFrame.metadata.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"FreezeFrame.1\", \"metadata\": true, \"name\": \"\", \"effect_name\": \"FreezeFrame\", \"enabled\": true, \"time_scalar\": 0.0}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:FreezeFrame.metadata.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"FreezeFrame.1\", \"metadata\": 1, \"name\": \"\", \"effect_name\": \"FreezeFrame\", \"enabled\": true, \"time_scalar\": 0.0}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:FreezeFrame.metadata.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"FreezeFrame.1\", \"metadata\": \"sample\", \"name\": \"\", \"effect_name\": \"FreezeFrame\", \"enabled\": true, \"time_scalar\": 0.0}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:FreezeFrame.metadata.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"FreezeFrame.1\", \"metadata\": [], \"name\": \"\", \"effect_name\": \"FreezeFrame\", \"enabled\": true, \"time_scalar\": 0.0}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:FreezeFrame.metadata.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"FreezeFrame.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": \"FreezeFrame\", \"enabled\": true, \"time_scalar\": 0.0}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"FreezeFrame.1\",\"metadata\":{},\"name\":\"\",\"effect_name\":\"FreezeFrame\",\"enabled\":true,\"time_scalar\":0.0}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:FreezeFrame.name.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"FreezeFrame.1\", \"metadata\": {}, \"effect_name\": \"FreezeFrame\", \"enabled\": true, \"time_scalar\": 0.0}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"FreezeFrame.1\",\"metadata\":{},\"name\":\"\",\"effect_name\":\"FreezeFrame\",\"enabled\":true,\"time_scalar\":0.0}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:FreezeFrame.name.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"FreezeFrame.1\", \"metadata\": {}, \"name\": null, \"effect_name\": \"FreezeFrame\", \"enabled\": true, \"time_scalar\": 0.0}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"FreezeFrame.1\",\"metadata\":{},\"name\":\"\",\"effect_name\":\"FreezeFrame\",\"enabled\":true,\"time_scalar\":0.0}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:FreezeFrame.name.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"FreezeFrame.1\", \"metadata\": {}, \"name\": true, \"effect_name\": \"FreezeFrame\", \"enabled\": true, \"time_scalar\": 0.0}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:FreezeFrame.name.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"FreezeFrame.1\", \"metadata\": {}, \"name\": 1, \"effect_name\": \"FreezeFrame\", \"enabled\": true, \"time_scalar\": 0.0}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:FreezeFrame.name.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"FreezeFrame.1\", \"metadata\": {}, \"name\": \"sample\", \"effect_name\": \"FreezeFrame\", \"enabled\": true, \"time_scalar\": 0.0}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"FreezeFrame.1\",\"metadata\":{},\"name\":\"sample\",\"effect_name\":\"FreezeFrame\",\"enabled\":true,\"time_scalar\":0.0}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:FreezeFrame.name.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"FreezeFrame.1\", \"metadata\": {}, \"name\": [], \"effect_name\": \"FreezeFrame\", \"enabled\": true, \"time_scalar\": 0.0}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:FreezeFrame.name.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"FreezeFrame.1\", \"metadata\": {}, \"name\": {}, \"effect_name\": \"FreezeFrame\", \"enabled\": true, \"time_scalar\": 0.0}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:FreezeFrame.effect_name.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"FreezeFrame.1\", \"metadata\": {}, \"name\": \"\", \"enabled\": true, \"time_scalar\": 0.0}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:FreezeFrame.effect_name.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"FreezeFrame.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": null, \"enabled\": true, \"time_scalar\": 0.0}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"FreezeFrame.1\",\"metadata\":{},\"name\":\"\",\"effect_name\":\"\",\"enabled\":true,\"time_scalar\":0.0}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:FreezeFrame.effect_name.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"FreezeFrame.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": true, \"enabled\": true, \"time_scalar\": 0.0}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:FreezeFrame.effect_name.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"FreezeFrame.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": 1, \"enabled\": true, \"time_scalar\": 0.0}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:FreezeFrame.effect_name.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"FreezeFrame.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": \"sample\", \"enabled\": true, \"time_scalar\": 0.0}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"FreezeFrame.1\",\"metadata\":{},\"name\":\"\",\"effect_name\":\"sample\",\"enabled\":true,\"time_scalar\":0.0}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:FreezeFrame.effect_name.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"FreezeFrame.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": [], \"enabled\": true, \"time_scalar\": 0.0}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:FreezeFrame.effect_name.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"FreezeFrame.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": {}, \"enabled\": true, \"time_scalar\": 0.0}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:FreezeFrame.enabled.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"FreezeFrame.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": \"FreezeFrame\", \"time_scalar\": 0.0}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"FreezeFrame.1\",\"metadata\":{},\"name\":\"\",\"effect_name\":\"FreezeFrame\",\"enabled\":true,\"time_scalar\":0.0}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:FreezeFrame.enabled.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"FreezeFrame.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": \"FreezeFrame\", \"enabled\": null, \"time_scalar\": 0.0}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:FreezeFrame.enabled.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"FreezeFrame.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": \"FreezeFrame\", \"enabled\": true, \"time_scalar\": 0.0}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"FreezeFrame.1\",\"metadata\":{},\"name\":\"\",\"effect_name\":\"FreezeFrame\",\"enabled\":true,\"time_scalar\":0.0}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:FreezeFrame.enabled.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"FreezeFrame.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": \"FreezeFrame\", \"enabled\": 1, \"time_scalar\": 0.0}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:FreezeFrame.enabled.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"FreezeFrame.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": \"FreezeFrame\", \"enabled\": \"sample\", \"time_scalar\": 0.0}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:FreezeFrame.enabled.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"FreezeFrame.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": \"FreezeFrame\", \"enabled\": [], \"time_scalar\": 0.0}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:FreezeFrame.enabled.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"FreezeFrame.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": \"FreezeFrame\", \"enabled\": {}, \"time_scalar\": 0.0}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:FreezeFrame.time_scalar.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"FreezeFrame.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": \"FreezeFrame\", \"enabled\": true}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:FreezeFrame.time_scalar.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"FreezeFrame.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": \"FreezeFrame\", \"enabled\": true, \"time_scalar\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:FreezeFrame.time_scalar.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"FreezeFrame.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": \"FreezeFrame\", \"enabled\": true, \"time_scalar\": true}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:FreezeFrame.time_scalar.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"FreezeFrame.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": \"FreezeFrame\", \"enabled\": true, \"time_scalar\": 1}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"FreezeFrame.1\",\"metadata\":{},\"name\":\"\",\"effect_name\":\"FreezeFrame\",\"enabled\":true,\"time_scalar\":1.0}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:FreezeFrame.time_scalar.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"FreezeFrame.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": \"FreezeFrame\", \"enabled\": true, \"time_scalar\": \"sample\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:FreezeFrame.time_scalar.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"FreezeFrame.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": \"FreezeFrame\", \"enabled\": true, \"time_scalar\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:FreezeFrame.time_scalar.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"FreezeFrame.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": \"FreezeFrame\", \"enabled\": true, \"time_scalar\": {}}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Gap.metadata.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Gap.1\", \"name\": \"\", \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Gap.1\",\"metadata\":{},\"name\":\"\",\"source_range\":{\"OTIO_SCHEMA\":\"TimeRange.1\",\"duration\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0},\"start_time\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0}},\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Gap.metadata.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": null, \"name\": \"\", \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Gap.metadata.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": true, \"name\": \"\", \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Gap.metadata.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": 1, \"name\": \"\", \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Gap.metadata.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": \"sample\", \"name\": \"\", \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Gap.metadata.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": [], \"name\": \"\", \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Gap.metadata.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Gap.1\",\"metadata\":{},\"name\":\"\",\"source_range\":{\"OTIO_SCHEMA\":\"TimeRange.1\",\"duration\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0},\"start_time\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0}},\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Gap.name.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Gap.1\",\"metadata\":{},\"name\":\"\",\"source_range\":{\"OTIO_SCHEMA\":\"TimeRange.1\",\"duration\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0},\"start_time\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0}},\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Gap.name.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": null, \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Gap.1\",\"metadata\":{},\"name\":\"\",\"source_range\":{\"OTIO_SCHEMA\":\"TimeRange.1\",\"duration\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0},\"start_time\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0}},\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Gap.name.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": true, \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Gap.name.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": 1, \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Gap.name.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": \"sample\", \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Gap.1\",\"metadata\":{},\"name\":\"sample\",\"source_range\":{\"OTIO_SCHEMA\":\"TimeRange.1\",\"duration\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0},\"start_time\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0}},\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Gap.name.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": [], \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Gap.name.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": {}, \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Gap.source_range.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": \"\", \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Gap.1\",\"metadata\":{},\"name\":\"\",\"source_range\":{\"OTIO_SCHEMA\":\"TimeRange.1\",\"duration\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0},\"start_time\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0}},\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Gap.source_range.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Gap.1\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Gap.source_range.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": true, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Gap.source_range.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": 1, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Gap.source_range.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": \"sample\", \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Gap.source_range.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": [], \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Gap.source_range.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": {}, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Gap.effects.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Gap.1\",\"metadata\":{},\"name\":\"\",\"source_range\":{\"OTIO_SCHEMA\":\"TimeRange.1\",\"duration\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0},\"start_time\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0}},\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Gap.effects.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"effects\": null, \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Gap.effects.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"effects\": true, \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Gap.effects.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"effects\": 1, \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Gap.effects.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"effects\": \"sample\", \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Gap.effects.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Gap.1\",\"metadata\":{},\"name\":\"\",\"source_range\":{\"OTIO_SCHEMA\":\"TimeRange.1\",\"duration\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0},\"start_time\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0}},\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Gap.effects.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"effects\": {}, \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Gap.markers.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"effects\": [], \"enabled\": true, \"color\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Gap.1\",\"metadata\":{},\"name\":\"\",\"source_range\":{\"OTIO_SCHEMA\":\"TimeRange.1\",\"duration\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0},\"start_time\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0}},\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Gap.markers.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"effects\": [], \"markers\": null, \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Gap.markers.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"effects\": [], \"markers\": true, \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Gap.markers.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"effects\": [], \"markers\": 1, \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Gap.markers.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"effects\": [], \"markers\": \"sample\", \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Gap.markers.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Gap.1\",\"metadata\":{},\"name\":\"\",\"source_range\":{\"OTIO_SCHEMA\":\"TimeRange.1\",\"duration\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0},\"start_time\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0}},\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Gap.markers.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"effects\": [], \"markers\": {}, \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Gap.enabled.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"effects\": [], \"markers\": [], \"color\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Gap.1\",\"metadata\":{},\"name\":\"\",\"source_range\":{\"OTIO_SCHEMA\":\"TimeRange.1\",\"duration\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0},\"start_time\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0}},\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Gap.enabled.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"effects\": [], \"markers\": [], \"enabled\": null, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Gap.enabled.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Gap.1\",\"metadata\":{},\"name\":\"\",\"source_range\":{\"OTIO_SCHEMA\":\"TimeRange.1\",\"duration\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0},\"start_time\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0}},\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Gap.enabled.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"effects\": [], \"markers\": [], \"enabled\": 1, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Gap.enabled.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"effects\": [], \"markers\": [], \"enabled\": \"sample\", \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Gap.enabled.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"effects\": [], \"markers\": [], \"enabled\": [], \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Gap.enabled.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"effects\": [], \"markers\": [], \"enabled\": {}, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Gap.color.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"effects\": [], \"markers\": [], \"enabled\": true}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Gap.1\",\"metadata\":{},\"name\":\"\",\"source_range\":{\"OTIO_SCHEMA\":\"TimeRange.1\",\"duration\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0},\"start_time\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0}},\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Gap.color.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Gap.1\",\"metadata\":{},\"name\":\"\",\"source_range\":{\"OTIO_SCHEMA\":\"TimeRange.1\",\"duration\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0},\"start_time\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0}},\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Gap.color.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": true}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Gap.color.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": 1}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Gap.color.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": \"sample\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Gap.color.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Gap.color.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Gap.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": {}}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:GeneratorReference.metadata.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"GeneratorReference.1\", \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"generator_kind\": \"\", \"parameters\": {}}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"GeneratorReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null,\"generator_kind\":\"\",\"parameters\":{}}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:GeneratorReference.metadata.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"GeneratorReference.1\", \"metadata\": null, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"generator_kind\": \"\", \"parameters\": {}}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:GeneratorReference.metadata.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"GeneratorReference.1\", \"metadata\": true, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"generator_kind\": \"\", \"parameters\": {}}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:GeneratorReference.metadata.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"GeneratorReference.1\", \"metadata\": 1, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"generator_kind\": \"\", \"parameters\": {}}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:GeneratorReference.metadata.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"GeneratorReference.1\", \"metadata\": \"sample\", \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"generator_kind\": \"\", \"parameters\": {}}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:GeneratorReference.metadata.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"GeneratorReference.1\", \"metadata\": [], \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"generator_kind\": \"\", \"parameters\": {}}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:GeneratorReference.metadata.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"GeneratorReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"generator_kind\": \"\", \"parameters\": {}}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"GeneratorReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null,\"generator_kind\":\"\",\"parameters\":{}}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:GeneratorReference.name.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"GeneratorReference.1\", \"metadata\": {}, \"available_range\": null, \"available_image_bounds\": null, \"generator_kind\": \"\", \"parameters\": {}}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"GeneratorReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null,\"generator_kind\":\"\",\"parameters\":{}}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:GeneratorReference.name.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"GeneratorReference.1\", \"metadata\": {}, \"name\": null, \"available_range\": null, \"available_image_bounds\": null, \"generator_kind\": \"\", \"parameters\": {}}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"GeneratorReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null,\"generator_kind\":\"\",\"parameters\":{}}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:GeneratorReference.name.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"GeneratorReference.1\", \"metadata\": {}, \"name\": true, \"available_range\": null, \"available_image_bounds\": null, \"generator_kind\": \"\", \"parameters\": {}}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:GeneratorReference.name.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"GeneratorReference.1\", \"metadata\": {}, \"name\": 1, \"available_range\": null, \"available_image_bounds\": null, \"generator_kind\": \"\", \"parameters\": {}}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:GeneratorReference.name.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"GeneratorReference.1\", \"metadata\": {}, \"name\": \"sample\", \"available_range\": null, \"available_image_bounds\": null, \"generator_kind\": \"\", \"parameters\": {}}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"GeneratorReference.1\",\"metadata\":{},\"name\":\"sample\",\"available_range\":null,\"available_image_bounds\":null,\"generator_kind\":\"\",\"parameters\":{}}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:GeneratorReference.name.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"GeneratorReference.1\", \"metadata\": {}, \"name\": [], \"available_range\": null, \"available_image_bounds\": null, \"generator_kind\": \"\", \"parameters\": {}}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:GeneratorReference.name.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"GeneratorReference.1\", \"metadata\": {}, \"name\": {}, \"available_range\": null, \"available_image_bounds\": null, \"generator_kind\": \"\", \"parameters\": {}}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:GeneratorReference.available_range.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"GeneratorReference.1\", \"metadata\": {}, \"name\": \"\", \"available_image_bounds\": null, \"generator_kind\": \"\", \"parameters\": {}}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"GeneratorReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null,\"generator_kind\":\"\",\"parameters\":{}}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:GeneratorReference.available_range.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"GeneratorReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"generator_kind\": \"\", \"parameters\": {}}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"GeneratorReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null,\"generator_kind\":\"\",\"parameters\":{}}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:GeneratorReference.available_range.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"GeneratorReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": true, \"available_image_bounds\": null, \"generator_kind\": \"\", \"parameters\": {}}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:GeneratorReference.available_range.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"GeneratorReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": 1, \"available_image_bounds\": null, \"generator_kind\": \"\", \"parameters\": {}}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:GeneratorReference.available_range.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"GeneratorReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": \"sample\", \"available_image_bounds\": null, \"generator_kind\": \"\", \"parameters\": {}}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:GeneratorReference.available_range.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"GeneratorReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": [], \"available_image_bounds\": null, \"generator_kind\": \"\", \"parameters\": {}}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:GeneratorReference.available_range.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"GeneratorReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": {}, \"available_image_bounds\": null, \"generator_kind\": \"\", \"parameters\": {}}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:GeneratorReference.available_image_bounds.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"GeneratorReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"generator_kind\": \"\", \"parameters\": {}}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"GeneratorReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null,\"generator_kind\":\"\",\"parameters\":{}}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:GeneratorReference.available_image_bounds.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"GeneratorReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"generator_kind\": \"\", \"parameters\": {}}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"GeneratorReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null,\"generator_kind\":\"\",\"parameters\":{}}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:GeneratorReference.available_image_bounds.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"GeneratorReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": true, \"generator_kind\": \"\", \"parameters\": {}}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:GeneratorReference.available_image_bounds.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"GeneratorReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": 1, \"generator_kind\": \"\", \"parameters\": {}}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:GeneratorReference.available_image_bounds.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"GeneratorReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": \"sample\", \"generator_kind\": \"\", \"parameters\": {}}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:GeneratorReference.available_image_bounds.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"GeneratorReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": [], \"generator_kind\": \"\", \"parameters\": {}}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:GeneratorReference.available_image_bounds.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"GeneratorReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": {}, \"generator_kind\": \"\", \"parameters\": {}}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:GeneratorReference.generator_kind.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"GeneratorReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"parameters\": {}}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:GeneratorReference.generator_kind.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"GeneratorReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"generator_kind\": null, \"parameters\": {}}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"GeneratorReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null,\"generator_kind\":\"\",\"parameters\":{}}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:GeneratorReference.generator_kind.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"GeneratorReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"generator_kind\": true, \"parameters\": {}}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:GeneratorReference.generator_kind.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"GeneratorReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"generator_kind\": 1, \"parameters\": {}}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:GeneratorReference.generator_kind.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"GeneratorReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"generator_kind\": \"sample\", \"parameters\": {}}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"GeneratorReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null,\"generator_kind\":\"sample\",\"parameters\":{}}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:GeneratorReference.generator_kind.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"GeneratorReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"generator_kind\": [], \"parameters\": {}}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:GeneratorReference.generator_kind.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"GeneratorReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"generator_kind\": {}, \"parameters\": {}}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:GeneratorReference.parameters.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"GeneratorReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"generator_kind\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:GeneratorReference.parameters.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"GeneratorReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"generator_kind\": \"\", \"parameters\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:GeneratorReference.parameters.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"GeneratorReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"generator_kind\": \"\", \"parameters\": true}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:GeneratorReference.parameters.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"GeneratorReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"generator_kind\": \"\", \"parameters\": 1}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:GeneratorReference.parameters.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"GeneratorReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"generator_kind\": \"\", \"parameters\": \"sample\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:GeneratorReference.parameters.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"GeneratorReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"generator_kind\": \"\", \"parameters\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:GeneratorReference.parameters.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"GeneratorReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"generator_kind\": \"\", \"parameters\": {}}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"GeneratorReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null,\"generator_kind\":\"\",\"parameters\":{}}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:HookScript.filepath.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"HookScript.1\", \"name\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"HookScript.1\",\"filepath\":null,\"name\":null}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:HookScript.filepath.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"HookScript.1\", \"filepath\": null, \"name\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"HookScript.1\",\"filepath\":null,\"name\":null}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:HookScript.filepath.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"HookScript.1\", \"filepath\": true, \"name\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"HookScript.1\",\"filepath\":true,\"name\":null}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:HookScript.filepath.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"HookScript.1\", \"filepath\": 1, \"name\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"HookScript.1\",\"filepath\":1,\"name\":null}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:HookScript.filepath.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"HookScript.1\", \"filepath\": \"sample\", \"name\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"HookScript.1\",\"filepath\":\"sample\",\"name\":null}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:HookScript.filepath.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"HookScript.1\", \"filepath\": [], \"name\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"HookScript.1\",\"filepath\":[],\"name\":null}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:HookScript.filepath.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"HookScript.1\", \"filepath\": {}, \"name\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"HookScript.1\",\"filepath\":{},\"name\":null}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:HookScript.name.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"HookScript.1\", \"filepath\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"HookScript.1\",\"filepath\":null,\"name\":null}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:HookScript.name.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"HookScript.1\", \"filepath\": null, \"name\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"HookScript.1\",\"filepath\":null,\"name\":null}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:HookScript.name.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"HookScript.1\", \"filepath\": null, \"name\": true}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"HookScript.1\",\"filepath\":null,\"name\":true}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:HookScript.name.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"HookScript.1\", \"filepath\": null, \"name\": 1}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"HookScript.1\",\"filepath\":null,\"name\":1}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:HookScript.name.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"HookScript.1\", \"filepath\": null, \"name\": \"sample\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"HookScript.1\",\"filepath\":null,\"name\":\"sample\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:HookScript.name.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"HookScript.1\", \"filepath\": null, \"name\": []}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"HookScript.1\",\"filepath\":null,\"name\":[]}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:HookScript.name.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"HookScript.1\", \"filepath\": null, \"name\": {}}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"HookScript.1\",\"filepath\":null,\"name\":{}}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:ImageSequenceReference.metadata.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"ImageSequenceReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null,\"target_url_base\":\"\",\"name_prefix\":\"\",\"name_suffix\":\"\",\"start_frame\":1,\"frame_step\":1,\"rate\":1.0,\"frame_zero_padding\":0,\"missing_frame_policy\":\"error\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:ImageSequenceReference.metadata.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": null, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ImageSequenceReference.metadata.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": true, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ImageSequenceReference.metadata.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": 1, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ImageSequenceReference.metadata.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": \"sample\", \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ImageSequenceReference.metadata.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": [], \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ImageSequenceReference.metadata.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"ImageSequenceReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null,\"target_url_base\":\"\",\"name_prefix\":\"\",\"name_suffix\":\"\",\"start_frame\":1,\"frame_step\":1,\"rate\":1.0,\"frame_zero_padding\":0,\"missing_frame_policy\":\"error\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:ImageSequenceReference.name.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"ImageSequenceReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null,\"target_url_base\":\"\",\"name_prefix\":\"\",\"name_suffix\":\"\",\"start_frame\":1,\"frame_step\":1,\"rate\":1.0,\"frame_zero_padding\":0,\"missing_frame_policy\":\"error\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:ImageSequenceReference.name.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": null, \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"ImageSequenceReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null,\"target_url_base\":\"\",\"name_prefix\":\"\",\"name_suffix\":\"\",\"start_frame\":1,\"frame_step\":1,\"rate\":1.0,\"frame_zero_padding\":0,\"missing_frame_policy\":\"error\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:ImageSequenceReference.name.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": true, \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ImageSequenceReference.name.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": 1, \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ImageSequenceReference.name.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"sample\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"ImageSequenceReference.1\",\"metadata\":{},\"name\":\"sample\",\"available_range\":null,\"available_image_bounds\":null,\"target_url_base\":\"\",\"name_prefix\":\"\",\"name_suffix\":\"\",\"start_frame\":1,\"frame_step\":1,\"rate\":1.0,\"frame_zero_padding\":0,\"missing_frame_policy\":\"error\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:ImageSequenceReference.name.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": [], \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ImageSequenceReference.name.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": {}, \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ImageSequenceReference.available_range.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"ImageSequenceReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null,\"target_url_base\":\"\",\"name_prefix\":\"\",\"name_suffix\":\"\",\"start_frame\":1,\"frame_step\":1,\"rate\":1.0,\"frame_zero_padding\":0,\"missing_frame_policy\":\"error\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:ImageSequenceReference.available_range.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"ImageSequenceReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null,\"target_url_base\":\"\",\"name_prefix\":\"\",\"name_suffix\":\"\",\"start_frame\":1,\"frame_step\":1,\"rate\":1.0,\"frame_zero_padding\":0,\"missing_frame_policy\":\"error\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:ImageSequenceReference.available_range.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": true, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ImageSequenceReference.available_range.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": 1, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ImageSequenceReference.available_range.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": \"sample\", \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ImageSequenceReference.available_range.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": [], \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ImageSequenceReference.available_range.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": {}, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ImageSequenceReference.available_image_bounds.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"ImageSequenceReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null,\"target_url_base\":\"\",\"name_prefix\":\"\",\"name_suffix\":\"\",\"start_frame\":1,\"frame_step\":1,\"rate\":1.0,\"frame_zero_padding\":0,\"missing_frame_policy\":\"error\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:ImageSequenceReference.available_image_bounds.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"ImageSequenceReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null,\"target_url_base\":\"\",\"name_prefix\":\"\",\"name_suffix\":\"\",\"start_frame\":1,\"frame_step\":1,\"rate\":1.0,\"frame_zero_padding\":0,\"missing_frame_policy\":\"error\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:ImageSequenceReference.available_image_bounds.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": true, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ImageSequenceReference.available_image_bounds.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": 1, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ImageSequenceReference.available_image_bounds.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": \"sample\", \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ImageSequenceReference.available_image_bounds.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": [], \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ImageSequenceReference.available_image_bounds.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": {}, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ImageSequenceReference.target_url_base.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ImageSequenceReference.target_url_base.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": null, \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"ImageSequenceReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null,\"target_url_base\":\"\",\"name_prefix\":\"\",\"name_suffix\":\"\",\"start_frame\":1,\"frame_step\":1,\"rate\":1.0,\"frame_zero_padding\":0,\"missing_frame_policy\":\"error\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:ImageSequenceReference.target_url_base.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": true, \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ImageSequenceReference.target_url_base.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": 1, \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ImageSequenceReference.target_url_base.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"sample\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"ImageSequenceReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null,\"target_url_base\":\"sample\",\"name_prefix\":\"\",\"name_suffix\":\"\",\"start_frame\":1,\"frame_step\":1,\"rate\":1.0,\"frame_zero_padding\":0,\"missing_frame_policy\":\"error\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:ImageSequenceReference.target_url_base.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": [], \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ImageSequenceReference.target_url_base.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": {}, \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ImageSequenceReference.name_prefix.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ImageSequenceReference.name_prefix.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": null, \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"ImageSequenceReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null,\"target_url_base\":\"\",\"name_prefix\":\"\",\"name_suffix\":\"\",\"start_frame\":1,\"frame_step\":1,\"rate\":1.0,\"frame_zero_padding\":0,\"missing_frame_policy\":\"error\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:ImageSequenceReference.name_prefix.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": true, \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ImageSequenceReference.name_prefix.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": 1, \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ImageSequenceReference.name_prefix.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"sample\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"ImageSequenceReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null,\"target_url_base\":\"\",\"name_prefix\":\"sample\",\"name_suffix\":\"\",\"start_frame\":1,\"frame_step\":1,\"rate\":1.0,\"frame_zero_padding\":0,\"missing_frame_policy\":\"error\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:ImageSequenceReference.name_prefix.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": [], \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ImageSequenceReference.name_prefix.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": {}, \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ImageSequenceReference.name_suffix.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"start_frame\": 1, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ImageSequenceReference.name_suffix.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": null, \"start_frame\": 1, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"ImageSequenceReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null,\"target_url_base\":\"\",\"name_prefix\":\"\",\"name_suffix\":\"\",\"start_frame\":1,\"frame_step\":1,\"rate\":1.0,\"frame_zero_padding\":0,\"missing_frame_policy\":\"error\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:ImageSequenceReference.name_suffix.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": true, \"start_frame\": 1, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ImageSequenceReference.name_suffix.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": 1, \"start_frame\": 1, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ImageSequenceReference.name_suffix.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"sample\", \"start_frame\": 1, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"ImageSequenceReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null,\"target_url_base\":\"\",\"name_prefix\":\"\",\"name_suffix\":\"sample\",\"start_frame\":1,\"frame_step\":1,\"rate\":1.0,\"frame_zero_padding\":0,\"missing_frame_policy\":\"error\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:ImageSequenceReference.name_suffix.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": [], \"start_frame\": 1, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ImageSequenceReference.name_suffix.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": {}, \"start_frame\": 1, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ImageSequenceReference.start_frame.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ImageSequenceReference.start_frame.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": null, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ImageSequenceReference.start_frame.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": true, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ImageSequenceReference.start_frame.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"ImageSequenceReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null,\"target_url_base\":\"\",\"name_prefix\":\"\",\"name_suffix\":\"\",\"start_frame\":1,\"frame_step\":1,\"rate\":1.0,\"frame_zero_padding\":0,\"missing_frame_policy\":\"error\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:ImageSequenceReference.start_frame.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": \"sample\", \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ImageSequenceReference.start_frame.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": [], \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ImageSequenceReference.start_frame.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": {}, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ImageSequenceReference.frame_step.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ImageSequenceReference.frame_step.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": null, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ImageSequenceReference.frame_step.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": true, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ImageSequenceReference.frame_step.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"ImageSequenceReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null,\"target_url_base\":\"\",\"name_prefix\":\"\",\"name_suffix\":\"\",\"start_frame\":1,\"frame_step\":1,\"rate\":1.0,\"frame_zero_padding\":0,\"missing_frame_policy\":\"error\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:ImageSequenceReference.frame_step.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": \"sample\", \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ImageSequenceReference.frame_step.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": [], \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ImageSequenceReference.frame_step.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": {}, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ImageSequenceReference.rate.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 1, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ImageSequenceReference.rate.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 1, \"rate\": null, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ImageSequenceReference.rate.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 1, \"rate\": true, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ImageSequenceReference.rate.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 1, \"rate\": 1, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"ImageSequenceReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null,\"target_url_base\":\"\",\"name_prefix\":\"\",\"name_suffix\":\"\",\"start_frame\":1,\"frame_step\":1,\"rate\":1.0,\"frame_zero_padding\":0,\"missing_frame_policy\":\"error\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:ImageSequenceReference.rate.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 1, \"rate\": \"sample\", \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ImageSequenceReference.rate.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 1, \"rate\": [], \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ImageSequenceReference.rate.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 1, \"rate\": {}, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ImageSequenceReference.frame_zero_padding.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 1, \"rate\": 1.0, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ImageSequenceReference.frame_zero_padding.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": null, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ImageSequenceReference.frame_zero_padding.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": true, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ImageSequenceReference.frame_zero_padding.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 1, \"missing_frame_policy\": \"error\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"ImageSequenceReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null,\"target_url_base\":\"\",\"name_prefix\":\"\",\"name_suffix\":\"\",\"start_frame\":1,\"frame_step\":1,\"rate\":1.0,\"frame_zero_padding\":1,\"missing_frame_policy\":\"error\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:ImageSequenceReference.frame_zero_padding.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": \"sample\", \"missing_frame_policy\": \"error\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ImageSequenceReference.frame_zero_padding.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": [], \"missing_frame_policy\": \"error\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ImageSequenceReference.frame_zero_padding.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": {}, \"missing_frame_policy\": \"error\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ImageSequenceReference.missing_frame_policy.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 0}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ImageSequenceReference.missing_frame_policy.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ImageSequenceReference.missing_frame_policy.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": true}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ImageSequenceReference.missing_frame_policy.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": 1}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ImageSequenceReference.missing_frame_policy.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": \"sample\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ImageSequenceReference.missing_frame_policy.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:ImageSequenceReference.missing_frame_policy.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"ImageSequenceReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null, \"target_url_base\": \"\", \"name_prefix\": \"\", \"name_suffix\": \"\", \"start_frame\": 1, \"frame_step\": 1, \"rate\": 1.0, \"frame_zero_padding\": 0, \"missing_frame_policy\": {}}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Item.metadata.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Item.1\", \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Item.1\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Item.metadata.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Item.1\", \"metadata\": null, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Item.metadata.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Item.1\", \"metadata\": true, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Item.metadata.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Item.1\", \"metadata\": 1, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Item.metadata.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Item.1\", \"metadata\": \"sample\", \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Item.metadata.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Item.1\", \"metadata\": [], \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Item.metadata.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Item.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Item.1\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Item.name.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Item.1\", \"metadata\": {}, \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Item.1\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Item.name.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Item.1\", \"metadata\": {}, \"name\": null, \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Item.1\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Item.name.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Item.1\", \"metadata\": {}, \"name\": true, \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Item.name.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Item.1\", \"metadata\": {}, \"name\": 1, \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Item.name.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Item.1\", \"metadata\": {}, \"name\": \"sample\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Item.1\",\"metadata\":{},\"name\":\"sample\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Item.name.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Item.1\", \"metadata\": {}, \"name\": [], \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Item.name.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Item.1\", \"metadata\": {}, \"name\": {}, \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Item.source_range.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Item.1\", \"metadata\": {}, \"name\": \"\", \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Item.1\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Item.source_range.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Item.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Item.1\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Item.source_range.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Item.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": true, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Item.source_range.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Item.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": 1, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Item.source_range.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Item.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": \"sample\", \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Item.source_range.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Item.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": [], \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Item.source_range.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Item.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": {}, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Item.effects.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Item.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Item.1\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Item.effects.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Item.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": null, \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Item.effects.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Item.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": true, \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Item.effects.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Item.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": 1, \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Item.effects.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Item.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": \"sample\", \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Item.effects.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Item.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Item.1\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Item.effects.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Item.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": {}, \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Item.markers.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Item.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"enabled\": true, \"color\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Item.1\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Item.markers.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Item.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": null, \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Item.markers.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Item.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": true, \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Item.markers.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Item.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": 1, \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Item.markers.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Item.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": \"sample\", \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Item.markers.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Item.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Item.1\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Item.markers.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Item.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": {}, \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Item.enabled.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Item.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"color\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Item.1\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Item.enabled.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Item.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": null, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Item.enabled.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Item.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Item.1\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Item.enabled.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Item.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": 1, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Item.enabled.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Item.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": \"sample\", \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Item.enabled.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Item.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": [], \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Item.enabled.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Item.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": {}, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Item.color.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Item.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Item.1\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Item.color.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Item.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Item.1\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Item.color.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Item.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": true}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Item.color.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Item.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": 1}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Item.color.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Item.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": \"sample\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Item.color.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Item.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Item.color.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Item.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": {}}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:LinearTimeWarp.metadata.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"LinearTimeWarp.1\", \"name\": \"\", \"effect_name\": \"LinearTimeWarp\", \"enabled\": true, \"time_scalar\": 1.0}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"LinearTimeWarp.1\",\"metadata\":{},\"name\":\"\",\"effect_name\":\"LinearTimeWarp\",\"enabled\":true,\"time_scalar\":1.0}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:LinearTimeWarp.metadata.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"LinearTimeWarp.1\", \"metadata\": null, \"name\": \"\", \"effect_name\": \"LinearTimeWarp\", \"enabled\": true, \"time_scalar\": 1.0}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:LinearTimeWarp.metadata.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"LinearTimeWarp.1\", \"metadata\": true, \"name\": \"\", \"effect_name\": \"LinearTimeWarp\", \"enabled\": true, \"time_scalar\": 1.0}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:LinearTimeWarp.metadata.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"LinearTimeWarp.1\", \"metadata\": 1, \"name\": \"\", \"effect_name\": \"LinearTimeWarp\", \"enabled\": true, \"time_scalar\": 1.0}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:LinearTimeWarp.metadata.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"LinearTimeWarp.1\", \"metadata\": \"sample\", \"name\": \"\", \"effect_name\": \"LinearTimeWarp\", \"enabled\": true, \"time_scalar\": 1.0}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:LinearTimeWarp.metadata.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"LinearTimeWarp.1\", \"metadata\": [], \"name\": \"\", \"effect_name\": \"LinearTimeWarp\", \"enabled\": true, \"time_scalar\": 1.0}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:LinearTimeWarp.metadata.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"LinearTimeWarp.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": \"LinearTimeWarp\", \"enabled\": true, \"time_scalar\": 1.0}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"LinearTimeWarp.1\",\"metadata\":{},\"name\":\"\",\"effect_name\":\"LinearTimeWarp\",\"enabled\":true,\"time_scalar\":1.0}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:LinearTimeWarp.name.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"LinearTimeWarp.1\", \"metadata\": {}, \"effect_name\": \"LinearTimeWarp\", \"enabled\": true, \"time_scalar\": 1.0}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"LinearTimeWarp.1\",\"metadata\":{},\"name\":\"\",\"effect_name\":\"LinearTimeWarp\",\"enabled\":true,\"time_scalar\":1.0}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:LinearTimeWarp.name.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"LinearTimeWarp.1\", \"metadata\": {}, \"name\": null, \"effect_name\": \"LinearTimeWarp\", \"enabled\": true, \"time_scalar\": 1.0}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"LinearTimeWarp.1\",\"metadata\":{},\"name\":\"\",\"effect_name\":\"LinearTimeWarp\",\"enabled\":true,\"time_scalar\":1.0}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:LinearTimeWarp.name.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"LinearTimeWarp.1\", \"metadata\": {}, \"name\": true, \"effect_name\": \"LinearTimeWarp\", \"enabled\": true, \"time_scalar\": 1.0}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:LinearTimeWarp.name.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"LinearTimeWarp.1\", \"metadata\": {}, \"name\": 1, \"effect_name\": \"LinearTimeWarp\", \"enabled\": true, \"time_scalar\": 1.0}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:LinearTimeWarp.name.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"LinearTimeWarp.1\", \"metadata\": {}, \"name\": \"sample\", \"effect_name\": \"LinearTimeWarp\", \"enabled\": true, \"time_scalar\": 1.0}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"LinearTimeWarp.1\",\"metadata\":{},\"name\":\"sample\",\"effect_name\":\"LinearTimeWarp\",\"enabled\":true,\"time_scalar\":1.0}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:LinearTimeWarp.name.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"LinearTimeWarp.1\", \"metadata\": {}, \"name\": [], \"effect_name\": \"LinearTimeWarp\", \"enabled\": true, \"time_scalar\": 1.0}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:LinearTimeWarp.name.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"LinearTimeWarp.1\", \"metadata\": {}, \"name\": {}, \"effect_name\": \"LinearTimeWarp\", \"enabled\": true, \"time_scalar\": 1.0}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:LinearTimeWarp.effect_name.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"LinearTimeWarp.1\", \"metadata\": {}, \"name\": \"\", \"enabled\": true, \"time_scalar\": 1.0}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:LinearTimeWarp.effect_name.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"LinearTimeWarp.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": null, \"enabled\": true, \"time_scalar\": 1.0}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"LinearTimeWarp.1\",\"metadata\":{},\"name\":\"\",\"effect_name\":\"\",\"enabled\":true,\"time_scalar\":1.0}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:LinearTimeWarp.effect_name.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"LinearTimeWarp.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": true, \"enabled\": true, \"time_scalar\": 1.0}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:LinearTimeWarp.effect_name.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"LinearTimeWarp.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": 1, \"enabled\": true, \"time_scalar\": 1.0}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:LinearTimeWarp.effect_name.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"LinearTimeWarp.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": \"sample\", \"enabled\": true, \"time_scalar\": 1.0}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"LinearTimeWarp.1\",\"metadata\":{},\"name\":\"\",\"effect_name\":\"sample\",\"enabled\":true,\"time_scalar\":1.0}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:LinearTimeWarp.effect_name.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"LinearTimeWarp.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": [], \"enabled\": true, \"time_scalar\": 1.0}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:LinearTimeWarp.effect_name.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"LinearTimeWarp.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": {}, \"enabled\": true, \"time_scalar\": 1.0}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:LinearTimeWarp.enabled.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"LinearTimeWarp.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": \"LinearTimeWarp\", \"time_scalar\": 1.0}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"LinearTimeWarp.1\",\"metadata\":{},\"name\":\"\",\"effect_name\":\"LinearTimeWarp\",\"enabled\":true,\"time_scalar\":1.0}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:LinearTimeWarp.enabled.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"LinearTimeWarp.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": \"LinearTimeWarp\", \"enabled\": null, \"time_scalar\": 1.0}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:LinearTimeWarp.enabled.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"LinearTimeWarp.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": \"LinearTimeWarp\", \"enabled\": true, \"time_scalar\": 1.0}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"LinearTimeWarp.1\",\"metadata\":{},\"name\":\"\",\"effect_name\":\"LinearTimeWarp\",\"enabled\":true,\"time_scalar\":1.0}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:LinearTimeWarp.enabled.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"LinearTimeWarp.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": \"LinearTimeWarp\", \"enabled\": 1, \"time_scalar\": 1.0}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:LinearTimeWarp.enabled.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"LinearTimeWarp.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": \"LinearTimeWarp\", \"enabled\": \"sample\", \"time_scalar\": 1.0}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:LinearTimeWarp.enabled.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"LinearTimeWarp.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": \"LinearTimeWarp\", \"enabled\": [], \"time_scalar\": 1.0}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:LinearTimeWarp.enabled.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"LinearTimeWarp.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": \"LinearTimeWarp\", \"enabled\": {}, \"time_scalar\": 1.0}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:LinearTimeWarp.time_scalar.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"LinearTimeWarp.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": \"LinearTimeWarp\", \"enabled\": true}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:LinearTimeWarp.time_scalar.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"LinearTimeWarp.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": \"LinearTimeWarp\", \"enabled\": true, \"time_scalar\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:LinearTimeWarp.time_scalar.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"LinearTimeWarp.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": \"LinearTimeWarp\", \"enabled\": true, \"time_scalar\": true}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:LinearTimeWarp.time_scalar.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"LinearTimeWarp.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": \"LinearTimeWarp\", \"enabled\": true, \"time_scalar\": 1}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"LinearTimeWarp.1\",\"metadata\":{},\"name\":\"\",\"effect_name\":\"LinearTimeWarp\",\"enabled\":true,\"time_scalar\":1.0}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:LinearTimeWarp.time_scalar.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"LinearTimeWarp.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": \"LinearTimeWarp\", \"enabled\": true, \"time_scalar\": \"sample\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:LinearTimeWarp.time_scalar.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"LinearTimeWarp.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": \"LinearTimeWarp\", \"enabled\": true, \"time_scalar\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:LinearTimeWarp.time_scalar.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"LinearTimeWarp.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": \"LinearTimeWarp\", \"enabled\": true, \"time_scalar\": {}}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Marker.metadata.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Marker.2\", \"name\": \"\", \"color\": \"RED\", \"marked_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"comment\": \"\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Marker.2\",\"metadata\":{},\"name\":\"\",\"color\":\"RED\",\"marked_range\":{\"OTIO_SCHEMA\":\"TimeRange.1\",\"duration\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0},\"start_time\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0}},\"comment\":\"\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Marker.metadata.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Marker.2\", \"metadata\": null, \"name\": \"\", \"color\": \"RED\", \"marked_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"comment\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Marker.metadata.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Marker.2\", \"metadata\": true, \"name\": \"\", \"color\": \"RED\", \"marked_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"comment\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Marker.metadata.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Marker.2\", \"metadata\": 1, \"name\": \"\", \"color\": \"RED\", \"marked_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"comment\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Marker.metadata.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Marker.2\", \"metadata\": \"sample\", \"name\": \"\", \"color\": \"RED\", \"marked_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"comment\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Marker.metadata.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Marker.2\", \"metadata\": [], \"name\": \"\", \"color\": \"RED\", \"marked_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"comment\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Marker.metadata.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Marker.2\", \"metadata\": {}, \"name\": \"\", \"color\": \"RED\", \"marked_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"comment\": \"\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Marker.2\",\"metadata\":{},\"name\":\"\",\"color\":\"RED\",\"marked_range\":{\"OTIO_SCHEMA\":\"TimeRange.1\",\"duration\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0},\"start_time\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0}},\"comment\":\"\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Marker.name.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Marker.2\", \"metadata\": {}, \"color\": \"RED\", \"marked_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"comment\": \"\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Marker.2\",\"metadata\":{},\"name\":\"\",\"color\":\"RED\",\"marked_range\":{\"OTIO_SCHEMA\":\"TimeRange.1\",\"duration\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0},\"start_time\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0}},\"comment\":\"\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Marker.name.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Marker.2\", \"metadata\": {}, \"name\": null, \"color\": \"RED\", \"marked_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"comment\": \"\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Marker.2\",\"metadata\":{},\"name\":\"\",\"color\":\"RED\",\"marked_range\":{\"OTIO_SCHEMA\":\"TimeRange.1\",\"duration\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0},\"start_time\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0}},\"comment\":\"\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Marker.name.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Marker.2\", \"metadata\": {}, \"name\": true, \"color\": \"RED\", \"marked_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"comment\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Marker.name.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Marker.2\", \"metadata\": {}, \"name\": 1, \"color\": \"RED\", \"marked_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"comment\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Marker.name.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Marker.2\", \"metadata\": {}, \"name\": \"sample\", \"color\": \"RED\", \"marked_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"comment\": \"\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Marker.2\",\"metadata\":{},\"name\":\"sample\",\"color\":\"RED\",\"marked_range\":{\"OTIO_SCHEMA\":\"TimeRange.1\",\"duration\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0},\"start_time\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0}},\"comment\":\"\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Marker.name.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Marker.2\", \"metadata\": {}, \"name\": [], \"color\": \"RED\", \"marked_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"comment\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Marker.name.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Marker.2\", \"metadata\": {}, \"name\": {}, \"color\": \"RED\", \"marked_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"comment\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Marker.color.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Marker.2\", \"metadata\": {}, \"name\": \"\", \"marked_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"comment\": \"\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Marker.2\",\"metadata\":{},\"name\":\"\",\"color\":\"GREEN\",\"marked_range\":{\"OTIO_SCHEMA\":\"TimeRange.1\",\"duration\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0},\"start_time\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0}},\"comment\":\"\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Marker.color.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Marker.2\", \"metadata\": {}, \"name\": \"\", \"color\": null, \"marked_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"comment\": \"\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Marker.2\",\"metadata\":{},\"name\":\"\",\"color\":\"\",\"marked_range\":{\"OTIO_SCHEMA\":\"TimeRange.1\",\"duration\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0},\"start_time\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0}},\"comment\":\"\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Marker.color.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Marker.2\", \"metadata\": {}, \"name\": \"\", \"color\": true, \"marked_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"comment\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Marker.color.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Marker.2\", \"metadata\": {}, \"name\": \"\", \"color\": 1, \"marked_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"comment\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Marker.color.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Marker.2\", \"metadata\": {}, \"name\": \"\", \"color\": \"sample\", \"marked_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"comment\": \"\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Marker.2\",\"metadata\":{},\"name\":\"\",\"color\":\"sample\",\"marked_range\":{\"OTIO_SCHEMA\":\"TimeRange.1\",\"duration\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0},\"start_time\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0}},\"comment\":\"\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Marker.color.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Marker.2\", \"metadata\": {}, \"name\": \"\", \"color\": [], \"marked_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"comment\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Marker.color.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Marker.2\", \"metadata\": {}, \"name\": \"\", \"color\": {}, \"marked_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"comment\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Marker.marked_range.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Marker.2\", \"metadata\": {}, \"name\": \"\", \"color\": \"RED\", \"comment\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Marker.marked_range.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Marker.2\", \"metadata\": {}, \"name\": \"\", \"color\": \"RED\", \"marked_range\": null, \"comment\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Marker.marked_range.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Marker.2\", \"metadata\": {}, \"name\": \"\", \"color\": \"RED\", \"marked_range\": true, \"comment\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Marker.marked_range.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Marker.2\", \"metadata\": {}, \"name\": \"\", \"color\": \"RED\", \"marked_range\": 1, \"comment\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Marker.marked_range.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Marker.2\", \"metadata\": {}, \"name\": \"\", \"color\": \"RED\", \"marked_range\": \"sample\", \"comment\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Marker.marked_range.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Marker.2\", \"metadata\": {}, \"name\": \"\", \"color\": \"RED\", \"marked_range\": [], \"comment\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Marker.marked_range.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Marker.2\", \"metadata\": {}, \"name\": \"\", \"color\": \"RED\", \"marked_range\": {}, \"comment\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Marker.comment.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Marker.2\", \"metadata\": {}, \"name\": \"\", \"color\": \"RED\", \"marked_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Marker.2\",\"metadata\":{},\"name\":\"\",\"color\":\"RED\",\"marked_range\":{\"OTIO_SCHEMA\":\"TimeRange.1\",\"duration\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0},\"start_time\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0}},\"comment\":\"\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Marker.comment.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Marker.2\", \"metadata\": {}, \"name\": \"\", \"color\": \"RED\", \"marked_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"comment\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Marker.2\",\"metadata\":{},\"name\":\"\",\"color\":\"RED\",\"marked_range\":{\"OTIO_SCHEMA\":\"TimeRange.1\",\"duration\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0},\"start_time\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0}},\"comment\":\"\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Marker.comment.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Marker.2\", \"metadata\": {}, \"name\": \"\", \"color\": \"RED\", \"marked_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"comment\": true}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Marker.comment.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Marker.2\", \"metadata\": {}, \"name\": \"\", \"color\": \"RED\", \"marked_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"comment\": 1}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Marker.comment.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Marker.2\", \"metadata\": {}, \"name\": \"\", \"color\": \"RED\", \"marked_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"comment\": \"sample\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Marker.2\",\"metadata\":{},\"name\":\"\",\"color\":\"RED\",\"marked_range\":{\"OTIO_SCHEMA\":\"TimeRange.1\",\"duration\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0},\"start_time\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0}},\"comment\":\"sample\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Marker.comment.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Marker.2\", \"metadata\": {}, \"name\": \"\", \"color\": \"RED\", \"marked_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"comment\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Marker.comment.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Marker.2\", \"metadata\": {}, \"name\": \"\", \"color\": \"RED\", \"marked_range\": {\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}, \"comment\": {}}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:MediaLinker.filepath.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"MediaLinker.1\", \"name\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"MediaLinker.1\",\"filepath\":null,\"name\":null}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:MediaLinker.filepath.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"MediaLinker.1\", \"filepath\": null, \"name\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"MediaLinker.1\",\"filepath\":null,\"name\":null}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:MediaLinker.filepath.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"MediaLinker.1\", \"filepath\": true, \"name\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"MediaLinker.1\",\"filepath\":true,\"name\":null}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:MediaLinker.filepath.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"MediaLinker.1\", \"filepath\": 1, \"name\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"MediaLinker.1\",\"filepath\":1,\"name\":null}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:MediaLinker.filepath.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"MediaLinker.1\", \"filepath\": \"sample\", \"name\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"MediaLinker.1\",\"filepath\":\"sample\",\"name\":null}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:MediaLinker.filepath.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"MediaLinker.1\", \"filepath\": [], \"name\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"MediaLinker.1\",\"filepath\":[],\"name\":null}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:MediaLinker.filepath.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"MediaLinker.1\", \"filepath\": {}, \"name\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"MediaLinker.1\",\"filepath\":{},\"name\":null}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:MediaLinker.name.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"MediaLinker.1\", \"filepath\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"MediaLinker.1\",\"filepath\":null,\"name\":null}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:MediaLinker.name.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"MediaLinker.1\", \"filepath\": null, \"name\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"MediaLinker.1\",\"filepath\":null,\"name\":null}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:MediaLinker.name.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"MediaLinker.1\", \"filepath\": null, \"name\": true}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"MediaLinker.1\",\"filepath\":null,\"name\":true}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:MediaLinker.name.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"MediaLinker.1\", \"filepath\": null, \"name\": 1}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"MediaLinker.1\",\"filepath\":null,\"name\":1}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:MediaLinker.name.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"MediaLinker.1\", \"filepath\": null, \"name\": \"sample\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"MediaLinker.1\",\"filepath\":null,\"name\":\"sample\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:MediaLinker.name.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"MediaLinker.1\", \"filepath\": null, \"name\": []}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"MediaLinker.1\",\"filepath\":null,\"name\":[]}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:MediaLinker.name.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"MediaLinker.1\", \"filepath\": null, \"name\": {}}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"MediaLinker.1\",\"filepath\":null,\"name\":{}}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:MediaReference.metadata.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"MediaReference.1\", \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"MediaReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:MediaReference.metadata.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"MediaReference.1\", \"metadata\": null, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:MediaReference.metadata.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"MediaReference.1\", \"metadata\": true, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:MediaReference.metadata.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"MediaReference.1\", \"metadata\": 1, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:MediaReference.metadata.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"MediaReference.1\", \"metadata\": \"sample\", \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:MediaReference.metadata.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"MediaReference.1\", \"metadata\": [], \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:MediaReference.metadata.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"MediaReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"MediaReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:MediaReference.name.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"MediaReference.1\", \"metadata\": {}, \"available_range\": null, \"available_image_bounds\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"MediaReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:MediaReference.name.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"MediaReference.1\", \"metadata\": {}, \"name\": null, \"available_range\": null, \"available_image_bounds\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"MediaReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:MediaReference.name.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"MediaReference.1\", \"metadata\": {}, \"name\": true, \"available_range\": null, \"available_image_bounds\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:MediaReference.name.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"MediaReference.1\", \"metadata\": {}, \"name\": 1, \"available_range\": null, \"available_image_bounds\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:MediaReference.name.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"MediaReference.1\", \"metadata\": {}, \"name\": \"sample\", \"available_range\": null, \"available_image_bounds\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"MediaReference.1\",\"metadata\":{},\"name\":\"sample\",\"available_range\":null,\"available_image_bounds\":null}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:MediaReference.name.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"MediaReference.1\", \"metadata\": {}, \"name\": [], \"available_range\": null, \"available_image_bounds\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:MediaReference.name.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"MediaReference.1\", \"metadata\": {}, \"name\": {}, \"available_range\": null, \"available_image_bounds\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:MediaReference.available_range.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"MediaReference.1\", \"metadata\": {}, \"name\": \"\", \"available_image_bounds\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"MediaReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:MediaReference.available_range.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"MediaReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"MediaReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:MediaReference.available_range.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"MediaReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": true, \"available_image_bounds\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:MediaReference.available_range.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"MediaReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": 1, \"available_image_bounds\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:MediaReference.available_range.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"MediaReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": \"sample\", \"available_image_bounds\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:MediaReference.available_range.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"MediaReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": [], \"available_image_bounds\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:MediaReference.available_range.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"MediaReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": {}, \"available_image_bounds\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:MediaReference.available_image_bounds.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"MediaReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"MediaReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:MediaReference.available_image_bounds.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"MediaReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"MediaReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:MediaReference.available_image_bounds.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"MediaReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": true}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:MediaReference.available_image_bounds.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"MediaReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": 1}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:MediaReference.available_image_bounds.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"MediaReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": \"sample\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:MediaReference.available_image_bounds.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"MediaReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:MediaReference.available_image_bounds.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"MediaReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": {}}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:MissingReference.metadata.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"MissingReference.1\", \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"MissingReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:MissingReference.metadata.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": null, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:MissingReference.metadata.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": true, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:MissingReference.metadata.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": 1, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:MissingReference.metadata.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": \"sample\", \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:MissingReference.metadata.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": [], \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:MissingReference.metadata.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"MissingReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:MissingReference.name.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"available_range\": null, \"available_image_bounds\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"MissingReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:MissingReference.name.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": null, \"available_range\": null, \"available_image_bounds\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"MissingReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:MissingReference.name.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": true, \"available_range\": null, \"available_image_bounds\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:MissingReference.name.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": 1, \"available_range\": null, \"available_image_bounds\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:MissingReference.name.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"sample\", \"available_range\": null, \"available_image_bounds\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"MissingReference.1\",\"metadata\":{},\"name\":\"sample\",\"available_range\":null,\"available_image_bounds\":null}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:MissingReference.name.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": [], \"available_range\": null, \"available_image_bounds\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:MissingReference.name.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": {}, \"available_range\": null, \"available_image_bounds\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:MissingReference.available_range.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_image_bounds\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"MissingReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:MissingReference.available_range.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"MissingReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:MissingReference.available_range.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": true, \"available_image_bounds\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:MissingReference.available_range.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": 1, \"available_image_bounds\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:MissingReference.available_range.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": \"sample\", \"available_image_bounds\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:MissingReference.available_range.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": [], \"available_image_bounds\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:MissingReference.available_range.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": {}, \"available_image_bounds\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:MissingReference.available_image_bounds.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"MissingReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:MissingReference.available_image_bounds.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"MissingReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:MissingReference.available_image_bounds.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": true}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:MissingReference.available_image_bounds.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": 1}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:MissingReference.available_image_bounds.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": \"sample\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:MissingReference.available_image_bounds.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:MissingReference.available_image_bounds.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": {}}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:SchemaDef.filepath.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"SchemaDef.1\", \"name\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"SchemaDef.1\",\"filepath\":null,\"name\":null}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:SchemaDef.filepath.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"SchemaDef.1\", \"filepath\": null, \"name\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"SchemaDef.1\",\"filepath\":null,\"name\":null}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:SchemaDef.filepath.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"SchemaDef.1\", \"filepath\": true, \"name\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"SchemaDef.1\",\"filepath\":true,\"name\":null}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:SchemaDef.filepath.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"SchemaDef.1\", \"filepath\": 1, \"name\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"SchemaDef.1\",\"filepath\":1,\"name\":null}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:SchemaDef.filepath.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"SchemaDef.1\", \"filepath\": \"sample\", \"name\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"SchemaDef.1\",\"filepath\":\"sample\",\"name\":null}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:SchemaDef.filepath.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"SchemaDef.1\", \"filepath\": [], \"name\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"SchemaDef.1\",\"filepath\":[],\"name\":null}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:SchemaDef.filepath.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"SchemaDef.1\", \"filepath\": {}, \"name\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"SchemaDef.1\",\"filepath\":{},\"name\":null}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:SchemaDef.name.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"SchemaDef.1\", \"filepath\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"SchemaDef.1\",\"filepath\":null,\"name\":null}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:SchemaDef.name.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"SchemaDef.1\", \"filepath\": null, \"name\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"SchemaDef.1\",\"filepath\":null,\"name\":null}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:SchemaDef.name.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"SchemaDef.1\", \"filepath\": null, \"name\": true}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"SchemaDef.1\",\"filepath\":null,\"name\":true}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:SchemaDef.name.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"SchemaDef.1\", \"filepath\": null, \"name\": 1}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"SchemaDef.1\",\"filepath\":null,\"name\":1}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:SchemaDef.name.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"SchemaDef.1\", \"filepath\": null, \"name\": \"sample\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"SchemaDef.1\",\"filepath\":null,\"name\":\"sample\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:SchemaDef.name.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"SchemaDef.1\", \"filepath\": null, \"name\": []}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"SchemaDef.1\",\"filepath\":null,\"name\":[]}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:SchemaDef.name.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"SchemaDef.1\", \"filepath\": null, \"name\": {}}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"SchemaDef.1\",\"filepath\":null,\"name\":{}}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:SerializableCollection.metadata.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"SerializableCollection.1\", \"name\": \"\", \"children\": []}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"SerializableCollection.1\",\"metadata\":{},\"name\":\"\",\"children\":[]}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:SerializableCollection.metadata.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"SerializableCollection.1\", \"metadata\": null, \"name\": \"\", \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:SerializableCollection.metadata.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"SerializableCollection.1\", \"metadata\": true, \"name\": \"\", \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:SerializableCollection.metadata.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"SerializableCollection.1\", \"metadata\": 1, \"name\": \"\", \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:SerializableCollection.metadata.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"SerializableCollection.1\", \"metadata\": \"sample\", \"name\": \"\", \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:SerializableCollection.metadata.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"SerializableCollection.1\", \"metadata\": [], \"name\": \"\", \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:SerializableCollection.metadata.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"SerializableCollection.1\", \"metadata\": {}, \"name\": \"\", \"children\": []}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"SerializableCollection.1\",\"metadata\":{},\"name\":\"\",\"children\":[]}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:SerializableCollection.name.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"SerializableCollection.1\", \"metadata\": {}, \"children\": []}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"SerializableCollection.1\",\"metadata\":{},\"name\":\"\",\"children\":[]}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:SerializableCollection.name.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"SerializableCollection.1\", \"metadata\": {}, \"name\": null, \"children\": []}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"SerializableCollection.1\",\"metadata\":{},\"name\":\"\",\"children\":[]}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:SerializableCollection.name.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"SerializableCollection.1\", \"metadata\": {}, \"name\": true, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:SerializableCollection.name.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"SerializableCollection.1\", \"metadata\": {}, \"name\": 1, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:SerializableCollection.name.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"SerializableCollection.1\", \"metadata\": {}, \"name\": \"sample\", \"children\": []}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"SerializableCollection.1\",\"metadata\":{},\"name\":\"sample\",\"children\":[]}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:SerializableCollection.name.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"SerializableCollection.1\", \"metadata\": {}, \"name\": [], \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:SerializableCollection.name.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"SerializableCollection.1\", \"metadata\": {}, \"name\": {}, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:SerializableCollection.children.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"SerializableCollection.1\", \"metadata\": {}, \"name\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:SerializableCollection.children.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"SerializableCollection.1\", \"metadata\": {}, \"name\": \"\", \"children\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:SerializableCollection.children.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"SerializableCollection.1\", \"metadata\": {}, \"name\": \"\", \"children\": true}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:SerializableCollection.children.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"SerializableCollection.1\", \"metadata\": {}, \"name\": \"\", \"children\": 1}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:SerializableCollection.children.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"SerializableCollection.1\", \"metadata\": {}, \"name\": \"\", \"children\": \"sample\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:SerializableCollection.children.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"SerializableCollection.1\", \"metadata\": {}, \"name\": \"\", \"children\": []}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"SerializableCollection.1\",\"metadata\":{},\"name\":\"\",\"children\":[]}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:SerializableCollection.children.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"SerializableCollection.1\", \"metadata\": {}, \"name\": \"\", \"children\": {}}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:SerializableObjectWithMetadata.metadata.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"SerializableObjectWithMetadata.1\", \"name\": \"\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"SerializableObjectWithMetadata.1\",\"metadata\":{},\"name\":\"\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:SerializableObjectWithMetadata.metadata.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"SerializableObjectWithMetadata.1\", \"metadata\": null, \"name\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:SerializableObjectWithMetadata.metadata.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"SerializableObjectWithMetadata.1\", \"metadata\": true, \"name\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:SerializableObjectWithMetadata.metadata.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"SerializableObjectWithMetadata.1\", \"metadata\": 1, \"name\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:SerializableObjectWithMetadata.metadata.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"SerializableObjectWithMetadata.1\", \"metadata\": \"sample\", \"name\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:SerializableObjectWithMetadata.metadata.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"SerializableObjectWithMetadata.1\", \"metadata\": [], \"name\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:SerializableObjectWithMetadata.metadata.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"SerializableObjectWithMetadata.1\", \"metadata\": {}, \"name\": \"\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"SerializableObjectWithMetadata.1\",\"metadata\":{},\"name\":\"\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:SerializableObjectWithMetadata.name.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"SerializableObjectWithMetadata.1\", \"metadata\": {}}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"SerializableObjectWithMetadata.1\",\"metadata\":{},\"name\":\"\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:SerializableObjectWithMetadata.name.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"SerializableObjectWithMetadata.1\", \"metadata\": {}, \"name\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"SerializableObjectWithMetadata.1\",\"metadata\":{},\"name\":\"\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:SerializableObjectWithMetadata.name.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"SerializableObjectWithMetadata.1\", \"metadata\": {}, \"name\": true}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:SerializableObjectWithMetadata.name.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"SerializableObjectWithMetadata.1\", \"metadata\": {}, \"name\": 1}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:SerializableObjectWithMetadata.name.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"SerializableObjectWithMetadata.1\", \"metadata\": {}, \"name\": \"sample\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"SerializableObjectWithMetadata.1\",\"metadata\":{},\"name\":\"sample\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:SerializableObjectWithMetadata.name.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"SerializableObjectWithMetadata.1\", \"metadata\": {}, \"name\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:SerializableObjectWithMetadata.name.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"SerializableObjectWithMetadata.1\", \"metadata\": {}, \"name\": {}}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Stack.metadata.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Stack.1\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"children\":[]}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Stack.metadata.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": null, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Stack.metadata.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": true, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Stack.metadata.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": 1, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Stack.metadata.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": \"sample\", \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Stack.metadata.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": [], \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Stack.metadata.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Stack.1\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"children\":[]}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Stack.name.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Stack.1\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"children\":[]}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Stack.name.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": null, \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Stack.1\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"children\":[]}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Stack.name.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": true, \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Stack.name.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": 1, \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Stack.name.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"sample\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Stack.1\",\"metadata\":{},\"name\":\"sample\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"children\":[]}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Stack.name.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": [], \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Stack.name.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": {}, \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Stack.source_range.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"\", \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Stack.1\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"children\":[]}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Stack.source_range.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Stack.1\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"children\":[]}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Stack.source_range.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": true, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Stack.source_range.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": 1, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Stack.source_range.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": \"sample\", \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Stack.source_range.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": [], \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Stack.source_range.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": {}, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Stack.effects.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Stack.1\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"children\":[]}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Stack.effects.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": null, \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Stack.effects.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": true, \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Stack.effects.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": 1, \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Stack.effects.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": \"sample\", \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Stack.effects.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Stack.1\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"children\":[]}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Stack.effects.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": {}, \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Stack.markers.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Stack.1\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"children\":[]}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Stack.markers.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": null, \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Stack.markers.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": true, \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Stack.markers.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": 1, \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Stack.markers.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": \"sample\", \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Stack.markers.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Stack.1\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"children\":[]}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Stack.markers.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": {}, \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Stack.enabled.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"color\": null, \"children\": []}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Stack.1\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"children\":[]}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Stack.enabled.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": null, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Stack.enabled.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Stack.1\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"children\":[]}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Stack.enabled.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": 1, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Stack.enabled.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": \"sample\", \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Stack.enabled.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": [], \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Stack.enabled.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": {}, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Stack.color.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"children\": []}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Stack.1\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"children\":[]}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Stack.color.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Stack.1\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"children\":[]}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Stack.color.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": true, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Stack.color.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": 1, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Stack.color.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": \"sample\", \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Stack.color.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": [], \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Stack.color.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": {}, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Stack.children.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Stack.children.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Stack.children.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": true}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Stack.children.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": 1}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Stack.children.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": \"sample\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Stack.children.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Stack.1\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"children\":[]}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Stack.children.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": {}}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:TimeEffect.metadata.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"TimeEffect.1\", \"name\": \"\", \"effect_name\": \"\", \"enabled\": true}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"TimeEffect.1\",\"metadata\":{},\"name\":\"\",\"effect_name\":\"\",\"enabled\":true}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:TimeEffect.metadata.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"TimeEffect.1\", \"metadata\": null, \"name\": \"\", \"effect_name\": \"\", \"enabled\": true}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:TimeEffect.metadata.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"TimeEffect.1\", \"metadata\": true, \"name\": \"\", \"effect_name\": \"\", \"enabled\": true}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:TimeEffect.metadata.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"TimeEffect.1\", \"metadata\": 1, \"name\": \"\", \"effect_name\": \"\", \"enabled\": true}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:TimeEffect.metadata.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"TimeEffect.1\", \"metadata\": \"sample\", \"name\": \"\", \"effect_name\": \"\", \"enabled\": true}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:TimeEffect.metadata.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"TimeEffect.1\", \"metadata\": [], \"name\": \"\", \"effect_name\": \"\", \"enabled\": true}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:TimeEffect.metadata.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"TimeEffect.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": \"\", \"enabled\": true}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"TimeEffect.1\",\"metadata\":{},\"name\":\"\",\"effect_name\":\"\",\"enabled\":true}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:TimeEffect.name.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"TimeEffect.1\", \"metadata\": {}, \"effect_name\": \"\", \"enabled\": true}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"TimeEffect.1\",\"metadata\":{},\"name\":\"\",\"effect_name\":\"\",\"enabled\":true}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:TimeEffect.name.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"TimeEffect.1\", \"metadata\": {}, \"name\": null, \"effect_name\": \"\", \"enabled\": true}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"TimeEffect.1\",\"metadata\":{},\"name\":\"\",\"effect_name\":\"\",\"enabled\":true}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:TimeEffect.name.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"TimeEffect.1\", \"metadata\": {}, \"name\": true, \"effect_name\": \"\", \"enabled\": true}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:TimeEffect.name.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"TimeEffect.1\", \"metadata\": {}, \"name\": 1, \"effect_name\": \"\", \"enabled\": true}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:TimeEffect.name.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"TimeEffect.1\", \"metadata\": {}, \"name\": \"sample\", \"effect_name\": \"\", \"enabled\": true}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"TimeEffect.1\",\"metadata\":{},\"name\":\"sample\",\"effect_name\":\"\",\"enabled\":true}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:TimeEffect.name.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"TimeEffect.1\", \"metadata\": {}, \"name\": [], \"effect_name\": \"\", \"enabled\": true}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:TimeEffect.name.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"TimeEffect.1\", \"metadata\": {}, \"name\": {}, \"effect_name\": \"\", \"enabled\": true}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:TimeEffect.effect_name.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"TimeEffect.1\", \"metadata\": {}, \"name\": \"\", \"enabled\": true}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:TimeEffect.effect_name.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"TimeEffect.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": null, \"enabled\": true}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"TimeEffect.1\",\"metadata\":{},\"name\":\"\",\"effect_name\":\"\",\"enabled\":true}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:TimeEffect.effect_name.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"TimeEffect.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": true, \"enabled\": true}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:TimeEffect.effect_name.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"TimeEffect.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": 1, \"enabled\": true}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:TimeEffect.effect_name.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"TimeEffect.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": \"sample\", \"enabled\": true}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"TimeEffect.1\",\"metadata\":{},\"name\":\"\",\"effect_name\":\"sample\",\"enabled\":true}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:TimeEffect.effect_name.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"TimeEffect.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": [], \"enabled\": true}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:TimeEffect.effect_name.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"TimeEffect.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": {}, \"enabled\": true}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:TimeEffect.enabled.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"TimeEffect.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": \"\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"TimeEffect.1\",\"metadata\":{},\"name\":\"\",\"effect_name\":\"\",\"enabled\":true}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:TimeEffect.enabled.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"TimeEffect.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": \"\", \"enabled\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:TimeEffect.enabled.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"TimeEffect.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": \"\", \"enabled\": true}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"TimeEffect.1\",\"metadata\":{},\"name\":\"\",\"effect_name\":\"\",\"enabled\":true}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:TimeEffect.enabled.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"TimeEffect.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": \"\", \"enabled\": 1}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:TimeEffect.enabled.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"TimeEffect.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": \"\", \"enabled\": \"sample\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:TimeEffect.enabled.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"TimeEffect.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": \"\", \"enabled\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:TimeEffect.enabled.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"TimeEffect.1\", \"metadata\": {}, \"name\": \"\", \"effect_name\": \"\", \"enabled\": {}}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Timeline.metadata.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Timeline.1\", \"name\": \"\", \"global_start_time\": null, \"tracks\": {\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"tracks\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Timeline.1\",\"metadata\":{},\"name\":\"\",\"global_start_time\":null,\"tracks\":{\"OTIO_SCHEMA\":\"Stack.1\",\"metadata\":{},\"name\":\"tracks\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"children\":[]}}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Timeline.metadata.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Timeline.1\", \"metadata\": null, \"name\": \"\", \"global_start_time\": null, \"tracks\": {\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"tracks\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Timeline.metadata.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Timeline.1\", \"metadata\": true, \"name\": \"\", \"global_start_time\": null, \"tracks\": {\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"tracks\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Timeline.metadata.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Timeline.1\", \"metadata\": 1, \"name\": \"\", \"global_start_time\": null, \"tracks\": {\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"tracks\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Timeline.metadata.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Timeline.1\", \"metadata\": \"sample\", \"name\": \"\", \"global_start_time\": null, \"tracks\": {\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"tracks\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Timeline.metadata.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Timeline.1\", \"metadata\": [], \"name\": \"\", \"global_start_time\": null, \"tracks\": {\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"tracks\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Timeline.metadata.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Timeline.1\", \"metadata\": {}, \"name\": \"\", \"global_start_time\": null, \"tracks\": {\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"tracks\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Timeline.1\",\"metadata\":{},\"name\":\"\",\"global_start_time\":null,\"tracks\":{\"OTIO_SCHEMA\":\"Stack.1\",\"metadata\":{},\"name\":\"tracks\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"children\":[]}}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Timeline.name.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Timeline.1\", \"metadata\": {}, \"global_start_time\": null, \"tracks\": {\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"tracks\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Timeline.1\",\"metadata\":{},\"name\":\"\",\"global_start_time\":null,\"tracks\":{\"OTIO_SCHEMA\":\"Stack.1\",\"metadata\":{},\"name\":\"tracks\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"children\":[]}}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Timeline.name.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Timeline.1\", \"metadata\": {}, \"name\": null, \"global_start_time\": null, \"tracks\": {\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"tracks\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Timeline.1\",\"metadata\":{},\"name\":\"\",\"global_start_time\":null,\"tracks\":{\"OTIO_SCHEMA\":\"Stack.1\",\"metadata\":{},\"name\":\"tracks\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"children\":[]}}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Timeline.name.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Timeline.1\", \"metadata\": {}, \"name\": true, \"global_start_time\": null, \"tracks\": {\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"tracks\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Timeline.name.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Timeline.1\", \"metadata\": {}, \"name\": 1, \"global_start_time\": null, \"tracks\": {\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"tracks\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Timeline.name.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Timeline.1\", \"metadata\": {}, \"name\": \"sample\", \"global_start_time\": null, \"tracks\": {\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"tracks\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Timeline.1\",\"metadata\":{},\"name\":\"sample\",\"global_start_time\":null,\"tracks\":{\"OTIO_SCHEMA\":\"Stack.1\",\"metadata\":{},\"name\":\"tracks\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"children\":[]}}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Timeline.name.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Timeline.1\", \"metadata\": {}, \"name\": [], \"global_start_time\": null, \"tracks\": {\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"tracks\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Timeline.name.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Timeline.1\", \"metadata\": {}, \"name\": {}, \"global_start_time\": null, \"tracks\": {\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"tracks\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Timeline.global_start_time.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Timeline.1\", \"metadata\": {}, \"name\": \"\", \"tracks\": {\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"tracks\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Timeline.1\",\"metadata\":{},\"name\":\"\",\"global_start_time\":null,\"tracks\":{\"OTIO_SCHEMA\":\"Stack.1\",\"metadata\":{},\"name\":\"tracks\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"children\":[]}}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Timeline.global_start_time.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Timeline.1\", \"metadata\": {}, \"name\": \"\", \"global_start_time\": null, \"tracks\": {\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"tracks\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Timeline.1\",\"metadata\":{},\"name\":\"\",\"global_start_time\":null,\"tracks\":{\"OTIO_SCHEMA\":\"Stack.1\",\"metadata\":{},\"name\":\"tracks\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"children\":[]}}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Timeline.global_start_time.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Timeline.1\", \"metadata\": {}, \"name\": \"\", \"global_start_time\": true, \"tracks\": {\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"tracks\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Timeline.global_start_time.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Timeline.1\", \"metadata\": {}, \"name\": \"\", \"global_start_time\": 1, \"tracks\": {\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"tracks\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Timeline.global_start_time.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Timeline.1\", \"metadata\": {}, \"name\": \"\", \"global_start_time\": \"sample\", \"tracks\": {\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"tracks\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Timeline.global_start_time.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Timeline.1\", \"metadata\": {}, \"name\": \"\", \"global_start_time\": [], \"tracks\": {\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"tracks\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Timeline.global_start_time.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Timeline.1\", \"metadata\": {}, \"name\": \"\", \"global_start_time\": {}, \"tracks\": {\"OTIO_SCHEMA\": \"Stack.1\", \"metadata\": {}, \"name\": \"tracks\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Timeline.tracks.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Timeline.1\", \"metadata\": {}, \"name\": \"\", \"global_start_time\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Timeline.tracks.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Timeline.1\", \"metadata\": {}, \"name\": \"\", \"global_start_time\": null, \"tracks\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Timeline.1\",\"metadata\":{},\"name\":\"\",\"global_start_time\":null,\"tracks\":null}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Timeline.tracks.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Timeline.1\", \"metadata\": {}, \"name\": \"\", \"global_start_time\": null, \"tracks\": true}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Timeline.tracks.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Timeline.1\", \"metadata\": {}, \"name\": \"\", \"global_start_time\": null, \"tracks\": 1}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Timeline.tracks.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Timeline.1\", \"metadata\": {}, \"name\": \"\", \"global_start_time\": null, \"tracks\": \"sample\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Timeline.tracks.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Timeline.1\", \"metadata\": {}, \"name\": \"\", \"global_start_time\": null, \"tracks\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Timeline.tracks.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Timeline.1\", \"metadata\": {}, \"name\": \"\", \"global_start_time\": null, \"tracks\": {}}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Track.metadata.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [], \"kind\": \"Video\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Track.1\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"children\":[],\"kind\":\"Video\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Track.metadata.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": null, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [], \"kind\": \"Video\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Track.metadata.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": true, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [], \"kind\": \"Video\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Track.metadata.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": 1, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [], \"kind\": \"Video\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Track.metadata.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": \"sample\", \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [], \"kind\": \"Video\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Track.metadata.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": [], \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [], \"kind\": \"Video\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Track.metadata.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [], \"kind\": \"Video\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Track.1\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"children\":[],\"kind\":\"Video\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Track.name.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [], \"kind\": \"Video\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Track.1\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"children\":[],\"kind\":\"Video\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Track.name.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": null, \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [], \"kind\": \"Video\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Track.1\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"children\":[],\"kind\":\"Video\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Track.name.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": true, \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [], \"kind\": \"Video\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Track.name.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": 1, \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [], \"kind\": \"Video\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Track.name.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"sample\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [], \"kind\": \"Video\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Track.1\",\"metadata\":{},\"name\":\"sample\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"children\":[],\"kind\":\"Video\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Track.name.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": [], \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [], \"kind\": \"Video\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Track.name.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": {}, \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [], \"kind\": \"Video\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Track.source_range.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [], \"kind\": \"Video\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Track.1\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"children\":[],\"kind\":\"Video\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Track.source_range.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [], \"kind\": \"Video\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Track.1\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"children\":[],\"kind\":\"Video\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Track.source_range.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": true, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [], \"kind\": \"Video\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Track.source_range.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": 1, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [], \"kind\": \"Video\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Track.source_range.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": \"sample\", \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [], \"kind\": \"Video\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Track.source_range.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": [], \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [], \"kind\": \"Video\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Track.source_range.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": {}, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [], \"kind\": \"Video\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Track.effects.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [], \"kind\": \"Video\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Track.1\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"children\":[],\"kind\":\"Video\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Track.effects.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": null, \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [], \"kind\": \"Video\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Track.effects.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": true, \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [], \"kind\": \"Video\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Track.effects.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": 1, \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [], \"kind\": \"Video\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Track.effects.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": \"sample\", \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [], \"kind\": \"Video\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Track.effects.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [], \"kind\": \"Video\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Track.1\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"children\":[],\"kind\":\"Video\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Track.effects.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": {}, \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [], \"kind\": \"Video\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Track.markers.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"enabled\": true, \"color\": null, \"children\": [], \"kind\": \"Video\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Track.1\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"children\":[],\"kind\":\"Video\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Track.markers.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": null, \"enabled\": true, \"color\": null, \"children\": [], \"kind\": \"Video\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Track.markers.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": true, \"enabled\": true, \"color\": null, \"children\": [], \"kind\": \"Video\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Track.markers.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": 1, \"enabled\": true, \"color\": null, \"children\": [], \"kind\": \"Video\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Track.markers.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": \"sample\", \"enabled\": true, \"color\": null, \"children\": [], \"kind\": \"Video\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Track.markers.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [], \"kind\": \"Video\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Track.1\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"children\":[],\"kind\":\"Video\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Track.markers.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": {}, \"enabled\": true, \"color\": null, \"children\": [], \"kind\": \"Video\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Track.enabled.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"color\": null, \"children\": [], \"kind\": \"Video\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Track.1\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"children\":[],\"kind\":\"Video\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Track.enabled.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": null, \"color\": null, \"children\": [], \"kind\": \"Video\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Track.enabled.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [], \"kind\": \"Video\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Track.1\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"children\":[],\"kind\":\"Video\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Track.enabled.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": 1, \"color\": null, \"children\": [], \"kind\": \"Video\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Track.enabled.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": \"sample\", \"color\": null, \"children\": [], \"kind\": \"Video\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Track.enabled.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": [], \"color\": null, \"children\": [], \"kind\": \"Video\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Track.enabled.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": {}, \"color\": null, \"children\": [], \"kind\": \"Video\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Track.color.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"children\": [], \"kind\": \"Video\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Track.1\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"children\":[],\"kind\":\"Video\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Track.color.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [], \"kind\": \"Video\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Track.1\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"children\":[],\"kind\":\"Video\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Track.color.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": true, \"children\": [], \"kind\": \"Video\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Track.color.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": 1, \"children\": [], \"kind\": \"Video\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Track.color.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": \"sample\", \"children\": [], \"kind\": \"Video\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Track.color.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": [], \"children\": [], \"kind\": \"Video\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Track.color.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": {}, \"children\": [], \"kind\": \"Video\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Track.children.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"kind\": \"Video\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Track.children.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": null, \"kind\": \"Video\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Track.children.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": true, \"kind\": \"Video\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Track.children.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": 1, \"kind\": \"Video\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Track.children.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": \"sample\", \"kind\": \"Video\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Track.children.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [], \"kind\": \"Video\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Track.1\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"children\":[],\"kind\":\"Video\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Track.children.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": {}, \"kind\": \"Video\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Track.kind.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Track.kind.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [], \"kind\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Track.1\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"children\":[],\"kind\":\"\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Track.kind.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [], \"kind\": true}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Track.kind.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [], \"kind\": 1}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Track.kind.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [], \"kind\": \"sample\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Track.1\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"children\":[],\"kind\":\"sample\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Track.kind.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [], \"kind\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Track.kind.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Track.1\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"children\": [], \"kind\": {}}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Transition.metadata.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Transition.1\", \"name\": \"\", \"in_offset\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"out_offset\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"transition_type\": \"\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Transition.1\",\"metadata\":{},\"name\":\"\",\"in_offset\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0},\"out_offset\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0},\"transition_type\":\"\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Transition.metadata.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Transition.1\", \"metadata\": null, \"name\": \"\", \"in_offset\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"out_offset\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"transition_type\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Transition.metadata.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Transition.1\", \"metadata\": true, \"name\": \"\", \"in_offset\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"out_offset\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"transition_type\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Transition.metadata.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Transition.1\", \"metadata\": 1, \"name\": \"\", \"in_offset\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"out_offset\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"transition_type\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Transition.metadata.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Transition.1\", \"metadata\": \"sample\", \"name\": \"\", \"in_offset\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"out_offset\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"transition_type\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Transition.metadata.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Transition.1\", \"metadata\": [], \"name\": \"\", \"in_offset\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"out_offset\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"transition_type\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Transition.metadata.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Transition.1\", \"metadata\": {}, \"name\": \"\", \"in_offset\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"out_offset\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"transition_type\": \"\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Transition.1\",\"metadata\":{},\"name\":\"\",\"in_offset\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0},\"out_offset\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0},\"transition_type\":\"\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Transition.name.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Transition.1\", \"metadata\": {}, \"in_offset\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"out_offset\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"transition_type\": \"\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Transition.1\",\"metadata\":{},\"name\":\"\",\"in_offset\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0},\"out_offset\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0},\"transition_type\":\"\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Transition.name.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Transition.1\", \"metadata\": {}, \"name\": null, \"in_offset\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"out_offset\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"transition_type\": \"\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Transition.1\",\"metadata\":{},\"name\":\"\",\"in_offset\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0},\"out_offset\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0},\"transition_type\":\"\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Transition.name.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Transition.1\", \"metadata\": {}, \"name\": true, \"in_offset\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"out_offset\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"transition_type\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Transition.name.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Transition.1\", \"metadata\": {}, \"name\": 1, \"in_offset\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"out_offset\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"transition_type\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Transition.name.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Transition.1\", \"metadata\": {}, \"name\": \"sample\", \"in_offset\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"out_offset\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"transition_type\": \"\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Transition.1\",\"metadata\":{},\"name\":\"sample\",\"in_offset\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0},\"out_offset\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0},\"transition_type\":\"\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Transition.name.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Transition.1\", \"metadata\": {}, \"name\": [], \"in_offset\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"out_offset\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"transition_type\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Transition.name.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Transition.1\", \"metadata\": {}, \"name\": {}, \"in_offset\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"out_offset\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"transition_type\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Transition.in_offset.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Transition.1\", \"metadata\": {}, \"name\": \"\", \"out_offset\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"transition_type\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Transition.in_offset.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Transition.1\", \"metadata\": {}, \"name\": \"\", \"in_offset\": null, \"out_offset\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"transition_type\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Transition.in_offset.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Transition.1\", \"metadata\": {}, \"name\": \"\", \"in_offset\": true, \"out_offset\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"transition_type\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Transition.in_offset.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Transition.1\", \"metadata\": {}, \"name\": \"\", \"in_offset\": 1, \"out_offset\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"transition_type\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Transition.in_offset.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Transition.1\", \"metadata\": {}, \"name\": \"\", \"in_offset\": \"sample\", \"out_offset\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"transition_type\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Transition.in_offset.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Transition.1\", \"metadata\": {}, \"name\": \"\", \"in_offset\": [], \"out_offset\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"transition_type\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Transition.in_offset.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Transition.1\", \"metadata\": {}, \"name\": \"\", \"in_offset\": {}, \"out_offset\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"transition_type\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Transition.out_offset.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Transition.1\", \"metadata\": {}, \"name\": \"\", \"in_offset\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"transition_type\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Transition.out_offset.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Transition.1\", \"metadata\": {}, \"name\": \"\", \"in_offset\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"out_offset\": null, \"transition_type\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Transition.out_offset.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Transition.1\", \"metadata\": {}, \"name\": \"\", \"in_offset\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"out_offset\": true, \"transition_type\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Transition.out_offset.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Transition.1\", \"metadata\": {}, \"name\": \"\", \"in_offset\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"out_offset\": 1, \"transition_type\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Transition.out_offset.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Transition.1\", \"metadata\": {}, \"name\": \"\", \"in_offset\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"out_offset\": \"sample\", \"transition_type\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Transition.out_offset.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Transition.1\", \"metadata\": {}, \"name\": \"\", \"in_offset\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"out_offset\": [], \"transition_type\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Transition.out_offset.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Transition.1\", \"metadata\": {}, \"name\": \"\", \"in_offset\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"out_offset\": {}, \"transition_type\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Transition.transition_type.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Transition.1\", \"metadata\": {}, \"name\": \"\", \"in_offset\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"out_offset\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Transition.transition_type.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Transition.1\", \"metadata\": {}, \"name\": \"\", \"in_offset\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"out_offset\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"transition_type\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Transition.1\",\"metadata\":{},\"name\":\"\",\"in_offset\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0},\"out_offset\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0},\"transition_type\":\"\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Transition.transition_type.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Transition.1\", \"metadata\": {}, \"name\": \"\", \"in_offset\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"out_offset\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"transition_type\": true}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Transition.transition_type.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Transition.1\", \"metadata\": {}, \"name\": \"\", \"in_offset\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"out_offset\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"transition_type\": 1}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Transition.transition_type.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Transition.1\", \"metadata\": {}, \"name\": \"\", \"in_offset\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"out_offset\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"transition_type\": \"sample\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Transition.1\",\"metadata\":{},\"name\":\"\",\"in_offset\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0},\"out_offset\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0},\"transition_type\":\"sample\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Transition.transition_type.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Transition.1\", \"metadata\": {}, \"name\": \"\", \"in_offset\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"out_offset\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"transition_type\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Transition.transition_type.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Transition.1\", \"metadata\": {}, \"name\": \"\", \"in_offset\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"out_offset\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"transition_type\": {}}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:PluginManifest.adapters.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"PluginManifest.1\", \"hook_scripts\": [], \"hooks\": {}, \"media_linkers\": [], \"schemadefs\": [], \"version_manifests\": {}}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"PluginManifest.1\",\"adapters\":[],\"hook_scripts\":[],\"hooks\":{},\"media_linkers\":[],\"schemadefs\":[],\"version_manifests\":{}}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:PluginManifest.adapters.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"PluginManifest.1\", \"adapters\": null, \"hook_scripts\": [], \"hooks\": {}, \"media_linkers\": [], \"schemadefs\": [], \"version_manifests\": {}}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"PluginManifest.1\",\"adapters\":null,\"hook_scripts\":[],\"hooks\":{},\"media_linkers\":[],\"schemadefs\":[],\"version_manifests\":{}}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:PluginManifest.adapters.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"PluginManifest.1\", \"adapters\": true, \"hook_scripts\": [], \"hooks\": {}, \"media_linkers\": [], \"schemadefs\": [], \"version_manifests\": {}}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"PluginManifest.1\",\"adapters\":true,\"hook_scripts\":[],\"hooks\":{},\"media_linkers\":[],\"schemadefs\":[],\"version_manifests\":{}}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:PluginManifest.adapters.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"PluginManifest.1\", \"adapters\": 1, \"hook_scripts\": [], \"hooks\": {}, \"media_linkers\": [], \"schemadefs\": [], \"version_manifests\": {}}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"PluginManifest.1\",\"adapters\":1,\"hook_scripts\":[],\"hooks\":{},\"media_linkers\":[],\"schemadefs\":[],\"version_manifests\":{}}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:PluginManifest.adapters.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"PluginManifest.1\", \"adapters\": \"sample\", \"hook_scripts\": [], \"hooks\": {}, \"media_linkers\": [], \"schemadefs\": [], \"version_manifests\": {}}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"PluginManifest.1\",\"adapters\":\"sample\",\"hook_scripts\":[],\"hooks\":{},\"media_linkers\":[],\"schemadefs\":[],\"version_manifests\":{}}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:PluginManifest.adapters.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"PluginManifest.1\", \"adapters\": [], \"hook_scripts\": [], \"hooks\": {}, \"media_linkers\": [], \"schemadefs\": [], \"version_manifests\": {}}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"PluginManifest.1\",\"adapters\":[],\"hook_scripts\":[],\"hooks\":{},\"media_linkers\":[],\"schemadefs\":[],\"version_manifests\":{}}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:PluginManifest.adapters.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"PluginManifest.1\", \"adapters\": {}, \"hook_scripts\": [], \"hooks\": {}, \"media_linkers\": [], \"schemadefs\": [], \"version_manifests\": {}}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"PluginManifest.1\",\"adapters\":{},\"hook_scripts\":[],\"hooks\":{},\"media_linkers\":[],\"schemadefs\":[],\"version_manifests\":{}}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:PluginManifest.hook_scripts.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"PluginManifest.1\", \"adapters\": [], \"hooks\": {}, \"media_linkers\": [], \"schemadefs\": [], \"version_manifests\": {}}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"PluginManifest.1\",\"adapters\":[],\"hook_scripts\":[],\"hooks\":{},\"media_linkers\":[],\"schemadefs\":[],\"version_manifests\":{}}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:PluginManifest.hook_scripts.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"PluginManifest.1\", \"adapters\": [], \"hook_scripts\": null, \"hooks\": {}, \"media_linkers\": [], \"schemadefs\": [], \"version_manifests\": {}}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"PluginManifest.1\",\"adapters\":[],\"hook_scripts\":null,\"hooks\":{},\"media_linkers\":[],\"schemadefs\":[],\"version_manifests\":{}}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:PluginManifest.hook_scripts.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"PluginManifest.1\", \"adapters\": [], \"hook_scripts\": true, \"hooks\": {}, \"media_linkers\": [], \"schemadefs\": [], \"version_manifests\": {}}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"PluginManifest.1\",\"adapters\":[],\"hook_scripts\":true,\"hooks\":{},\"media_linkers\":[],\"schemadefs\":[],\"version_manifests\":{}}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:PluginManifest.hook_scripts.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"PluginManifest.1\", \"adapters\": [], \"hook_scripts\": 1, \"hooks\": {}, \"media_linkers\": [], \"schemadefs\": [], \"version_manifests\": {}}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"PluginManifest.1\",\"adapters\":[],\"hook_scripts\":1,\"hooks\":{},\"media_linkers\":[],\"schemadefs\":[],\"version_manifests\":{}}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:PluginManifest.hook_scripts.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"PluginManifest.1\", \"adapters\": [], \"hook_scripts\": \"sample\", \"hooks\": {}, \"media_linkers\": [], \"schemadefs\": [], \"version_manifests\": {}}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"PluginManifest.1\",\"adapters\":[],\"hook_scripts\":\"sample\",\"hooks\":{},\"media_linkers\":[],\"schemadefs\":[],\"version_manifests\":{}}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:PluginManifest.hook_scripts.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"PluginManifest.1\", \"adapters\": [], \"hook_scripts\": [], \"hooks\": {}, \"media_linkers\": [], \"schemadefs\": [], \"version_manifests\": {}}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"PluginManifest.1\",\"adapters\":[],\"hook_scripts\":[],\"hooks\":{},\"media_linkers\":[],\"schemadefs\":[],\"version_manifests\":{}}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:PluginManifest.hook_scripts.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"PluginManifest.1\", \"adapters\": [], \"hook_scripts\": {}, \"hooks\": {}, \"media_linkers\": [], \"schemadefs\": [], \"version_manifests\": {}}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"PluginManifest.1\",\"adapters\":[],\"hook_scripts\":{},\"hooks\":{},\"media_linkers\":[],\"schemadefs\":[],\"version_manifests\":{}}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:PluginManifest.hooks.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"PluginManifest.1\", \"adapters\": [], \"hook_scripts\": [], \"media_linkers\": [], \"schemadefs\": [], \"version_manifests\": {}}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"PluginManifest.1\",\"adapters\":[],\"hook_scripts\":[],\"hooks\":{},\"media_linkers\":[],\"schemadefs\":[],\"version_manifests\":{}}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:PluginManifest.hooks.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"PluginManifest.1\", \"adapters\": [], \"hook_scripts\": [], \"hooks\": null, \"media_linkers\": [], \"schemadefs\": [], \"version_manifests\": {}}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"PluginManifest.1\",\"adapters\":[],\"hook_scripts\":[],\"hooks\":null,\"media_linkers\":[],\"schemadefs\":[],\"version_manifests\":{}}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:PluginManifest.hooks.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"PluginManifest.1\", \"adapters\": [], \"hook_scripts\": [], \"hooks\": true, \"media_linkers\": [], \"schemadefs\": [], \"version_manifests\": {}}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"PluginManifest.1\",\"adapters\":[],\"hook_scripts\":[],\"hooks\":true,\"media_linkers\":[],\"schemadefs\":[],\"version_manifests\":{}}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:PluginManifest.hooks.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"PluginManifest.1\", \"adapters\": [], \"hook_scripts\": [], \"hooks\": 1, \"media_linkers\": [], \"schemadefs\": [], \"version_manifests\": {}}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"PluginManifest.1\",\"adapters\":[],\"hook_scripts\":[],\"hooks\":1,\"media_linkers\":[],\"schemadefs\":[],\"version_manifests\":{}}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:PluginManifest.hooks.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"PluginManifest.1\", \"adapters\": [], \"hook_scripts\": [], \"hooks\": \"sample\", \"media_linkers\": [], \"schemadefs\": [], \"version_manifests\": {}}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"PluginManifest.1\",\"adapters\":[],\"hook_scripts\":[],\"hooks\":\"sample\",\"media_linkers\":[],\"schemadefs\":[],\"version_manifests\":{}}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:PluginManifest.hooks.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"PluginManifest.1\", \"adapters\": [], \"hook_scripts\": [], \"hooks\": [], \"media_linkers\": [], \"schemadefs\": [], \"version_manifests\": {}}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"PluginManifest.1\",\"adapters\":[],\"hook_scripts\":[],\"hooks\":[],\"media_linkers\":[],\"schemadefs\":[],\"version_manifests\":{}}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:PluginManifest.hooks.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"PluginManifest.1\", \"adapters\": [], \"hook_scripts\": [], \"hooks\": {}, \"media_linkers\": [], \"schemadefs\": [], \"version_manifests\": {}}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"PluginManifest.1\",\"adapters\":[],\"hook_scripts\":[],\"hooks\":{},\"media_linkers\":[],\"schemadefs\":[],\"version_manifests\":{}}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:PluginManifest.media_linkers.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"PluginManifest.1\", \"adapters\": [], \"hook_scripts\": [], \"hooks\": {}, \"schemadefs\": [], \"version_manifests\": {}}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"PluginManifest.1\",\"adapters\":[],\"hook_scripts\":[],\"hooks\":{},\"media_linkers\":[],\"schemadefs\":[],\"version_manifests\":{}}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:PluginManifest.media_linkers.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"PluginManifest.1\", \"adapters\": [], \"hook_scripts\": [], \"hooks\": {}, \"media_linkers\": null, \"schemadefs\": [], \"version_manifests\": {}}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"PluginManifest.1\",\"adapters\":[],\"hook_scripts\":[],\"hooks\":{},\"media_linkers\":null,\"schemadefs\":[],\"version_manifests\":{}}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:PluginManifest.media_linkers.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"PluginManifest.1\", \"adapters\": [], \"hook_scripts\": [], \"hooks\": {}, \"media_linkers\": true, \"schemadefs\": [], \"version_manifests\": {}}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"PluginManifest.1\",\"adapters\":[],\"hook_scripts\":[],\"hooks\":{},\"media_linkers\":true,\"schemadefs\":[],\"version_manifests\":{}}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:PluginManifest.media_linkers.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"PluginManifest.1\", \"adapters\": [], \"hook_scripts\": [], \"hooks\": {}, \"media_linkers\": 1, \"schemadefs\": [], \"version_manifests\": {}}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"PluginManifest.1\",\"adapters\":[],\"hook_scripts\":[],\"hooks\":{},\"media_linkers\":1,\"schemadefs\":[],\"version_manifests\":{}}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:PluginManifest.media_linkers.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"PluginManifest.1\", \"adapters\": [], \"hook_scripts\": [], \"hooks\": {}, \"media_linkers\": \"sample\", \"schemadefs\": [], \"version_manifests\": {}}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"PluginManifest.1\",\"adapters\":[],\"hook_scripts\":[],\"hooks\":{},\"media_linkers\":\"sample\",\"schemadefs\":[],\"version_manifests\":{}}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:PluginManifest.media_linkers.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"PluginManifest.1\", \"adapters\": [], \"hook_scripts\": [], \"hooks\": {}, \"media_linkers\": [], \"schemadefs\": [], \"version_manifests\": {}}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"PluginManifest.1\",\"adapters\":[],\"hook_scripts\":[],\"hooks\":{},\"media_linkers\":[],\"schemadefs\":[],\"version_manifests\":{}}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:PluginManifest.media_linkers.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"PluginManifest.1\", \"adapters\": [], \"hook_scripts\": [], \"hooks\": {}, \"media_linkers\": {}, \"schemadefs\": [], \"version_manifests\": {}}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"PluginManifest.1\",\"adapters\":[],\"hook_scripts\":[],\"hooks\":{},\"media_linkers\":{},\"schemadefs\":[],\"version_manifests\":{}}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:PluginManifest.schemadefs.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"PluginManifest.1\", \"adapters\": [], \"hook_scripts\": [], \"hooks\": {}, \"media_linkers\": [], \"version_manifests\": {}}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"PluginManifest.1\",\"adapters\":[],\"hook_scripts\":[],\"hooks\":{},\"media_linkers\":[],\"schemadefs\":[],\"version_manifests\":{}}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:PluginManifest.schemadefs.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"PluginManifest.1\", \"adapters\": [], \"hook_scripts\": [], \"hooks\": {}, \"media_linkers\": [], \"schemadefs\": null, \"version_manifests\": {}}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"PluginManifest.1\",\"adapters\":[],\"hook_scripts\":[],\"hooks\":{},\"media_linkers\":[],\"schemadefs\":null,\"version_manifests\":{}}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:PluginManifest.schemadefs.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"PluginManifest.1\", \"adapters\": [], \"hook_scripts\": [], \"hooks\": {}, \"media_linkers\": [], \"schemadefs\": true, \"version_manifests\": {}}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"PluginManifest.1\",\"adapters\":[],\"hook_scripts\":[],\"hooks\":{},\"media_linkers\":[],\"schemadefs\":true,\"version_manifests\":{}}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:PluginManifest.schemadefs.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"PluginManifest.1\", \"adapters\": [], \"hook_scripts\": [], \"hooks\": {}, \"media_linkers\": [], \"schemadefs\": 1, \"version_manifests\": {}}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"PluginManifest.1\",\"adapters\":[],\"hook_scripts\":[],\"hooks\":{},\"media_linkers\":[],\"schemadefs\":1,\"version_manifests\":{}}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:PluginManifest.schemadefs.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"PluginManifest.1\", \"adapters\": [], \"hook_scripts\": [], \"hooks\": {}, \"media_linkers\": [], \"schemadefs\": \"sample\", \"version_manifests\": {}}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"PluginManifest.1\",\"adapters\":[],\"hook_scripts\":[],\"hooks\":{},\"media_linkers\":[],\"schemadefs\":\"sample\",\"version_manifests\":{}}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:PluginManifest.schemadefs.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"PluginManifest.1\", \"adapters\": [], \"hook_scripts\": [], \"hooks\": {}, \"media_linkers\": [], \"schemadefs\": [], \"version_manifests\": {}}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"PluginManifest.1\",\"adapters\":[],\"hook_scripts\":[],\"hooks\":{},\"media_linkers\":[],\"schemadefs\":[],\"version_manifests\":{}}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:PluginManifest.schemadefs.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"PluginManifest.1\", \"adapters\": [], \"hook_scripts\": [], \"hooks\": {}, \"media_linkers\": [], \"schemadefs\": {}, \"version_manifests\": {}}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"PluginManifest.1\",\"adapters\":[],\"hook_scripts\":[],\"hooks\":{},\"media_linkers\":[],\"schemadefs\":{},\"version_manifests\":{}}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:PluginManifest.version_manifests.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"PluginManifest.1\", \"adapters\": [], \"hook_scripts\": [], \"hooks\": {}, \"media_linkers\": [], \"schemadefs\": []}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"PluginManifest.1\",\"adapters\":[],\"hook_scripts\":[],\"hooks\":{},\"media_linkers\":[],\"schemadefs\":[],\"version_manifests\":{}}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:PluginManifest.version_manifests.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"PluginManifest.1\", \"adapters\": [], \"hook_scripts\": [], \"hooks\": {}, \"media_linkers\": [], \"schemadefs\": [], \"version_manifests\": null}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"PluginManifest.1\",\"adapters\":[],\"hook_scripts\":[],\"hooks\":{},\"media_linkers\":[],\"schemadefs\":[],\"version_manifests\":null}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:PluginManifest.version_manifests.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"PluginManifest.1\", \"adapters\": [], \"hook_scripts\": [], \"hooks\": {}, \"media_linkers\": [], \"schemadefs\": [], \"version_manifests\": true}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"PluginManifest.1\",\"adapters\":[],\"hook_scripts\":[],\"hooks\":{},\"media_linkers\":[],\"schemadefs\":[],\"version_manifests\":true}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:PluginManifest.version_manifests.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"PluginManifest.1\", \"adapters\": [], \"hook_scripts\": [], \"hooks\": {}, \"media_linkers\": [], \"schemadefs\": [], \"version_manifests\": 1}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"PluginManifest.1\",\"adapters\":[],\"hook_scripts\":[],\"hooks\":{},\"media_linkers\":[],\"schemadefs\":[],\"version_manifests\":1}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:PluginManifest.version_manifests.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"PluginManifest.1\", \"adapters\": [], \"hook_scripts\": [], \"hooks\": {}, \"media_linkers\": [], \"schemadefs\": [], \"version_manifests\": \"sample\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"PluginManifest.1\",\"adapters\":[],\"hook_scripts\":[],\"hooks\":{},\"media_linkers\":[],\"schemadefs\":[],\"version_manifests\":\"sample\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:PluginManifest.version_manifests.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"PluginManifest.1\", \"adapters\": [], \"hook_scripts\": [], \"hooks\": {}, \"media_linkers\": [], \"schemadefs\": [], \"version_manifests\": []}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"PluginManifest.1\",\"adapters\":[],\"hook_scripts\":[],\"hooks\":{},\"media_linkers\":[],\"schemadefs\":[],\"version_manifests\":[]}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:PluginManifest.version_manifests.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"PluginManifest.1\", \"adapters\": [], \"hook_scripts\": [], \"hooks\": {}, \"media_linkers\": [], \"schemadefs\": [], \"version_manifests\": {}}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"PluginManifest.1\",\"adapters\":[],\"hook_scripts\":[],\"hooks\":{},\"media_linkers\":[],\"schemadefs\":[],\"version_manifests\":{}}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:RationalTime.rate.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"RationalTime.1\", \"value\": 0.0}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:RationalTime.rate.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": null, \"value\": 0.0}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:RationalTime.rate.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": true, \"value\": 0.0}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:RationalTime.rate.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1, \"value\": 0.0}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:RationalTime.rate.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": \"sample\", \"value\": 0.0}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:RationalTime.rate.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": [], \"value\": 0.0}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:RationalTime.rate.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": {}, \"value\": 0.0}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:RationalTime.value.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:RationalTime.value.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:RationalTime.value.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": true}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:RationalTime.value.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 1}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":1.0}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:RationalTime.value.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": \"sample\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:RationalTime.value.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:RationalTime.value.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": {}}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:TimeRange.duration.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"TimeRange.1\", \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:TimeRange.duration.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": null, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:TimeRange.duration.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": true, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:TimeRange.duration.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": 1, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:TimeRange.duration.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": \"sample\", \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:TimeRange.duration.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": [], \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:TimeRange.duration.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {}, \"start_time\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:TimeRange.start_time.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:TimeRange.start_time.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:TimeRange.start_time.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": true}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:TimeRange.start_time.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": 1}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:TimeRange.start_time.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": \"sample\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:TimeRange.start_time.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:TimeRange.start_time.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"TimeRange.1\", \"duration\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"start_time\": {}}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:TimeTransform.offset.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"TimeTransform.1\", \"rate\": -1.0, \"scale\": 1.0}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:TimeTransform.offset.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"TimeTransform.1\", \"offset\": null, \"rate\": -1.0, \"scale\": 1.0}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:TimeTransform.offset.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"TimeTransform.1\", \"offset\": true, \"rate\": -1.0, \"scale\": 1.0}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:TimeTransform.offset.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"TimeTransform.1\", \"offset\": 1, \"rate\": -1.0, \"scale\": 1.0}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:TimeTransform.offset.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"TimeTransform.1\", \"offset\": \"sample\", \"rate\": -1.0, \"scale\": 1.0}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:TimeTransform.offset.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"TimeTransform.1\", \"offset\": [], \"rate\": -1.0, \"scale\": 1.0}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:TimeTransform.offset.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"TimeTransform.1\", \"offset\": {}, \"rate\": -1.0, \"scale\": 1.0}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:TimeTransform.rate.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"TimeTransform.1\", \"offset\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"scale\": 1.0}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:TimeTransform.rate.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"TimeTransform.1\", \"offset\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"rate\": null, \"scale\": 1.0}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:TimeTransform.rate.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"TimeTransform.1\", \"offset\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"rate\": true, \"scale\": 1.0}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:TimeTransform.rate.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"TimeTransform.1\", \"offset\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"rate\": 1, \"scale\": 1.0}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"TimeTransform.1\",\"offset\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0},\"rate\":1.0,\"scale\":1.0}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:TimeTransform.rate.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"TimeTransform.1\", \"offset\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"rate\": \"sample\", \"scale\": 1.0}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:TimeTransform.rate.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"TimeTransform.1\", \"offset\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"rate\": [], \"scale\": 1.0}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:TimeTransform.rate.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"TimeTransform.1\", \"offset\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"rate\": {}, \"scale\": 1.0}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:TimeTransform.scale.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"TimeTransform.1\", \"offset\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"rate\": -1.0}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:TimeTransform.scale.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"TimeTransform.1\", \"offset\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"rate\": -1.0, \"scale\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:TimeTransform.scale.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"TimeTransform.1\", \"offset\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"rate\": -1.0, \"scale\": true}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:TimeTransform.scale.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"TimeTransform.1\", \"offset\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"rate\": -1.0, \"scale\": 1}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"TimeTransform.1\",\"offset\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0},\"rate\":-1.0,\"scale\":1.0}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:TimeTransform.scale.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"TimeTransform.1\", \"offset\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"rate\": -1.0, \"scale\": \"sample\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:TimeTransform.scale.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"TimeTransform.1\", \"offset\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"rate\": -1.0, \"scale\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:TimeTransform.scale.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"TimeTransform.1\", \"offset\": {\"OTIO_SCHEMA\": \"RationalTime.1\", \"rate\": 1.0, \"value\": 0.0}, \"rate\": -1.0, \"scale\": {}}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:V2d.x.missing" {
  let result = @schema.read("{\"OTIO_SCHEMA\": \"V2d.1\", \"y\": 0.0}")
  assert_true(result is Err(_))
}

///|
test "fields:V2d.x.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"V2d.1\", \"x\": null, \"y\": 0.0}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:V2d.x.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"V2d.1\", \"x\": true, \"y\": 0.0}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:V2d.x.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"V2d.1\", \"x\": 1, \"y\": 0.0}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"V2d.1\",\"x\":1.0,\"y\":0.0}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:V2d.x.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"V2d.1\", \"x\": \"sample\", \"y\": 0.0}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:V2d.x.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"V2d.1\", \"x\": [], \"y\": 0.0}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:V2d.x.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"V2d.1\", \"x\": {}, \"y\": 0.0}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:V2d.y.missing" {
  let result = @schema.read("{\"OTIO_SCHEMA\": \"V2d.1\", \"x\": 0.0}")
  assert_true(result is Err(_))
}

///|
test "fields:V2d.y.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"V2d.1\", \"x\": 0.0, \"y\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:V2d.y.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"V2d.1\", \"x\": 0.0, \"y\": true}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:V2d.y.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"V2d.1\", \"x\": 0.0, \"y\": 1}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"V2d.1\",\"x\":0.0,\"y\":1.0}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:V2d.y.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"V2d.1\", \"x\": 0.0, \"y\": \"sample\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:V2d.y.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"V2d.1\", \"x\": 0.0, \"y\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:V2d.y.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"V2d.1\", \"x\": 0.0, \"y\": {}}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Box2d.min.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Box2d.1\", \"max\": {\"OTIO_SCHEMA\": \"V2d.1\", \"x\": 0.0, \"y\": 0.0}}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Box2d.min.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Box2d.1\", \"min\": null, \"max\": {\"OTIO_SCHEMA\": \"V2d.1\", \"x\": 0.0, \"y\": 0.0}}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Box2d.min.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Box2d.1\", \"min\": true, \"max\": {\"OTIO_SCHEMA\": \"V2d.1\", \"x\": 0.0, \"y\": 0.0}}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Box2d.min.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Box2d.1\", \"min\": 1, \"max\": {\"OTIO_SCHEMA\": \"V2d.1\", \"x\": 0.0, \"y\": 0.0}}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Box2d.min.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Box2d.1\", \"min\": \"sample\", \"max\": {\"OTIO_SCHEMA\": \"V2d.1\", \"x\": 0.0, \"y\": 0.0}}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Box2d.min.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Box2d.1\", \"min\": [], \"max\": {\"OTIO_SCHEMA\": \"V2d.1\", \"x\": 0.0, \"y\": 0.0}}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Box2d.min.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Box2d.1\", \"min\": {}, \"max\": {\"OTIO_SCHEMA\": \"V2d.1\", \"x\": 0.0, \"y\": 0.0}}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Box2d.max.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Box2d.1\", \"min\": {\"OTIO_SCHEMA\": \"V2d.1\", \"x\": 0.0, \"y\": 0.0}}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Box2d.max.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Box2d.1\", \"min\": {\"OTIO_SCHEMA\": \"V2d.1\", \"x\": 0.0, \"y\": 0.0}, \"max\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Box2d.max.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Box2d.1\", \"min\": {\"OTIO_SCHEMA\": \"V2d.1\", \"x\": 0.0, \"y\": 0.0}, \"max\": true}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Box2d.max.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Box2d.1\", \"min\": {\"OTIO_SCHEMA\": \"V2d.1\", \"x\": 0.0, \"y\": 0.0}, \"max\": 1}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Box2d.max.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Box2d.1\", \"min\": {\"OTIO_SCHEMA\": \"V2d.1\", \"x\": 0.0, \"y\": 0.0}, \"max\": \"sample\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Box2d.max.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Box2d.1\", \"min\": {\"OTIO_SCHEMA\": \"V2d.1\", \"x\": 0.0, \"y\": 0.0}, \"max\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Box2d.max.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Box2d.1\", \"min\": {\"OTIO_SCHEMA\": \"V2d.1\", \"x\": 0.0, \"y\": 0.0}, \"max\": {}}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Color.r.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Color.1\", \"g\": 1.0, \"b\": 1.0, \"a\": 1.0, \"name\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Color.r.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Color.1\", \"r\": null, \"g\": 1.0, \"b\": 1.0, \"a\": 1.0, \"name\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Color.r.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Color.1\", \"r\": true, \"g\": 1.0, \"b\": 1.0, \"a\": 1.0, \"name\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Color.r.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Color.1\", \"r\": 1, \"g\": 1.0, \"b\": 1.0, \"a\": 1.0, \"name\": \"\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Color.1\",\"r\":1.0,\"g\":1.0,\"b\":1.0,\"a\":1.0,\"name\":\"\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Color.r.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Color.1\", \"r\": \"sample\", \"g\": 1.0, \"b\": 1.0, \"a\": 1.0, \"name\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Color.r.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Color.1\", \"r\": [], \"g\": 1.0, \"b\": 1.0, \"a\": 1.0, \"name\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Color.r.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Color.1\", \"r\": {}, \"g\": 1.0, \"b\": 1.0, \"a\": 1.0, \"name\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Color.g.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Color.1\", \"r\": 1.0, \"b\": 1.0, \"a\": 1.0, \"name\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Color.g.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Color.1\", \"r\": 1.0, \"g\": null, \"b\": 1.0, \"a\": 1.0, \"name\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Color.g.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Color.1\", \"r\": 1.0, \"g\": true, \"b\": 1.0, \"a\": 1.0, \"name\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Color.g.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Color.1\", \"r\": 1.0, \"g\": 1, \"b\": 1.0, \"a\": 1.0, \"name\": \"\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Color.1\",\"r\":1.0,\"g\":1.0,\"b\":1.0,\"a\":1.0,\"name\":\"\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Color.g.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Color.1\", \"r\": 1.0, \"g\": \"sample\", \"b\": 1.0, \"a\": 1.0, \"name\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Color.g.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Color.1\", \"r\": 1.0, \"g\": [], \"b\": 1.0, \"a\": 1.0, \"name\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Color.g.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Color.1\", \"r\": 1.0, \"g\": {}, \"b\": 1.0, \"a\": 1.0, \"name\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Color.b.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Color.1\", \"r\": 1.0, \"g\": 1.0, \"a\": 1.0, \"name\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Color.b.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Color.1\", \"r\": 1.0, \"g\": 1.0, \"b\": null, \"a\": 1.0, \"name\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Color.b.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Color.1\", \"r\": 1.0, \"g\": 1.0, \"b\": true, \"a\": 1.0, \"name\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Color.b.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Color.1\", \"r\": 1.0, \"g\": 1.0, \"b\": 1, \"a\": 1.0, \"name\": \"\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Color.1\",\"r\":1.0,\"g\":1.0,\"b\":1.0,\"a\":1.0,\"name\":\"\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Color.b.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Color.1\", \"r\": 1.0, \"g\": 1.0, \"b\": \"sample\", \"a\": 1.0, \"name\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Color.b.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Color.1\", \"r\": 1.0, \"g\": 1.0, \"b\": [], \"a\": 1.0, \"name\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Color.b.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Color.1\", \"r\": 1.0, \"g\": 1.0, \"b\": {}, \"a\": 1.0, \"name\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Color.a.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Color.1\", \"r\": 1.0, \"g\": 1.0, \"b\": 1.0, \"name\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Color.a.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Color.1\", \"r\": 1.0, \"g\": 1.0, \"b\": 1.0, \"a\": null, \"name\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Color.a.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Color.1\", \"r\": 1.0, \"g\": 1.0, \"b\": 1.0, \"a\": true, \"name\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Color.a.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Color.1\", \"r\": 1.0, \"g\": 1.0, \"b\": 1.0, \"a\": 1, \"name\": \"\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Color.1\",\"r\":1.0,\"g\":1.0,\"b\":1.0,\"a\":1.0,\"name\":\"\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Color.a.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Color.1\", \"r\": 1.0, \"g\": 1.0, \"b\": 1.0, \"a\": \"sample\", \"name\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Color.a.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Color.1\", \"r\": 1.0, \"g\": 1.0, \"b\": 1.0, \"a\": [], \"name\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Color.a.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Color.1\", \"r\": 1.0, \"g\": 1.0, \"b\": 1.0, \"a\": {}, \"name\": \"\"}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Color.name.missing" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Color.1\", \"r\": 1.0, \"g\": 1.0, \"b\": 1.0, \"a\": 1.0}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Color.name.null" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Color.1\", \"r\": 1.0, \"g\": 1.0, \"b\": 1.0, \"a\": 1.0, \"name\": null}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Color.name.bool" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Color.1\", \"r\": 1.0, \"g\": 1.0, \"b\": 1.0, \"a\": 1.0, \"name\": true}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Color.name.number" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Color.1\", \"r\": 1.0, \"g\": 1.0, \"b\": 1.0, \"a\": 1.0, \"name\": 1}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Color.name.string" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Color.1\", \"r\": 1.0, \"g\": 1.0, \"b\": 1.0, \"a\": 1.0, \"name\": \"sample\"}",
  )
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Color.1\",\"r\":1.0,\"g\":1.0,\"b\":1.0,\"a\":1.0,\"name\":\"sample\"}",
  ).unwrap()
  assert_true(
    @otiojson.equivalent(result.unwrap().to_json().unwrap(), expected),
  )
}

///|
test "fields:Color.name.array" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Color.1\", \"r\": 1.0, \"g\": 1.0, \"b\": 1.0, \"a\": 1.0, \"name\": []}",
  )
  assert_true(result is Err(_))
}

///|
test "fields:Color.name.object" {
  let result = @schema.read(
    "{\"OTIO_SCHEMA\": \"Color.1\", \"r\": 1.0, \"g\": 1.0, \"b\": 1.0, \"a\": 1.0, \"name\": {}}",
  )
  assert_true(result is Err(_))
}
