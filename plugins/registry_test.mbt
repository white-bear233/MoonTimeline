///|
test "version manifests downgrade nested clips without reupgrading" {
  let r = @plugins.Registry::new()
  r.register_version_manifest("legacy", { "Clip": 1 }).unwrap()
  let clip = @schema.Object::new("Clip").unwrap()
  let track = @schema.Object::new("Track")
    .unwrap()
    .with_children([clip])
    .unwrap()
  let restored = @otiojson.parse(
    r.write_versions(track.to_json().unwrap(), "legacy").unwrap(),
  ).unwrap()
  match restored {
    Object(o) =>
      match o.get("children") {
        Some(Array(a)) => assert_eq(@schema.tag(a[0]), "Clip.1")
        _ => abort("children")
      }
    _ => abort("root")
  }
  assert_eq(clip.schema_version(), 2)
}

///|
test "adapter hook and media linker pipeline" {
  let r = @plugins.Registry::new()
  let calls : Array[String] = []
  r
  .register_hook("post_adapter_read", fn(j, _a) {
    calls.push("read")
    Ok(j)
  })
  .unwrap()
  r
  .register_hook("post_media_linker", fn(j, _a) {
    calls.push("linked")
    Ok(j)
  })
  .unwrap()
  r
  .register_hook("pre_adapter_write", fn(j, _a) {
    calls.push("write")
    Ok(j)
  })
  .unwrap()
  r
  .register_media_linker("test", fn(_clip, _args) {
    calls.push("link")
    @schema.Object::new("ExternalReference")
    .unwrap()
    .with_field("target_url", Json::string("linked.mov"))
    .unwrap()
    .to_json()
  })
  .unwrap()
  let source = @schema.write(@schema.Object::new("Clip").unwrap()).unwrap()
  let linked = r.read(source, media_linker=Some("test")).unwrap()
  assert_eq(
    @schema.Object::from_json(linked)
    .unwrap()
    .active_media()
    .unwrap()
    .get("target_url"),
    Some(Json::string("linked.mov")),
  )
  r.write(linked).unwrap() |> ignore
  assert_eq(calls, ["read", "link", "linked", "write"])
  assert_eq(r.adapter_for_suffix("otio").unwrap(), "otio_json")
  assert_true(r.register_hook("bad", fn(j, _a) { Ok(j) }) is Err(_))
  assert_true(r.read("{}", adapter="bad") is Err(_))
}

///|
test "custom schemas upgrade downgrade and protect builtins" {
  let r = @plugins.Registry::new()
  r
  .register_schema({
    name: "Custom",
    version: 2,
    upgrade: fn(j, _v) { Ok(j) },
    downgrade: fn(j, _v) { Ok(j) },
  })
  .unwrap()
  let custom = @schema.read(
    "{\"OTIO_SCHEMA\":\"Custom.1\",\"nested\":{\"keep\":9}}",
  ).unwrap()
  assert_eq(@schema.tag(r.convert_schema(custom, 2).unwrap()), "Custom.2")
  assert_true(r.convert_schema(custom, 3) is Err(_))
  assert_true(
    r.register_schema({
      name: "Clip",
      version: 2,
      upgrade: fn(j, _v) { Ok(j) },
      downgrade: fn(j, _v) { Ok(j) },
    })
    is Err(_),
  )
}

///|
test "manifest resolution is atomic and hooks versions are wired by name" {
  let registry = @plugins.Registry::new()
  let resolver : @plugins.Resolver = {
    adapter: fn(desc) {
      Ok({
        name: desc.name().unwrap(),
        suffixes: ["custom"],
        read: fn(s) { @otiojson.parse(s) },
        write: fn(j) { @otiojson.stringify(j) },
      })
    },
    hook: fn(_desc) { Ok(fn(j, _args) { Ok(j) }) },
    media_linker: fn(_desc) { Ok(fn(_j, _args) { Ok(Json::null()) }) },
    schema: fn(_desc) { Err("not_supplied") },
  }
  let desc = @schema.Object::new("Adapter")
    .unwrap()
    .with_name("custom")
    .unwrap()
  let manifest = @schema.Object::new("PluginManifest")
    .unwrap()
    .with_field("adapters", Json::array([desc.to_json().unwrap()]))
    .unwrap()
  let invalid = manifest
    .with_field(
      "hooks",
      Json::object({
        "post_adapter_read": Json::array([Json::string("missing")]),
      }),
    )
    .unwrap()
  assert_true(registry.load_manifest(invalid, resolver) is Err(_))
  assert_false(registry.adapter_names().contains("custom"))
  registry.load_manifest(manifest, resolver).unwrap()
  assert_eq(registry.adapter_for_suffix("custom").unwrap(), "custom")
  assert_eq(registry.read("42", adapter="custom").unwrap(), Json::number(42))
  assert_true(registry.load_manifest(manifest, resolver) is Err(_))
}
