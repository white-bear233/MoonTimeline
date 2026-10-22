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
pub fn parse(args : Array[String]) -> String {
  match @app.parse_args(args) {
    Ok(c) => @app.config_json(c)
    Err(e) => Json::object({ "error": Json::string(e) }).stringify()
  }
}
