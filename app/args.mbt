///|
pub(all) struct Config {
  action : String
  input : String
  output : String?
  track : Int32
  item : Int32
  at : Double
  duration : Double
  rate : Double
  path : String
}

///|
pub fn parse_args(args : Array[String]) -> Result[Config, String] {
  if args.length() < 2 {
    return Err(
      "Usage: moontimeline inspect|validate|export|split|trim|gap INPUT [--output FILE] [--track N --clip N --at-frame N --duration-frames N --rate FPS] [--format json]",
    )
  }
  let action = args[0]
  if !["inspect", "validate", "export", "split", "trim", "gap"].contains(action) {
    return Err("Unknown command")
  }
  let opts : Map[String, String] = Map([])
  let mut i = 2
  while i < args.length() {
    let key = args[i]
    if ![
        "--output", "--track", "--clip", "--at-frame", "--duration-frames", "--rate",
        "--format", "--path",
      ].contains(key) ||
      i + 1 >= args.length() ||
      opts.contains(key) {
      return Err("Unknown, duplicate or incomplete option: " + key)
    }
    opts[key] = args[i + 1]
    i = i + 2
  }
  if opts.get("--format").unwrap_or("json") != "json" {
    return Err("Only --format json is supported")
  }
  if action != "inspect" && action != "validate" && opts.get("--output") is None {
    return Err("--output is required")
  }
  if (action == "inspect" || action == "validate") &&
    opts.get("--output") is Some(_) {
    return Err("Read-only commands do not accept --output")
  }
  if ["split", "trim", "gap"].contains(action) {
    if opts.get("--path") is None {
      for key in ["--track", "--clip"] {
        if opts.get(key) is None {
          return Err("Required: " + key + " (or --path)")
        }
      }
    }
    if opts.get("--rate") is None {
      return Err("Required: --rate")
    }
    if action != "gap" && opts.get("--at-frame") is None {
      return Err("Required: --at-frame")
    }
    if action != "split" && opts.get("--duration-frames") is None {
      return Err("Required: --duration-frames")
    }
  }
  let track = @string.parse_int(opts.get("--track").unwrap_or("0")) catch {
    _ => return Err("Invalid track index")
  }
  let item = @string.parse_int(opts.get("--clip").unwrap_or("0")) catch {
    _ => return Err("Invalid item index")
  }
  let at = @string.parse_double(opts.get("--at-frame").unwrap_or("0")) catch {
    _ => return Err("Invalid frame")
  }
  let duration = @string.parse_double(
    opts.get("--duration-frames").unwrap_or("0"),
  ) catch {
    _ => return Err("Invalid duration")
  }
  let rate = @string.parse_double(opts.get("--rate").unwrap_or("24")) catch {
    _ => return Err("Invalid rate")
  }
  if track < 0 ||
    item < 0 ||
    at.is_nan() ||
    at.is_inf() ||
    duration.is_nan() ||
    duration.is_inf() ||
    rate.is_nan() ||
    rate.is_inf() ||
    rate <= 0.0 {
    return Err("Invalid numeric argument")
  }
  Ok({
    action,
    input: args[1],
    output: opts.get("--output"),
    track,
    item,
    at,
    duration,
    rate,
    path: opts.get("--path").unwrap_or(""),
  })
}

///|
pub fn config_json(c : Config) -> String {
  Json::object({
    "action": Json::string(c.action),
    "input": Json::string(c.input),
    "output": match c.output {
      None => Json::null()
      Some(s) => Json::string(s)
    },
    "track": Json::number(c.track.to_double()),
    "item": Json::number(c.item.to_double()),
    "at": Json::number(c.at),
    "duration": Json::number(c.duration),
    "rate": Json::number(c.rate),
    "path": Json::string(c.path),
  }).stringify()
}
