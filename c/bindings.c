#include <stdio.h>
#include "bindings.h"

int add(int a, int b) {
  printf("add: %d, %d\n", a, b);
  return a + b;
}
