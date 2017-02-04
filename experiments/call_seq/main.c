#include <tesla-macros.h>
#include <tesla.h>

void f(void) {}

void g(void) {}

int main(void) {
  TESLA_WITHIN(main, eventually(TSEQUENCE(call(f), call(g))));

  return 0;
}
