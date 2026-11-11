///|
pub fn run(
  source : String,
  action : String,
  track : Int32,
  item : Int32,
  at : Double,
  duration : Double,
  rate : Double,
  path : String,
) -> String {
  @app.response_json(
    @app.run(source, action, track, item, at, duration, rate, path),
  )
}

///|
// JavaScript callers pass native arrays; dynamic MoonBit Array has a different ABI.
pub fn parse(args : FixedArray[String]) -> String {
  match @app.parse_args(Array::from_fixed_array(args)) {
    Ok(c) => @app.config_json(c)
    Err(e) => Json::object({ "error": Json::string(e) }).stringify()
  }
}
