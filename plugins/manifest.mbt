///|
/// Host-owned module resolution. Paths in a manifest are descriptions, never
/// executable code in the portable library. The host supplies these callbacks.
pub(all) struct Resolver {
  adapter : (@schema.Object) -> Result[Adapter, String]
  hook : (@schema.Object) -> Result[
    (Json, Json) -> Result[Json, String],
    String,
  ]
  media_linker : (@schema.Object) -> Result[
    (Json, Json) -> Result[Json, String],
    String,
  ]
  schema : (@schema.Object) -> Result[SchemaDefinition, String]
}

///|
fn descriptions(
  manifest : @schema.Object,
  key : String,
  kind : String,
) -> Result[Array[@schema.Object], String] {
  let values = match manifest.get(key) {
    Some(Array(a)) => a
    None => return Ok([])
    _ => return Err("invalid_manifest_list:" + key)
  }
  let out : Array[@schema.Object] = []
  for raw in values {
    let o = match @schema.Object::from_json(raw) {
      Ok(v) => v
      Err(e) => return Err(e)
    }
    if o.schema_name() != kind {
      return Err("invalid_plugin_description:" + key)
    }
    out.push(o)
  }
  Ok(out)
}

///|
pub fn Registry::adapter_names(self : Registry) -> Array[String] {
  self.adapters.keys().to_array()
}

///|
pub fn Registry::media_linker_names(self : Registry) -> Array[String] {
  self.linkers.keys().to_array()
}

///|
/// Host supplies discovered paths (for example OTIO_PLUGIN_MANIFEST_PATH) and
/// file IO. Duplicate paths are ignored. Each manifest loads atomically.
pub fn Registry::discover(
  self : Registry,
  paths : Array[String],
  read_file : (String) -> Result[String, String],
  resolver : Resolver,
) -> Result[Array[String], String] {
  let loaded : Array[String] = []
  for path in paths {
    if loaded.contains(path) {
      continue
    }
    let text = match read_file(path) {
      Ok(v) => v
      Err(e) => return Err(e)
    }
    let manifest = match @schema.read(text) {
      Ok(v) => v
      Err(e) => return Err(e)
    }
    match self.load_manifest(manifest, resolver) {
      Err(e) => return Err(path + ":" + e)
      _ => ()
    }
    loaded.push(path)
  }
  Ok(loaded)
}

///|
/// Registration is atomic: failed resolution or invalid hooks leave the registry
/// unchanged. Callback side effects remain the responsibility of the host.
pub fn Registry::load_manifest(
  self : Registry,
  manifest : @schema.Object,
  resolver : Resolver,
) -> Result[Unit, String] {
  if manifest.schema_name() != "PluginManifest" {
    return Err("not_a_plugin_manifest")
  }
  let hooks : Map[String, Array[(Json, Json) -> Result[Json, String]]] = Map([])
  for phase, list in self.hooks {
    hooks[phase] = list.copy()
  }
  let staged : Registry = {
    adapters: self.adapters.copy(),
    hooks,
    linkers: self.linkers.copy(),
    schemas: self.schemas.copy(),
    versions: self.versions.copy(),
  }
  let adapters = match descriptions(manifest, "adapters", "Adapter") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  for desc in adapters {
    let plugin = match (resolver.adapter)(desc) {
      Ok(v) => v
      Err(e) => return Err(e)
    }
    if desc.name() != Ok(plugin.name) {
      return Err("plugin_name_mismatch")
    }
    match staged.register_adapter(plugin) {
      Err(e) => return Err(e)
      _ => ()
    }
  }
  let linkers = match descriptions(manifest, "media_linkers", "MediaLinker") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  for desc in linkers {
    let name = match desc.name() {
      Ok(v) => v
      Err(e) => return Err(e)
    }
    let plugin = match (resolver.media_linker)(desc) {
      Ok(v) => v
      Err(e) => return Err(e)
    }
    match staged.register_media_linker(name, plugin) {
      Err(e) => return Err(e)
      _ => ()
    }
  }
  let definitions = match descriptions(manifest, "schemadefs", "SchemaDef") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  for desc in definitions {
    let plugin = match (resolver.schema)(desc) {
      Ok(v) => v
      Err(e) => return Err(e)
    }
    match staged.register_schema(plugin) {
      Err(e) => return Err(e)
      _ => ()
    }
  }
  let scripts = match descriptions(manifest, "hook_scripts", "HookScript") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let resolved : Map[String, (Json, Json) -> Result[Json, String]] = Map([])
  for desc in scripts {
    let name = match desc.name() {
      Ok(v) => v
      Err(e) => return Err(e)
    }
    if resolved.contains(name) {
      return Err("duplicate_hook_script")
    }
    resolved[name] = match (resolver.hook)(desc) {
      Ok(v) => v
      Err(e) => return Err(e)
    }
  }
  match manifest.get("hooks") {
    Some(Object(phases)) =>
      for phase, names in phases {
        let names = match names {
          Array(a) => a
          _ => return Err("invalid_manifest_hooks")
        }
        for name in names {
          let name = match name {
            String(s) => s
            _ => return Err("invalid_hook_name")
          }
          let hook = match resolved.get(name) {
            Some(v) => v
            None => return Err("hook_script_not_found")
          }
          match staged.register_hook(phase, hook) {
            Err(e) => return Err(e)
            _ => ()
          }
        }
      }
    None => ()
    _ => return Err("invalid_manifest_hooks")
  }
  match manifest.get("version_manifests") {
    Some(Object(families)) =>
      for family, labels in families {
        let labels = match labels {
          Object(o) => o
          _ => return Err("invalid_version_manifest")
        }
        for label, values in labels {
          let values = match values {
            Object(o) => o
            _ => return Err("invalid_version_manifest")
          }
          let versions : Map[String, Int32] = Map([])
          for name, value in values {
            match value {
              Number(n, ..) =>
                if n >= 1.0 && n <= 2147483647.0 && n.to_int().to_double() == n {
                  versions[name] = n.to_int()
                } else {
                  return Err("invalid_schema_version")
                }
              _ => return Err("invalid_schema_version")
            }
          }
          match
            staged.register_version_manifest(family + ":" + label, versions) {
            Err(e) => return Err(e)
            _ => ()
          }
        }
      }
    None => ()
    _ => return Err("invalid_version_manifest")
  }
  for name, value in staged.adapters {
    self.adapters[name] = value
  }
  for name, value in staged.hooks {
    self.hooks[name] = value
  }
  for name, value in staged.linkers {
    self.linkers[name] = value
  }
  for name, value in staged.schemas {
    self.schemas[name] = value
  }
  for name, value in staged.versions {
    self.versions[name] = value
  }
  Ok(())
}
