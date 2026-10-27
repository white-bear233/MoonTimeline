///|
pub fn Color::named(name : String) -> Result[Color, String] {
  match name.to_upper() {
    "BLACK" => Ok({ r: 0.0, g: 0.0, b: 0.0, a: 1.0, name: "Black", })
    "BLUE" => Ok({ r: 0.0, g: 0.0, b: 1.0, a: 1.0, name: "Blue", })
    "CYAN" => Ok({ r: 0.0, g: 1.0, b: 1.0, a: 1.0, name: "Cyan", })
    "GREEN" => Ok({ r: 0.0, g: 1.0, b: 0.0, a: 1.0, name: "Green", })
    "MAGENTA" => Ok({ r: 1.0, g: 0.0, b: 1.0, a: 1.0, name: "Magenta", })
    "ORANGE" => Ok({ r: 1.0, g: 0.5, b: 0.0, a: 1.0, name: "Orange", })
    "PINK" => Ok({ r: 1.0, g: 0.0, b: 1.0, a: 1.0, name: "Pink", })
    "PURPLE" => Ok({ r: 0.5, g: 0.0, b: 0.5, a: 1.0, name: "Purple", })
    "RED" => Ok({ r: 1.0, g: 0.0, b: 0.0, a: 1.0, name: "Red", })
    "TRANSPARENT" =>
      Ok({ r: 0.0, g: 0.0, b: 0.0, a: 0.0, name: "Transparent", })
    "WHITE" => Ok({ r: 1.0, g: 1.0, b: 1.0, a: 1.0, name: "White", })
    "YELLOW" => Ok({ r: 1.0, g: 1.0, b: 0.0, a: 1.0, name: "Yellow", })
    _ => Err("unknown_color")
  }
}
