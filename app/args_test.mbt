///|
test "CLI rejects ambiguity and missing edit coordinates" {
  assert_true(
    @app.parse_args(["split", "a.otio", "--output", "b.otio"]) is Err(_),
  )
  assert_true(@app.parse_args(["inspect", "a.otio", "--rate", "0"]) is Err(_))
  assert_true(
    @app.parse_args(["inspect", "a.otio", "--format", "xml"]) is Err(_),
  )
  assert_true(
    @app.parse_args(["inspect", "a.otio", "--track", "0", "--track", "1"])
    is Err(_),
  )
  assert_eq(@app.parse_args(["inspect", "a.otio"]).unwrap().action, "inspect")
}
