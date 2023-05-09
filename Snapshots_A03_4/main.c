// This is a program to test your memory tracing skills
// NOTE: the functions lack appropriate documentation

#include "cs136.h"

// SEASHELL_READONL_PLACEHOLDER

// Ignore the following line: it allows us to do mutual recursion
// (we learn about this in Section 06)
bool bar(bool);

int counter = 1;
const int target = 9;
const int fun = 71;

void trace(int trace_no) {
  printf("Snapshot #%d!\n", trace_no); 
  // TAKE A MEMORY SNAPSHOT NOW
}

void my_fun_function(int m, int n, char c) {
  ++counter;
  ++m;
  n++;
  bool b1 = (m == c);
  bool b2 = (m == n);
  trace(1);
  char d = 'd'; 
  return;
}

int count_factors(int n) {
  assert(n > 2);
  ++counter;
  int factor_count = 0;
  for (int i = 2; i < n; ++i) {
    if (n % i == 0) {
      printf("New factor detected!\n");
      trace(2);
      ++factor_count;
    }
  }
  return factor_count;
}

bool foo(bool bf) {
  ++counter;
  if (bf) {
    return bar(!bf);
  } else {
    trace(3);
    return bf;
  }
}

bool bar(bool bb) {
  ++counter;
  return foo(bb);
}

int main(void) {
  ++counter;
  my_fun_function(fun, 'h', 'H');
  int pfc = count_factors(target);
  bool foobar = foo(true);
}
