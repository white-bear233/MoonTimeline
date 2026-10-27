///|
fn component(object : Object, field : String) -> Result[Double, String] {
  match object.get(field) {
    Some(Number(n, ..)) => Ok(n)
    _ => Err("invalid_spatial_component")
  }
}

///|
pub(all) struct V2d {
  x : Double
  y : Double
}

///|
pub fn V2d::to_json(self : V2d) -> Json {
  Json::object({
    "OTIO_SCHEMA": Json::string("V2d.1"),
    "x": Json::number(self.x),
    "y": Json::number(self.y),
  })
}

///|
pub fn V2d::from_json(raw : Json) -> Result[V2d, String] {
  let object = match Object::from_json(raw) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  if object.schema_name() != "V2d" {
    return Err("not_a_vector")
  }
  let x = match component(object, "x") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let y = match component(object, "y") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  Ok({ x, y, })
}

///|
pub(all) struct Box2d {
  min : V2d
  max : V2d
}

///|
pub fn Box2d::to_json(self : Box2d) -> Json {
  Json::object({
    "OTIO_SCHEMA": Json::string("Box2d.1"),
    "min": self.min.to_json(),
    "max": self.max.to_json(),
  })
}

///|
pub fn Box2d::from_json(raw : Json) -> Result[Box2d, String] {
  let object = match Object::from_json(raw) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  if object.schema_name() != "Box2d" {
    return Err("not_a_box")
  }
  let min = match object.get("min") {
    Some(j) =>
      match V2d::from_json(j) {
        Ok(v) => v
        Err(e) => return Err(e)
      }
    None => return Err("missing_min")
  }
  let max = match object.get("max") {
    Some(j) =>
      match V2d::from_json(j) {
        Ok(v) => v
        Err(e) => return Err(e)
      }
    None => return Err("missing_max")
  }
  Ok({ min, max, })
}

///|
pub fn Box2d::contains(self : Box2d, point : V2d) -> Bool {
  point.x >= self.min.x &&
  point.x <= self.max.x &&
  point.y >= self.min.y &&
  point.y <= self.max.y
}

///|
pub fn Box2d::extended_by(self : Box2d, other : Box2d) -> Box2d {
  {
    min: {
      x: if self.min.x < other.min.x {
        self.min.x
      } else {
        other.min.x
      },
      y: if self.min.y < other.min.y {
        self.min.y
      } else {
        other.min.y
      },
    },
    max: {
      x: if self.max.x > other.max.x {
        self.max.x
      } else {
        other.max.x
      },
      y: if self.max.y > other.max.y {
        self.max.y
      } else {
        other.max.y
      },
    },
  }
}

///|
pub(all) struct Color {
  r : Double
  g : Double
  b : Double
  a : Double
  name : String
}

///|
pub fn Color::to_json(self : Color) -> Json {
  Json::object({
    "OTIO_SCHEMA": Json::string("Color.1"),
    "r": Json::number(self.r),
    "g": Json::number(self.g),
    "b": Json::number(self.b),
    "a": Json::number(self.a),
    "name": Json::string(self.name),
  })
}

///|
pub fn Color::from_json(raw : Json) -> Result[Color, String] {
  let o = match Object::from_json(raw) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  if o.schema_name() != "Color" {
    return Err("not_a_color")
  }
  let r = match component(o, "r") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let g = match component(o, "g") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let b = match component(o, "b") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let a = match component(o, "a") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let name = match text(o, "name") {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  Ok({ r, g, b, a, name, })
}
