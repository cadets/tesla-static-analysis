#include <stdlib.h>
#include <tesla.h>
#include <tesla-macros.h>

struct test_struct {
  int field __attribute__((annotate("field:test_struct.field")));
};

void init(struct test_struct **s) {
  (*s)->field = 0;
}

void end(struct test_struct **s) {
  (*s)->field = -1;
}

int main(void) {
  struct test_struct *st = malloc(sizeof(*st));

  TESLA_WITHIN(main, eventually(
    TSEQUENCE(
      call(init(&st)),
      call(end(&st))
    )
  ));

  init(&st);
  end(&st);
  
  return 0;
}
