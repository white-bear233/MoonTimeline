///|
/// Host-owned function reflection and invocation. Python class/function objects
/// are represented by stable host identifiers and JSON arguments at this boundary.
pub(all) struct ModuleFunction {
  arguments : Array[String]
  doc : String?
  invoke : (Json) -> Result[Json, String]
}

///|
pub(all) struct PluginModule {
  id : String
  doc : String?
  functions : Map[String, ModuleFunction]
  schema_definitions : Json
}

///|
/// A lazy plugin handle. Successful loads are cached; failed loads may be retried.
/// The loader receives the descriptor and namespace and owns platform imports.
pub struct Plugin {
  description : @schema.Object
  manifest_path : String?
  priv loader : (@schema.Object, String) -> Result[PluginModule, String]
  priv mut loaded : PluginModule?
}

///|
pub fn Plugin::new(
  description : @schema.Object,
  loader : (@schema.Object, String) -> Result[PluginModule, String],
  manifest_path~ : String? = None,
) -> Result[Plugin, String] {
  if !["Adapter", "HookScript", "MediaLinker", "SchemaDef"].contains(
      description.schema_name(),
    ) {
    return Err("not_a_plugin")
  }
  Ok({ description, manifest_path, loader, loaded: None, })
}

///|
pub fn Plugin::load_module(self : Plugin) -> Result[PluginModule, String] {
  match self.loaded {
    Some(v) => return Ok(v)
    None => ()
  }
  let module_namespace = if self.description.schema_name() == "SchemaDef" {
    "schemadef"
  } else {
    "adapters"
  }
  match (self.loader)(self.description, module_namespace) {
    Ok(v) => {
      self.loaded = Some(v)
      Ok(v)
    }
    Err(e) => Err(e)
  }
}

///|
/// POSIX / virtual-file-system path semantics. Native Windows hosts should supply
/// their own resolver through module_abs_path's optional resolve callback.
pub fn plugin_path(
  filepath : String,
  manifest_path : String?,
) -> Result[String, String] {
  if filepath.has_prefix("/") {
    return Ok(filepath)
  }
  let manifest = match manifest_path {
    Some(v) if v != "" => v
    _ => return Err("MisconfiguredPluginError:missing_json_path")
  }
  let pieces = manifest.split("/").to_array()
  let mut last = pieces.length() - 2
  while last >= 0 && pieces[last] == "" {
    last -= 1
  }
  let mut directory = ""
  let count = if last < 0 { pieces.length() - 1 } else { last + 1 }
  for i = 0; i < count; i = i + 1 {
    directory = directory + pieces[i].to_owned() + "/"
  }
  Ok(directory + filepath)
}

///|
pub fn Plugin::module_abs_path(
  self : Plugin,
  resolve~ : (String, String?) -> Result[String, String] = plugin_path,
) -> Result[String, String] {
  match self.description.get("filepath") {
    Some(String(path)) => resolve(path, self.manifest_path)
    _ => Err("TypeError:invalid_filepath")
  }
}

///|
pub fn Plugin::has_feature(
  self : Plugin,
  feature : String,
) -> Result[Bool, String] {
  let features : Map[String, Array[String]] = {
    "read": ["read_from_file", "read_from_string"],
    "write": ["write_to_file", "write_to_string"],
    "read_from_file": ["read_from_file"],
    "read_from_string": ["read_from_string"],
    "write_to_file": ["write_to_file"],
    "write_to_string": ["write_to_string"],
    "hooks": ["adapter_hook_names"],
  }
  if !features.contains(feature.to_lower()) {
    return Ok(false)
  }
  // The upstream binding validates lowercase but indexes the original spelling.
  let names = match features.get(feature) {
    Some(v) => v
    None => return Err("KeyError:" + feature)
  }
  let loaded_module = match self.load_module() {
    Ok(v) => v
    Err(e) => {
      if e.has_prefix("ImportError:") || e.has_prefix("ModuleNotFoundError:") {
        return Ok(false)
      }
      return Err(e)
    }
  }
  for name in names {
    if loaded_module.functions.contains(name) {
      return Ok(true)
    }
  }
  Ok(false)
}

///|
pub fn Plugin::execute(
  self : Plugin,
  name : String,
  arguments : Json,
) -> Result[Json, String] {
  let loaded_module = match self.load_module() {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  match loaded_module.functions.get(name) {
    Some(f) => (f.invoke)(arguments)
    None => Err("AdapterDoesntSupportFunctionError:" + name)
  }
}

///|
pub fn Plugin::adapter_hook_names(self : Plugin) -> Result[Json, String] {
  match self.has_feature("hooks") {
    Err(e) => Err(e)
    Ok(false) => Ok(Json::array([]))
    Ok(true) => self.execute("adapter_hook_names", Json::empty_object())
  }
}

///|
pub fn Plugin::plugin_info_map(
  self : Plugin,
  default_linker~ : String = "",
  resolve~ : (String, String?) -> Result[String, String] = plugin_path,
) -> Result[Json, String] {
  let loaded_module = match self.load_module() {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let path = match self.module_abs_path(resolve~) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  fn optional(value : String?) -> Json {
    match value {
      Some(v) => Json::string(v)
      None => Json::null()
    }
  }
  let result : Map[String, Json] = {
    "name": self.description.get("name").unwrap_or(Json::null()),
    "doc": optional(loaded_module.doc),
    "path": Json::string(path),
    "from manifest": optional(self.manifest_path),
  }
  match self.description.schema_name() {
    "Adapter" => {
      let features : Map[String, Json] = Map([])
      for
        name in [
          "read_from_file", "read_from_string", "write_to_file", "write_to_string",
        ] {
        match loaded_module.functions.get(name) {
          Some(f) =>
            features[name] = Json::object({
              "args": Json::array(f.arguments.map(fn(s) { Json::string(s) })),
              "doc": optional(f.doc),
            })
          None => ()
        }
      }
      if loaded_module.functions.contains("adapter_hook_names") {
        features["hooks"] = match self.adapter_hook_names() {
          Ok(v) => v
          Err(e) => return Err(e)
        }
      }
      result["supported features"] = Json::object(features)
    }
    "MediaLinker" => {
      let function = match loaded_module.functions.get("link_media_reference") {
        Some(v) => v
        None => return Err("AttributeError:link_media_reference")
      }
      match function.doc {
        Some(doc) if doc != "" => {
          let original = match loaded_module.doc {
            Some(v) => v
            None => return Err("TypeError:missing_module_doc")
          }
          result["doc"] = Json::string(original + "\n\n" + doc)
        }
        _ => ()
      }
      if is_default_linker(self.description, default_linker) {
        result["** CURRENT DEFAULT MEDIA LINKER"] = Json::boolean(true)
      }
    }
    "SchemaDef" => result["SchemaDefs"] = loaded_module.schema_definitions
    _ => ()
  }
  @otiojson.clone(Json::object(result))
}

///|
/// Manifest lookup delegates loading to host-owned handles. The same handle can
/// be returned repeatedly by the host to preserve module caching and identity.
pub fn manifest_module(
  manifest : @schema.Object,
  key : String,
  load : (@schema.Object) -> Result[PluginModule, String],
  kind~ : String = "adapters",
  by_suffix~ : Bool = false,
) -> Result[PluginModule, String] {
  let descriptor = match
    (if by_suffix {
      manifest_from_suffix(manifest, key)
    } else {
      manifest_from_name(manifest, key, kind~)
    }) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  load(descriptor)
}
