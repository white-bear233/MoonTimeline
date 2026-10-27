///|
test "OTIO numeric extensions exact integers escaped strings and independent copies" {
  let raw = "{\"a\":[Inf,-Infinity,NaN,9223372036854775807],\"s\":\"NaN\\\" \\u0049nf\"}"
  let j = @otiojson.parse(raw).unwrap()
  let text = @otiojson.stringify(j).unwrap()
  assert_true(text.contains("9223372036854775807"))
  assert_true(@otiojson.equivalent(j, @otiojson.parse(text).unwrap()))
  let copy = @otiojson.clone(j).unwrap()
  match j {
    Object(o) => o.clear()
    _ => abort("object")
  }
  assert_true(
    @otiojson.stringify(copy).unwrap().contains("9223372036854775807"),
  )
}

///|
test "strict token boundaries duplicates malformed strings depth and cycles" {
  for
    raw in [
      "[Inf,]", "{\"a\":1,\"a\":2}", "NaNx", "Infinity0", "[1 2]", "\"\\x\"", "[",
      "null null", "{\"a\":Inf,}",
    ] {
    assert_true(@otiojson.parse(raw) is Err(_))
  }
  let cycle : Map[String, Json] = Map([])
  cycle["self"] = Json::object(cycle)
  assert_true(@otiojson.stringify(Json::object(cycle)) is Err(_))
}
