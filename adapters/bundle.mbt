///|
pub(all) enum MediaPolicy {
  ErrorIfNotFile
  MissingIfNotFile
  AllMissing
}

///|
/// IO-free bundle. The host supplies file bytes; all paths are validated before
/// the host writes anything. No archive entry is implicitly extracted to disk.
pub struct Bundle {
  priv document : Json
  priv files : Map[String, Bytes]
}

///|
pub fn safe_relative_path(path : String) -> Bool {
  if path == "" ||
    path.has_prefix("/") ||
    path.contains("\\") ||
    path.contains(":") ||
    path.contains("\u0000") {
    return false
  }
  for segment in path.split("/") {
    if segment == "" ||
      segment == "." ||
      segment == ".." ||
      segment.has_suffix(".") ||
      segment.has_suffix(" ") {
      return false
    }
    let name = segment.to_owned().to_upper().split(".").to_array()[0]
    if [
        "CON", "PRN", "AUX", "NUL", "COM1", "COM2", "COM3", "COM4", "COM5", "COM6",
        "COM7", "COM8", "COM9", "LPT1", "LPT2", "LPT3", "LPT4", "LPT5", "LPT6", "LPT7",
        "LPT8", "LPT9",
      ].contains(name.to_owned()) {
      return false
    }
  }
  true
}

///|
fn hex(c : Char) -> Int32 {
  if c >= '0' && c <= '9' {
    c.to_int() - 48
  } else if c >= 'a' && c <= 'f' {
    c.to_int() - 87
  } else if c >= 'A' && c <= 'F' {
    c.to_int() - 55
  } else {
    -1
  }
}

///|
pub fn decode_url_path(path : String) -> Result[String, String] {
  let chars = path.to_array()
  let out = @buffer.Buffer()
  let mut i = 0
  while i < chars.length() {
    if chars[i] == '%' {
      if i + 2 >= chars.length() ||
        hex(chars[i + 1]) < 0 ||
        hex(chars[i + 2]) < 0 {
        return Err("invalid_url_escape")
      }
      out.write_byte((hex(chars[i + 1]) * 16 + hex(chars[i + 2])).to_byte())
      i += 3
    } else {
      out.write_char_utf8(chars[i])
      i += 1
    }
  }
  let decoded = @utf8.decode(out.to_bytes()) catch {
    _ => return Err("invalid_url_utf8")
  }
  if decoded.contains("\u0000") {
    Err("invalid_url_path")
  } else {
    Ok(decoded)
  }
}

///|
pub fn encode_url_path(path : String) -> String {
  let out = StringBuilder()
  let hex = "0123456789ABCDEF".to_array()
  for b in @utf8.encode(path) {
    let n = b.to_int()
    if (n >= 48 && n <= 57) ||
      (n >= 65 && n <= 90) ||
      (n >= 97 && n <= 122) ||
      [45, 46, 95, 126, 47].contains(n) {
      out.write_char(n.unsafe_to_char())
    } else {
      out.write_char('%')
      out.write_char(hex[n / 16])
      out.write_char(hex[n % 16])
    }
  }
  out.to_string()
}

///|
pub fn Bundle::document(self : Bundle) -> Json {
  @otiojson.clone(self.document).unwrap()
}

///|
pub fn Bundle::entries(self : Bundle) -> Map[String, Bytes] {
  let copy : Map[String, Bytes] = Map([])
  for name, bytes in self.files {
    copy[name] = bytes
  }
  copy
}

///|
pub fn read_otiod(
  entries : Map[String, Bytes],
  max_total_bytes~ : Int32 = 268435456,
) -> Result[Bundle, String] {
  if entries.length() > 10000 || max_total_bytes < 0 {
    return Err("bundle_limit")
  }
  let names : Map[String, Bool] = Map([])
  let files : Map[String, Bytes] = Map([])
  let mut remaining = max_total_bytes
  for name, bytes in entries {
    if !safe_relative_path(name) || names.contains(name.to_lower()) {
      return Err("unsafe_or_duplicate_bundle_path")
    }
    names[name.to_lower()] = true
    if bytes.length() > remaining {
      return Err("bundle_limit")
    }
    remaining -= bytes.length()
    files[name] = bytes
  }
  match files.get("version.txt") {
    Some(bytes) => {
      let version = @utf8.decode(bytes) catch {
        _ => return Err("invalid_bundle_version")
      }
      if version != "1.0.0" {
        return Err("unsupported_bundle_version")
      }
    }
    None => () // OTIOD does not require a version file.
  }
  let content = match files.get("content.otio") {
    Some(b) => b
    None => return Err("missing_content_otio")
  }
  if content.length() > 16000000 {
    return Err("document_limit")
  }
  let text = @utf8.decode(content) catch {
    _ => return Err("invalid_content_utf8")
  }
  let document = match @otiojson.parse(text) {
    Ok(j) => j
    Err(e) => return Err(e)
  }
  Ok({ document, files, })
}

///|
pub fn read_otioz(
  bytes : Bytes,
  max_total_bytes~ : Int32 = 268435456,
) -> Result[Bundle, String] {
  if max_total_bytes < 0 {
    return Err("bundle_limit")
  }
  let archive = @zip.read(
    bytes,
    limits=@zip.ReadLimits(
      max_package_bytes=max_total_bytes,
      max_entries=10000,
      max_entry_uncompressed_bytes=max_total_bytes,
      max_total_uncompressed_bytes=max_total_bytes,
      max_preserved_source_bytes=max_total_bytes,
    ),
  ) catch {
    _ => return Err("invalid_or_oversized_zip")
  }
  let entries : Map[String, Bytes] = Map([])
  for entry in archive.entries() {
    let name = entry.name()
    if name.has_suffix("/") && entry.data().length() == 0 {
      continue
    }
    if entries.contains(name) {
      return Err("duplicate_zip_entry")
    }
    entries[name] = entry.data().to_owned()
  }
  read_otiod(entries, max_total_bytes~)
}

///|
pub fn Bundle::to_otioz(
  self : Bundle,
  max_bytes~ : Int32 = 268435456,
) -> Result[Bytes, String] {
  let archive = @zip.Archive()
  for name, bytes in self.files {
    archive.add(name, bytes, compression=@zip.Deflate)
  }
  if !self.files.contains("version.txt") {
    archive.add("version.txt", @utf8.encode("1.0.0"), compression=@zip.Deflate)
  }
  let result = @zip.write(archive, max_output_bytes=max_bytes) catch {
    _ => return Err("zip_write_error")
  }
  Ok(result)
}

///|
/// `media` keys are original target URLs, values are bytes read by the host.
/// Equal URLs share one file; distinct URLs with equal basenames are rejected.
pub fn bundle(
  document : Json,
  media : Map[String, Bytes],
  policy~ : MediaPolicy = ErrorIfNotFile,
) -> Result[Bundle, String] {
  let copy = match @otiojson.clone(document) {
    Ok(j) => j
    Err(e) => return Err(e)
  }
  let files : Map[String, Bytes] = Map([])
  let sources : Map[String, String] = Map([])
  fn walk(j : Json) -> Result[Unit, String] {
    match j {
      Object(o) => {
        if @schema.tag(j) == "ExternalReference.1" {
          let url = match o.get("target_url") {
            Some(String(s)) => s
            _ => return Err("missing_media_url")
          }
          let bytes = match policy {
            AllMissing => None
            _ => media.get(url)
          }
          match bytes {
            Some(data) => {
              let decoded = match decode_url_path(url) {
                Ok(v) => v
                Err(e) => return Err(e)
              }
              let normalized = decoded.split("\\").join("/")
              let parts = normalized.split("/").to_array()
              let basename = parts[parts.length() - 1].to_owned()
              if !safe_relative_path(basename) {
                return Err("unsafe_media_basename")
              }
              let target = "media/" + basename
              match sources.get(target.to_lower()) {
                Some(previous) =>
                  if previous != url {
                    return Err("duplicate_media_basename")
                  }
                None => ()
              }
              sources[target.to_lower()] = url
              files[target] = data
              o["target_url"] = Json::string(encode_url_path(target))
            }
            None => {
              if policy is ErrorIfNotFile {
                return Err("media_not_supplied:" + url)
              }
              o["OTIO_SCHEMA"] = Json::string("MissingReference.1")
              let metadata = match o.get("metadata") {
                Some(Object(m)) => m
                _ => Map([])
              }
              metadata["original_target_url"] = Json::string(url)
              metadata["missing_reference_because"] = Json::string(
                "Media was not supplied by the host or AllMissing was selected",
              )
              o["metadata"] = Json::object(metadata)
              o.remove("target_url")
            }
          }
        }
        for _, value in o {
          match walk(value) {
            Err(e) => return Err(e)
            _ => ()
          }
        }
      }
      Array(a) =>
        for value in a {
          match walk(value) {
            Err(e) => return Err(e)
            _ => ()
          }
        }
      _ => ()
    }
    Ok(())
  }
  match walk(copy) {
    Err(e) => return Err(e)
    _ => ()
  }
  let content = match @otiojson.stringify(copy) {
    Ok(s) => s
    Err(e) => return Err(e)
  }
  files["content.otio"] = @utf8.encode(content)
  files["version.txt"] = @utf8.encode("1.0.0")
  read_otiod(files)
}
