///|
test "spatial bounds colors and extension roundtrip" {
  let box : @schema.Box2d = {
    min: { x: -1.0, y: -2.0, },
    max: { x: 2.0, y: 3.0, },
  }
  let roundtrip = @schema.Box2d::from_json(box.to_json()).unwrap()
  assert_true(roundtrip.contains({ x: 2.0, y: 3.0, }))
  assert_false(roundtrip.contains({ x: 2.1, y: 3.0, }))
  let extended = box.extended_by({
    min: { x: 0.0, y: 0.0, },
    max: { x: 5.0, y: 5.0, },
  })
  assert_eq(extended.min.x, -1.0)
  assert_eq(extended.max.x, 5.0)
  let color : @schema.Color = {
    r: 0.1,
    g: 0.2,
    b: 0.3,
    a: 1.0,
    name: "Custom",
  }
  assert_true(
    @otiojson.equivalent(
      @schema.Color::from_json(color.to_json()).unwrap().to_json(),
      color.to_json(),
    ),
  )
}

///|
test "official color byte packing shorthand and vector normalization" {
  let c = @schema.Color::from_float_list([0.1, 0.2, 0.3, 0.4]).unwrap()
  assert_eq(c.to_hex().unwrap(), "#19334c66")
  assert_eq(c.to_agbr_integer().unwrap(), 1716269849U)
  assert_eq(
    @schema.Color::from_agbr_integer(1716269849U).to_hex().unwrap(),
    "#19334c66",
  )
  assert_eq(
    @schema.Color::from_hex("bad").unwrap().to_hex().unwrap(),
    "#bbaaddff",
  )
  assert_true(@schema.Color::from_hex("#xx") is Err(_))
  let v : @schema.V2d = { x: 3.0, y: 4.0, }
  assert_eq(v.length(), 5.0)
  assert_eq(v.dot({ x: 1.0, y: 0.0, }), 3.0)
  assert_true(
    v.normalized().unwrap().equal_with_error({ x: 0.6, y: 0.8, }, 1.0e-12),
  )
  let zero : @schema.V2d = { x: 0.0, y: 0.0, }
  assert_true(zero.normalized(reject_zero=true) is Err(_))
}
