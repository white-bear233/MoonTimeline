///|
pub fn timeline_from_clips(clips : Array[Object]) -> Result[Object, String] {
  let track = match Object::new("Track").unwrap().with_children(clips) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  let stack = match Object::new("Stack").unwrap().with_children([track]) {
    Ok(v) => v
    Err(e) => return Err(e)
  }
  Object::new("Timeline")
  .unwrap()
  .with_field("tracks", stack.with_name("tracks").unwrap().to_json().unwrap())
}
