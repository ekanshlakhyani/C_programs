#include "cs136-trace.h"
#include "stack.h"
#include <stdio.h>


// scanner(void) reads in ints, and prints the numbers in their original order
// and then in reverse order.
// effects: reads input and prints to the screen.
void scanner(void) {
  int i;
  struct stack *s = stack_create();
  while (scanf("%d", &i) == 1) {
    stack_push(i, s);
    printf("%d\n", i);
  }
  while (!stack_is_empty(s)) {
    printf("%d\n", stack_pop(s));
  }
  stack_destroy(s);
}


int main(void) {
  scanner();
}
