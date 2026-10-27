///|
test "OTIOD and compressed OTIOZ preserve media and unknown metadata" {
  let media = @schema.Object::new("ExternalReference")
    .unwrap()
    .with_field("target_url", Json::string("file:///shots/a%20b.mov"))
    .unwrap()
  let original = media.to_json().unwrap()
  let bundle = @adapters.bundle(original, {
    "file:///shots/a%20b.mov": b"payload",
  }).unwrap()
  assert_eq(bundle.entries().get("media/a b.mov"), Some(b"payload"))
  let restored = @adapters.read_otioz(bundle.to_otioz().unwrap()).unwrap()
  assert_true(@otiojson.equivalent(restored.document(), bundle.document()))
  assert_eq(restored.entries().get("media/a b.mov"), Some(b"payload"))
  assert_eq(
    media.get("target_url"),
    Some(Json::string("file:///shots/a%20b.mov")),
  )
  assert_true(
    @adapters.read_otioz(bundle.to_otioz().unwrap(), max_total_bytes=4)
    is Err(_),
  )
}

///|
test "bundles reject traversal collisions invalid content and missing media" {
  for
    name in [
      "../x", "/x", "C:/x", "media/../x", "media\\x", "NUL.txt", "a//b", "a/", "a.",
    ] {
    assert_false(@adapters.safe_relative_path(name))
  }
  assert_true(
    @adapters.read_otiod({ "content.otio": b"{}", "../bad": b"bad" }) is Err(_),
  )
  assert_true(
    @adapters.read_otiod({ "content.otio": b"{}", "a": b"1", "A": b"2" })
    is Err(_),
  )
  assert_true(
    @adapters.read_otiod({ "content.otio": b"{}", "version.txt": b"2.0" })
    is Err(_),
  )
  assert_true(@adapters.read_otiod({ "content.otio": b"{" }) is Err(_))
  let raw = @schema.Object::new("ExternalReference")
    .unwrap()
    .with_field("target_url", Json::string("missing.mov"))
    .unwrap()
    .to_json()
    .unwrap()
  assert_true(@adapters.bundle(raw, Map([])) is Err(_))
  assert_eq(
    @schema.tag(
      @adapters.bundle(raw, Map([]), policy=@adapters.AllMissing)
      .unwrap()
      .document(),
    ),
    "MissingReference.1",
  )
  assert_eq(@adapters.decode_url_path("%E4%B8%AD%20a").unwrap(), "中 a")
  assert_true(@adapters.decode_url_path("%xx") is Err(_))
  assert_true(@adapters.decode_url_path("%00") is Err(_))
}
