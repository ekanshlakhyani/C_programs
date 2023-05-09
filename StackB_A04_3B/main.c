#include "cs136-trace.h"
#include "stack.h"
#include <stdio.h>

// scanner(void) reads in symbols, and prints the symbols in their 
// original order and then in reverse order.
// effects: reads input and prints to the screen.
void scanner(void) {
  int i;
  struct stack *s = stack_create();
  while (1) {
    i = read_symbol();
    if (i != INVALID_SYMBOL) {
      stack_push(i, s);
      print_symbol(i);
      printf("\n");
    } else {
      break;
    }
  }
  while (!stack_is_empty(s)) {
    print_symbol(stack_pop(s));
    printf("\n");
  }  
  stack_destroy(s);
}


int main(void) {
  scanner();
}
