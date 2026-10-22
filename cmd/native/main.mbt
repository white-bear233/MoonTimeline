///|
#borrow(path)
extern "C" fn read_bytes(path : Bytes) -> Bytes = "mt_read"

///|
#borrow(path, content)
extern "C" fn write_bytes(path : Bytes, content : Bytes) -> Int32 = "mt_write"

///|
extern "C" fn exit_process(code : Int32) -> Unit = "exit"

///|
fn main {
  let args = @env.args()
  let args = args[1:].to_owned()
  if args.length() == 1 && args[0] == "--help" {
    println(
      "moontimeline inspect|validate|export|split|trim|gap INPUT [--output FILE] [--track N --clip N --at-frame N --duration-frames N --rate FPS] [--format json]",
    )
    return
  }
  let c = match @app.parse_args(args) {
    Ok(c) => c
    Err(e) => {
      println(e)
      exit_process(2)
      return
    }
  }
  let data = read_bytes(@utf8.encode(c.input + "\u0000"))
  if data.length() == 0 || data[0] != b'\x00' {
    println("Unable to read input (missing, unreadable or over 16 MB)")
    exit_process(2)
    return
  }
  let source = @utf8.decode(data[1:]) catch {
    _ => {
      println("Input is not UTF-8")
      exit_process(2)
      return
    }
  }
  let r = @app.run(
    source,
    c.action,
    c.track,
    c.item,
    c.at,
    c.duration,
    c.rate,
    c.path,
  )
  match r.output {
    Some(s) =>
      match c.output {
        Some(path) =>
          if write_bytes(@utf8.encode(path + "\u0000"), @utf8.encode(s + "\n")) !=
            0 {
            println(
              "Cannot create output; existing files are never overwritten",
            )
            exit_process(2)
            return
          }
        None => {
          exit_process(2)
          return
        }
      }
    None => ()
  }
  println(r.body)
  exit_process(r.code)
}
