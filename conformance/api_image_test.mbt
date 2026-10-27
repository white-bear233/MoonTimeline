// Generated from official OTIO 0.18.1 by tools/generate_api_tests.py.

///|
test "image:0-info" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 10.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 1,\n    \"frame_step\": 1,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  assert_eq(s.abstract_target_url("#"), "file:///images/shot.#.exr")
  assert_eq(s.number_of_images(), 10)
  api_number(s.end_frame().unwrap(), 10.0)
}

///|
test "image:0-target_url_for_image_number--1" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 10.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 1,\n    \"frame_step\": 1,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  assert_eq(s.target_url(-1).unwrap(), "file:///images/shot.0000.exr")
}

///|
test "image:0-presentation_time_for_image_number--1" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 10.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 1,\n    \"frame_step\": 1,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  let actual_time = s.presentation_time(-1).unwrap()
  api_number(actual_time.value(), 47.0)
  api_number(actual_time.rate(), 24.0)
}

///|
test "image:0-target_url_for_image_number-0" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 10.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 1,\n    \"frame_step\": 1,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  assert_eq(s.target_url(0).unwrap(), "file:///images/shot.0001.exr")
}

///|
test "image:0-presentation_time_for_image_number-0" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 10.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 1,\n    \"frame_step\": 1,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  let actual_time = s.presentation_time(0).unwrap()
  api_number(actual_time.value(), 48.0)
  api_number(actual_time.rate(), 24.0)
}

///|
test "image:0-target_url_for_image_number-1" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 10.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 1,\n    \"frame_step\": 1,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  assert_eq(s.target_url(1).unwrap(), "file:///images/shot.0002.exr")
}

///|
test "image:0-presentation_time_for_image_number-1" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 10.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 1,\n    \"frame_step\": 1,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  let actual_time = s.presentation_time(1).unwrap()
  api_number(actual_time.value(), 49.0)
  api_number(actual_time.rate(), 24.0)
}

///|
test "image:0-target_url_for_image_number-9" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 10.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 1,\n    \"frame_step\": 1,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  assert_eq(s.target_url(9).unwrap(), "file:///images/shot.0010.exr")
}

///|
test "image:0-presentation_time_for_image_number-9" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 10.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 1,\n    \"frame_step\": 1,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  let actual_time = s.presentation_time(9).unwrap()
  api_number(actual_time.value(), 57.0)
  api_number(actual_time.rate(), 24.0)
}

///|
test "image:0-target_url_for_image_number-10" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 10.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 1,\n    \"frame_step\": 1,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  assert_true(s.target_url(10) is Err(_))
}

///|
test "image:0-presentation_time_for_image_number-10" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 10.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 1,\n    \"frame_step\": 1,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  assert_true(s.presentation_time(10) is Err(_))
}

///|
test "image:0-target_url_for_image_number-100" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 10.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 1,\n    \"frame_step\": 1,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  assert_true(s.target_url(100) is Err(_))
}

///|
test "image:0-presentation_time_for_image_number-100" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 10.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 1,\n    \"frame_step\": 1,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  assert_true(s.presentation_time(100) is Err(_))
}

///|
test "image:0-frame-47" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 10.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 1,\n    \"frame_step\": 1,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  assert_true(
    s.frame_for_time(@time.RationalTime::new(47.0, 24.0).unwrap()) is Err(_),
  )
}

///|
test "image:0-range-47" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 10.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 1,\n    \"frame_step\": 1,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  assert_true(
    s.frame_range(
      @range.TimeRange::new(
        @time.RationalTime::new(47.0, 24.0).unwrap(),
        @time.RationalTime::new(1.0, 24.0).unwrap(),
      ).unwrap(),
    )
    is Err(_),
  )
}

///|
test "image:0-frame-48" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 10.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 1,\n    \"frame_step\": 1,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  api_number(
    s.frame_for_time(@time.RationalTime::new(48.0, 24.0).unwrap()).unwrap(),
    1.0,
  )
}

///|
test "image:0-range-48" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 10.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 1,\n    \"frame_step\": 1,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  let (a, b) = s
    .frame_range(
      @range.TimeRange::new(
        @time.RationalTime::new(48.0, 24.0).unwrap(),
        @time.RationalTime::new(1.0, 24.0).unwrap(),
      ).unwrap(),
    )
    .unwrap()
  api_number(a, 1.0)
  api_number(b, 1.0)
}

///|
test "image:0-frame-48.5" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 10.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 1,\n    \"frame_step\": 1,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  api_number(
    s.frame_for_time(@time.RationalTime::new(48.5, 24.0).unwrap()).unwrap(),
    1.0,
  )
}

///|
test "image:0-range-48.5" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 10.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 1,\n    \"frame_step\": 1,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  let (a, b) = s
    .frame_range(
      @range.TimeRange::new(
        @time.RationalTime::new(48.5, 24.0).unwrap(),
        @time.RationalTime::new(1.0, 24.0).unwrap(),
      ).unwrap(),
    )
    .unwrap()
  api_number(a, 1.0)
  api_number(b, 1.0)
}

///|
test "image:0-frame-49" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 10.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 1,\n    \"frame_step\": 1,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  api_number(
    s.frame_for_time(@time.RationalTime::new(49.0, 24.0).unwrap()).unwrap(),
    2.0,
  )
}

///|
test "image:0-range-49" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 10.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 1,\n    \"frame_step\": 1,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  let (a, b) = s
    .frame_range(
      @range.TimeRange::new(
        @time.RationalTime::new(49.0, 24.0).unwrap(),
        @time.RationalTime::new(1.0, 24.0).unwrap(),
      ).unwrap(),
    )
    .unwrap()
  api_number(a, 2.0)
  api_number(b, 2.0)
}

///|
test "image:0-frame-50" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 10.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 1,\n    \"frame_step\": 1,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  api_number(
    s.frame_for_time(@time.RationalTime::new(50.0, 24.0).unwrap()).unwrap(),
    3.0,
  )
}

///|
test "image:0-range-50" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 10.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 1,\n    \"frame_step\": 1,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  let (a, b) = s
    .frame_range(
      @range.TimeRange::new(
        @time.RationalTime::new(50.0, 24.0).unwrap(),
        @time.RationalTime::new(1.0, 24.0).unwrap(),
      ).unwrap(),
    )
    .unwrap()
  api_number(a, 3.0)
  api_number(b, 3.0)
}

///|
test "image:0-frame-57" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 10.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 1,\n    \"frame_step\": 1,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  api_number(
    s.frame_for_time(@time.RationalTime::new(57.0, 24.0).unwrap()).unwrap(),
    10.0,
  )
}

///|
test "image:0-range-57" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 10.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 1,\n    \"frame_step\": 1,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  let (a, b) = s
    .frame_range(
      @range.TimeRange::new(
        @time.RationalTime::new(57.0, 24.0).unwrap(),
        @time.RationalTime::new(1.0, 24.0).unwrap(),
      ).unwrap(),
    )
    .unwrap()
  api_number(a, 10.0)
  api_number(b, 10.0)
}

///|
test "image:0-frame-58" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 10.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 1,\n    \"frame_step\": 1,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  assert_true(
    s.frame_for_time(@time.RationalTime::new(58.0, 24.0).unwrap()) is Err(_),
  )
}

///|
test "image:0-range-58" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 10.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 1,\n    \"frame_step\": 1,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  assert_true(
    s.frame_range(
      @range.TimeRange::new(
        @time.RationalTime::new(58.0, 24.0).unwrap(),
        @time.RationalTime::new(1.0, 24.0).unwrap(),
      ).unwrap(),
    )
    is Err(_),
  )
}

///|
test "image:0-frame-60" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 10.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 1,\n    \"frame_step\": 1,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  assert_true(
    s.frame_for_time(@time.RationalTime::new(60.0, 24.0).unwrap()) is Err(_),
  )
}

///|
test "image:0-range-60" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 10.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 1,\n    \"frame_step\": 1,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  assert_true(
    s.frame_range(
      @range.TimeRange::new(
        @time.RationalTime::new(60.0, 24.0).unwrap(),
        @time.RationalTime::new(1.0, 24.0).unwrap(),
      ).unwrap(),
    )
    is Err(_),
  )
}

///|
test "image:1-info" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 10.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": -5,\n    \"frame_step\": 2,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  assert_eq(s.abstract_target_url("#"), "file:///images/shot.#.exr")
  assert_eq(s.number_of_images(), 5)
  api_number(s.end_frame().unwrap(), 4.0)
}

///|
test "image:1-target_url_for_image_number--1" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 10.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": -5,\n    \"frame_step\": 2,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  assert_eq(s.target_url(-1).unwrap(), "file:///images/shot.-0007.exr")
}

///|
test "image:1-presentation_time_for_image_number--1" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 10.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": -5,\n    \"frame_step\": 2,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  let actual_time = s.presentation_time(-1).unwrap()
  api_number(actual_time.value(), 46.0)
  api_number(actual_time.rate(), 24.0)
}

///|
test "image:1-target_url_for_image_number-0" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 10.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": -5,\n    \"frame_step\": 2,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  assert_eq(s.target_url(0).unwrap(), "file:///images/shot.-0005.exr")
}

///|
test "image:1-presentation_time_for_image_number-0" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 10.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": -5,\n    \"frame_step\": 2,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  let actual_time = s.presentation_time(0).unwrap()
  api_number(actual_time.value(), 48.0)
  api_number(actual_time.rate(), 24.0)
}

///|
test "image:1-target_url_for_image_number-1" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 10.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": -5,\n    \"frame_step\": 2,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  assert_eq(s.target_url(1).unwrap(), "file:///images/shot.-0003.exr")
}

///|
test "image:1-presentation_time_for_image_number-1" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 10.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": -5,\n    \"frame_step\": 2,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  let actual_time = s.presentation_time(1).unwrap()
  api_number(actual_time.value(), 50.0)
  api_number(actual_time.rate(), 24.0)
}

///|
test "image:1-target_url_for_image_number-4" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 10.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": -5,\n    \"frame_step\": 2,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  assert_eq(s.target_url(4).unwrap(), "file:///images/shot.0003.exr")
}

///|
test "image:1-presentation_time_for_image_number-4" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 10.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": -5,\n    \"frame_step\": 2,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  let actual_time = s.presentation_time(4).unwrap()
  api_number(actual_time.value(), 56.0)
  api_number(actual_time.rate(), 24.0)
}

///|
test "image:1-target_url_for_image_number-5" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 10.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": -5,\n    \"frame_step\": 2,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  assert_true(s.target_url(5) is Err(_))
}

///|
test "image:1-presentation_time_for_image_number-5" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 10.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": -5,\n    \"frame_step\": 2,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  assert_true(s.presentation_time(5) is Err(_))
}

///|
test "image:1-target_url_for_image_number-100" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 10.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": -5,\n    \"frame_step\": 2,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  assert_true(s.target_url(100) is Err(_))
}

///|
test "image:1-presentation_time_for_image_number-100" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 10.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": -5,\n    \"frame_step\": 2,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  assert_true(s.presentation_time(100) is Err(_))
}

///|
test "image:1-frame-47" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 10.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": -5,\n    \"frame_step\": 2,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  assert_true(
    s.frame_for_time(@time.RationalTime::new(47.0, 24.0).unwrap()) is Err(_),
  )
}

///|
test "image:1-range-47" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 10.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": -5,\n    \"frame_step\": 2,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  assert_true(
    s.frame_range(
      @range.TimeRange::new(
        @time.RationalTime::new(47.0, 24.0).unwrap(),
        @time.RationalTime::new(1.0, 24.0).unwrap(),
      ).unwrap(),
    )
    is Err(_),
  )
}

///|
test "image:1-frame-48" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 10.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": -5,\n    \"frame_step\": 2,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  api_number(
    s.frame_for_time(@time.RationalTime::new(48.0, 24.0).unwrap()).unwrap(),
    -5.0,
  )
}

///|
test "image:1-range-48" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 10.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": -5,\n    \"frame_step\": 2,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  let (a, b) = s
    .frame_range(
      @range.TimeRange::new(
        @time.RationalTime::new(48.0, 24.0).unwrap(),
        @time.RationalTime::new(1.0, 24.0).unwrap(),
      ).unwrap(),
    )
    .unwrap()
  api_number(a, -5.0)
  api_number(b, -5.0)
}

///|
test "image:1-frame-48.5" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 10.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": -5,\n    \"frame_step\": 2,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  api_number(
    s.frame_for_time(@time.RationalTime::new(48.5, 24.0).unwrap()).unwrap(),
    -5.0,
  )
}

///|
test "image:1-range-48.5" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 10.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": -5,\n    \"frame_step\": 2,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  let (a, b) = s
    .frame_range(
      @range.TimeRange::new(
        @time.RationalTime::new(48.5, 24.0).unwrap(),
        @time.RationalTime::new(1.0, 24.0).unwrap(),
      ).unwrap(),
    )
    .unwrap()
  api_number(a, -5.0)
  api_number(b, -5.0)
}

///|
test "image:1-frame-49" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 10.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": -5,\n    \"frame_step\": 2,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  api_number(
    s.frame_for_time(@time.RationalTime::new(49.0, 24.0).unwrap()).unwrap(),
    -4.0,
  )
}

///|
test "image:1-range-49" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 10.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": -5,\n    \"frame_step\": 2,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  let (a, b) = s
    .frame_range(
      @range.TimeRange::new(
        @time.RationalTime::new(49.0, 24.0).unwrap(),
        @time.RationalTime::new(1.0, 24.0).unwrap(),
      ).unwrap(),
    )
    .unwrap()
  api_number(a, -4.0)
  api_number(b, -4.0)
}

///|
test "image:1-frame-50" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 10.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": -5,\n    \"frame_step\": 2,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  api_number(
    s.frame_for_time(@time.RationalTime::new(50.0, 24.0).unwrap()).unwrap(),
    -3.0,
  )
}

///|
test "image:1-range-50" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 10.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": -5,\n    \"frame_step\": 2,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  let (a, b) = s
    .frame_range(
      @range.TimeRange::new(
        @time.RationalTime::new(50.0, 24.0).unwrap(),
        @time.RationalTime::new(1.0, 24.0).unwrap(),
      ).unwrap(),
    )
    .unwrap()
  api_number(a, -3.0)
  api_number(b, -3.0)
}

///|
test "image:1-frame-57" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 10.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": -5,\n    \"frame_step\": 2,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  api_number(
    s.frame_for_time(@time.RationalTime::new(57.0, 24.0).unwrap()).unwrap(),
    4.0,
  )
}

///|
test "image:1-range-57" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 10.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": -5,\n    \"frame_step\": 2,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  let (a, b) = s
    .frame_range(
      @range.TimeRange::new(
        @time.RationalTime::new(57.0, 24.0).unwrap(),
        @time.RationalTime::new(1.0, 24.0).unwrap(),
      ).unwrap(),
    )
    .unwrap()
  api_number(a, 4.0)
  api_number(b, 4.0)
}

///|
test "image:1-frame-58" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 10.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": -5,\n    \"frame_step\": 2,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  assert_true(
    s.frame_for_time(@time.RationalTime::new(58.0, 24.0).unwrap()) is Err(_),
  )
}

///|
test "image:1-range-58" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 10.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": -5,\n    \"frame_step\": 2,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  assert_true(
    s.frame_range(
      @range.TimeRange::new(
        @time.RationalTime::new(58.0, 24.0).unwrap(),
        @time.RationalTime::new(1.0, 24.0).unwrap(),
      ).unwrap(),
    )
    is Err(_),
  )
}

///|
test "image:1-frame-60" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 10.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": -5,\n    \"frame_step\": 2,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  assert_true(
    s.frame_for_time(@time.RationalTime::new(60.0, 24.0).unwrap()) is Err(_),
  )
}

///|
test "image:1-range-60" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 10.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": -5,\n    \"frame_step\": 2,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  assert_true(
    s.frame_range(
      @range.TimeRange::new(
        @time.RationalTime::new(60.0, 24.0).unwrap(),
        @time.RationalTime::new(1.0, 24.0).unwrap(),
      ).unwrap(),
    )
    is Err(_),
  )
}

///|
test "image:2-info" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 11.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 1001,\n    \"frame_step\": 3,\n    \"rate\": 30.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  assert_eq(s.abstract_target_url("#"), "file:///images/shot.#.exr")
  assert_eq(s.number_of_images(), 4)
  api_number(s.end_frame().unwrap(), 1013.0)
}

///|
test "image:2-target_url_for_image_number--1" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 11.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 1001,\n    \"frame_step\": 3,\n    \"rate\": 30.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  assert_eq(s.target_url(-1).unwrap(), "file:///images/shot.0998.exr")
}

///|
test "image:2-presentation_time_for_image_number--1" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 11.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 1001,\n    \"frame_step\": 3,\n    \"rate\": 30.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  let actual_time = s.presentation_time(-1).unwrap()
  api_number(actual_time.value(), 57.0)
  api_number(actual_time.rate(), 30.0)
}

///|
test "image:2-target_url_for_image_number-0" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 11.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 1001,\n    \"frame_step\": 3,\n    \"rate\": 30.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  assert_eq(s.target_url(0).unwrap(), "file:///images/shot.1001.exr")
}

///|
test "image:2-presentation_time_for_image_number-0" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 11.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 1001,\n    \"frame_step\": 3,\n    \"rate\": 30.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  let actual_time = s.presentation_time(0).unwrap()
  api_number(actual_time.value(), 60.0)
  api_number(actual_time.rate(), 30.0)
}

///|
test "image:2-target_url_for_image_number-1" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 11.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 1001,\n    \"frame_step\": 3,\n    \"rate\": 30.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  assert_eq(s.target_url(1).unwrap(), "file:///images/shot.1004.exr")
}

///|
test "image:2-presentation_time_for_image_number-1" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 11.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 1001,\n    \"frame_step\": 3,\n    \"rate\": 30.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  let actual_time = s.presentation_time(1).unwrap()
  api_number(actual_time.value(), 63.0)
  api_number(actual_time.rate(), 30.0)
}

///|
test "image:2-target_url_for_image_number-3" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 11.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 1001,\n    \"frame_step\": 3,\n    \"rate\": 30.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  assert_eq(s.target_url(3).unwrap(), "file:///images/shot.1010.exr")
}

///|
test "image:2-presentation_time_for_image_number-3" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 11.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 1001,\n    \"frame_step\": 3,\n    \"rate\": 30.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  let actual_time = s.presentation_time(3).unwrap()
  api_number(actual_time.value(), 69.0)
  api_number(actual_time.rate(), 30.0)
}

///|
test "image:2-target_url_for_image_number-4" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 11.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 1001,\n    \"frame_step\": 3,\n    \"rate\": 30.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  assert_true(s.target_url(4) is Err(_))
}

///|
test "image:2-presentation_time_for_image_number-4" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 11.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 1001,\n    \"frame_step\": 3,\n    \"rate\": 30.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  assert_true(s.presentation_time(4) is Err(_))
}

///|
test "image:2-target_url_for_image_number-100" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 11.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 1001,\n    \"frame_step\": 3,\n    \"rate\": 30.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  assert_true(s.target_url(100) is Err(_))
}

///|
test "image:2-presentation_time_for_image_number-100" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 11.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 1001,\n    \"frame_step\": 3,\n    \"rate\": 30.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  assert_true(s.presentation_time(100) is Err(_))
}

///|
test "image:2-frame-47" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 11.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 1001,\n    \"frame_step\": 3,\n    \"rate\": 30.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  assert_true(
    s.frame_for_time(@time.RationalTime::new(47.0, 24.0).unwrap()) is Err(_),
  )
}

///|
test "image:2-range-47" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 11.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 1001,\n    \"frame_step\": 3,\n    \"rate\": 30.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  assert_true(
    s.frame_range(
      @range.TimeRange::new(
        @time.RationalTime::new(47.0, 24.0).unwrap(),
        @time.RationalTime::new(1.0, 24.0).unwrap(),
      ).unwrap(),
    )
    is Err(_),
  )
}

///|
test "image:2-frame-48" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 11.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 1001,\n    \"frame_step\": 3,\n    \"rate\": 30.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  api_number(
    s.frame_for_time(@time.RationalTime::new(48.0, 24.0).unwrap()).unwrap(),
    1001.0,
  )
}

///|
test "image:2-range-48" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 11.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 1001,\n    \"frame_step\": 3,\n    \"rate\": 30.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  let (a, b) = s
    .frame_range(
      @range.TimeRange::new(
        @time.RationalTime::new(48.0, 24.0).unwrap(),
        @time.RationalTime::new(1.0, 24.0).unwrap(),
      ).unwrap(),
    )
    .unwrap()
  api_number(a, 1001.0)
  api_number(b, 1001.0)
}

///|
test "image:2-frame-48.5" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 11.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 1001,\n    \"frame_step\": 3,\n    \"rate\": 30.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  api_number(
    s.frame_for_time(@time.RationalTime::new(48.5, 24.0).unwrap()).unwrap(),
    1001.0,
  )
}

///|
test "image:2-range-48.5" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 11.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 1001,\n    \"frame_step\": 3,\n    \"rate\": 30.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  let (a, b) = s
    .frame_range(
      @range.TimeRange::new(
        @time.RationalTime::new(48.5, 24.0).unwrap(),
        @time.RationalTime::new(1.0, 24.0).unwrap(),
      ).unwrap(),
    )
    .unwrap()
  api_number(a, 1001.0)
  api_number(b, 1001.0)
}

///|
test "image:2-frame-49" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 11.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 1001,\n    \"frame_step\": 3,\n    \"rate\": 30.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  api_number(
    s.frame_for_time(@time.RationalTime::new(49.0, 24.0).unwrap()).unwrap(),
    1002.0,
  )
}

///|
test "image:2-range-49" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 11.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 1001,\n    \"frame_step\": 3,\n    \"rate\": 30.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  let (a, b) = s
    .frame_range(
      @range.TimeRange::new(
        @time.RationalTime::new(49.0, 24.0).unwrap(),
        @time.RationalTime::new(1.0, 24.0).unwrap(),
      ).unwrap(),
    )
    .unwrap()
  api_number(a, 1002.0)
  api_number(b, 1002.0)
}

///|
test "image:2-frame-50" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 11.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 1001,\n    \"frame_step\": 3,\n    \"rate\": 30.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  api_number(
    s.frame_for_time(@time.RationalTime::new(50.0, 24.0).unwrap()).unwrap(),
    1003.0,
  )
}

///|
test "image:2-range-50" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 11.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 1001,\n    \"frame_step\": 3,\n    \"rate\": 30.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  let (a, b) = s
    .frame_range(
      @range.TimeRange::new(
        @time.RationalTime::new(50.0, 24.0).unwrap(),
        @time.RationalTime::new(1.0, 24.0).unwrap(),
      ).unwrap(),
    )
    .unwrap()
  api_number(a, 1003.0)
  api_number(b, 1003.0)
}

///|
test "image:2-frame-57" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 11.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 1001,\n    \"frame_step\": 3,\n    \"rate\": 30.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  api_number(
    s.frame_for_time(@time.RationalTime::new(57.0, 24.0).unwrap()).unwrap(),
    1012.0,
  )
}

///|
test "image:2-range-57" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 11.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 1001,\n    \"frame_step\": 3,\n    \"rate\": 30.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  let (a, b) = s
    .frame_range(
      @range.TimeRange::new(
        @time.RationalTime::new(57.0, 24.0).unwrap(),
        @time.RationalTime::new(1.0, 24.0).unwrap(),
      ).unwrap(),
    )
    .unwrap()
  api_number(a, 1012.0)
  api_number(b, 1012.0)
}

///|
test "image:2-frame-58" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 11.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 1001,\n    \"frame_step\": 3,\n    \"rate\": 30.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  api_number(
    s.frame_for_time(@time.RationalTime::new(58.0, 24.0).unwrap()).unwrap(),
    1013.0,
  )
}

///|
test "image:2-range-58" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 11.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 1001,\n    \"frame_step\": 3,\n    \"rate\": 30.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  let (a, b) = s
    .frame_range(
      @range.TimeRange::new(
        @time.RationalTime::new(58.0, 24.0).unwrap(),
        @time.RationalTime::new(1.0, 24.0).unwrap(),
      ).unwrap(),
    )
    .unwrap()
  api_number(a, 1013.0)
  api_number(b, 1013.0)
}

///|
test "image:2-frame-60" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 11.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 1001,\n    \"frame_step\": 3,\n    \"rate\": 30.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  assert_true(
    s.frame_for_time(@time.RationalTime::new(60.0, 24.0).unwrap()) is Err(_),
  )
}

///|
test "image:2-range-60" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 11.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 1001,\n    \"frame_step\": 3,\n    \"rate\": 30.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  assert_true(
    s.frame_range(
      @range.TimeRange::new(
        @time.RationalTime::new(60.0, 24.0).unwrap(),
        @time.RationalTime::new(1.0, 24.0).unwrap(),
      ).unwrap(),
    )
    is Err(_),
  )
}

///|
test "image:3-info" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 0.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 0,\n    \"frame_step\": 1,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  assert_eq(s.abstract_target_url("#"), "file:///images/shot.#.exr")
  assert_eq(s.number_of_images(), 0)
  api_number(s.end_frame().unwrap(), -1.0)
}

///|
test "image:3-target_url_for_image_number--1" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 0.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 0,\n    \"frame_step\": 1,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  assert_true(s.target_url(-1) is Err(_))
}

///|
test "image:3-presentation_time_for_image_number--1" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 0.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 0,\n    \"frame_step\": 1,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  let actual_time = s.presentation_time(-1).unwrap()
  api_number(actual_time.value(), 47.0)
  api_number(actual_time.rate(), 24.0)
}

///|
test "image:3-target_url_for_image_number-0" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 0.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 0,\n    \"frame_step\": 1,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  assert_true(s.target_url(0) is Err(_))
}

///|
test "image:3-presentation_time_for_image_number-0" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 0.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 0,\n    \"frame_step\": 1,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  assert_true(s.presentation_time(0) is Err(_))
}

///|
test "image:3-target_url_for_image_number-1" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 0.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 0,\n    \"frame_step\": 1,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  assert_true(s.target_url(1) is Err(_))
}

///|
test "image:3-presentation_time_for_image_number-1" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 0.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 0,\n    \"frame_step\": 1,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  assert_true(s.presentation_time(1) is Err(_))
}

///|
test "image:3-target_url_for_image_number-100" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 0.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 0,\n    \"frame_step\": 1,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  assert_true(s.target_url(100) is Err(_))
}

///|
test "image:3-presentation_time_for_image_number-100" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 0.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 0,\n    \"frame_step\": 1,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  assert_true(s.presentation_time(100) is Err(_))
}

///|
test "image:3-frame-47" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 0.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 0,\n    \"frame_step\": 1,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  assert_true(
    s.frame_for_time(@time.RationalTime::new(47.0, 24.0).unwrap()) is Err(_),
  )
}

///|
test "image:3-range-47" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 0.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 0,\n    \"frame_step\": 1,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  assert_true(
    s.frame_range(
      @range.TimeRange::new(
        @time.RationalTime::new(47.0, 24.0).unwrap(),
        @time.RationalTime::new(1.0, 24.0).unwrap(),
      ).unwrap(),
    )
    is Err(_),
  )
}

///|
test "image:3-frame-48" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 0.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 0,\n    \"frame_step\": 1,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  assert_true(
    s.frame_for_time(@time.RationalTime::new(48.0, 24.0).unwrap()) is Err(_),
  )
}

///|
test "image:3-range-48" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 0.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 0,\n    \"frame_step\": 1,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  assert_true(
    s.frame_range(
      @range.TimeRange::new(
        @time.RationalTime::new(48.0, 24.0).unwrap(),
        @time.RationalTime::new(1.0, 24.0).unwrap(),
      ).unwrap(),
    )
    is Err(_),
  )
}

///|
test "image:3-frame-48.5" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 0.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 0,\n    \"frame_step\": 1,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  assert_true(
    s.frame_for_time(@time.RationalTime::new(48.5, 24.0).unwrap()) is Err(_),
  )
}

///|
test "image:3-range-48.5" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 0.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 0,\n    \"frame_step\": 1,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  assert_true(
    s.frame_range(
      @range.TimeRange::new(
        @time.RationalTime::new(48.5, 24.0).unwrap(),
        @time.RationalTime::new(1.0, 24.0).unwrap(),
      ).unwrap(),
    )
    is Err(_),
  )
}

///|
test "image:3-frame-49" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 0.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 0,\n    \"frame_step\": 1,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  assert_true(
    s.frame_for_time(@time.RationalTime::new(49.0, 24.0).unwrap()) is Err(_),
  )
}

///|
test "image:3-range-49" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 0.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 0,\n    \"frame_step\": 1,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  assert_true(
    s.frame_range(
      @range.TimeRange::new(
        @time.RationalTime::new(49.0, 24.0).unwrap(),
        @time.RationalTime::new(1.0, 24.0).unwrap(),
      ).unwrap(),
    )
    is Err(_),
  )
}

///|
test "image:3-frame-50" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 0.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 0,\n    \"frame_step\": 1,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  assert_true(
    s.frame_for_time(@time.RationalTime::new(50.0, 24.0).unwrap()) is Err(_),
  )
}

///|
test "image:3-range-50" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 0.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 0,\n    \"frame_step\": 1,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  assert_true(
    s.frame_range(
      @range.TimeRange::new(
        @time.RationalTime::new(50.0, 24.0).unwrap(),
        @time.RationalTime::new(1.0, 24.0).unwrap(),
      ).unwrap(),
    )
    is Err(_),
  )
}

///|
test "image:3-frame-57" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 0.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 0,\n    \"frame_step\": 1,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  assert_true(
    s.frame_for_time(@time.RationalTime::new(57.0, 24.0).unwrap()) is Err(_),
  )
}

///|
test "image:3-range-57" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 0.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 0,\n    \"frame_step\": 1,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  assert_true(
    s.frame_range(
      @range.TimeRange::new(
        @time.RationalTime::new(57.0, 24.0).unwrap(),
        @time.RationalTime::new(1.0, 24.0).unwrap(),
      ).unwrap(),
    )
    is Err(_),
  )
}

///|
test "image:3-frame-58" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 0.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 0,\n    \"frame_step\": 1,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  assert_true(
    s.frame_for_time(@time.RationalTime::new(58.0, 24.0).unwrap()) is Err(_),
  )
}

///|
test "image:3-range-58" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 0.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 0,\n    \"frame_step\": 1,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  assert_true(
    s.frame_range(
      @range.TimeRange::new(
        @time.RationalTime::new(58.0, 24.0).unwrap(),
        @time.RationalTime::new(1.0, 24.0).unwrap(),
      ).unwrap(),
    )
    is Err(_),
  )
}

///|
test "image:3-frame-60" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 0.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 0,\n    \"frame_step\": 1,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  assert_true(
    s.frame_for_time(@time.RationalTime::new(60.0, 24.0).unwrap()) is Err(_),
  )
}

///|
test "image:3-range-60" {
  let s = @schema.ImageSequence::from_object(
    @schema.read(
      "{\n    \"OTIO_SCHEMA\": \"ImageSequenceReference.1\",\n    \"metadata\": {},\n    \"name\": \"\",\n    \"available_range\": {\n        \"OTIO_SCHEMA\": \"TimeRange.1\",\n        \"duration\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 0.0\n        },\n        \"start_time\": {\n            \"OTIO_SCHEMA\": \"RationalTime.1\",\n            \"rate\": 24.0,\n            \"value\": 48.0\n        }\n    },\n    \"available_image_bounds\": null,\n    \"target_url_base\": \"file:///images\",\n    \"name_prefix\": \"shot.\",\n    \"name_suffix\": \".exr\",\n    \"start_frame\": 0,\n    \"frame_step\": 1,\n    \"rate\": 24.0,\n    \"frame_zero_padding\": 4,\n    \"missing_frame_policy\": \"error\"\n}",
    ).unwrap(),
  ).unwrap()
  assert_true(
    s.frame_range(
      @range.TimeRange::new(
        @time.RationalTime::new(60.0, 24.0).unwrap(),
        @time.RationalTime::new(1.0, 24.0).unwrap(),
      ).unwrap(),
    )
    is Err(_),
  )
}
