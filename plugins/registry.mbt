///|
pub(all) struct Adapter {
  name : String
  suffixes : Array[String]
  read : (String) -> Result[Json, String]
  write : (Json) -> Result[String, String]
}

///|
pub(all) struct SchemaDefinition {
  name : String
  version : Int32
  upgrade : (Json, Int32) -> Result[Json, String]
  downgrade : (Json, Int32) -> Result[Json, String]
}

///|
pub struct Registry {
  priv adapters : Map[String, Adapter]
  priv hooks : Map[String, Array[(Json, Json) -> Result[Json, String]]]
  priv linkers : Map[String, (Json, Json) -> Result[Json, String]]
  priv schemas : Map[String, SchemaDefinition]
  priv versions : Map[String, Map[String, Int32]]
}

///|
pub fn Registry::new() -> Registry {
  let adapters : Map[String, Adapter] = Map([])
  adapters["otio_json"] = {
    name: "otio_json",
    suffixes: ["otio"],
    read: fn(s) { @otiojson.parse(s) },
    write: fn(j) { @otiojson.stringify(j) },
  }
  {
    adapters,
    hooks: Map([]),
    linkers: Map([]),
    schemas: Map([]),
    versions: Map([]),
  }
}

///|
pub fn Registry::register_adapter(
  self : Registry,
  adapter : Adapter,
) -> Result[Unit, String] {
  if adapter.name == "" || self.adapters.contains(adapter.name) {
    return Err("duplicate_or_empty_adapter")
  }
  self.adapters[adapter.name] = {
    ..adapter,
    suffixes: adapter.suffixes.copy(),
  }
  Ok(())
}

///|
pub fn Registry::adapter_for_suffix(
  self : Registry,
  suffix : String,
) -> Result[String, String] {
  let matches : Array[String] = []
  for name, adapter in self.adapters {
    if adapter.suffixes.contains(suffix.to_lower()) {
      matches.push(name)
    }
  }
  if matches.length() == 1 {
    Ok(matches[0])
  } else if matches.length() == 0 {
    Err("adapter_not_found")
  } else {
    Err("ambiguous_adapter_suffix")
  }
}

///|
pub fn Registry::register_hook(
  self : Registry,
  phase : String,
  hook : (Json, Json) -> Result[Json, String],
) -> Result[Unit, String] {
  if ![
      "post_adapter_read", "post_media_linker", "pre_adapter_write", "post_adapter_write",
    ].contains(phase) {
    return Err("unknown_hook_phase")
  }
  let list = self.hooks.get(phase).unwrap_or([])
  list.push(hook)
  self.hooks[phase] = list
  Ok(())
}

///|
pub fn Registry::run_hooks(
  self : Registry,
  phase : String,
  document : Json,
  args : Json,
) -> Result[Json, String] {
  if ![
      "post_adapter_read", "post_media_linker", "pre_adapter_write", "post_adapter_write",
    ].contains(phase) {
    return Err("unknown_hook_phase")
  }
  let args = match @otiojson.clone(args) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let mut value = match @otiojson.clone(document) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  for hook in self.hooks.get(phase).unwrap_or([]) {
    value = match hook(value, @otiojson.clone(args).unwrap()) {
      Ok(v) => v
      Err(e) => return Err(e)
    }
  }
  @otiojson.clone(value)
}

///|
pub fn Registry::register_media_linker(
  self : Registry,
  name : String,
  linker : (Json, Json) -> Result[Json, String],
) -> Result[Unit, String] {
  if name == "" || self.linkers.contains(name) {
    return Err("duplicate_or_empty_linker")
  }
  self.linkers[name] = linker
  Ok(())
}

///|
pub fn Registry::link_media(
  self : Registry,
  document : Json,
  name : String,
  args~ : Json = Json::empty_object(),
) -> Result[Json, String] {
  let args = match @otiojson.clone(args) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let linker = match self.linkers.get(name) {
    Some(v) => v
    None => return Err("media_linker_not_found")
  }
  let copy = match @otiojson.clone(document) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  fn walk(j : Json, depth : Int32) -> Result[Unit, String] {
    if depth > 64 {
      return Err("input_limit")
    }
    match j {
      Object(o) => {
        if @schema.tag(j) == "Clip.2" {
          let media = match
            linker(@otiojson.clone(j).unwrap(), @otiojson.clone(args).unwrap()) {
            Ok(v) => v
            Err(e) => return Err(e)
          }
          if !(media is Null) {
            let reference = match @schema.Object::from_json(media) {
              Ok(v) => v
              Err(e) => return Err(e)
            }
            if !reference.schema_name().has_suffix("Reference") &&
              !reference.is_unknown() {
              return Err("linker_returned_non_media")
            }
            let key = match o.get("active_media_reference_key") {
              Some(String(s)) => s
              _ => return Err("missing_active_key")
            }
            match o.get("media_references") {
              Some(Object(refs)) => refs[key] = media
              _ => return Err("invalid_media_map")
            }
          }
        }
        for _, v in o {
          match walk(v, depth + 1) {
            Err(e) => return Err(e)
            _ => ()
          }
        }
      }
      Array(a) =>
        for v in a {
          match walk(v, depth + 1) {
            Err(e) => return Err(e)
            _ => ()
          }
        }
      _ => ()
    }
    Ok(())
  }
  match walk(copy, 0) {
    Err(e) => return Err(e)
    _ => ()
  }
  self.run_hooks("post_media_linker", copy, args)
}

///|
pub fn Registry::read(
  self : Registry,
  source : String,
  adapter~ : String = "otio_json",
  media_linker~ : String? = None,
  args~ : Json = Json::empty_object(),
) -> Result[Json, String] {
  let a = match self.adapters.get(adapter) {
    Some(v) => v
    None => return Err("adapter_not_found")
  }
  let document = match (a.read)(source) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let document = match self.upgrade_document(document) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let document = match self.run_hooks("post_adapter_read", document, args) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  match media_linker {
    Some(name) => self.link_media(document, name, args~)
    None => self.run_hooks("post_media_linker", document, args)
  }
}

///|
pub fn Registry::write(
  self : Registry,
  document : Json,
  adapter~ : String = "otio_json",
  args~ : Json = Json::empty_object(),
) -> Result[String, String] {
  let a = match self.adapters.get(adapter) {
    Some(v) => v
    None => return Err("adapter_not_found")
  }
  let document = match self.run_hooks("pre_adapter_write", document, args) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let text = match (a.write)(document) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  Ok(text)
}

///|
/// File IO belongs to the host. The string adapter and hooks remain portable.
pub fn Registry::read_file(
  self : Registry,
  path : String,
  read_file : (String) -> Result[String, String],
  adapter~ : String = "otio_json",
  media_linker~ : String? = None,
  args~ : Json = Json::empty_object(),
) -> Result[Json, String] {
  let source = match read_file(path) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  self.read(source, adapter~, media_linker~, args~)
}

///|
/// Match upstream's string-to-file fallback, including its two pre-write hook
/// passes. post_adapter_write is a file event, never a write-to-string event.
pub fn Registry::write_file(
  self : Registry,
  document : Json,
  path : String,
  write_file : (String, String) -> Result[Unit, String],
  adapter~ : String = "otio_json",
  args~ : Json = Json::empty_object(),
) -> Result[String, String] {
  let document = match self.run_hooks("pre_adapter_write", document, args) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let source = match self.write(document, adapter~) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  match write_file(path, source) {
    Err(e) => return Err(e)
    _ => ()
  }
  match self.run_hooks("post_adapter_write", document, args) {
    Err(e) => return Err(e)
    _ => ()
  }
  Ok(path)
}

///|
pub fn Registry::register_schema(
  self : Registry,
  definition : SchemaDefinition,
) -> Result[Unit, String] {
  if definition.name == "" ||
    definition.version < 1 ||
    self.schemas.contains(definition.name) ||
    @schema.registered_schemas().contains(definition.name) {
    return Err("invalid_or_duplicate_schema")
  }
  self.schemas[definition.name] = definition
  Ok(())
}

///|
pub fn Registry::convert_schema(
  self : Registry,
  object : @schema.Object,
  version : Int32,
) -> Result[Json, String] {
  let name = object.schema_name()
  if object.schema_version() == version {
    return object.to_json()
  }
  match self.schemas.get(name) {
    Some(definition) => {
      if version < 1 || version > definition.version {
        return Err("unsupported_schema_version")
      }
      let raw = object.to_json().unwrap()
      let converted = if version > object.schema_version() {
        (definition.upgrade)(raw, version)
      } else {
        (definition.downgrade)(raw, version)
      }
      match converted {
        Ok(Object(o)) => {
          o["OTIO_SCHEMA"] = Json::string(name + "." + version.to_string())
          @otiojson.clone(Json::object(o))
        }
        Ok(_) => Err("invalid_schema_callback")
        Err(e) => Err(e)
      }
    }
    None => object.to_version(version)
  }
}

///|
pub fn Registry::register_version_manifest(
  self : Registry,
  name : String,
  versions : Map[String, Int32],
) -> Result[Unit, String] {
  if name == "" || self.versions.contains(name) {
    return Err("duplicate_or_empty_version_manifest")
  }
  for _, version in versions {
    if version < 1 {
      return Err("invalid_schema_version")
    }
  }
  self.versions[name] = versions.copy()
  Ok(())
}

///|
pub fn Registry::write_versions(
  self : Registry,
  document : Json,
  manifest : String,
) -> Result[String, String] {
  let versions = match self.versions.get(manifest) {
    Some(v) => v
    None => return Err("version_manifest_not_found")
  }
  fn convert(j : Json, depth : Int32) -> Result[Json, String] {
    if depth > 64 {
      return Err("input_limit")
    }
    match j {
      Object(o) => {
        let raw = Json::object(o)
        let converted = if @schema.tag(raw) == "" {
          raw
        } else {
          let obj = match @schema.Object::from_json(raw) {
            Ok(v) => v
            Err(e) => return Err(e)
          }
          match versions.get(obj.schema_name()) {
            Some(v) =>
              match self.convert_schema(obj, v) {
                Ok(j) => j
                Err(e) => return Err(e)
              }
            None => raw
          }
        }
        let fields : Map[String, Json] = Map([])
        match converted {
          Object(values) =>
            for k, v in values {
              match convert(v, depth + 1) {
                Ok(v) => fields[k] = v
                Err(e) => return Err(e)
              }
            }
          _ => return Err("invalid_schema_callback")
        }
        Ok(Json::object(fields))
      }
      Array(a) => {
        let out : Array[Json] = []
        for v in a {
          match convert(v, depth + 1) {
            Ok(v) => out.push(v)
            Err(e) => return Err(e)
          }
        }
        Ok(Json::array(out))
      }
      _ => Ok(j)
    }
  }
  match convert(document, 0) {
    Ok(j) => @otiojson.stringify(j)
    Err(e) => Err(e)
  }
}

///|
pub fn Registry::link_media_reference(
  self : Registry,
  clip : Json,
  name : String,
  args~ : Json = Json::empty_object(),
) -> Result[Json, String] {
  let linker = match self.linkers.get(name) {
    Some(v) => v
    None => return Err("media_linker_not_found")
  }
  let input = match @otiojson.clone(clip) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let args = match @otiojson.clone(args) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  match linker(input, args) {
    Ok(v) => @otiojson.clone(v)
    Err(e) => Err(e)
  }
}
