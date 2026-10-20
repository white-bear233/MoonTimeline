///|
test "writer rejects cyclic metadata without recursion failure" {
  let metadata : Map[String, Json] = Map([])
  metadata["self"] = Json::object(metadata)
  let t : @model.Timeline = {
    name: "cycle",
    metadata: Json::object(metadata),
    global_start_time: None,
    tracks: {
      attributes: @model.Attributes::new("tracks"),
      source_range: None,
      children: [],
    },
    extra: Json::empty_object(),
  }
  assert_true(@otio.write(t) is Err(_))
}

///|
test "writer rejects oversized serialized model" {
  let values = []
  for i = 0; i < 2000010; i = i + 1 {
    values.push(Json::number(i.to_double()))
  }
  let t : @model.Timeline = {
    name: "nodes",
    metadata: Json::object({ "values": Json::array(values) }),
    global_start_time: None,
    tracks: {
      attributes: @model.Attributes::new("tracks"),
      source_range: None,
      children: [],
    },
    extra: Json::empty_object(),
  }
  assert_true(@otio.write(t) is Err(_))
}
