#ifndef BINDINGS_CPP_H
#define BINDINGS_CPP_H

#ifdef __cplusplus
extern "C" {
#endif // __cplusplus

  #include <stdint.h>

  const char *my_library_last_error(void);
  int verify_ipc_message(const void *data, int64_t size_bytes);

  int ffi();

#ifdef __cplusplus
}
#endif // __cplusplus

#endif // BINDINGS_CPP_H
