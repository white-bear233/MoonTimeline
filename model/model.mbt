///|
/// Common OTIO fields. Metadata is retained as arbitrary JSON.
/// `extra` keeps fields outside the computed subset so a read-write round trip
/// does not drop upstream data (markers, effects, vendor extensions).
pub(all) struct Attributes {
  name : String
  metadata : Json
  enabled : Bool
  color : Json
  extra : Json
}

///|
pub fn Attributes::new(name : String) -> Attributes {
  {
    name,
    metadata: Json::empty_object(),
    enabled: true,
    color: Json::null(),
    extra: Json::empty_object(),
  }
}

///|
/// Known media reference kinds. Anything else is kept opaque.
pub(all) enum MediaKind {
  External(String)
  Missing
  Opaque(Json)
}

///|
pub(all) struct MediaReference {
  name : String
  metadata : Json
  kind : MediaKind
  available_range : @range.TimeRange?
  available_image_bounds : Json
  extra : Json
}

///|
pub(all) struct Clip {
  attributes : Attributes
  source_range : @range.TimeRange?
  media_references : Map[String, MediaReference]
  active_media_reference_key : String
}

///|
/// Resolve the chosen media without consulting the file system or network.
pub fn Clip::active_media(self : Clip) -> Result[MediaReference, String] {
  match self.media_references.get(self.active_media_reference_key) {
    Some(reference) => Ok(reference)
    None => Err("missing_active_media_reference")
  }
}

///|
/// An omitted source range can use an available media range. Unknown is explicit.
pub fn Clip::effective_range(self : Clip) -> Result[@range.TimeRange, String] {
  match self.source_range {
    Some(range) => Ok(range)
    None =>
      match self.active_media() {
        Err(e) => Err(e)
        Ok(media) =>
          match media.available_range {
            Some(range) => Ok(range)
            None => Err("unknown_source_range")
          }
      }
  }
}

///|
pub(all) struct Gap {
  attributes : Attributes
  source_range : @range.TimeRange
}

///|
pub(all) enum Item {
  Clip(Clip)
  Gap(Gap)
  /// Preserved verbatim (for example Transition.1) but not part of the computed subset.
  Opaque(Json)
}

///|
pub(all) enum TrackKind {
  Video
  Audio
}

///|
/// Children are sequential. Their placement is computed by the later layout module.
/// `source_range` trims the composition; a non-empty value is preserved but not computed.
pub(all) struct Track {
  attributes : Attributes
  kind : TrackKind
  source_range : @range.TimeRange?
  children : Array[Item]
}

///|
/// Root tracks are simultaneous. `source_range` trims the stack.
pub(all) struct Stack {
  attributes : Attributes
  source_range : @range.TimeRange?
  children : Array[Track]
}

///|
pub(all) struct Timeline {
  name : String
  metadata : Json
  global_start_time : @time.RationalTime?
  tracks : Stack
  extra : Json
}
