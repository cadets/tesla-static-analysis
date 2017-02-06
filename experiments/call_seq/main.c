#include <tesla-macros.h>
#include <tesla.h>

void f(void) {
}

void g(void) {
}

void h(void) {
  f();
  g();
}

void i(void) {
  h();
}

int main(void) {
  TESLA_WITHIN(main, eventually(TSEQUENCE(call(f), call(g))));

  i();
  return 0;
}
