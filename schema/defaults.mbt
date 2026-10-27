// Generated from official OTIO 0.18.1 constructors.

///|
pub fn registered_schemas() -> Array[String] {
  [
    "Adapter", "Box2d", "Clip", "Color", "Composable", "Composition", "Effect", "ExternalReference",
    "FreezeFrame", "Gap", "GeneratorReference", "HookScript", "ImageSequenceReference",
    "Item", "LinearTimeWarp", "Marker", "MediaLinker", "MediaReference", "MissingReference",
    "PluginManifest", "RationalTime", "SchemaDef", "SerializableCollection", "SerializableObject",
    "SerializableObjectWithMetadata", "Stack", "TimeEffect", "TimeRange", "TimeTransform",
    "Timeline", "Track", "Transition", "V2d",
  ]
}

///|
fn default_json(name : String) -> Result[Json, String] {
  let source = match name {
    "Adapter" =>
      "{\"OTIO_SCHEMA\":\"Adapter.1\",\"filepath\":null,\"name\":null,\"suffixes\":[]}"
    "Box2d" =>
      "{\"OTIO_SCHEMA\":\"Box2d.1\",\"min\":{\"OTIO_SCHEMA\":\"V2d.1\",\"x\":0.0,\"y\":0.0},\"max\":{\"OTIO_SCHEMA\":\"V2d.1\",\"x\":0.0,\"y\":0.0}}"
    "Clip" =>
      "{\"OTIO_SCHEMA\":\"Clip.2\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"media_references\":{\"DEFAULT_MEDIA\":{\"OTIO_SCHEMA\":\"MissingReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null}},\"active_media_reference_key\":\"DEFAULT_MEDIA\"}"
    "Color" =>
      "{\"OTIO_SCHEMA\":\"Color.1\",\"r\":1.0,\"g\":1.0,\"b\":1.0,\"a\":1.0,\"name\":\"\"}"
    "Composable" =>
      "{\"OTIO_SCHEMA\":\"Composable.1\",\"metadata\":{},\"name\":\"\"}"
    "Composition" =>
      "{\"OTIO_SCHEMA\":\"Composition.1\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"children\":[]}"
    "Effect" =>
      "{\"OTIO_SCHEMA\":\"Effect.1\",\"metadata\":{},\"name\":\"\",\"effect_name\":\"\",\"enabled\":true}"
    "ExternalReference" =>
      "{\"OTIO_SCHEMA\":\"ExternalReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null,\"target_url\":\"\"}"
    "FreezeFrame" =>
      "{\"OTIO_SCHEMA\":\"FreezeFrame.1\",\"metadata\":{},\"name\":\"\",\"effect_name\":\"FreezeFrame\",\"enabled\":true,\"time_scalar\":0.0}"
    "Gap" =>
      "{\"OTIO_SCHEMA\":\"Gap.1\",\"metadata\":{},\"name\":\"\",\"source_range\":{\"OTIO_SCHEMA\":\"TimeRange.1\",\"duration\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0},\"start_time\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0}},\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null}"
    "GeneratorReference" =>
      "{\"OTIO_SCHEMA\":\"GeneratorReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null,\"generator_kind\":\"\",\"parameters\":{}}"
    "HookScript" =>
      "{\"OTIO_SCHEMA\":\"HookScript.1\",\"filepath\":null,\"name\":null}"
    "ImageSequenceReference" =>
      "{\"OTIO_SCHEMA\":\"ImageSequenceReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null,\"target_url_base\":\"\",\"name_prefix\":\"\",\"name_suffix\":\"\",\"start_frame\":1,\"frame_step\":1,\"rate\":1.0,\"frame_zero_padding\":0,\"missing_frame_policy\":\"error\"}"
    "Item" =>
      "{\"OTIO_SCHEMA\":\"Item.1\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null}"
    "LinearTimeWarp" =>
      "{\"OTIO_SCHEMA\":\"LinearTimeWarp.1\",\"metadata\":{},\"name\":\"\",\"effect_name\":\"LinearTimeWarp\",\"enabled\":true,\"time_scalar\":1.0}"
    "Marker" =>
      "{\"OTIO_SCHEMA\":\"Marker.2\",\"metadata\":{},\"name\":\"\",\"color\":\"RED\",\"marked_range\":{\"OTIO_SCHEMA\":\"TimeRange.1\",\"duration\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0},\"start_time\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0}},\"comment\":\"\"}"
    "MediaLinker" =>
      "{\"OTIO_SCHEMA\":\"MediaLinker.1\",\"filepath\":null,\"name\":null}"
    "MediaReference" =>
      "{\"OTIO_SCHEMA\":\"MediaReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null}"
    "MissingReference" =>
      "{\"OTIO_SCHEMA\":\"MissingReference.1\",\"metadata\":{},\"name\":\"\",\"available_range\":null,\"available_image_bounds\":null}"
    "PluginManifest" =>
      "{\"OTIO_SCHEMA\":\"PluginManifest.1\",\"adapters\":[],\"hook_scripts\":[],\"hooks\":{},\"media_linkers\":[],\"schemadefs\":[],\"version_manifests\":{}}"
    "RationalTime" =>
      "{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0}"
    "SchemaDef" =>
      "{\"OTIO_SCHEMA\":\"SchemaDef.1\",\"filepath\":null,\"name\":null}"
    "SerializableCollection" =>
      "{\"OTIO_SCHEMA\":\"SerializableCollection.1\",\"metadata\":{},\"name\":\"\",\"children\":[]}"
    "SerializableObject" => "{\"OTIO_SCHEMA\":\"SerializableObject.1\"}"
    "SerializableObjectWithMetadata" =>
      "{\"OTIO_SCHEMA\":\"SerializableObjectWithMetadata.1\",\"metadata\":{},\"name\":\"\"}"
    "Stack" =>
      "{\"OTIO_SCHEMA\":\"Stack.1\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"children\":[]}"
    "TimeEffect" =>
      "{\"OTIO_SCHEMA\":\"TimeEffect.1\",\"metadata\":{},\"name\":\"\",\"effect_name\":\"\",\"enabled\":true}"
    "TimeRange" =>
      "{\"OTIO_SCHEMA\":\"TimeRange.1\",\"duration\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0},\"start_time\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0}}"
    "TimeTransform" =>
      "{\"OTIO_SCHEMA\":\"TimeTransform.1\",\"offset\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0},\"rate\":-1.0,\"scale\":1.0}"
    "Timeline" =>
      "{\"OTIO_SCHEMA\":\"Timeline.1\",\"metadata\":{},\"name\":\"\",\"global_start_time\":null,\"tracks\":{\"OTIO_SCHEMA\":\"Stack.1\",\"metadata\":{},\"name\":\"tracks\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"children\":[]}}"
    "Track" =>
      "{\"OTIO_SCHEMA\":\"Track.1\",\"metadata\":{},\"name\":\"\",\"source_range\":null,\"effects\":[],\"markers\":[],\"enabled\":true,\"color\":null,\"children\":[],\"kind\":\"Video\"}"
    "Transition" =>
      "{\"OTIO_SCHEMA\":\"Transition.1\",\"metadata\":{},\"name\":\"\",\"in_offset\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0},\"out_offset\":{\"OTIO_SCHEMA\":\"RationalTime.1\",\"rate\":1.0,\"value\":0.0},\"transition_type\":\"\"}"
    "V2d" => "{\"OTIO_SCHEMA\":\"V2d.1\",\"x\":0.0,\"y\":0.0}"
    _ => return Err("unknown_schema:" + name)
  }
  @otiojson.parse(source)
}
