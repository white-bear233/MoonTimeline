///|
/// Standard schema inheritance for typed traversal; custom unregistered schemas
/// only promise SerializableObject, as upstream UnknownSchema does.
pub fn Object::is_a(self : Object, base : String) -> Bool {
  let kind = self.schema_name()
  if base == kind {
    return true
  }
  let composition = ["Composition", "Track", "Stack"].contains(kind)
  let item = composition || ["Item", "Clip", "Gap"].contains(kind)
  let composable = item || ["Composable", "Transition"].contains(kind)
  let media = [
    "MediaReference", "ExternalReference", "MissingReference", "GeneratorReference",
    "ImageSequenceReference",
  ].contains(kind)
  let effect = ["Effect", "TimeEffect", "LinearTimeWarp", "FreezeFrame"].contains(
    kind,
  )
  match base {
    "Composition" => composition
    "Item" => item
    "Composable" => composable
    "MediaReference" => media
    "Effect" => effect
    "TimeEffect" =>
      ["TimeEffect", "LinearTimeWarp", "FreezeFrame"].contains(kind)
    "LinearTimeWarp" => kind == "FreezeFrame"
    "SerializableObjectWithMetadata" =>
      composable ||
      media ||
      effect ||
      [
        "SerializableObjectWithMetadata", "Marker", "Timeline", "SerializableCollection",
      ].contains(kind)
    "SerializableObject" =>
      !["RationalTime", "TimeRange", "TimeTransform", "V2d", "Box2d", "Color"].contains(
        kind,
      )
    _ => false
  }
}

///|
pub fn Object::composition_kind(self : Object) -> Result[String, String] {
  if self.is_a("Composition") {
    Ok(self.schema_name())
  } else {
    Err("not_a_composition")
  }
}
