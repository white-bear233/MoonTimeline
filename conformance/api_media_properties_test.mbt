// Generated from official OTIO 0.18.1 by tools/generate_api_tests.py.

///|
test "media_properties:set-0" {
  assert_true(
    @schema.Object::new("Clip")
    .unwrap()
    .with_optional_media_references({}, "DEFAULT_MEDIA")
    is Err(_),
  )
}

///|
test "media_properties:set-1" {
  assert_true(
    @schema.Object::new("Clip")
    .unwrap()
    .with_optional_media_references(
      {
        "": Some(
          @schema.read(
            "{\n    \"OTIO_SCHEMA\": \"MissingReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": null,\n    \"available_image_bounds\": null\n}",
          ).unwrap(),
        ),
      },
      "",
    )
    is Err(_),
  )
}

///|
test "media_properties:set-2" {
  assert_true(
    @schema.Object::new("Clip")
    .unwrap()
    .with_optional_media_references(
      {
        "a": Some(
          @schema.read(
            "{\n    \"OTIO_SCHEMA\": \"MissingReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": null,\n    \"available_image_bounds\": null\n}",
          ).unwrap(),
        ),
      },
      "bad",
    )
    is Err(_),
  )
}

///|
test "media_properties:set-3" {
  let changed = @schema.Object::new("Clip")
    .unwrap()
    .with_optional_media_references(
      {
        "a": Some(
          @schema.read(
            "{\n    \"OTIO_SCHEMA\": \"MissingReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": null,\n    \"available_image_bounds\": null\n}",
          ).unwrap(),
        ),
      },
      "a",
    )
    .unwrap()
  assert_true(
    changed.equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"Clip.2\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"media_references\": {\n        \"a\": {\n            \"OTIO_SCHEMA\": \"MissingReference.1\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"available_range\": null,\n            \"available_image_bounds\": null\n        }\n    },\n    \"active_media_reference_key\": \"a\"\n}",
      ).unwrap(),
    ),
  )
  assert_true(
    changed
    .media_reference()
    .unwrap()
    .unwrap()
    .equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"MissingReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": null,\n    \"available_image_bounds\": null\n}",
      ).unwrap(),
    ),
  )
}

///|
test "media_properties:set-4" {
  let changed = @schema.Object::new("Clip")
    .unwrap()
    .with_optional_media_references({ "a": None }, "a")
    .unwrap()
  assert_true(
    changed.equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"Clip.2\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"media_references\": {\n        \"a\": {\n            \"OTIO_SCHEMA\": \"MissingReference.1\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"available_range\": null,\n            \"available_image_bounds\": null\n        }\n    },\n    \"active_media_reference_key\": \"a\"\n}",
      ).unwrap(),
    ),
  )
  assert_true(
    changed
    .media_reference()
    .unwrap()
    .unwrap()
    .equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"MissingReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": null,\n    \"available_image_bounds\": null\n}",
      ).unwrap(),
    ),
  )
}

///|
test "media_properties:set-5" {
  let changed = @schema.Object::new("Clip")
    .unwrap()
    .with_optional_media_references(
      {
        "a": Some(
          @schema.read(
            "{\n    \"OTIO_SCHEMA\": \"ExternalReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": null,\n    \"available_image_bounds\": null,\n    \"target_url\": \"file:///shot.mov\"\n}",
          ).unwrap(),
        ),
        "b": Some(
          @schema.read(
            "{\n    \"OTIO_SCHEMA\": \"MissingReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": null,\n    \"available_image_bounds\": null\n}",
          ).unwrap(),
        ),
      },
      "b",
    )
    .unwrap()
  assert_true(
    changed.equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"Clip.2\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"media_references\": {\n        \"a\": {\n            \"OTIO_SCHEMA\": \"ExternalReference.1\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"available_range\": null,\n            \"available_image_bounds\": null,\n            \"target_url\": \"file:///shot.mov\"\n        },\n        \"b\": {\n            \"OTIO_SCHEMA\": \"MissingReference.1\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"available_range\": null,\n            \"available_image_bounds\": null\n        }\n    },\n    \"active_media_reference_key\": \"b\"\n}",
      ).unwrap(),
    ),
  )
  assert_true(
    changed
    .media_reference()
    .unwrap()
    .unwrap()
    .equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"MissingReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": null,\n    \"available_image_bounds\": null\n}",
      ).unwrap(),
    ),
  )
}

///|
test "media_properties:set-6" {
  assert_true(
    @schema.Object::new("Clip")
    .unwrap()
    .with_optional_media_references(
      {
        "a": Some(
          @schema.read(
            "{\n    \"OTIO_SCHEMA\": \"Clip.2\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"media_references\": {\n        \"DEFAULT_MEDIA\": {\n            \"OTIO_SCHEMA\": \"MissingReference.1\",\n            \"metadata\": {},\n            \"name\": \"\",\n            \"available_range\": null,\n            \"available_image_bounds\": null\n        }\n    },\n    \"active_media_reference_key\": \"DEFAULT_MEDIA\"\n}",
          ).unwrap(),
        ),
      },
      "a",
    )
    is Err(_),
  )
}

///|
test "media_properties:get-DEFAULT_MEDIA" {
  let c = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"DEFAULT_MEDIA\"}",
  ).unwrap()
  assert_true(
    c
    .media_reference()
    .unwrap()
    .unwrap()
    .equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"MissingReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": null,\n    \"available_image_bounds\": null\n}",
      ).unwrap(),
    ),
  )
}

///|
test "media_properties:get-missing" {
  let c = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"missing\"}",
  ).unwrap()
  assert_true(c.media_reference().unwrap() is None)
}

///|
test "media_properties:get-" {
  let c = @schema.read(
    "{\"OTIO_SCHEMA\": \"Clip.2\", \"metadata\": {}, \"name\": \"\", \"source_range\": null, \"effects\": [], \"markers\": [], \"enabled\": true, \"color\": null, \"media_references\": {\"DEFAULT_MEDIA\": {\"OTIO_SCHEMA\": \"MissingReference.1\", \"metadata\": {}, \"name\": \"\", \"available_range\": null, \"available_image_bounds\": null}}, \"active_media_reference_key\": \"\"}",
  ).unwrap()
  assert_true(c.media_reference().unwrap() is None)
}

///|
test "media_properties:default-key" {
  assert_eq(
    @schema.Object::new("Clip").unwrap().get("active_media_reference_key"),
    Some(Json::string("DEFAULT_MEDIA")),
  )
}

///|
test "media_properties:marker-color-BLACK" {
  assert_true(
    @schema.Object::new("Marker")
    .unwrap()
    .with_field("color", Json::string("BLACK"))
    .unwrap()
    .equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"Marker.2\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"color\": \"BLACK\",\n    \"marked_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 1.0,\n            \"value\": 0.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 1.0,\n            \"value\": 0.0\n        }\n    },\n    \"comment\": \"\"\n}",
      ).unwrap(),
    ),
  )
}

///|
test "media_properties:marker-color-BLUE" {
  assert_true(
    @schema.Object::new("Marker")
    .unwrap()
    .with_field("color", Json::string("BLUE"))
    .unwrap()
    .equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"Marker.2\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"color\": \"BLUE\",\n    \"marked_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 1.0,\n            \"value\": 0.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 1.0,\n            \"value\": 0.0\n        }\n    },\n    \"comment\": \"\"\n}",
      ).unwrap(),
    ),
  )
}

///|
test "media_properties:marker-color-CYAN" {
  assert_true(
    @schema.Object::new("Marker")
    .unwrap()
    .with_field("color", Json::string("CYAN"))
    .unwrap()
    .equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"Marker.2\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"color\": \"CYAN\",\n    \"marked_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 1.0,\n            \"value\": 0.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 1.0,\n            \"value\": 0.0\n        }\n    },\n    \"comment\": \"\"\n}",
      ).unwrap(),
    ),
  )
}

///|
test "media_properties:marker-color-GREEN" {
  assert_true(
    @schema.Object::new("Marker")
    .unwrap()
    .with_field("color", Json::string("GREEN"))
    .unwrap()
    .equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"Marker.2\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"color\": \"GREEN\",\n    \"marked_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 1.0,\n            \"value\": 0.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 1.0,\n            \"value\": 0.0\n        }\n    },\n    \"comment\": \"\"\n}",
      ).unwrap(),
    ),
  )
}

///|
test "media_properties:marker-color-MAGENTA" {
  assert_true(
    @schema.Object::new("Marker")
    .unwrap()
    .with_field("color", Json::string("MAGENTA"))
    .unwrap()
    .equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"Marker.2\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"color\": \"MAGENTA\",\n    \"marked_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 1.0,\n            \"value\": 0.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 1.0,\n            \"value\": 0.0\n        }\n    },\n    \"comment\": \"\"\n}",
      ).unwrap(),
    ),
  )
}

///|
test "media_properties:marker-color-ORANGE" {
  assert_true(
    @schema.Object::new("Marker")
    .unwrap()
    .with_field("color", Json::string("ORANGE"))
    .unwrap()
    .equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"Marker.2\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"color\": \"ORANGE\",\n    \"marked_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 1.0,\n            \"value\": 0.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 1.0,\n            \"value\": 0.0\n        }\n    },\n    \"comment\": \"\"\n}",
      ).unwrap(),
    ),
  )
}

///|
test "media_properties:marker-color-PINK" {
  assert_true(
    @schema.Object::new("Marker")
    .unwrap()
    .with_field("color", Json::string("PINK"))
    .unwrap()
    .equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"Marker.2\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"color\": \"PINK\",\n    \"marked_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 1.0,\n            \"value\": 0.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 1.0,\n            \"value\": 0.0\n        }\n    },\n    \"comment\": \"\"\n}",
      ).unwrap(),
    ),
  )
}

///|
test "media_properties:marker-color-PURPLE" {
  assert_true(
    @schema.Object::new("Marker")
    .unwrap()
    .with_field("color", Json::string("PURPLE"))
    .unwrap()
    .equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"Marker.2\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"color\": \"PURPLE\",\n    \"marked_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 1.0,\n            \"value\": 0.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 1.0,\n            \"value\": 0.0\n        }\n    },\n    \"comment\": \"\"\n}",
      ).unwrap(),
    ),
  )
}

///|
test "media_properties:marker-color-RED" {
  assert_true(
    @schema.Object::new("Marker")
    .unwrap()
    .with_field("color", Json::string("RED"))
    .unwrap()
    .equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"Marker.2\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"color\": \"RED\",\n    \"marked_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 1.0,\n            \"value\": 0.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 1.0,\n            \"value\": 0.0\n        }\n    },\n    \"comment\": \"\"\n}",
      ).unwrap(),
    ),
  )
}

///|
test "media_properties:marker-color-WHITE" {
  assert_true(
    @schema.Object::new("Marker")
    .unwrap()
    .with_field("color", Json::string("WHITE"))
    .unwrap()
    .equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"Marker.2\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"color\": \"WHITE\",\n    \"marked_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 1.0,\n            \"value\": 0.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 1.0,\n            \"value\": 0.0\n        }\n    },\n    \"comment\": \"\"\n}",
      ).unwrap(),
    ),
  )
}

///|
test "media_properties:marker-color-YELLOW" {
  assert_true(
    @schema.Object::new("Marker")
    .unwrap()
    .with_field("color", Json::string("YELLOW"))
    .unwrap()
    .equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"Marker.2\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"color\": \"YELLOW\",\n    \"marked_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 1.0,\n            \"value\": 0.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 1.0,\n            \"value\": 0.0\n        }\n    },\n    \"comment\": \"\"\n}",
      ).unwrap(),
    ),
  )
}

///|
test "media_properties:track-kind-Audio" {
  assert_true(
    @schema.Object::new("Track")
    .unwrap()
    .with_field("kind", Json::string("Audio"))
    .unwrap()
    .equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"Track.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"children\": [],\n    \"kind\": \"Audio\"\n}",
      ).unwrap(),
    ),
  )
}

///|
test "media_properties:track-kind-Video" {
  assert_true(
    @schema.Object::new("Track")
    .unwrap()
    .with_field("kind", Json::string("Video"))
    .unwrap()
    .equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"Track.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"source_range\": null,\n    \"effects\": [],\n    \"markers\": [],\n    \"enabled\": true,\n    \"color\": null,\n    \"children\": [],\n    \"kind\": \"Video\"\n}",
      ).unwrap(),
    ),
  )
}

///|
test "media_properties:transition-type-Custom" {
  assert_true(
    @schema.Object::new("Transition")
    .unwrap()
    .with_field("transition_type", Json::string("Custom_Transition"))
    .unwrap()
    .equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"Transition.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"in_offset\": {\n        \"OTIO_SCHEMA\": \"RationalTime.1\",\n        \"rate\": 1.0,\n        \"value\": 0.0\n    },\n    \"out_offset\": {\n        \"OTIO_SCHEMA\": \"RationalTime.1\",\n        \"rate\": 1.0,\n        \"value\": 0.0\n    },\n    \"transition_type\": \"Custom_Transition\"\n}",
      ).unwrap(),
    ),
  )
}

///|
test "media_properties:transition-type-SMPTE_Dissolve" {
  assert_true(
    @schema.Object::new("Transition")
    .unwrap()
    .with_field("transition_type", Json::string("SMPTE_Dissolve"))
    .unwrap()
    .equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"Transition.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"in_offset\": {\n        \"OTIO_SCHEMA\": \"RationalTime.1\",\n        \"rate\": 1.0,\n        \"value\": 0.0\n    },\n    \"out_offset\": {\n        \"OTIO_SCHEMA\": \"RationalTime.1\",\n        \"rate\": 1.0,\n        \"value\": 0.0\n    },\n    \"transition_type\": \"SMPTE_Dissolve\"\n}",
      ).unwrap(),
    ),
  )
}

///|
test "media_properties:missing-policy-error" {
  assert_true(
    @schema.Object::new("ImageSequenceReference")
    .unwrap()
    .with_field("missing_frame_policy", Json::string("error"))
    .unwrap()
    .equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": null,\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"\",\n    \"name_prefix\": \"\",\n    \"name_suffix\": \"\",\n    \"start_frame\": 1,\n    \"frame_step\": 1,\n    \"rate\": 1.0,\n    \"frame_zero_padding\": 0,\n    \"missing_frame_policy\": \"error\"\n}",
      ).unwrap(),
    ),
  )
}

///|
test "media_properties:missing-policy-hold" {
  assert_true(
    @schema.Object::new("ImageSequenceReference")
    .unwrap()
    .with_field("missing_frame_policy", Json::string("hold"))
    .unwrap()
    .equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": null,\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"\",\n    \"name_prefix\": \"\",\n    \"name_suffix\": \"\",\n    \"start_frame\": 1,\n    \"frame_step\": 1,\n    \"rate\": 1.0,\n    \"frame_zero_padding\": 0,\n    \"missing_frame_policy\": \"hold\"\n}",
      ).unwrap(),
    ),
  )
}

///|
test "media_properties:missing-policy-black" {
  assert_true(
    @schema.Object::new("ImageSequenceReference")
    .unwrap()
    .with_field("missing_frame_policy", Json::string("black"))
    .unwrap()
    .equivalent(
      @schema.read(
        "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": null,\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"\",\n    \"name_prefix\": \"\",\n    \"name_suffix\": \"\",\n    \"start_frame\": 1,\n    \"frame_step\": 1,\n    \"rate\": 1.0,\n    \"frame_zero_padding\": 0,\n    \"missing_frame_policy\": \"black\"\n}",
      ).unwrap(),
    ),
  )
}
