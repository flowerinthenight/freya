#include "bindings.h"
#include "nanoarrow/nanoarrow_ipc.h"
#include <errno.h>
#include <stdio.h>

static struct ArrowError global_error;

const char *my_library_last_error(void) {
  return ArrowErrorMessage(&global_error);
}

int verify_ipc_message(const void *data, int64_t size_bytes) {
  struct ArrowBufferView buffer_view;
  buffer_view.data.data = data;
  buffer_view.size_bytes = size_bytes;

  struct ArrowIpcDecoder decoder;
  ArrowIpcDecoderInit(&decoder);
  int result =
      ArrowIpcDecoderVerifyHeader(&decoder, buffer_view, &global_error);
  ArrowIpcDecoderReset(&decoder);

  return result;
}

int ffi() {
  printf("ffi\n");
  int64_t in_size = 0;
  uint8_t data[8096];

  freopen(NULL, "rb", stdin);
  in_size = fread(data, 1, 8096, stdin);

  if (in_size == 8096) {
    fprintf(stderr, "This example can't read messages more than 8096 bytes\n");
    return -1;
  }

  int result = verify_ipc_message(data, in_size);
  if (result != 0) {
    fprintf(stderr, "%s\n", my_library_last_error());
  }

  return result;
}
