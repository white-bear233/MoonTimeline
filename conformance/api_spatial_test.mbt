// Generated from official OTIO 0.18.1 by tools/generate_api_tests.py.

///|
test "spatial:vector-0" {
  let v = @schema.V2d::from_json(
    @otiojson.parse(
      "{\n    \"OTIO_SCHEMA\": \"V2d.1\",\n    \"x\": 0.0,\n    \"y\": 0.0\n}",
    ).unwrap(),
  ).unwrap()
  api_number(v.length(), 0.0)
  api_number(v.length_squared(), 0.0)
  let vector = v.normalized().unwrap()
  api_number(vector.x, 0.0)
  api_number(vector.y, 0.0)
  let vector = v.normalized_non_null()
  api_number(vector.x, 0.0 / 0.0)
  api_number(vector.y, 0.0 / 0.0)
  assert_true(v.normalized(reject_zero=true) is Err(_))
  let b = @schema.V2d::from_json(
    @otiojson.parse(
      "{\n    \"OTIO_SCHEMA\": \"V2d.1\",\n    \"x\": 0.0,\n    \"y\": 0.0\n}",
    ).unwrap(),
  ).unwrap()
  api_number(v.dot(b), 0.0)
  api_number(v.cross(b), 0.0)
  let vector = v.add(b)
  api_number(vector.x, 0.0)
  api_number(vector.y, 0.0)
  let vector = v.subtract(b)
  api_number(vector.x, 0.0)
  api_number(vector.y, 0.0)
  let vector = v.multiply_components(b)
  api_number(vector.x, 0.0)
  api_number(vector.y, 0.0)
  assert_eq(v.equal_with_error(b, -1.0), false)
  assert_eq(v.equal_with_error(b, -1.0, relative=true), true)
  assert_eq(v.equal_with_error(b, 0.0), true)
  assert_eq(v.equal_with_error(b, 0.0, relative=true), true)
  assert_eq(v.equal_with_error(b, 0.1), true)
  assert_eq(v.equal_with_error(b, 0.1, relative=true), true)
  assert_eq(v.equal_with_error(b, 1.0 / 0.0), true)
  assert_eq(v.equal_with_error(b, 1.0 / 0.0, relative=true), false)
  assert_eq(v.equal_with_error(b, 0.0 / 0.0), false)
  assert_eq(v.equal_with_error(b, 0.0 / 0.0, relative=true), false)
  let b = @schema.V2d::from_json(
    @otiojson.parse(
      "{\n    \"OTIO_SCHEMA\": \"V2d.1\",\n    \"x\": 3.0,\n    \"y\": 4.0\n}",
    ).unwrap(),
  ).unwrap()
  api_number(v.dot(b), 0.0)
  api_number(v.cross(b), 0.0)
  let vector = v.add(b)
  api_number(vector.x, 3.0)
  api_number(vector.y, 4.0)
  let vector = v.subtract(b)
  api_number(vector.x, -3.0)
  api_number(vector.y, -4.0)
  let vector = v.multiply_components(b)
  api_number(vector.x, 0.0)
  api_number(vector.y, 0.0)
  assert_eq(v.equal_with_error(b, -1.0), false)
  assert_eq(v.equal_with_error(b, -1.0, relative=true), false)
  assert_eq(v.equal_with_error(b, 0.0), false)
  assert_eq(v.equal_with_error(b, 0.0, relative=true), false)
  assert_eq(v.equal_with_error(b, 0.1), false)
  assert_eq(v.equal_with_error(b, 0.1, relative=true), false)
  assert_eq(v.equal_with_error(b, 1.0 / 0.0), true)
  assert_eq(v.equal_with_error(b, 1.0 / 0.0, relative=true), false)
  assert_eq(v.equal_with_error(b, 0.0 / 0.0), false)
  assert_eq(v.equal_with_error(b, 0.0 / 0.0, relative=true), false)
  let b = @schema.V2d::from_json(
    @otiojson.parse(
      "{\n    \"OTIO_SCHEMA\": \"V2d.1\",\n    \"x\": -1.0,\n    \"y\": 2.0\n}",
    ).unwrap(),
  ).unwrap()
  api_number(v.dot(b), 0.0)
  api_number(v.cross(b), 0.0)
  let vector = v.add(b)
  api_number(vector.x, -1.0)
  api_number(vector.y, 2.0)
  let vector = v.subtract(b)
  api_number(vector.x, 1.0)
  api_number(vector.y, -2.0)
  let vector = v.multiply_components(b)
  api_number(vector.x, -0.0)
  api_number(vector.y, 0.0)
  assert_eq(v.equal_with_error(b, -1.0), false)
  assert_eq(v.equal_with_error(b, -1.0, relative=true), false)
  assert_eq(v.equal_with_error(b, 0.0), false)
  assert_eq(v.equal_with_error(b, 0.0, relative=true), false)
  assert_eq(v.equal_with_error(b, 0.1), false)
  assert_eq(v.equal_with_error(b, 0.1, relative=true), false)
  assert_eq(v.equal_with_error(b, 1.0 / 0.0), true)
  assert_eq(v.equal_with_error(b, 1.0 / 0.0, relative=true), false)
  assert_eq(v.equal_with_error(b, 0.0 / 0.0), false)
  assert_eq(v.equal_with_error(b, 0.0 / 0.0, relative=true), false)
}

///|
test "spatial:normalize-0" {
  let v = @schema.V2d::from_json(
    @otiojson.parse(
      "{\n    \"OTIO_SCHEMA\": \"V2d.1\",\n    \"x\": 0.0,\n    \"y\": 0.0\n}",
    ).unwrap(),
  ).unwrap()
  let vector = v.normalized().unwrap()
  api_number(vector.x, 0.0)
  api_number(vector.y, 0.0)
}

///|
test "spatial:normalizeExc-0" {
  let v = @schema.V2d::from_json(
    @otiojson.parse(
      "{\n    \"OTIO_SCHEMA\": \"V2d.1\",\n    \"x\": 0.0,\n    \"y\": 0.0\n}",
    ).unwrap(),
  ).unwrap()
  assert_true(v.normalized(reject_zero=true) is Err(_))
}

///|
test "spatial:normalizeNonNull-0" {
  let v = @schema.V2d::from_json(
    @otiojson.parse(
      "{\n    \"OTIO_SCHEMA\": \"V2d.1\",\n    \"x\": 0.0,\n    \"y\": 0.0\n}",
    ).unwrap(),
  ).unwrap()
  let vector = v.normalized_non_null()
  api_number(vector.x, 0.0 / 0.0)
  api_number(vector.y, 0.0 / 0.0)
}

///|
test "spatial:vector-1" {
  let v = @schema.V2d::from_json(
    @otiojson.parse(
      "{\n    \"OTIO_SCHEMA\": \"V2d.1\",\n    \"x\": 3.0,\n    \"y\": 4.0\n}",
    ).unwrap(),
  ).unwrap()
  api_number(v.length(), 5.0)
  api_number(v.length_squared(), 25.0)
  let vector = v.normalized().unwrap()
  api_number(vector.x, 0.6)
  api_number(vector.y, 0.8)
  let vector = v.normalized_non_null()
  api_number(vector.x, 0.6)
  api_number(vector.y, 0.8)
  let vector = v.normalized(reject_zero=true).unwrap()
  api_number(vector.x, 0.6)
  api_number(vector.y, 0.8)
  let b = @schema.V2d::from_json(
    @otiojson.parse(
      "{\n    \"OTIO_SCHEMA\": \"V2d.1\",\n    \"x\": 0.0,\n    \"y\": 0.0\n}",
    ).unwrap(),
  ).unwrap()
  api_number(v.dot(b), 0.0)
  api_number(v.cross(b), 0.0)
  let vector = v.add(b)
  api_number(vector.x, 3.0)
  api_number(vector.y, 4.0)
  let vector = v.subtract(b)
  api_number(vector.x, 3.0)
  api_number(vector.y, 4.0)
  let vector = v.multiply_components(b)
  api_number(vector.x, 0.0)
  api_number(vector.y, 0.0)
  assert_eq(v.equal_with_error(b, -1.0), false)
  assert_eq(v.equal_with_error(b, -1.0, relative=true), false)
  assert_eq(v.equal_with_error(b, 0.0), false)
  assert_eq(v.equal_with_error(b, 0.0, relative=true), false)
  assert_eq(v.equal_with_error(b, 0.1), false)
  assert_eq(v.equal_with_error(b, 0.1, relative=true), false)
  assert_eq(v.equal_with_error(b, 1.0 / 0.0), true)
  assert_eq(v.equal_with_error(b, 1.0 / 0.0, relative=true), true)
  assert_eq(v.equal_with_error(b, 0.0 / 0.0), false)
  assert_eq(v.equal_with_error(b, 0.0 / 0.0, relative=true), false)
  let b = @schema.V2d::from_json(
    @otiojson.parse(
      "{\n    \"OTIO_SCHEMA\": \"V2d.1\",\n    \"x\": 3.0,\n    \"y\": 4.0\n}",
    ).unwrap(),
  ).unwrap()
  api_number(v.dot(b), 25.0)
  api_number(v.cross(b), 0.0)
  let vector = v.add(b)
  api_number(vector.x, 6.0)
  api_number(vector.y, 8.0)
  let vector = v.subtract(b)
  api_number(vector.x, 0.0)
  api_number(vector.y, 0.0)
  let vector = v.multiply_components(b)
  api_number(vector.x, 9.0)
  api_number(vector.y, 16.0)
  assert_eq(v.equal_with_error(b, -1.0), false)
  assert_eq(v.equal_with_error(b, -1.0, relative=true), false)
  assert_eq(v.equal_with_error(b, 0.0), true)
  assert_eq(v.equal_with_error(b, 0.0, relative=true), true)
  assert_eq(v.equal_with_error(b, 0.1), true)
  assert_eq(v.equal_with_error(b, 0.1, relative=true), true)
  assert_eq(v.equal_with_error(b, 1.0 / 0.0), true)
  assert_eq(v.equal_with_error(b, 1.0 / 0.0, relative=true), true)
  assert_eq(v.equal_with_error(b, 0.0 / 0.0), false)
  assert_eq(v.equal_with_error(b, 0.0 / 0.0, relative=true), false)
  let b = @schema.V2d::from_json(
    @otiojson.parse(
      "{\n    \"OTIO_SCHEMA\": \"V2d.1\",\n    \"x\": -1.0,\n    \"y\": 2.0\n}",
    ).unwrap(),
  ).unwrap()
  api_number(v.dot(b), 5.0)
  api_number(v.cross(b), 10.0)
  let vector = v.add(b)
  api_number(vector.x, 2.0)
  api_number(vector.y, 6.0)
  let vector = v.subtract(b)
  api_number(vector.x, 4.0)
  api_number(vector.y, 2.0)
  let vector = v.multiply_components(b)
  api_number(vector.x, -3.0)
  api_number(vector.y, 8.0)
  assert_eq(v.equal_with_error(b, -1.0), false)
  assert_eq(v.equal_with_error(b, -1.0, relative=true), false)
  assert_eq(v.equal_with_error(b, 0.0), false)
  assert_eq(v.equal_with_error(b, 0.0, relative=true), false)
  assert_eq(v.equal_with_error(b, 0.1), false)
  assert_eq(v.equal_with_error(b, 0.1, relative=true), false)
  assert_eq(v.equal_with_error(b, 1.0 / 0.0), true)
  assert_eq(v.equal_with_error(b, 1.0 / 0.0, relative=true), true)
  assert_eq(v.equal_with_error(b, 0.0 / 0.0), false)
  assert_eq(v.equal_with_error(b, 0.0 / 0.0, relative=true), false)
}

///|
test "spatial:normalize-1" {
  let v = @schema.V2d::from_json(
    @otiojson.parse(
      "{\n    \"OTIO_SCHEMA\": \"V2d.1\",\n    \"x\": 3.0,\n    \"y\": 4.0\n}",
    ).unwrap(),
  ).unwrap()
  let vector = v.normalized().unwrap()
  api_number(vector.x, 0.6)
  api_number(vector.y, 0.8)
}

///|
test "spatial:normalizeExc-1" {
  let v = @schema.V2d::from_json(
    @otiojson.parse(
      "{\n    \"OTIO_SCHEMA\": \"V2d.1\",\n    \"x\": 3.0,\n    \"y\": 4.0\n}",
    ).unwrap(),
  ).unwrap()
  let vector = v.normalized(reject_zero=true).unwrap()
  api_number(vector.x, 0.6)
  api_number(vector.y, 0.8)
}

///|
test "spatial:normalizeNonNull-1" {
  let v = @schema.V2d::from_json(
    @otiojson.parse(
      "{\n    \"OTIO_SCHEMA\": \"V2d.1\",\n    \"x\": 3.0,\n    \"y\": 4.0\n}",
    ).unwrap(),
  ).unwrap()
  let vector = v.normalized_non_null()
  api_number(vector.x, 0.6)
  api_number(vector.y, 0.8)
}

///|
test "spatial:vector-2" {
  let v = @schema.V2d::from_json(
    @otiojson.parse(
      "{\n    \"OTIO_SCHEMA\": \"V2d.1\",\n    \"x\": -1.0,\n    \"y\": 2.0\n}",
    ).unwrap(),
  ).unwrap()
  api_number(v.length(), 2.23606797749979)
  api_number(v.length_squared(), 5.0)
  let vector = v.normalized().unwrap()
  api_number(vector.x, -0.4472135954999579)
  api_number(vector.y, 0.8944271909999159)
  let vector = v.normalized_non_null()
  api_number(vector.x, -0.4472135954999579)
  api_number(vector.y, 0.8944271909999159)
  let vector = v.normalized(reject_zero=true).unwrap()
  api_number(vector.x, -0.4472135954999579)
  api_number(vector.y, 0.8944271909999159)
  let b = @schema.V2d::from_json(
    @otiojson.parse(
      "{\n    \"OTIO_SCHEMA\": \"V2d.1\",\n    \"x\": 0.0,\n    \"y\": 0.0\n}",
    ).unwrap(),
  ).unwrap()
  api_number(v.dot(b), 0.0)
  api_number(v.cross(b), -0.0)
  let vector = v.add(b)
  api_number(vector.x, -1.0)
  api_number(vector.y, 2.0)
  let vector = v.subtract(b)
  api_number(vector.x, -1.0)
  api_number(vector.y, 2.0)
  let vector = v.multiply_components(b)
  api_number(vector.x, -0.0)
  api_number(vector.y, 0.0)
  assert_eq(v.equal_with_error(b, -1.0), false)
  assert_eq(v.equal_with_error(b, -1.0, relative=true), false)
  assert_eq(v.equal_with_error(b, 0.0), false)
  assert_eq(v.equal_with_error(b, 0.0, relative=true), false)
  assert_eq(v.equal_with_error(b, 0.1), false)
  assert_eq(v.equal_with_error(b, 0.1, relative=true), false)
  assert_eq(v.equal_with_error(b, 1.0 / 0.0), true)
  assert_eq(v.equal_with_error(b, 1.0 / 0.0, relative=true), true)
  assert_eq(v.equal_with_error(b, 0.0 / 0.0), false)
  assert_eq(v.equal_with_error(b, 0.0 / 0.0, relative=true), false)
  let b = @schema.V2d::from_json(
    @otiojson.parse(
      "{\n    \"OTIO_SCHEMA\": \"V2d.1\",\n    \"x\": 3.0,\n    \"y\": 4.0\n}",
    ).unwrap(),
  ).unwrap()
  api_number(v.dot(b), 5.0)
  api_number(v.cross(b), -10.0)
  let vector = v.add(b)
  api_number(vector.x, 2.0)
  api_number(vector.y, 6.0)
  let vector = v.subtract(b)
  api_number(vector.x, -4.0)
  api_number(vector.y, -2.0)
  let vector = v.multiply_components(b)
  api_number(vector.x, -3.0)
  api_number(vector.y, 8.0)
  assert_eq(v.equal_with_error(b, -1.0), false)
  assert_eq(v.equal_with_error(b, -1.0, relative=true), false)
  assert_eq(v.equal_with_error(b, 0.0), false)
  assert_eq(v.equal_with_error(b, 0.0, relative=true), false)
  assert_eq(v.equal_with_error(b, 0.1), false)
  assert_eq(v.equal_with_error(b, 0.1, relative=true), false)
  assert_eq(v.equal_with_error(b, 1.0 / 0.0), true)
  assert_eq(v.equal_with_error(b, 1.0 / 0.0, relative=true), true)
  assert_eq(v.equal_with_error(b, 0.0 / 0.0), false)
  assert_eq(v.equal_with_error(b, 0.0 / 0.0, relative=true), false)
  let b = @schema.V2d::from_json(
    @otiojson.parse(
      "{\n    \"OTIO_SCHEMA\": \"V2d.1\",\n    \"x\": -1.0,\n    \"y\": 2.0\n}",
    ).unwrap(),
  ).unwrap()
  api_number(v.dot(b), 5.0)
  api_number(v.cross(b), 0.0)
  let vector = v.add(b)
  api_number(vector.x, -2.0)
  api_number(vector.y, 4.0)
  let vector = v.subtract(b)
  api_number(vector.x, 0.0)
  api_number(vector.y, 0.0)
  let vector = v.multiply_components(b)
  api_number(vector.x, 1.0)
  api_number(vector.y, 4.0)
  assert_eq(v.equal_with_error(b, -1.0), false)
  assert_eq(v.equal_with_error(b, -1.0, relative=true), false)
  assert_eq(v.equal_with_error(b, 0.0), true)
  assert_eq(v.equal_with_error(b, 0.0, relative=true), true)
  assert_eq(v.equal_with_error(b, 0.1), true)
  assert_eq(v.equal_with_error(b, 0.1, relative=true), true)
  assert_eq(v.equal_with_error(b, 1.0 / 0.0), true)
  assert_eq(v.equal_with_error(b, 1.0 / 0.0, relative=true), true)
  assert_eq(v.equal_with_error(b, 0.0 / 0.0), false)
  assert_eq(v.equal_with_error(b, 0.0 / 0.0, relative=true), false)
}

///|
test "spatial:normalize-2" {
  let v = @schema.V2d::from_json(
    @otiojson.parse(
      "{\n    \"OTIO_SCHEMA\": \"V2d.1\",\n    \"x\": -1.0,\n    \"y\": 2.0\n}",
    ).unwrap(),
  ).unwrap()
  let vector = v.normalized().unwrap()
  api_number(vector.x, -0.4472135954999579)
  api_number(vector.y, 0.8944271909999159)
}

///|
test "spatial:normalizeExc-2" {
  let v = @schema.V2d::from_json(
    @otiojson.parse(
      "{\n    \"OTIO_SCHEMA\": \"V2d.1\",\n    \"x\": -1.0,\n    \"y\": 2.0\n}",
    ).unwrap(),
  ).unwrap()
  let vector = v.normalized(reject_zero=true).unwrap()
  api_number(vector.x, -0.4472135954999579)
  api_number(vector.y, 0.8944271909999159)
}

///|
test "spatial:normalizeNonNull-2" {
  let v = @schema.V2d::from_json(
    @otiojson.parse(
      "{\n    \"OTIO_SCHEMA\": \"V2d.1\",\n    \"x\": -1.0,\n    \"y\": 2.0\n}",
    ).unwrap(),
  ).unwrap()
  let vector = v.normalized_non_null()
  api_number(vector.x, -0.4472135954999579)
  api_number(vector.y, 0.8944271909999159)
}

///|
test "spatial:vector-3" {
  let v = @schema.V2d::from_json(
    @otiojson.parse(
      "{\n    \"OTIO_SCHEMA\": \"V2d.1\",\n    \"x\": 1e308,\n    \"y\": 1e308\n}",
    ).unwrap(),
  ).unwrap()
  api_number(v.length(), 1.0 / 0.0)
  api_number(v.length_squared(), 1.0 / 0.0)
  let vector = v.normalized().unwrap()
  api_number(vector.x, 0.0)
  api_number(vector.y, 0.0)
  let vector = v.normalized_non_null()
  api_number(vector.x, 0.0)
  api_number(vector.y, 0.0)
  let vector = v.normalized(reject_zero=true).unwrap()
  api_number(vector.x, 0.0)
  api_number(vector.y, 0.0)
  let b = @schema.V2d::from_json(
    @otiojson.parse(
      "{\n    \"OTIO_SCHEMA\": \"V2d.1\",\n    \"x\": 0.0,\n    \"y\": 0.0\n}",
    ).unwrap(),
  ).unwrap()
  api_number(v.dot(b), 0.0)
  api_number(v.cross(b), 0.0)
  let vector = v.add(b)
  api_number(vector.x, 1.0e+308)
  api_number(vector.y, 1.0e+308)
  let vector = v.subtract(b)
  api_number(vector.x, 1.0e+308)
  api_number(vector.y, 1.0e+308)
  let vector = v.multiply_components(b)
  api_number(vector.x, 0.0)
  api_number(vector.y, 0.0)
  assert_eq(v.equal_with_error(b, -1.0), false)
  assert_eq(v.equal_with_error(b, -1.0, relative=true), false)
  assert_eq(v.equal_with_error(b, 0.0), false)
  assert_eq(v.equal_with_error(b, 0.0, relative=true), false)
  assert_eq(v.equal_with_error(b, 0.1), false)
  assert_eq(v.equal_with_error(b, 0.1, relative=true), false)
  assert_eq(v.equal_with_error(b, 1.0 / 0.0), true)
  assert_eq(v.equal_with_error(b, 1.0 / 0.0, relative=true), true)
  assert_eq(v.equal_with_error(b, 0.0 / 0.0), false)
  assert_eq(v.equal_with_error(b, 0.0 / 0.0, relative=true), false)
  let b = @schema.V2d::from_json(
    @otiojson.parse(
      "{\n    \"OTIO_SCHEMA\": \"V2d.1\",\n    \"x\": 3.0,\n    \"y\": 4.0\n}",
    ).unwrap(),
  ).unwrap()
  api_number(v.dot(b), 1.0 / 0.0)
  api_number(v.cross(b), 0.0 / 0.0)
  let vector = v.add(b)
  api_number(vector.x, 1.0e+308)
  api_number(vector.y, 1.0e+308)
  let vector = v.subtract(b)
  api_number(vector.x, 1.0e+308)
  api_number(vector.y, 1.0e+308)
  let vector = v.multiply_components(b)
  api_number(vector.x, 1.0 / 0.0)
  api_number(vector.y, 1.0 / 0.0)
  assert_eq(v.equal_with_error(b, -1.0), false)
  assert_eq(v.equal_with_error(b, -1.0, relative=true), false)
  assert_eq(v.equal_with_error(b, 0.0), false)
  assert_eq(v.equal_with_error(b, 0.0, relative=true), false)
  assert_eq(v.equal_with_error(b, 0.1), false)
  assert_eq(v.equal_with_error(b, 0.1, relative=true), false)
  assert_eq(v.equal_with_error(b, 1.0 / 0.0), true)
  assert_eq(v.equal_with_error(b, 1.0 / 0.0, relative=true), true)
  assert_eq(v.equal_with_error(b, 0.0 / 0.0), false)
  assert_eq(v.equal_with_error(b, 0.0 / 0.0, relative=true), false)
  let b = @schema.V2d::from_json(
    @otiojson.parse(
      "{\n    \"OTIO_SCHEMA\": \"V2d.1\",\n    \"x\": -1.0,\n    \"y\": 2.0\n}",
    ).unwrap(),
  ).unwrap()
  api_number(v.dot(b), 1.0 / 0.0)
  api_number(v.cross(b), 1.0 / 0.0)
  let vector = v.add(b)
  api_number(vector.x, 1.0e+308)
  api_number(vector.y, 1.0e+308)
  let vector = v.subtract(b)
  api_number(vector.x, 1.0e+308)
  api_number(vector.y, 1.0e+308)
  let vector = v.multiply_components(b)
  api_number(vector.x, -1.0e+308)
  api_number(vector.y, 1.0 / 0.0)
  assert_eq(v.equal_with_error(b, -1.0), false)
  assert_eq(v.equal_with_error(b, -1.0, relative=true), false)
  assert_eq(v.equal_with_error(b, 0.0), false)
  assert_eq(v.equal_with_error(b, 0.0, relative=true), false)
  assert_eq(v.equal_with_error(b, 0.1), false)
  assert_eq(v.equal_with_error(b, 0.1, relative=true), false)
  assert_eq(v.equal_with_error(b, 1.0 / 0.0), true)
  assert_eq(v.equal_with_error(b, 1.0 / 0.0, relative=true), true)
  assert_eq(v.equal_with_error(b, 0.0 / 0.0), false)
  assert_eq(v.equal_with_error(b, 0.0 / 0.0, relative=true), false)
}

///|
test "spatial:normalize-3" {
  let v = @schema.V2d::from_json(
    @otiojson.parse(
      "{\n    \"OTIO_SCHEMA\": \"V2d.1\",\n    \"x\": 1e308,\n    \"y\": 1e308\n}",
    ).unwrap(),
  ).unwrap()
  let vector = v.normalized().unwrap()
  api_number(vector.x, 0.0)
  api_number(vector.y, 0.0)
}

///|
test "spatial:normalizeExc-3" {
  let v = @schema.V2d::from_json(
    @otiojson.parse(
      "{\n    \"OTIO_SCHEMA\": \"V2d.1\",\n    \"x\": 1e308,\n    \"y\": 1e308\n}",
    ).unwrap(),
  ).unwrap()
  let vector = v.normalized(reject_zero=true).unwrap()
  api_number(vector.x, 0.0)
  api_number(vector.y, 0.0)
}

///|
test "spatial:normalizeNonNull-3" {
  let v = @schema.V2d::from_json(
    @otiojson.parse(
      "{\n    \"OTIO_SCHEMA\": \"V2d.1\",\n    \"x\": 1e308,\n    \"y\": 1e308\n}",
    ).unwrap(),
  ).unwrap()
  let vector = v.normalized_non_null()
  api_number(vector.x, 0.0)
  api_number(vector.y, 0.0)
}

///|
test "spatial:vector-4" {
  let v = @schema.V2d::from_json(
    @otiojson.parse(
      "{\n    \"OTIO_SCHEMA\": \"V2d.1\",\n    \"x\": 1e-300,\n    \"y\": 1e-300\n}",
    ).unwrap(),
  ).unwrap()
  api_number(v.length(), 1.4142135623730952e-300)
  api_number(v.length_squared(), 0.0)
  let vector = v.normalized().unwrap()
  api_number(vector.x, 0.7071067811865475)
  api_number(vector.y, 0.7071067811865475)
  let vector = v.normalized_non_null()
  api_number(vector.x, 0.7071067811865475)
  api_number(vector.y, 0.7071067811865475)
  let vector = v.normalized(reject_zero=true).unwrap()
  api_number(vector.x, 0.7071067811865475)
  api_number(vector.y, 0.7071067811865475)
  let b = @schema.V2d::from_json(
    @otiojson.parse(
      "{\n    \"OTIO_SCHEMA\": \"V2d.1\",\n    \"x\": 0.0,\n    \"y\": 0.0\n}",
    ).unwrap(),
  ).unwrap()
  api_number(v.dot(b), 0.0)
  api_number(v.cross(b), 0.0)
  let vector = v.add(b)
  api_number(vector.x, 1.0e-300)
  api_number(vector.y, 1.0e-300)
  let vector = v.subtract(b)
  api_number(vector.x, 1.0e-300)
  api_number(vector.y, 1.0e-300)
  let vector = v.multiply_components(b)
  api_number(vector.x, 0.0)
  api_number(vector.y, 0.0)
  assert_eq(v.equal_with_error(b, -1.0), false)
  assert_eq(v.equal_with_error(b, -1.0, relative=true), false)
  assert_eq(v.equal_with_error(b, 0.0), false)
  assert_eq(v.equal_with_error(b, 0.0, relative=true), false)
  assert_eq(v.equal_with_error(b, 0.1), true)
  assert_eq(v.equal_with_error(b, 0.1, relative=true), false)
  assert_eq(v.equal_with_error(b, 1.0 / 0.0), true)
  assert_eq(v.equal_with_error(b, 1.0 / 0.0, relative=true), true)
  assert_eq(v.equal_with_error(b, 0.0 / 0.0), false)
  assert_eq(v.equal_with_error(b, 0.0 / 0.0, relative=true), false)
  let b = @schema.V2d::from_json(
    @otiojson.parse(
      "{\n    \"OTIO_SCHEMA\": \"V2d.1\",\n    \"x\": 3.0,\n    \"y\": 4.0\n}",
    ).unwrap(),
  ).unwrap()
  api_number(v.dot(b), 7.0e-300)
  api_number(v.cross(b), 9.999999999999999e-301)
  let vector = v.add(b)
  api_number(vector.x, 3.0)
  api_number(vector.y, 4.0)
  let vector = v.subtract(b)
  api_number(vector.x, -3.0)
  api_number(vector.y, -4.0)
  let vector = v.multiply_components(b)
  api_number(vector.x, 3.0e-300)
  api_number(vector.y, 4.0e-300)
  assert_eq(v.equal_with_error(b, -1.0), false)
  assert_eq(v.equal_with_error(b, -1.0, relative=true), false)
  assert_eq(v.equal_with_error(b, 0.0), false)
  assert_eq(v.equal_with_error(b, 0.0, relative=true), false)
  assert_eq(v.equal_with_error(b, 0.1), false)
  assert_eq(v.equal_with_error(b, 0.1, relative=true), false)
  assert_eq(v.equal_with_error(b, 1.0 / 0.0), true)
  assert_eq(v.equal_with_error(b, 1.0 / 0.0, relative=true), true)
  assert_eq(v.equal_with_error(b, 0.0 / 0.0), false)
  assert_eq(v.equal_with_error(b, 0.0 / 0.0, relative=true), false)
  let b = @schema.V2d::from_json(
    @otiojson.parse(
      "{\n    \"OTIO_SCHEMA\": \"V2d.1\",\n    \"x\": -1.0,\n    \"y\": 2.0\n}",
    ).unwrap(),
  ).unwrap()
  api_number(v.dot(b), 1.0e-300)
  api_number(v.cross(b), 3.0e-300)
  let vector = v.add(b)
  api_number(vector.x, -1.0)
  api_number(vector.y, 2.0)
  let vector = v.subtract(b)
  api_number(vector.x, 1.0)
  api_number(vector.y, -2.0)
  let vector = v.multiply_components(b)
  api_number(vector.x, -1.0e-300)
  api_number(vector.y, 2.0e-300)
  assert_eq(v.equal_with_error(b, -1.0), false)
  assert_eq(v.equal_with_error(b, -1.0, relative=true), false)
  assert_eq(v.equal_with_error(b, 0.0), false)
  assert_eq(v.equal_with_error(b, 0.0, relative=true), false)
  assert_eq(v.equal_with_error(b, 0.1), false)
  assert_eq(v.equal_with_error(b, 0.1, relative=true), false)
  assert_eq(v.equal_with_error(b, 1.0 / 0.0), true)
  assert_eq(v.equal_with_error(b, 1.0 / 0.0, relative=true), true)
  assert_eq(v.equal_with_error(b, 0.0 / 0.0), false)
  assert_eq(v.equal_with_error(b, 0.0 / 0.0, relative=true), false)
}

///|
test "spatial:normalize-4" {
  let v = @schema.V2d::from_json(
    @otiojson.parse(
      "{\n    \"OTIO_SCHEMA\": \"V2d.1\",\n    \"x\": 1e-300,\n    \"y\": 1e-300\n}",
    ).unwrap(),
  ).unwrap()
  let vector = v.normalized().unwrap()
  api_number(vector.x, 0.7071067811865475)
  api_number(vector.y, 0.7071067811865475)
}

///|
test "spatial:normalizeExc-4" {
  let v = @schema.V2d::from_json(
    @otiojson.parse(
      "{\n    \"OTIO_SCHEMA\": \"V2d.1\",\n    \"x\": 1e-300,\n    \"y\": 1e-300\n}",
    ).unwrap(),
  ).unwrap()
  let vector = v.normalized(reject_zero=true).unwrap()
  api_number(vector.x, 0.7071067811865475)
  api_number(vector.y, 0.7071067811865475)
}

///|
test "spatial:normalizeNonNull-4" {
  let v = @schema.V2d::from_json(
    @otiojson.parse(
      "{\n    \"OTIO_SCHEMA\": \"V2d.1\",\n    \"x\": 1e-300,\n    \"y\": 1e-300\n}",
    ).unwrap(),
  ).unwrap()
  let vector = v.normalized_non_null()
  api_number(vector.x, 0.7071067811865475)
  api_number(vector.y, 0.7071067811865475)
}

///|
test "spatial:vector-5" {
  let v = @schema.V2d::from_json(
    @otiojson.parse(
      "{\n    \"OTIO_SCHEMA\": \"V2d.1\",\n    \"x\": Infinity,\n    \"y\": 1.0\n}",
    ).unwrap(),
  ).unwrap()
  api_number(v.length(), 1.0 / 0.0)
  api_number(v.length_squared(), 1.0 / 0.0)
  let vector = v.normalized().unwrap()
  api_number(vector.x, 0.0 / 0.0)
  api_number(vector.y, 0.0)
  let vector = v.normalized_non_null()
  api_number(vector.x, 0.0 / 0.0)
  api_number(vector.y, 0.0)
  let vector = v.normalized(reject_zero=true).unwrap()
  api_number(vector.x, 0.0 / 0.0)
  api_number(vector.y, 0.0)
  let b = @schema.V2d::from_json(
    @otiojson.parse(
      "{\n    \"OTIO_SCHEMA\": \"V2d.1\",\n    \"x\": 0.0,\n    \"y\": 0.0\n}",
    ).unwrap(),
  ).unwrap()
  api_number(v.dot(b), 0.0 / 0.0)
  api_number(v.cross(b), 0.0 / 0.0)
  let vector = v.add(b)
  api_number(vector.x, 1.0 / 0.0)
  api_number(vector.y, 1.0)
  let vector = v.subtract(b)
  api_number(vector.x, 1.0 / 0.0)
  api_number(vector.y, 1.0)
  let vector = v.multiply_components(b)
  api_number(vector.x, 0.0 / 0.0)
  api_number(vector.y, 0.0)
  assert_eq(v.equal_with_error(b, -1.0), false)
  assert_eq(v.equal_with_error(b, -1.0, relative=true), false)
  assert_eq(v.equal_with_error(b, 0.0), false)
  assert_eq(v.equal_with_error(b, 0.0, relative=true), false)
  assert_eq(v.equal_with_error(b, 0.1), false)
  assert_eq(v.equal_with_error(b, 0.1, relative=true), false)
  assert_eq(v.equal_with_error(b, 1.0 / 0.0), true)
  assert_eq(v.equal_with_error(b, 1.0 / 0.0, relative=true), true)
  assert_eq(v.equal_with_error(b, 0.0 / 0.0), false)
  assert_eq(v.equal_with_error(b, 0.0 / 0.0, relative=true), false)
  let b = @schema.V2d::from_json(
    @otiojson.parse(
      "{\n    \"OTIO_SCHEMA\": \"V2d.1\",\n    \"x\": 3.0,\n    \"y\": 4.0\n}",
    ).unwrap(),
  ).unwrap()
  api_number(v.dot(b), 1.0 / 0.0)
  api_number(v.cross(b), 1.0 / 0.0)
  let vector = v.add(b)
  api_number(vector.x, 1.0 / 0.0)
  api_number(vector.y, 5.0)
  let vector = v.subtract(b)
  api_number(vector.x, 1.0 / 0.0)
  api_number(vector.y, -3.0)
  let vector = v.multiply_components(b)
  api_number(vector.x, 1.0 / 0.0)
  api_number(vector.y, 4.0)
  assert_eq(v.equal_with_error(b, -1.0), false)
  assert_eq(v.equal_with_error(b, -1.0, relative=true), false)
  assert_eq(v.equal_with_error(b, 0.0), false)
  assert_eq(v.equal_with_error(b, 0.0, relative=true), false)
  assert_eq(v.equal_with_error(b, 0.1), false)
  assert_eq(v.equal_with_error(b, 0.1, relative=true), false)
  assert_eq(v.equal_with_error(b, 1.0 / 0.0), true)
  assert_eq(v.equal_with_error(b, 1.0 / 0.0, relative=true), true)
  assert_eq(v.equal_with_error(b, 0.0 / 0.0), false)
  assert_eq(v.equal_with_error(b, 0.0 / 0.0, relative=true), false)
  let b = @schema.V2d::from_json(
    @otiojson.parse(
      "{\n    \"OTIO_SCHEMA\": \"V2d.1\",\n    \"x\": -1.0,\n    \"y\": 2.0\n}",
    ).unwrap(),
  ).unwrap()
  api_number(v.dot(b), -1.0 / 0.0)
  api_number(v.cross(b), 1.0 / 0.0)
  let vector = v.add(b)
  api_number(vector.x, 1.0 / 0.0)
  api_number(vector.y, 3.0)
  let vector = v.subtract(b)
  api_number(vector.x, 1.0 / 0.0)
  api_number(vector.y, -1.0)
  let vector = v.multiply_components(b)
  api_number(vector.x, -1.0 / 0.0)
  api_number(vector.y, 2.0)
  assert_eq(v.equal_with_error(b, -1.0), false)
  assert_eq(v.equal_with_error(b, -1.0, relative=true), false)
  assert_eq(v.equal_with_error(b, 0.0), false)
  assert_eq(v.equal_with_error(b, 0.0, relative=true), false)
  assert_eq(v.equal_with_error(b, 0.1), false)
  assert_eq(v.equal_with_error(b, 0.1, relative=true), false)
  assert_eq(v.equal_with_error(b, 1.0 / 0.0), true)
  assert_eq(v.equal_with_error(b, 1.0 / 0.0, relative=true), true)
  assert_eq(v.equal_with_error(b, 0.0 / 0.0), false)
  assert_eq(v.equal_with_error(b, 0.0 / 0.0, relative=true), false)
}

///|
test "spatial:normalize-5" {
  let v = @schema.V2d::from_json(
    @otiojson.parse(
      "{\n    \"OTIO_SCHEMA\": \"V2d.1\",\n    \"x\": Infinity,\n    \"y\": 1.0\n}",
    ).unwrap(),
  ).unwrap()
  let vector = v.normalized().unwrap()
  api_number(vector.x, 0.0 / 0.0)
  api_number(vector.y, 0.0)
}

///|
test "spatial:normalizeExc-5" {
  let v = @schema.V2d::from_json(
    @otiojson.parse(
      "{\n    \"OTIO_SCHEMA\": \"V2d.1\",\n    \"x\": Infinity,\n    \"y\": 1.0\n}",
    ).unwrap(),
  ).unwrap()
  let vector = v.normalized(reject_zero=true).unwrap()
  api_number(vector.x, 0.0 / 0.0)
  api_number(vector.y, 0.0)
}

///|
test "spatial:normalizeNonNull-5" {
  let v = @schema.V2d::from_json(
    @otiojson.parse(
      "{\n    \"OTIO_SCHEMA\": \"V2d.1\",\n    \"x\": Infinity,\n    \"y\": 1.0\n}",
    ).unwrap(),
  ).unwrap()
  let vector = v.normalized_non_null()
  api_number(vector.x, 0.0 / 0.0)
  api_number(vector.y, 0.0)
}

///|
test "spatial:vector-6" {
  let v = @schema.V2d::from_json(
    @otiojson.parse(
      "{\n    \"OTIO_SCHEMA\": \"V2d.1\",\n    \"x\": NaN,\n    \"y\": 1.0\n}",
    ).unwrap(),
  ).unwrap()
  api_number(v.length(), 0.0 / 0.0)
  api_number(v.length_squared(), 0.0 / 0.0)
  let vector = v.normalized().unwrap()
  api_number(vector.x, 0.0 / 0.0)
  api_number(vector.y, 0.0 / 0.0)
  let vector = v.normalized_non_null()
  api_number(vector.x, 0.0 / 0.0)
  api_number(vector.y, 0.0 / 0.0)
  let vector = v.normalized(reject_zero=true).unwrap()
  api_number(vector.x, 0.0 / 0.0)
  api_number(vector.y, 0.0 / 0.0)
  let b = @schema.V2d::from_json(
    @otiojson.parse(
      "{\n    \"OTIO_SCHEMA\": \"V2d.1\",\n    \"x\": 0.0,\n    \"y\": 0.0\n}",
    ).unwrap(),
  ).unwrap()
  api_number(v.dot(b), 0.0 / 0.0)
  api_number(v.cross(b), 0.0 / 0.0)
  let vector = v.add(b)
  api_number(vector.x, 0.0 / 0.0)
  api_number(vector.y, 1.0)
  let vector = v.subtract(b)
  api_number(vector.x, 0.0 / 0.0)
  api_number(vector.y, 1.0)
  let vector = v.multiply_components(b)
  api_number(vector.x, 0.0 / 0.0)
  api_number(vector.y, 0.0)
  assert_eq(v.equal_with_error(b, -1.0), false)
  assert_eq(v.equal_with_error(b, -1.0, relative=true), false)
  assert_eq(v.equal_with_error(b, 0.0), false)
  assert_eq(v.equal_with_error(b, 0.0, relative=true), false)
  assert_eq(v.equal_with_error(b, 0.1), false)
  assert_eq(v.equal_with_error(b, 0.1, relative=true), false)
  assert_eq(v.equal_with_error(b, 1.0 / 0.0), false)
  assert_eq(v.equal_with_error(b, 1.0 / 0.0, relative=true), false)
  assert_eq(v.equal_with_error(b, 0.0 / 0.0), false)
  assert_eq(v.equal_with_error(b, 0.0 / 0.0, relative=true), false)
  let b = @schema.V2d::from_json(
    @otiojson.parse(
      "{\n    \"OTIO_SCHEMA\": \"V2d.1\",\n    \"x\": 3.0,\n    \"y\": 4.0\n}",
    ).unwrap(),
  ).unwrap()
  api_number(v.dot(b), 0.0 / 0.0)
  api_number(v.cross(b), 0.0 / 0.0)
  let vector = v.add(b)
  api_number(vector.x, 0.0 / 0.0)
  api_number(vector.y, 5.0)
  let vector = v.subtract(b)
  api_number(vector.x, 0.0 / 0.0)
  api_number(vector.y, -3.0)
  let vector = v.multiply_components(b)
  api_number(vector.x, 0.0 / 0.0)
  api_number(vector.y, 4.0)
  assert_eq(v.equal_with_error(b, -1.0), false)
  assert_eq(v.equal_with_error(b, -1.0, relative=true), false)
  assert_eq(v.equal_with_error(b, 0.0), false)
  assert_eq(v.equal_with_error(b, 0.0, relative=true), false)
  assert_eq(v.equal_with_error(b, 0.1), false)
  assert_eq(v.equal_with_error(b, 0.1, relative=true), false)
  assert_eq(v.equal_with_error(b, 1.0 / 0.0), false)
  assert_eq(v.equal_with_error(b, 1.0 / 0.0, relative=true), false)
  assert_eq(v.equal_with_error(b, 0.0 / 0.0), false)
  assert_eq(v.equal_with_error(b, 0.0 / 0.0, relative=true), false)
  let b = @schema.V2d::from_json(
    @otiojson.parse(
      "{\n    \"OTIO_SCHEMA\": \"V2d.1\",\n    \"x\": -1.0,\n    \"y\": 2.0\n}",
    ).unwrap(),
  ).unwrap()
  api_number(v.dot(b), 0.0 / 0.0)
  api_number(v.cross(b), 0.0 / 0.0)
  let vector = v.add(b)
  api_number(vector.x, 0.0 / 0.0)
  api_number(vector.y, 3.0)
  let vector = v.subtract(b)
  api_number(vector.x, 0.0 / 0.0)
  api_number(vector.y, -1.0)
  let vector = v.multiply_components(b)
  api_number(vector.x, 0.0 / 0.0)
  api_number(vector.y, 2.0)
  assert_eq(v.equal_with_error(b, -1.0), false)
  assert_eq(v.equal_with_error(b, -1.0, relative=true), false)
  assert_eq(v.equal_with_error(b, 0.0), false)
  assert_eq(v.equal_with_error(b, 0.0, relative=true), false)
  assert_eq(v.equal_with_error(b, 0.1), false)
  assert_eq(v.equal_with_error(b, 0.1, relative=true), false)
  assert_eq(v.equal_with_error(b, 1.0 / 0.0), false)
  assert_eq(v.equal_with_error(b, 1.0 / 0.0, relative=true), false)
  assert_eq(v.equal_with_error(b, 0.0 / 0.0), false)
  assert_eq(v.equal_with_error(b, 0.0 / 0.0, relative=true), false)
}

///|
test "spatial:normalize-6" {
  let v = @schema.V2d::from_json(
    @otiojson.parse(
      "{\n    \"OTIO_SCHEMA\": \"V2d.1\",\n    \"x\": NaN,\n    \"y\": 1.0\n}",
    ).unwrap(),
  ).unwrap()
  let vector = v.normalized().unwrap()
  api_number(vector.x, 0.0 / 0.0)
  api_number(vector.y, 0.0 / 0.0)
}

///|
test "spatial:normalizeExc-6" {
  let v = @schema.V2d::from_json(
    @otiojson.parse(
      "{\n    \"OTIO_SCHEMA\": \"V2d.1\",\n    \"x\": NaN,\n    \"y\": 1.0\n}",
    ).unwrap(),
  ).unwrap()
  let vector = v.normalized(reject_zero=true).unwrap()
  api_number(vector.x, 0.0 / 0.0)
  api_number(vector.y, 0.0 / 0.0)
}

///|
test "spatial:normalizeNonNull-6" {
  let v = @schema.V2d::from_json(
    @otiojson.parse(
      "{\n    \"OTIO_SCHEMA\": \"V2d.1\",\n    \"x\": NaN,\n    \"y\": 1.0\n}",
    ).unwrap(),
  ).unwrap()
  let vector = v.normalized_non_null()
  api_number(vector.x, 0.0 / 0.0)
  api_number(vector.y, 0.0 / 0.0)
}

///|
test "spatial:limits" {
  let (low, high, small, epsilon, dimensions) = @schema.vector_limits()
  api_number(low, -1.7976931348623157e+308)
  api_number(high, 1.7976931348623157e+308)
  api_number(small, 2.2250738585072014e-308)
  api_number(epsilon, 2.220446049250313e-16)
  assert_eq(dimensions, 2)
}

///|
test "spatial:box-0" {
  let b = @schema.Box2d::from_json(
    @otiojson.parse(
      "{\n    \"OTIO_SCHEMA\": \"Box2d.1\",\n    \"min\": {\n        \"OTIO_SCHEMA\": \"V2d.1\",\n        \"x\": 0.0,\n        \"y\": 0.0\n    },\n    \"max\": {\n        \"OTIO_SCHEMA\": \"V2d.1\",\n        \"x\": 0.0,\n        \"y\": 0.0\n    }\n}",
    ).unwrap(),
  ).unwrap()
  let vector = b.center()
  api_number(vector.x, 0.0)
  api_number(vector.y, 0.0)
  assert_eq(
    b.contains(
      @schema.V2d::from_json(
        @otiojson.parse(
          "{\n    \"OTIO_SCHEMA\": \"V2d.1\",\n    \"x\": 0.0,\n    \"y\": 0.0\n}",
        ).unwrap(),
      ).unwrap(),
    ),
    true,
  )
  let extended = b.extended_by_point(
    @schema.V2d::from_json(
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"V2d.1\",\n    \"x\": 0.0,\n    \"y\": 0.0\n}",
      ).unwrap(),
    ).unwrap(),
  )
  let vector = extended.min
  api_number(vector.x, 0.0)
  api_number(vector.y, 0.0)
  let vector = extended.max
  api_number(vector.x, 0.0)
  api_number(vector.y, 0.0)
  assert_eq(
    b.contains(
      @schema.V2d::from_json(
        @otiojson.parse(
          "{\n    \"OTIO_SCHEMA\": \"V2d.1\",\n    \"x\": 3.0,\n    \"y\": 4.0\n}",
        ).unwrap(),
      ).unwrap(),
    ),
    false,
  )
  let extended = b.extended_by_point(
    @schema.V2d::from_json(
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"V2d.1\",\n    \"x\": 3.0,\n    \"y\": 4.0\n}",
      ).unwrap(),
    ).unwrap(),
  )
  let vector = extended.min
  api_number(vector.x, 0.0)
  api_number(vector.y, 0.0)
  let vector = extended.max
  api_number(vector.x, 3.0)
  api_number(vector.y, 4.0)
  assert_eq(
    b.contains(
      @schema.V2d::from_json(
        @otiojson.parse(
          "{\n    \"OTIO_SCHEMA\": \"V2d.1\",\n    \"x\": -1.0,\n    \"y\": 2.0\n}",
        ).unwrap(),
      ).unwrap(),
    ),
    false,
  )
  let extended = b.extended_by_point(
    @schema.V2d::from_json(
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"V2d.1\",\n    \"x\": -1.0,\n    \"y\": 2.0\n}",
      ).unwrap(),
    ).unwrap(),
  )
  let vector = extended.min
  api_number(vector.x, -1.0)
  api_number(vector.y, 0.0)
  let vector = extended.max
  api_number(vector.x, 0.0)
  api_number(vector.y, 2.0)
  let other = @schema.Box2d::from_json(
    @otiojson.parse(
      "{\n    \"OTIO_SCHEMA\": \"Box2d.1\",\n    \"min\": {\n        \"OTIO_SCHEMA\": \"V2d.1\",\n        \"x\": 0.0,\n        \"y\": 0.0\n    },\n    \"max\": {\n        \"OTIO_SCHEMA\": \"V2d.1\",\n        \"x\": 0.0,\n        \"y\": 0.0\n    }\n}",
    ).unwrap(),
  ).unwrap()
  assert_eq(b.intersects(other), true)
  let extended = b.extended_by(other)
  let vector = extended.min
  api_number(vector.x, 0.0)
  api_number(vector.y, 0.0)
  let vector = extended.max
  api_number(vector.x, 0.0)
  api_number(vector.y, 0.0)
  let other = @schema.Box2d::from_json(
    @otiojson.parse(
      "{\n    \"OTIO_SCHEMA\": \"Box2d.1\",\n    \"min\": {\n        \"OTIO_SCHEMA\": \"V2d.1\",\n        \"x\": -1.0,\n        \"y\": -2.0\n    },\n    \"max\": {\n        \"OTIO_SCHEMA\": \"V2d.1\",\n        \"x\": 3.0,\n        \"y\": 4.0\n    }\n}",
    ).unwrap(),
  ).unwrap()
  assert_eq(b.intersects(other), true)
  let extended = b.extended_by(other)
  let vector = extended.min
  api_number(vector.x, -1.0)
  api_number(vector.y, -2.0)
  let vector = extended.max
  api_number(vector.x, 3.0)
  api_number(vector.y, 4.0)
  let other = @schema.Box2d::from_json(
    @otiojson.parse(
      "{\n    \"OTIO_SCHEMA\": \"Box2d.1\",\n    \"min\": {\n        \"OTIO_SCHEMA\": \"V2d.1\",\n        \"x\": 3.0,\n        \"y\": 4.0\n    },\n    \"max\": {\n        \"OTIO_SCHEMA\": \"V2d.1\",\n        \"x\": -1.0,\n        \"y\": -2.0\n    }\n}",
    ).unwrap(),
  ).unwrap()
  assert_eq(b.intersects(other), false)
  let extended = b.extended_by(other)
  let vector = extended.min
  api_number(vector.x, 0.0)
  api_number(vector.y, 0.0)
  let vector = extended.max
  api_number(vector.x, 0.0)
  api_number(vector.y, 0.0)
}

///|
test "spatial:box-1" {
  let b = @schema.Box2d::from_json(
    @otiojson.parse(
      "{\n    \"OTIO_SCHEMA\": \"Box2d.1\",\n    \"min\": {\n        \"OTIO_SCHEMA\": \"V2d.1\",\n        \"x\": -1.0,\n        \"y\": -2.0\n    },\n    \"max\": {\n        \"OTIO_SCHEMA\": \"V2d.1\",\n        \"x\": 3.0,\n        \"y\": 4.0\n    }\n}",
    ).unwrap(),
  ).unwrap()
  let vector = b.center()
  api_number(vector.x, 1.0)
  api_number(vector.y, 1.0)
  assert_eq(
    b.contains(
      @schema.V2d::from_json(
        @otiojson.parse(
          "{\n    \"OTIO_SCHEMA\": \"V2d.1\",\n    \"x\": 0.0,\n    \"y\": 0.0\n}",
        ).unwrap(),
      ).unwrap(),
    ),
    true,
  )
  let extended = b.extended_by_point(
    @schema.V2d::from_json(
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"V2d.1\",\n    \"x\": 0.0,\n    \"y\": 0.0\n}",
      ).unwrap(),
    ).unwrap(),
  )
  let vector = extended.min
  api_number(vector.x, -1.0)
  api_number(vector.y, -2.0)
  let vector = extended.max
  api_number(vector.x, 3.0)
  api_number(vector.y, 4.0)
  assert_eq(
    b.contains(
      @schema.V2d::from_json(
        @otiojson.parse(
          "{\n    \"OTIO_SCHEMA\": \"V2d.1\",\n    \"x\": 3.0,\n    \"y\": 4.0\n}",
        ).unwrap(),
      ).unwrap(),
    ),
    true,
  )
  let extended = b.extended_by_point(
    @schema.V2d::from_json(
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"V2d.1\",\n    \"x\": 3.0,\n    \"y\": 4.0\n}",
      ).unwrap(),
    ).unwrap(),
  )
  let vector = extended.min
  api_number(vector.x, -1.0)
  api_number(vector.y, -2.0)
  let vector = extended.max
  api_number(vector.x, 3.0)
  api_number(vector.y, 4.0)
  assert_eq(
    b.contains(
      @schema.V2d::from_json(
        @otiojson.parse(
          "{\n    \"OTIO_SCHEMA\": \"V2d.1\",\n    \"x\": -1.0,\n    \"y\": 2.0\n}",
        ).unwrap(),
      ).unwrap(),
    ),
    true,
  )
  let extended = b.extended_by_point(
    @schema.V2d::from_json(
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"V2d.1\",\n    \"x\": -1.0,\n    \"y\": 2.0\n}",
      ).unwrap(),
    ).unwrap(),
  )
  let vector = extended.min
  api_number(vector.x, -1.0)
  api_number(vector.y, -2.0)
  let vector = extended.max
  api_number(vector.x, 3.0)
  api_number(vector.y, 4.0)
  let other = @schema.Box2d::from_json(
    @otiojson.parse(
      "{\n    \"OTIO_SCHEMA\": \"Box2d.1\",\n    \"min\": {\n        \"OTIO_SCHEMA\": \"V2d.1\",\n        \"x\": 0.0,\n        \"y\": 0.0\n    },\n    \"max\": {\n        \"OTIO_SCHEMA\": \"V2d.1\",\n        \"x\": 0.0,\n        \"y\": 0.0\n    }\n}",
    ).unwrap(),
  ).unwrap()
  assert_eq(b.intersects(other), true)
  let extended = b.extended_by(other)
  let vector = extended.min
  api_number(vector.x, -1.0)
  api_number(vector.y, -2.0)
  let vector = extended.max
  api_number(vector.x, 3.0)
  api_number(vector.y, 4.0)
  let other = @schema.Box2d::from_json(
    @otiojson.parse(
      "{\n    \"OTIO_SCHEMA\": \"Box2d.1\",\n    \"min\": {\n        \"OTIO_SCHEMA\": \"V2d.1\",\n        \"x\": -1.0,\n        \"y\": -2.0\n    },\n    \"max\": {\n        \"OTIO_SCHEMA\": \"V2d.1\",\n        \"x\": 3.0,\n        \"y\": 4.0\n    }\n}",
    ).unwrap(),
  ).unwrap()
  assert_eq(b.intersects(other), true)
  let extended = b.extended_by(other)
  let vector = extended.min
  api_number(vector.x, -1.0)
  api_number(vector.y, -2.0)
  let vector = extended.max
  api_number(vector.x, 3.0)
  api_number(vector.y, 4.0)
  let other = @schema.Box2d::from_json(
    @otiojson.parse(
      "{\n    \"OTIO_SCHEMA\": \"Box2d.1\",\n    \"min\": {\n        \"OTIO_SCHEMA\": \"V2d.1\",\n        \"x\": 3.0,\n        \"y\": 4.0\n    },\n    \"max\": {\n        \"OTIO_SCHEMA\": \"V2d.1\",\n        \"x\": -1.0,\n        \"y\": -2.0\n    }\n}",
    ).unwrap(),
  ).unwrap()
  assert_eq(b.intersects(other), true)
  let extended = b.extended_by(other)
  let vector = extended.min
  api_number(vector.x, -1.0)
  api_number(vector.y, -2.0)
  let vector = extended.max
  api_number(vector.x, 3.0)
  api_number(vector.y, 4.0)
}

///|
test "spatial:box-2" {
  let b = @schema.Box2d::from_json(
    @otiojson.parse(
      "{\n    \"OTIO_SCHEMA\": \"Box2d.1\",\n    \"min\": {\n        \"OTIO_SCHEMA\": \"V2d.1\",\n        \"x\": 3.0,\n        \"y\": 4.0\n    },\n    \"max\": {\n        \"OTIO_SCHEMA\": \"V2d.1\",\n        \"x\": -1.0,\n        \"y\": -2.0\n    }\n}",
    ).unwrap(),
  ).unwrap()
  let vector = b.center()
  api_number(vector.x, 1.0)
  api_number(vector.y, 1.0)
  assert_eq(
    b.contains(
      @schema.V2d::from_json(
        @otiojson.parse(
          "{\n    \"OTIO_SCHEMA\": \"V2d.1\",\n    \"x\": 0.0,\n    \"y\": 0.0\n}",
        ).unwrap(),
      ).unwrap(),
    ),
    false,
  )
  let extended = b.extended_by_point(
    @schema.V2d::from_json(
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"V2d.1\",\n    \"x\": 0.0,\n    \"y\": 0.0\n}",
      ).unwrap(),
    ).unwrap(),
  )
  let vector = extended.min
  api_number(vector.x, 0.0)
  api_number(vector.y, 0.0)
  let vector = extended.max
  api_number(vector.x, 0.0)
  api_number(vector.y, 0.0)
  assert_eq(
    b.contains(
      @schema.V2d::from_json(
        @otiojson.parse(
          "{\n    \"OTIO_SCHEMA\": \"V2d.1\",\n    \"x\": 3.0,\n    \"y\": 4.0\n}",
        ).unwrap(),
      ).unwrap(),
    ),
    false,
  )
  let extended = b.extended_by_point(
    @schema.V2d::from_json(
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"V2d.1\",\n    \"x\": 3.0,\n    \"y\": 4.0\n}",
      ).unwrap(),
    ).unwrap(),
  )
  let vector = extended.min
  api_number(vector.x, 3.0)
  api_number(vector.y, 4.0)
  let vector = extended.max
  api_number(vector.x, 3.0)
  api_number(vector.y, 4.0)
  assert_eq(
    b.contains(
      @schema.V2d::from_json(
        @otiojson.parse(
          "{\n    \"OTIO_SCHEMA\": \"V2d.1\",\n    \"x\": -1.0,\n    \"y\": 2.0\n}",
        ).unwrap(),
      ).unwrap(),
    ),
    false,
  )
  let extended = b.extended_by_point(
    @schema.V2d::from_json(
      @otiojson.parse(
        "{\n    \"OTIO_SCHEMA\": \"V2d.1\",\n    \"x\": -1.0,\n    \"y\": 2.0\n}",
      ).unwrap(),
    ).unwrap(),
  )
  let vector = extended.min
  api_number(vector.x, -1.0)
  api_number(vector.y, 2.0)
  let vector = extended.max
  api_number(vector.x, -1.0)
  api_number(vector.y, 2.0)
  let other = @schema.Box2d::from_json(
    @otiojson.parse(
      "{\n    \"OTIO_SCHEMA\": \"Box2d.1\",\n    \"min\": {\n        \"OTIO_SCHEMA\": \"V2d.1\",\n        \"x\": 0.0,\n        \"y\": 0.0\n    },\n    \"max\": {\n        \"OTIO_SCHEMA\": \"V2d.1\",\n        \"x\": 0.0,\n        \"y\": 0.0\n    }\n}",
    ).unwrap(),
  ).unwrap()
  assert_eq(b.intersects(other), false)
  let extended = b.extended_by(other)
  let vector = extended.min
  api_number(vector.x, 0.0)
  api_number(vector.y, 0.0)
  let vector = extended.max
  api_number(vector.x, 0.0)
  api_number(vector.y, 0.0)
  let other = @schema.Box2d::from_json(
    @otiojson.parse(
      "{\n    \"OTIO_SCHEMA\": \"Box2d.1\",\n    \"min\": {\n        \"OTIO_SCHEMA\": \"V2d.1\",\n        \"x\": -1.0,\n        \"y\": -2.0\n    },\n    \"max\": {\n        \"OTIO_SCHEMA\": \"V2d.1\",\n        \"x\": 3.0,\n        \"y\": 4.0\n    }\n}",
    ).unwrap(),
  ).unwrap()
  assert_eq(b.intersects(other), true)
  let extended = b.extended_by(other)
  let vector = extended.min
  api_number(vector.x, -1.0)
  api_number(vector.y, -2.0)
  let vector = extended.max
  api_number(vector.x, 3.0)
  api_number(vector.y, 4.0)
  let other = @schema.Box2d::from_json(
    @otiojson.parse(
      "{\n    \"OTIO_SCHEMA\": \"Box2d.1\",\n    \"min\": {\n        \"OTIO_SCHEMA\": \"V2d.1\",\n        \"x\": 3.0,\n        \"y\": 4.0\n    },\n    \"max\": {\n        \"OTIO_SCHEMA\": \"V2d.1\",\n        \"x\": -1.0,\n        \"y\": -2.0\n    }\n}",
    ).unwrap(),
  ).unwrap()
  assert_eq(b.intersects(other), false)
  let extended = b.extended_by(other)
  let vector = extended.min
  api_number(vector.x, 3.0)
  api_number(vector.y, 4.0)
  let vector = extended.max
  api_number(vector.x, -1.0)
  api_number(vector.y, -2.0)
}

///|
test "spatial:color-BLACK" {
  let color = @schema.Color::named("BLACK").unwrap()
  api_number(color.r, 0.0)
  api_number(color.g, 0.0)
  api_number(color.b, 0.0)
  api_number(color.a, 1.0)
  assert_eq(color.name, "Black")
}

///|
test "spatial:color-BLUE" {
  let color = @schema.Color::named("BLUE").unwrap()
  api_number(color.r, 0.0)
  api_number(color.g, 0.0)
  api_number(color.b, 1.0)
  api_number(color.a, 1.0)
  assert_eq(color.name, "Blue")
}

///|
test "spatial:color-CYAN" {
  let color = @schema.Color::named("CYAN").unwrap()
  api_number(color.r, 0.0)
  api_number(color.g, 1.0)
  api_number(color.b, 1.0)
  api_number(color.a, 1.0)
  assert_eq(color.name, "Cyan")
}

///|
test "spatial:color-GREEN" {
  let color = @schema.Color::named("GREEN").unwrap()
  api_number(color.r, 0.0)
  api_number(color.g, 1.0)
  api_number(color.b, 0.0)
  api_number(color.a, 1.0)
  assert_eq(color.name, "Green")
}

///|
test "spatial:color-MAGENTA" {
  let color = @schema.Color::named("MAGENTA").unwrap()
  api_number(color.r, 1.0)
  api_number(color.g, 0.0)
  api_number(color.b, 1.0)
  api_number(color.a, 1.0)
  assert_eq(color.name, "Magenta")
}

///|
test "spatial:color-ORANGE" {
  let color = @schema.Color::named("ORANGE").unwrap()
  api_number(color.r, 1.0)
  api_number(color.g, 0.5)
  api_number(color.b, 0.0)
  api_number(color.a, 1.0)
  assert_eq(color.name, "Orange")
}

///|
test "spatial:color-PINK" {
  let color = @schema.Color::named("PINK").unwrap()
  api_number(color.r, 1.0)
  api_number(color.g, 0.0)
  api_number(color.b, 1.0)
  api_number(color.a, 1.0)
  assert_eq(color.name, "Pink")
}

///|
test "spatial:color-PURPLE" {
  let color = @schema.Color::named("PURPLE").unwrap()
  api_number(color.r, 0.5)
  api_number(color.g, 0.0)
  api_number(color.b, 0.5)
  api_number(color.a, 1.0)
  assert_eq(color.name, "Purple")
}

///|
test "spatial:color-RED" {
  let color = @schema.Color::named("RED").unwrap()
  api_number(color.r, 1.0)
  api_number(color.g, 0.0)
  api_number(color.b, 0.0)
  api_number(color.a, 1.0)
  assert_eq(color.name, "Red")
}

///|
test "spatial:color-TRANSPARENT" {
  let color = @schema.Color::named("TRANSPARENT").unwrap()
  api_number(color.r, 0.0)
  api_number(color.g, 0.0)
  api_number(color.b, 0.0)
  api_number(color.a, 0.0)
  assert_eq(color.name, "Transparent")
}

///|
test "spatial:color-WHITE" {
  let color = @schema.Color::named("WHITE").unwrap()
  api_number(color.r, 1.0)
  api_number(color.g, 1.0)
  api_number(color.b, 1.0)
  api_number(color.a, 1.0)
  assert_eq(color.name, "White")
}

///|
test "spatial:color-YELLOW" {
  let color = @schema.Color::named("YELLOW").unwrap()
  api_number(color.r, 1.0)
  api_number(color.g, 1.0)
  api_number(color.b, 0.0)
  api_number(color.a, 1.0)
  assert_eq(color.name, "Yellow")
}

///|
test "spatial:hex-0" {
  let result = @schema.Color::from_hex("")
  assert_true(result is Err(_))
}

///|
test "spatial:hex-1" {
  let result = @schema.Color::from_hex("#")
  assert_true(result is Err(_))
}

///|
test "spatial:hex-2" {
  let result = @schema.Color::from_hex("0")
  assert_true(result is Err(_))
}

///|
test "spatial:hex-3" {
  let result = @schema.Color::from_hex("ff")
  assert_true(result is Err(_))
}

///|
test "spatial:hex-4" {
  let result = @schema.Color::from_hex("fff")
  let color = result.unwrap()
  api_number(color.r, 1.0)
  api_number(color.g, 1.0)
  api_number(color.b, 1.0)
  api_number(color.a, 1.0)
  assert_eq(color.name, "")
}

///|
test "spatial:hex-5" {
  let result = @schema.Color::from_hex("ffff")
  let color = result.unwrap()
  api_number(color.r, 1.0)
  api_number(color.g, 1.0)
  api_number(color.b, 1.0)
  api_number(color.a, 1.0)
  assert_eq(color.name, "")
}

///|
test "spatial:hex-6" {
  let result = @schema.Color::from_hex("112233")
  let color = result.unwrap()
  api_number(color.r, 0.06666666666666667)
  api_number(color.g, 0.13333333333333333)
  api_number(color.b, 0.2)
  api_number(color.a, 1.0)
  assert_eq(color.name, "")
}

///|
test "spatial:hex-7" {
  let result = @schema.Color::from_hex("11223344")
  let color = result.unwrap()
  api_number(color.r, 0.06666666666666667)
  api_number(color.g, 0.13333333333333333)
  api_number(color.b, 0.2)
  api_number(color.a, 0.26666666666666666)
  assert_eq(color.name, "")
}

///|
test "spatial:hex-8" {
  let result = @schema.Color::from_hex("#abcd")
  let color = result.unwrap()
  api_number(color.r, 0.6666666666666666)
  api_number(color.g, 0.7333333333333333)
  api_number(color.b, 0.8)
  api_number(color.a, 0.8666666666666667)
  assert_eq(color.name, "")
}

///|
test "spatial:hex-9" {
  let result = @schema.Color::from_hex("0Xff00ff")
  let color = result.unwrap()
  api_number(color.r, 1.0)
  api_number(color.g, 0.0)
  api_number(color.b, 1.0)
  api_number(color.a, 1.0)
  assert_eq(color.name, "")
}

///|
test "spatial:hex-10" {
  let result = @schema.Color::from_hex("0x#fff")
  assert_true(result is Err(_))
}

///|
test "spatial:hex-11" {
  let result = @schema.Color::from_hex("g00")
  assert_true(result is Err(_))
}

///|
test "spatial:hex-12" {
  let result = @schema.Color::from_hex("1z2233")
  let color = result.unwrap()
  api_number(color.r, 0.00392156862745098)
  api_number(color.g, 0.13333333333333333)
  api_number(color.b, 0.2)
  api_number(color.a, 1.0)
  assert_eq(color.name, "")
}

///|
test "spatial:hex-13" {
  let result = @schema.Color::from_hex(" 12233")
  let color = result.unwrap()
  api_number(color.r, 0.00392156862745098)
  api_number(color.g, 0.13333333333333333)
  api_number(color.b, 0.2)
  api_number(color.a, 1.0)
  assert_eq(color.name, "")
}

///|
test "spatial:hex-14" {
  let result = @schema.Color::from_hex("+12233")
  let color = result.unwrap()
  api_number(color.r, 0.00392156862745098)
  api_number(color.g, 0.13333333333333333)
  api_number(color.b, 0.2)
  api_number(color.a, 1.0)
  assert_eq(color.name, "")
}

///|
test "spatial:hex-15" {
  let result = @schema.Color::from_hex("-12233")
  let color = result.unwrap()
  api_number(color.r, -0.00392156862745098)
  api_number(color.g, 0.13333333333333333)
  api_number(color.b, 0.2)
  api_number(color.a, 1.0)
  assert_eq(color.name, "")
}

///|
test "spatial:hex-16" {
  let result = @schema.Color::from_hex("FfAa09")
  let color = result.unwrap()
  api_number(color.r, 1.0)
  api_number(color.g, 0.6666666666666666)
  api_number(color.b, 0.03529411764705882)
  api_number(color.a, 1.0)
  assert_eq(color.name, "")
}

///|
test "spatial:hex-17" {
  let result = @schema.Color::from_hex("12345")
  assert_true(result is Err(_))
}

///|
test "spatial:hex-18" {
  let result = @schema.Color::from_hex("1234567")
  assert_true(result is Err(_))
}

///|
test "spatial:hex-19" {
  let result = @schema.Color::from_hex("123456789")
  assert_true(result is Err(_))
}

///|
test "spatial:int-0--1" {
  assert_true(@schema.Color::from_int_list([], bit_depth=-1) is Err(_))
}

///|
test "spatial:int-0-0" {
  assert_true(@schema.Color::from_int_list([], bit_depth=0) is Err(_))
}

///|
test "spatial:int-0-1" {
  assert_true(@schema.Color::from_int_list([], bit_depth=1) is Err(_))
}

///|
test "spatial:int-0-8" {
  assert_true(@schema.Color::from_int_list([], bit_depth=8) is Err(_))
}

///|
test "spatial:int-0-16" {
  assert_true(@schema.Color::from_int_list([], bit_depth=16) is Err(_))
}

///|
test "spatial:int-1--1" {
  assert_true(@schema.Color::from_int_list([1], bit_depth=-1) is Err(_))
}

///|
test "spatial:int-1-0" {
  assert_true(@schema.Color::from_int_list([1], bit_depth=0) is Err(_))
}

///|
test "spatial:int-1-1" {
  assert_true(@schema.Color::from_int_list([1], bit_depth=1) is Err(_))
}

///|
test "spatial:int-1-8" {
  assert_true(@schema.Color::from_int_list([1], bit_depth=8) is Err(_))
}

///|
test "spatial:int-1-16" {
  assert_true(@schema.Color::from_int_list([1], bit_depth=16) is Err(_))
}

///|
test "spatial:int-2--1" {
  assert_true(@schema.Color::from_int_list([1, 2], bit_depth=-1) is Err(_))
}

///|
test "spatial:int-2-0" {
  assert_true(@schema.Color::from_int_list([1, 2], bit_depth=0) is Err(_))
}

///|
test "spatial:int-2-1" {
  assert_true(@schema.Color::from_int_list([1, 2], bit_depth=1) is Err(_))
}

///|
test "spatial:int-2-8" {
  assert_true(@schema.Color::from_int_list([1, 2], bit_depth=8) is Err(_))
}

///|
test "spatial:int-2-16" {
  assert_true(@schema.Color::from_int_list([1, 2], bit_depth=16) is Err(_))
}

///|
test "spatial:int-3--1" {
  let color = @schema.Color::from_int_list([0, 127, 255], bit_depth=-1).unwrap()
  api_number(color.r, -0.0)
  api_number(color.g, -254.0)
  api_number(color.b, -510.0)
  api_number(color.a, 1.0)
  assert_eq(color.name, "")
}

///|
test "spatial:int-3-0" {
  let color = @schema.Color::from_int_list([0, 127, 255], bit_depth=0).unwrap()
  api_number(color.r, 0.0 / 0.0)
  api_number(color.g, 1.0 / 0.0)
  api_number(color.b, 1.0 / 0.0)
  api_number(color.a, 1.0)
  assert_eq(color.name, "")
}

///|
test "spatial:int-3-1" {
  let color = @schema.Color::from_int_list([0, 127, 255], bit_depth=1).unwrap()
  api_number(color.r, 0.0)
  api_number(color.g, 127.0)
  api_number(color.b, 255.0)
  api_number(color.a, 1.0)
  assert_eq(color.name, "")
}

///|
test "spatial:int-3-8" {
  let color = @schema.Color::from_int_list([0, 127, 255], bit_depth=8).unwrap()
  api_number(color.r, 0.0)
  api_number(color.g, 0.4980392156862745)
  api_number(color.b, 1.0)
  api_number(color.a, 1.0)
  assert_eq(color.name, "")
}

///|
test "spatial:int-3-16" {
  let color = @schema.Color::from_int_list([0, 127, 255], bit_depth=16).unwrap()
  api_number(color.r, 0.0)
  api_number(color.g, 0.0019378957808804456)
  api_number(color.b, 0.0038910505836575876)
  api_number(color.a, 1.0)
  assert_eq(color.name, "")
}

///|
test "spatial:int-4--1" {
  let color = @schema.Color::from_int_list([1, 2, 3, 4], bit_depth=-1).unwrap()
  api_number(color.r, -2.0)
  api_number(color.g, -4.0)
  api_number(color.b, -6.0)
  api_number(color.a, -8.0)
  assert_eq(color.name, "")
}

///|
test "spatial:int-4-0" {
  let color = @schema.Color::from_int_list([1, 2, 3, 4], bit_depth=0).unwrap()
  api_number(color.r, 1.0 / 0.0)
  api_number(color.g, 1.0 / 0.0)
  api_number(color.b, 1.0 / 0.0)
  api_number(color.a, 1.0 / 0.0)
  assert_eq(color.name, "")
}

///|
test "spatial:int-4-1" {
  let color = @schema.Color::from_int_list([1, 2, 3, 4], bit_depth=1).unwrap()
  api_number(color.r, 1.0)
  api_number(color.g, 2.0)
  api_number(color.b, 3.0)
  api_number(color.a, 4.0)
  assert_eq(color.name, "")
}

///|
test "spatial:int-4-8" {
  let color = @schema.Color::from_int_list([1, 2, 3, 4], bit_depth=8).unwrap()
  api_number(color.r, 0.00392156862745098)
  api_number(color.g, 0.00784313725490196)
  api_number(color.b, 0.011764705882352941)
  api_number(color.a, 0.01568627450980392)
  assert_eq(color.name, "")
}

///|
test "spatial:int-4-16" {
  let color = @schema.Color::from_int_list([1, 2, 3, 4], bit_depth=16).unwrap()
  api_number(color.r, 1.5259021896696422e-05)
  api_number(color.g, 3.0518043793392844e-05)
  api_number(color.b, 4.5777065690089265e-05)
  api_number(color.a, 6.103608758678569e-05)
  assert_eq(color.name, "")
}

///|
test "spatial:int-5--1" {
  assert_true(
    @schema.Color::from_int_list([1, 2, 3, 4, 5], bit_depth=-1) is Err(_),
  )
}

///|
test "spatial:int-5-0" {
  assert_true(
    @schema.Color::from_int_list([1, 2, 3, 4, 5], bit_depth=0) is Err(_),
  )
}

///|
test "spatial:int-5-1" {
  assert_true(
    @schema.Color::from_int_list([1, 2, 3, 4, 5], bit_depth=1) is Err(_),
  )
}

///|
test "spatial:int-5-8" {
  assert_true(
    @schema.Color::from_int_list([1, 2, 3, 4, 5], bit_depth=8) is Err(_),
  )
}

///|
test "spatial:int-5-16" {
  assert_true(
    @schema.Color::from_int_list([1, 2, 3, 4, 5], bit_depth=16) is Err(_),
  )
}

///|
test "spatial:int-6--1" {
  let color = @schema.Color::from_int_list([-1, 256, 999], bit_depth=-1).unwrap()
  api_number(color.r, 2.0)
  api_number(color.g, -512.0)
  api_number(color.b, -1998.0)
  api_number(color.a, 1.0)
  assert_eq(color.name, "")
}

///|
test "spatial:int-6-0" {
  let color = @schema.Color::from_int_list([-1, 256, 999], bit_depth=0).unwrap()
  api_number(color.r, -1.0 / 0.0)
  api_number(color.g, 1.0 / 0.0)
  api_number(color.b, 1.0 / 0.0)
  api_number(color.a, 1.0)
  assert_eq(color.name, "")
}

///|
test "spatial:int-6-1" {
  let color = @schema.Color::from_int_list([-1, 256, 999], bit_depth=1).unwrap()
  api_number(color.r, -1.0)
  api_number(color.g, 256.0)
  api_number(color.b, 999.0)
  api_number(color.a, 1.0)
  assert_eq(color.name, "")
}

///|
test "spatial:int-6-8" {
  let color = @schema.Color::from_int_list([-1, 256, 999], bit_depth=8).unwrap()
  api_number(color.r, -0.00392156862745098)
  api_number(color.g, 1.003921568627451)
  api_number(color.b, 3.9176470588235293)
  api_number(color.a, 1.0)
  assert_eq(color.name, "")
}

///|
test "spatial:int-6-16" {
  let color = @schema.Color::from_int_list([-1, 256, 999], bit_depth=16).unwrap()
  api_number(color.r, -1.5259021896696422e-05)
  api_number(color.g, 0.003906309605554284)
  api_number(color.b, 0.015243762874799725)
  api_number(color.a, 1.0)
  assert_eq(color.name, "")
}

///|
test "spatial:float-0" {
  assert_true(@schema.Color::from_float_list([]) is Err(_))
}

///|
test "spatial:float-1" {
  assert_true(@schema.Color::from_float_list([1.0]) is Err(_))
}

///|
test "spatial:float-2" {
  assert_true(@schema.Color::from_float_list([1.0, 2.0]) is Err(_))
}

///|
test "spatial:float-3" {
  let color = @schema.Color::from_float_list([0.0, 0.5, 1.0]).unwrap()
  api_number(color.r, 0.0)
  api_number(color.g, 0.5)
  api_number(color.b, 1.0)
  api_number(color.a, 1.0)
  assert_eq(color.name, "")
  let channels = color.to_float_list()
  api_number(channels[0], 0.0)
  api_number(channels[1], 0.5)
  api_number(channels[2], 1.0)
  api_number(channels[3], 1.0)
  assert_eq(color.to_hex().unwrap(), "#007fffff")
  assert_eq(color.to_int_list(bit_depth=-1).unwrap(), [0, 0, 0, 0])
  assert_eq(color.to_int_list(bit_depth=0).unwrap(), [0, 0, 0, 0])
  assert_eq(color.to_int_list(bit_depth=1).unwrap(), [0, 0, 1, 1])
  assert_eq(color.to_int_list(bit_depth=8).unwrap(), [0, 127, 255, 255])
  assert_eq(color.to_int_list(bit_depth=16).unwrap(), [0, 32767, 65535, 65535])
}

///|
test "spatial:float-4" {
  let color = @schema.Color::from_float_list([1.0, 2.0, 3.0, 4.0]).unwrap()
  api_number(color.r, 1.0)
  api_number(color.g, 2.0)
  api_number(color.b, 3.0)
  api_number(color.a, 4.0)
  assert_eq(color.name, "")
  let channels = color.to_float_list()
  api_number(channels[0], 1.0)
  api_number(channels[1], 2.0)
  api_number(channels[2], 3.0)
  api_number(channels[3], 4.0)
  assert_eq(color.to_hex().unwrap(), "#ff1fe2fd3fc")
  assert_eq(color.to_int_list(bit_depth=-1).unwrap(), [0, -1, -1, -2])
  assert_eq(color.to_int_list(bit_depth=0).unwrap(), [0, 0, 0, 0])
  assert_eq(color.to_int_list(bit_depth=1).unwrap(), [1, 2, 3, 4])
  assert_eq(color.to_int_list(bit_depth=8).unwrap(), [255, 510, 765, 1020])
  assert_eq(color.to_int_list(bit_depth=16).unwrap(), [
    65535, 131070, 196605, 262140,
  ])
}

///|
test "spatial:float-5" {
  assert_true(
    @schema.Color::from_float_list([1.0, 2.0, 3.0, 4.0, 5.0]) is Err(_),
  )
}

///|
test "spatial:float-6" {
  let color = @schema.Color::from_float_list([-1.0, 2.0, 3.0]).unwrap()
  api_number(color.r, -1.0)
  api_number(color.g, 2.0)
  api_number(color.b, 3.0)
  api_number(color.a, 1.0)
  assert_eq(color.name, "")
  let channels = color.to_float_list()
  api_number(channels[0], -1.0)
  api_number(channels[1], 2.0)
  api_number(channels[2], 3.0)
  api_number(channels[3], 1.0)
  assert_eq(color.to_hex().unwrap(), "#ffffff011fe2fdff")
  assert_eq(color.to_int_list(bit_depth=-1).unwrap(), [0, -1, -1, 0])
  assert_eq(color.to_int_list(bit_depth=0).unwrap(), [0, 0, 0, 0])
  assert_eq(color.to_int_list(bit_depth=1).unwrap(), [-1, 2, 3, 1])
  assert_eq(color.to_int_list(bit_depth=8).unwrap(), [-255, 510, 765, 255])
  assert_eq(color.to_int_list(bit_depth=16).unwrap(), [
    -65535, 131070, 196605, 65535,
  ])
}

///|
test "spatial:float-7" {
  let color = @schema.Color::from_float_list([1.0 / 0.0, 0.0 / 0.0, 0.0]).unwrap()
  api_number(color.r, 1.0 / 0.0)
  api_number(color.g, 0.0 / 0.0)
  api_number(color.b, 0.0)
  api_number(color.a, 1.0)
  assert_eq(color.name, "")
  let channels = color.to_float_list()
  api_number(channels[0], 1.0 / 0.0)
  api_number(channels[1], 0.0 / 0.0)
  api_number(channels[2], 0.0)
  api_number(channels[3], 1.0)
}

///|
test "spatial:agbr-0" {
  let color = @schema.Color::from_agbr_integer(0U)
  api_number(color.r, 0.0)
  api_number(color.g, 0.0)
  api_number(color.b, 0.0)
  api_number(color.a, 0.0)
  assert_eq(color.name, "")
  assert_eq(color.to_agbr_integer().unwrap(), 0U)
}

///|
test "spatial:agbr-1" {
  let color = @schema.Color::from_agbr_integer(1U)
  api_number(color.r, 0.00392156862745098)
  api_number(color.g, 0.0)
  api_number(color.b, 0.0)
  api_number(color.a, 0.0)
  assert_eq(color.name, "")
  assert_eq(color.to_agbr_integer().unwrap(), 1U)
}

///|
test "spatial:agbr-305419896" {
  let color = @schema.Color::from_agbr_integer(305419896U)
  api_number(color.r, 0.47058823529411764)
  api_number(color.g, 0.20392156862745098)
  api_number(color.b, 0.33725490196078434)
  api_number(color.a, 0.07058823529411765)
  assert_eq(color.name, "")
  assert_eq(color.to_agbr_integer().unwrap(), 307639416U)
}

///|
test "spatial:agbr-4294967295" {
  let color = @schema.Color::from_agbr_integer(4294967295U)
  api_number(color.r, 1.0)
  api_number(color.g, 1.0)
  api_number(color.b, 1.0)
  api_number(color.a, 1.0)
  assert_eq(color.name, "")
  assert_eq(color.to_agbr_integer().unwrap(), 4294967295U)
}
