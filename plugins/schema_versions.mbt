///|
/// Upgrade registered schema definitions throughout a document. Unknown tags
/// remain data; a registered future version is rejected explicitly.
pub fn Registry::upgrade_document(
  self : Registry,
  document : Json,
) -> Result[Json, String] {
  let copy = match @otiojson.clone(document) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  fn walk(j : Json, depth : Int32) -> Result[Json, String] {
    if depth > 64 {
      return Err("input_limit")
    }
    match j {
      Object(o) => {
        let converted = if @schema.tag(j) == "" {
          j
        } else {
          let obj = match @schema.Object::from_json(j) {
            Ok(v) => v
            Err(e) => return Err(e)
          }
          match self.schemas.get(obj.schema_name()) {
            Some(def) => {
              if obj.schema_version() > def.version {
                return Err("unsupported_schema_version")
              }
              match self.convert_schema(obj, def.version) {
                Ok(v) => v
                Err(e) => return Err(e)
              }
            }
            None => obj.to_json().unwrap()
          }
        }
        let values = match converted {
          Object(fields) => fields
          _ => o
        }
        let out : Map[String, Json] = Map([])
        for k, v in values {
          match walk(v, depth + 1) {
            Ok(v) => out[k] = v
            Err(e) => return Err(e)
          }
        }
        Ok(Json::object(out))
      }
      Array(a) => {
        let out : Array[Json] = []
        for v in a {
          match walk(v, depth + 1) {
            Ok(v) => out.push(v)
            Err(e) => return Err(e)
          }
        }
        Ok(Json::array(out))
      }
      _ => Ok(j)
    }
  }
  walk(copy, 0)
}
