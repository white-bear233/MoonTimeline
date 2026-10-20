/* Minimal synchronous file adapter. All timeline logic lives in MoonBit. */
#include <stdio.h>
#include "moonbit.h"
MOONBIT_FFI_EXPORT moonbit_bytes_t mt_read(moonbit_bytes_t path) {
  FILE *f = fopen((const char*)path, "rb");
  if (!f) return moonbit_make_bytes(1, 1);
  if (fseek(f, 0, SEEK_END) != 0) { fclose(f); return moonbit_make_bytes(1, 1); }
  long size = ftell(f);
  if (size < 0 || size > 16000000 || fseek(f, 0, SEEK_SET) != 0) { fclose(f); return moonbit_make_bytes(1, 1); }
  moonbit_bytes_t out = moonbit_make_bytes((int32_t)size + 1, 0);
  if (fread(out + 1, 1, (size_t)size, f) != (size_t)size || ferror(f)) out[0] = 1;
  if (fclose(f) != 0) out[0] = 1;
  return out;
}
MOONBIT_FFI_EXPORT int32_t mt_write(moonbit_bytes_t path, moonbit_bytes_t content) {
  FILE *f = fopen((const char*)path, "wbx");
  if (!f) return 1;
  size_t size = Moonbit_array_length(content);
  int bad = fwrite(content, 1, size, f) != size;
  if (fclose(f) != 0) bad = 1;
  if (bad) remove((const char*)path);
  return bad;
}
