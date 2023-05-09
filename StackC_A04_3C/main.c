#include "cs136-trace.h"
#include "stack.h"
#include <stdio.h>

// scanner(void) reads in symbols, and prints the symbols in their 
// original order and then in reverse order and then in their 
// original order, and then finally in their reverse order.
// effects: reads input and prints to the screen.
void scan(void) {
  int i;
  struct stack *s = stack_create();
  struct stack *s2 = stack_create();
  struct stack *s3 = stack_create();
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
    int i1 = stack_pop(s);
    print_symbol(i1);
    printf("\n");
    stack_push(i1, s2);
  }  
  stack_destroy(s);
  while (!stack_is_empty(s2)) {
    int i2 = stack_pop(s2);
    print_symbol(i2);
    printf("\n");
    stack_push(i2, s3);
  }  
  stack_destroy(s2);
  while (!stack_is_empty(s3)) {
    int i3 = stack_pop(s3);
    print_symbol(i3);
    printf("\n");
  }  
  stack_destroy(s3);
}


int main(void) {
  scan();
}


