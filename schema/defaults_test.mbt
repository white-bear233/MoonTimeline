// Generated official default-object roundtrip cases.

///|
test "official schema default Adapter" {
  let obj = @schema.Object::new("Adapter").unwrap()
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Adapter.1\",\"filepath\":null,\"name\":null,\"suffixes\":[]}",
  ).unwrap()
  assert_true(@otiojson.equivalent(obj.to_json().unwrap(), expected))
  let parsed = @schema.read(@schema.write(obj).unwrap()).unwrap()
  assert_true(obj.equivalent(parsed))
}

///|
test "official schema default Box2d" {
  let obj = @schema.Object::new("Box2d").unwrap()
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Box2d.1\",\"min\":{\"OTIO_SCHEMA\":\"V2d.1\",\"x\":0.0,\"y\":0.0},\"max\":{\"OTIO_SCHEMA\":\"V2d.1\",\"x\":0.0,\"y\":0.0}}",
  ).unwrap()
  assert_true(@otiojson.equivalent(obj.to_json().unwrap(), expected))
  let parsed = @schema.read(@schema.write(obj).unwrap()).unwrap()
  assert_true(obj.equivalent(parsed))
}

///|
test "official schema default Clip" {
  let obj = @schema.Object::new("Clip").unwrap()
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Clip.2\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"media_references\":{\"DEFAULT_MEDIA\":{\"OTIO_SCHEMA\":\"MissingReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null}},\"active_media_reference_key\":\"DEFAULT_MEDIA\"}",
  ).unwrap()
  assert_true(@otiojson.equivalent(obj.to_json().unwrap(), expected))
  let parsed = @schema.read(@schema.write(obj).unwrap()).unwrap()
  assert_true(obj.equivalent(parsed))
}

///|
test "official schema default Color" {
  let obj = @schema.Object::new("Color").unwrap()
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Color.1\",\"r\":1.0,\"g\":1.0,\"b\":1.0,\"a\":1.0,\"name\":\"\"}",
  ).unwrap()
  assert_true(@otiojson.equivalent(obj.to_json().unwrap(), expected))
  let parsed = @schema.read(@schema.write(obj).unwrap()).unwrap()
  assert_true(obj.equivalent(parsed))
}

///|
test "official schema default Composable" {
  let obj = @schema.Object::new("Composable").unwrap()
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Composable.1\",\"metadata\":{},\"name\":\"\"}",
  ).unwrap()
  assert_true(@otiojson.equivalent(obj.to_json().unwrap(), expected))
  let parsed = @schema.read(@schema.write(obj).unwrap()).unwrap()
  assert_true(obj.equivalent(parsed))
}

///|
test "official schema default Composition" {
  let obj = @schema.Object::new("Composition").unwrap()
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Composition.1\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"children\":[]}",
  ).unwrap()
  assert_true(@otiojson.equivalent(obj.to_json().unwrap(), expected))
  let parsed = @schema.read(@schema.write(obj).unwrap()).unwrap()
  assert_true(obj.equivalent(parsed))
}

///|
test "official schema default Effect" {
  let obj = @schema.Object::new("Effect").unwrap()
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Effect.1\",\"metadata\":{},\"name\":\"\",\"effect_name\":\"\",\"enabled\":true}",
  ).unwrap()
  assert_true(@otiojson.equivalent(obj.to_json().unwrap(), expected))
  let parsed = @schema.read(@schema.write(obj).unwrap()).unwrap()
  assert_true(obj.equivalent(parsed))
}

///|
test "official schema default ExternalReference" {
  let obj = @schema.Object::new("ExternalReference").unwrap()
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"ExternalReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null,\"target_url\":\"\"}",
  ).unwrap()
  assert_true(@otiojson.equivalent(obj.to_json().unwrap(), expected))
  let parsed = @schema.read(@schema.write(obj).unwrap()).unwrap()
  assert_true(obj.equivalent(parsed))
}

///|
test "official schema default FreezeFrame" {
  let obj = @schema.Object::new("FreezeFrame").unwrap()
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"FreezeFrame.1\",\"metadata\":{},\"name\":\"\",\"effect_name\":\"FreezeFrame\",\"enabled\":true,\"time_scalar\":0.0}",
  ).unwrap()
  assert_true(@otiojson.equivalent(obj.to_json().unwrap(), expected))
  let parsed = @schema.read(@schema.write(obj).unwrap()).unwrap()
  assert_true(obj.equivalent(parsed))
}

///|
test "official schema default Gap" {
  let obj = @schema.Object::new("Gap").unwrap()
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Gap.1\",\"metadata\":{},\"name\":\"\",\"source_range\":{\"OTIO_SCHEMA\":\"TimeRange.1\",\"duration\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0},\"start_time\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0}},\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null}",
  ).unwrap()
  assert_true(@otiojson.equivalent(obj.to_json().unwrap(), expected))
  let parsed = @schema.read(@schema.write(obj).unwrap()).unwrap()
  assert_true(obj.equivalent(parsed))
}

///|
test "official schema default GeneratorReference" {
  let obj = @schema.Object::new("GeneratorReference").unwrap()
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"GeneratorReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null,\"generator_kind\":\"\",\"parameters\":{}}",
  ).unwrap()
  assert_true(@otiojson.equivalent(obj.to_json().unwrap(), expected))
  let parsed = @schema.read(@schema.write(obj).unwrap()).unwrap()
  assert_true(obj.equivalent(parsed))
}

///|
test "official schema default HookScript" {
  let obj = @schema.Object::new("HookScript").unwrap()
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"HookScript.1\",\"filepath\":null,\"name\":null}",
  ).unwrap()
  assert_true(@otiojson.equivalent(obj.to_json().unwrap(), expected))
  let parsed = @schema.read(@schema.write(obj).unwrap()).unwrap()
  assert_true(obj.equivalent(parsed))
}

///|
test "official schema default ImageSequenceReference" {
  let obj = @schema.Object::new("ImageSequenceReference").unwrap()
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"ImageSequenceReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null,\"target_url_base\":\"\",\"name_prefix\":\"\",\"name_suffix\":\"\",\"start_frame\":1,\"frame_step\":1,\"rate\":1.0,\"frame_zero_padding\":0,\"missing_frame_policy\":\"error\"}",
  ).unwrap()
  assert_true(@otiojson.equivalent(obj.to_json().unwrap(), expected))
  let parsed = @schema.read(@schema.write(obj).unwrap()).unwrap()
  assert_true(obj.equivalent(parsed))
}

///|
test "official schema default Item" {
  let obj = @schema.Object::new("Item").unwrap()
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Item.1\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null}",
  ).unwrap()
  assert_true(@otiojson.equivalent(obj.to_json().unwrap(), expected))
  let parsed = @schema.read(@schema.write(obj).unwrap()).unwrap()
  assert_true(obj.equivalent(parsed))
}

///|
test "official schema default LinearTimeWarp" {
  let obj = @schema.Object::new("LinearTimeWarp").unwrap()
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"LinearTimeWarp.1\",\"metadata\":{},\"name\":\"\",\"effect_name\":\"LinearTimeWarp\",\"enabled\":true,\"time_scalar\":1.0}",
  ).unwrap()
  assert_true(@otiojson.equivalent(obj.to_json().unwrap(), expected))
  let parsed = @schema.read(@schema.write(obj).unwrap()).unwrap()
  assert_true(obj.equivalent(parsed))
}

///|
test "official schema default Marker" {
  let obj = @schema.Object::new("Marker").unwrap()
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Marker.2\",\"metadata\":{},\"name\":\"\",\"color\":\"RED\",\"marked_range\":{\"OTIO_SCHEMA\":\"TimeRange.1\",\"duration\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0},\"start_time\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0}},\"comment\":\"\"}",
  ).unwrap()
  assert_true(@otiojson.equivalent(obj.to_json().unwrap(), expected))
  let parsed = @schema.read(@schema.write(obj).unwrap()).unwrap()
  assert_true(obj.equivalent(parsed))
}

///|
test "official schema default MediaLinker" {
  let obj = @schema.Object::new("MediaLinker").unwrap()
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"MediaLinker.1\",\"filepath\":null,\"name\":null}",
  ).unwrap()
  assert_true(@otiojson.equivalent(obj.to_json().unwrap(), expected))
  let parsed = @schema.read(@schema.write(obj).unwrap()).unwrap()
  assert_true(obj.equivalent(parsed))
}

///|
test "official schema default MediaReference" {
  let obj = @schema.Object::new("MediaReference").unwrap()
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"MediaReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null}",
  ).unwrap()
  assert_true(@otiojson.equivalent(obj.to_json().unwrap(), expected))
  let parsed = @schema.read(@schema.write(obj).unwrap()).unwrap()
  assert_true(obj.equivalent(parsed))
}

///|
test "official schema default MissingReference" {
  let obj = @schema.Object::new("MissingReference").unwrap()
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"MissingReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null}",
  ).unwrap()
  assert_true(@otiojson.equivalent(obj.to_json().unwrap(), expected))
  let parsed = @schema.read(@schema.write(obj).unwrap()).unwrap()
  assert_true(obj.equivalent(parsed))
}

///|
test "official schema default PluginManifest" {
  let obj = @schema.Object::new("PluginManifest").unwrap()
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"PluginManifest.1\",\"adapters\":[],\"hook_scripts\":[],\"hooks\":{},\"media_linkers\":[],\"schemadefs\":[],\"version_manifests\":{}}",
  ).unwrap()
  assert_true(@otiojson.equivalent(obj.to_json().unwrap(), expected))
  let parsed = @schema.read(@schema.write(obj).unwrap()).unwrap()
  assert_true(obj.equivalent(parsed))
}

///|
test "official schema default RationalTime" {
  let obj = @schema.Object::new("RationalTime").unwrap()
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0}",
  ).unwrap()
  assert_true(@otiojson.equivalent(obj.to_json().unwrap(), expected))
  let parsed = @schema.read(@schema.write(obj).unwrap()).unwrap()
  assert_true(obj.equivalent(parsed))
}

///|
test "official schema default SchemaDef" {
  let obj = @schema.Object::new("SchemaDef").unwrap()
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"SchemaDef.1\",\"filepath\":null,\"name\":null}",
  ).unwrap()
  assert_true(@otiojson.equivalent(obj.to_json().unwrap(), expected))
  let parsed = @schema.read(@schema.write(obj).unwrap()).unwrap()
  assert_true(obj.equivalent(parsed))
}

///|
test "official schema default SerializableCollection" {
  let obj = @schema.Object::new("SerializableCollection").unwrap()
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"SerializableCollection.1\",\"metadata\":{},\"name\":\"\",\"children\":[]}",
  ).unwrap()
  assert_true(@otiojson.equivalent(obj.to_json().unwrap(), expected))
  let parsed = @schema.read(@schema.write(obj).unwrap()).unwrap()
  assert_true(obj.equivalent(parsed))
}

///|
test "official schema default SerializableObject" {
  let obj = @schema.Object::new("SerializableObject").unwrap()
  let expected = @otiojson.parse("{\"OTIO_SCHEMA\":\"SerializableObject.1\"}").unwrap()
  assert_true(@otiojson.equivalent(obj.to_json().unwrap(), expected))
  let parsed = @schema.read(@schema.write(obj).unwrap()).unwrap()
  assert_true(obj.equivalent(parsed))
}

///|
test "official schema default SerializableObjectWithMetadata" {
  let obj = @schema.Object::new("SerializableObjectWithMetadata").unwrap()
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"SerializableObjectWithMetadata.1\",\"metadata\":{},\"name\":\"\"}",
  ).unwrap()
  assert_true(@otiojson.equivalent(obj.to_json().unwrap(), expected))
  let parsed = @schema.read(@schema.write(obj).unwrap()).unwrap()
  assert_true(obj.equivalent(parsed))
}

///|
test "official schema default Stack" {
  let obj = @schema.Object::new("Stack").unwrap()
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Stack.1\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"children\":[]}",
  ).unwrap()
  assert_true(@otiojson.equivalent(obj.to_json().unwrap(), expected))
  let parsed = @schema.read(@schema.write(obj).unwrap()).unwrap()
  assert_true(obj.equivalent(parsed))
}

///|
test "official schema default TimeEffect" {
  let obj = @schema.Object::new("TimeEffect").unwrap()
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"TimeEffect.1\",\"metadata\":{},\"name\":\"\",\"effect_name\":\"\",\"enabled\":true}",
  ).unwrap()
  assert_true(@otiojson.equivalent(obj.to_json().unwrap(), expected))
  let parsed = @schema.read(@schema.write(obj).unwrap()).unwrap()
  assert_true(obj.equivalent(parsed))
}

///|
test "official schema default TimeRange" {
  let obj = @schema.Object::new("TimeRange").unwrap()
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"TimeRange.1\",\"duration\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0},\"start_time\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0}}",
  ).unwrap()
  assert_true(@otiojson.equivalent(obj.to_json().unwrap(), expected))
  let parsed = @schema.read(@schema.write(obj).unwrap()).unwrap()
  assert_true(obj.equivalent(parsed))
}

///|
test "official schema default TimeTransform" {
  let obj = @schema.Object::new("TimeTransform").unwrap()
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"TimeTransform.1\",\"offset\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0},\"rate\":-1.0,\"scale\":1.0}",
  ).unwrap()
  assert_true(@otiojson.equivalent(obj.to_json().unwrap(), expected))
  let parsed = @schema.read(@schema.write(obj).unwrap()).unwrap()
  assert_true(obj.equivalent(parsed))
}

///|
test "official schema default Timeline" {
  let obj = @schema.Object::new("Timeline").unwrap()
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Timeline.1\",\"metadata\":{},\"name\":\"\",\"global_start_time\":null,\"tracks\":{\"OTIO_SCHEMA\":\"Stack.1\",\"metadata\":{},\"name\":\"tracks\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"children\":[]}}",
  ).unwrap()
  assert_true(@otiojson.equivalent(obj.to_json().unwrap(), expected))
  let parsed = @schema.read(@schema.write(obj).unwrap()).unwrap()
  assert_true(obj.equivalent(parsed))
}

///|
test "official schema default Track" {
  let obj = @schema.Object::new("Track").unwrap()
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Track.1\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"children\":[],\"kind\":\"Video\"}",
  ).unwrap()
  assert_true(@otiojson.equivalent(obj.to_json().unwrap(), expected))
  let parsed = @schema.read(@schema.write(obj).unwrap()).unwrap()
  assert_true(obj.equivalent(parsed))
}

///|
test "official schema default Transition" {
  let obj = @schema.Object::new("Transition").unwrap()
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"Transition.1\",\"metadata\":{},\"name\":\"\",\"in_offset\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0},\"out_offset\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0},\"transition_type\":\"\"}",
  ).unwrap()
  assert_true(@otiojson.equivalent(obj.to_json().unwrap(), expected))
  let parsed = @schema.read(@schema.write(obj).unwrap()).unwrap()
  assert_true(obj.equivalent(parsed))
}

///|
test "official schema default V2d" {
  let obj = @schema.Object::new("V2d").unwrap()
  let expected = @otiojson.parse(
    "{\"OTIO_SCHEMA\":\"V2d.1\",\"x\":0.0,\"y\":0.0}",
  ).unwrap()
  assert_true(@otiojson.equivalent(obj.to_json().unwrap(), expected))
  let parsed = @schema.read(@schema.write(obj).unwrap()).unwrap()
  assert_true(obj.equivalent(parsed))
}
