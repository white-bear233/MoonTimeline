///|
pub fn manifest_from_name(
  manifest : @schema.Object,
  name : String,
  kind~ : String = "adapters",
) -> Result[@schema.Object, String] {
  if manifest.schema_name() != "PluginManifest" {
    return Err("not_a_plugin_manifest")
  }
  let a = match manifest.get(kind) {
    Some(Array(a)) => a
    _ => return Err("invalid_plugin_kind")
  }
  for raw in a {
    let plugin = match @schema.Object::from_json(raw) {
      Ok(v) => v
      Err(e) => return Err(e)
    }
    if plugin.get("name") == Some(Json::string(name)) {
      return Ok(plugin)
    }
  }
  Err("plugin_not_found")
}

///|
pub fn manifest_from_suffix(
  manifest : @schema.Object,
  suffix : String,
) -> Result[@schema.Object, String] {
  let a = match descriptions(manifest, "adapters", "Adapter") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  for plugin in a {
    match plugin.get("suffixes") {
      Some(Array(suffixes)) =>
        if suffixes.contains(Json::string(suffix.to_lower())) {
          return Ok(plugin)
        }
      _ => return Err("invalid_suffixes")
    }
  }
  Err("adapter_not_found")
}

///|
/// Data-level manifest concatenation follows upstream order, retaining duplicate
/// descriptors. Loading into Registry remains an atomic, conflict-checked step.
pub fn extend_manifest(
  first : @schema.Object,
  second : @schema.Object?,
) -> Result[@schema.Object, String] {
  let second = match second {
    None => return Ok(first)
    Some(v) => v
  }
  if first.schema_name() != "PluginManifest" ||
    second.schema_name() != "PluginManifest" {
    return Err("not_a_plugin_manifest")
  }
  let mut output = first
  for key in ["adapters", "schemadefs", "media_linkers", "hook_scripts"] {
    let a = match first.get(key) {
      Some(Array(v)) => v
      _ => return Err("invalid_manifest_list")
    }
    let b = match second.get(key) {
      Some(Array(v)) => v
      _ => return Err("invalid_manifest_list")
    }
    for v in b {
      a.push(v)
    }
    output = match output.with_field(key, Json::array(a)) {
      Ok(v) => v
      Err(e) => return Err(e)
    }
  }
  for field in ["hooks", "version_manifests"] {
    let a = match first.get(field) {
      Some(Object(v)) => v
      _ => return Err("invalid_manifest_map")
    }
    let b = match second.get(field) {
      Some(Object(v)) => v
      _ => return Err("invalid_manifest_map")
    }
    for key, value in b {
      if field == "hooks" {
        let list = match a.get(key) {
          None => []
          Some(Array(v)) => v
          _ => return Err("invalid_hook_list")
        }
        let added = match value {
          Array(v) => v
          _ => return Err("invalid_hook_list")
        }
        for v in added {
          list.push(v)
        }
        a[key] = Json::array(list)
      } else {
        let versions = match a.get(key) {
          None => Map([])
          Some(Object(v)) => v
          _ => return Err("invalid_version_family")
        }
        let added = match value {
          Object(v) => v
          _ => return Err("invalid_version_family")
        }
        for label, version in added {
          versions[label] = version
        }
        a[key] = Json::object(versions)
      }
    }
    output = match output.with_field(field, Json::object(a)) {
      Ok(v) => v
      Err(e) => return Err(e)
    }
  }
  Ok(output)
}

///|
/// The host supplies OTIO_DEFAULT_MEDIA_LINKER; the portable core never reads
/// ambient process environment variables.
pub fn is_default_linker(
  description : @schema.Object,
  default_name : String,
) -> Bool {
  description.get("name") == Some(Json::string(default_name))
}
