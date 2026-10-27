///|
/// Host services for the full OTIO adapter calling convention. Each argument map
/// is separate; adapters receive keyword arguments as a JSON object.
pub(all) struct PluginIO {
  read_file : (String) -> Result[String, String]
  write_file : (String, String) -> Result[Unit, String]
  hook : (String, Json, Json) -> Result[Json, String]
  link_media : (Json, String, Json) -> Result[Json, String]
}

///|
fn argument_map(value : Json) -> Result[Map[String, Json], String] {
  match @otiojson.clone(value) {
    Ok(Object(v)) => Ok(v)
    Ok(Null) => Ok(Map([]))
    _ => Err("TypeError:argument_map")
  }
}

///|
fn keyword(
  arguments : Map[String, Json],
  key : String,
  value : Json,
) -> Result[Unit, String] {
  if arguments.contains(key) {
    Err("TypeError:duplicate_keyword:" + key)
  } else {
    arguments[key] = value
    Ok(())
  }
}

///|
pub fn Plugin::read_document(
  self : Plugin,
  input : String,
  io : PluginIO,
  from_file~ : Bool = false,
  adapter_arguments~ : Json = Json::empty_object(),
  hook_arguments~ : Json = Json::empty_object(),
  media_arguments~ : Json = Json::null(),
  media_linker~ : String? = Some("__default"),
) -> Result[Json, String] {
  let args = match argument_map(adapter_arguments) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let hooks = match argument_map(hook_arguments) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let media = if from_file {
    match argument_map(media_arguments) {
      Ok(v) => Json::object(v)
      Err(e) => return Err(e)
    }
  } else {
    match @otiojson.clone(media_arguments) {
      Ok(v) => v
      Err(e) => return Err(e)
    }
  }
  hooks["adapter_arguments"] = @otiojson.clone(Json::object(args)).unwrap()
  hooks["media_linker_argument_map"] = if from_file {
    media
  } else {
    @otiojson.clone(media).unwrap()
  }
  match self.has_feature("hooks") {
    Ok(true) => args["hook_function_argument_map"] = Json::object(hooks)
    Err(e) => return Err(e)
    _ => ()
  }
  let mut function_name = "read_from_string"
  if from_file {
    let file = match self.has_feature("read_from_file") {
      Ok(v) => v
      Err(e) => return Err(e)
    }
    let string = if file {
      false
    } else {
      match self.has_feature("read_from_string") {
        Ok(v) => v
        Err(e) => return Err(e)
      }
    }
    if !file && string {
      let text = match (io.read_file)(input) {
        Ok(v) => v
        Err(e) => return Err(e)
      }
      match keyword(args, "input_str", Json::string(text)) {
        Err(e) => return Err(e)
        _ => ()
      }
    } else {
      function_name = "read_from_file"
      match keyword(args, "filepath", Json::string(input)) {
        Err(e) => return Err(e)
        _ => ()
      }
    }
  } else {
    match keyword(args, "input_str", Json::string(input)) {
      Err(e) => return Err(e)
      _ => ()
    }
  }
  let value = match self.execute(function_name, Json::object(args)) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let value = match (io.hook)("post_adapter_read", value, Json::object(hooks)) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let value = match media_linker {
    Some(name) if name != "" && name != "__do_not_link_media" =>
      match (io.link_media)(value, name, media) {
        Ok(v) => v
        Err(e) => return Err(e)
      }
    _ => value
  }
  (io.hook)(
    "post_media_linker",
    value,
    if from_file {
      media
    } else {
      Json::object(hooks)
    },
  )
}

///|
pub fn Plugin::write_document(
  self : Plugin,
  document : Json,
  io : PluginIO,
  filepath~ : String? = None,
  adapter_arguments~ : Json = Json::empty_object(),
  hook_arguments~ : Json = Json::empty_object(),
) -> Result[Json, String] {
  let args = match argument_map(adapter_arguments) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let hooks = match argument_map(hook_arguments) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  hooks["adapter_arguments"] = @otiojson.clone(Json::object(args)).unwrap()
  match filepath {
    Some(path) => hooks["_filepath"] = Json::string(path)
    None => ()
  }
  if filepath is Some(_) {
    match self.has_feature("hooks") {
      Ok(true) => args["hook_function_argument_map"] = Json::object(hooks)
      Err(e) => return Err(e)
      _ => ()
    }
  }
  let value = match
    (io.hook)("pre_adapter_write", document, Json::object(hooks)) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  match filepath {
    None => {
      match keyword(args, "input_otio", value) {
        Err(e) => return Err(e)
        _ => ()
      }
      self.execute("write_to_string", Json::object(args))
    }
    Some(path) => {
      let file = match self.has_feature("write_to_file") {
        Ok(v) => v
        Err(e) => return Err(e)
      }
      let string = if file {
        false
      } else {
        match self.has_feature("write_to_string") {
          Ok(v) => v
          Err(e) => return Err(e)
        }
      }
      let result = if !file && string {
        let nested_hooks = args
          .get("hook_function_argument_map")
          .unwrap_or(Json::empty_object())
        args.remove("hook_function_argument_map")
        let text = match
          self.write_document(
            value,
            io,
            adapter_arguments=Json::object(args),
            hook_arguments=nested_hooks,
          ) {
          Ok(String(v)) => v
          Ok(_) => return Err("TypeError:adapter_text")
          Err(e) => return Err(e)
        }
        match (io.write_file)(path, text) {
          Err(e) => return Err(e)
          _ => ()
        }
        Json::string(path)
      } else {
        match keyword(args, "input_otio", value) {
          Err(e) => return Err(e)
          _ => ()
        }
        match keyword(args, "filepath", Json::string(path)) {
          Err(e) => return Err(e)
          _ => ()
        }
        match self.execute("write_to_file", Json::object(args)) {
          Ok(v) => v
          Err(e) => return Err(e)
        }
      }
      match (io.hook)("post_adapter_write", value, Json::object(hooks)) {
        Err(e) => return Err(e)
        _ => ()
      }
      Ok(result)
    }
  }
}
