///|
pub(all) struct ManifestSource {
  manifest : @schema.Object
  source_files : Array[String]
}

///|
pub struct ManifestContext {
  priv loader : () -> Result[ManifestSource, String]
  priv mut cached : ManifestSource?
}

///|
pub fn ManifestContext::new(
  loader : () -> Result[ManifestSource, String],
) -> ManifestContext {
  { loader, cached: None, }
}

///|
/// Host-local ActiveManifest equivalent; no process-wide mutable global state.
pub fn ManifestContext::active(
  self : ManifestContext,
  force_reload~ : Bool = false,
) -> Result[ManifestSource, String] {
  if !force_reload {
    match self.cached {
      Some(v) => return Ok(v)
      None => ()
    }
  }
  match (self.loader)() {
    Ok(v) => {
      self.cached = Some(v)
      Ok(v)
    }
    Err(e) => Err(e)
  }
}

///|
/// The caller supplies an absolute native path. Pass it to Plugin::new when
/// resolving descriptors so relative module paths retain manifest provenance.
pub fn manifest_from_file(
  path : String,
  read_file : (String) -> Result[String, String],
) -> Result[ManifestSource, String] {
  let text = match read_file(path) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let manifest = match @schema.read(text) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  if manifest.schema_name() != "PluginManifest" {
    return Err("AttributeError:not_a_manifest")
  }
  Ok({ manifest, source_files: [path], })
}

///|
pub fn manifest_plugins(
  manifest : @schema.Object,
  kind : String,
) -> Result[Array[@schema.Object], String] {
  let list = match manifest.get(kind) {
    Some(Array(v)) => v
    _ => return Err("AttributeError:plugin_kind")
  }
  let result = []
  for item in list {
    match @schema.Object::from_json(item) {
      Ok(v) => result.push(v)
      Err(e) => return Err(e)
    }
  }
  Ok(result)
}

///|
pub fn manifest_names(
  manifest : @schema.Object,
  kind : String,
) -> Result[Array[String], String] {
  let list = match manifest_plugins(manifest, kind) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let result = []
  for item in list {
    match item.get("name") {
      Some(String(v)) => result.push(v)
      _ => return Err("TypeError:plugin_name")
    }
  }
  Ok(result)
}

///|
pub fn hook_names(manifest : @schema.Object) -> Result[Array[String], String] {
  match manifest.get("hooks") {
    Some(Object(v)) => Ok(v.keys().to_array())
    _ => Err("AttributeError:hooks")
  }
}

///|
pub fn scripts_attached_to(
  manifest : @schema.Object,
  hook : String,
) -> Result[Array[String], String] {
  let hooks = match manifest.get("hooks") {
    Some(Object(v)) => v
    _ => return Err("AttributeError:hooks")
  }
  let values = match hooks.get(hook) {
    Some(Array(v)) => v
    None => return Err("KeyError:" + hook)
    _ => return Err("TypeError:hook_list")
  }
  let result = []
  for value in values {
    match value {
      String(v) => result.push(v)
      _ => return Err("TypeError:hook_script")
    }
  }
  Ok(result)
}

///|
pub fn run_manifest_hooks(
  manifest : @schema.Object,
  hook : String,
  document : Json,
  args : Json,
  invoke : (@schema.Object, Json, Json) -> Result[Json, String],
) -> Result[Json, String] {
  let names = match scripts_attached_to(manifest, hook) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let mut result = document
  for name in names {
    let descriptor = match
      manifest_from_name(manifest, name, kind="hook_scripts") {
      Ok(v) => v
      Err(e) => return Err(e)
    }
    result = match invoke(descriptor, result, args) {
      Ok(v) => v
      Err(e) => return Err(e)
    }
  }
  Ok(result)
}

///|
pub fn adapter_from_filepath(
  manifest : @schema.Object,
  path : String,
) -> Result[@schema.Object, String] {
  let base = path.split("\\").join("/").split("/").to_array()
  let name = base[base.length() - 1].to_owned()
  let parts = name.split(".").to_array()
  let mut non_dot = false
  for i = 0; i + 1 < parts.length(); i = i + 1 {
    if parts[i] != "" {
      non_dot = true
    }
  }
  manifest_from_suffix(
    manifest,
    if non_dot {
      parts[parts.length() - 1].to_owned()
    } else {
      ""
    },
  )
}

///|
pub fn suffixes_with_defined_adapters(
  manifest : @schema.Object,
  has_feature : (@schema.Object, String) -> Result[Bool, String],
  read~ : Bool = false,
  write~ : Bool = false,
) -> Result[Array[String], String] {
  let all = !read && !write
  let list = match manifest_plugins(manifest, "adapters") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let result = []
  for descriptor in list {
    let r = if read || all {
      match has_feature(descriptor, "read") {
        Ok(v) => v
        Err(e) => return Err(e)
      }
    } else {
      false
    }
    let w = if !r && (write || all) {
      match has_feature(descriptor, "write") {
        Ok(v) => v
        Err(e) => return Err(e)
      }
    } else {
      false
    }
    if r || w {
      let values = match descriptor.get("suffixes") {
        Some(Array(v)) => v
        _ => return Err("TypeError:suffixes")
      }
      for value in values {
        match value {
          String(v) => if !result.contains(v) { result.push(v) }
          _ => return Err("TypeError:suffix")
        }
      }
    }
  }
  Ok(result)
}

///|
pub fn default_media_linker(
  environment_value : String?,
) -> Result[String, String] {
  match environment_value {
    Some(v) => Ok(v)
    None => Err("NoDefaultMediaLinkerError:unset")
  }
}

///|
pub fn media_linker_from_name(
  manifest : @schema.Object,
  name : String?,
  default_name : String?,
) -> Result[@schema.Object?, String] {
  let name = match name {
    None | Some("") | Some("__default") => default_name
    other => other
  }
  match name {
    None | Some("") => Ok(None)
    Some(v) =>
      match manifest_from_name(manifest, v, kind="media_linkers") {
        Ok(v) => Ok(Some(v))
        Err(e) => Err(e)
      }
  }
}

///|
pub fn linked_media_reference(
  manifest : @schema.Object,
  clip : Json,
  name : String?,
  default_name : String?,
  args : Json,
  invoke : (@schema.Object, Json, Json) -> Result[Json, String],
) -> Result[Json, String] {
  match media_linker_from_name(manifest, name, default_name) {
    Err(e) => Err(e)
    Ok(None) => Ok(clip)
    Ok(Some(descriptor)) => invoke(descriptor, clip, args)
  }
}

///|
pub fn plugin_info_map(
  source : ManifestSource,
  info : (@schema.Object) -> Result[Json, String],
) -> Result[Json, String] {
  let result : Map[String, Json] = Map([])
  // Upstream 0.18.1 mistakenly treats version-family keys as plugin objects.
  // A nonempty version-manifest map raises AttributeError in its info query.
  match source.manifest.get("version_manifests") {
    Some(Object(values)) if values.length() > 0 =>
      return Err("AttributeError:version_manifest_name")
    _ => ()
  }
  result["version_manifests"] = Json::empty_object()
  for kind in ["adapters", "schemadefs", "media_linkers", "hook_scripts"] {
    let entries : Map[String, Json] = Map([])
    let list = match manifest_plugins(source.manifest, kind) {
      Ok(v) => v
      Err(e) => return Err(e)
    }
    for descriptor in list {
      let name = match descriptor.get("name") {
        Some(String(v)) => v
        _ => return Err("TypeError:plugin_name")
      }
      entries[name] = match info(descriptor) {
        Ok(v) => v
        Err(e) =>
          Json::string("ERROR: could not compute plugin_info_map because: " + e)
      }
    }
    result[kind] = Json::object(entries)
  }
  result["hooks"] = source.manifest.get("hooks").unwrap_or(Json::empty_object())
  result["manifests"] = Json::array(
    source.source_files.map(fn(s) { Json::string(s) }),
  )
  @otiojson.clone(Json::object(result))
}
