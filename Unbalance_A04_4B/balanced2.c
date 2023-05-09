#include "cs136-trace.h"
#include "stack.h"
#include <stdio.h>

// is_balance reads input and prints balanced if the brackets are balanced.
// effects: reads input and prints to the screen. 
void is_balance() {
  char c;
  struct stack *s = stack_create();
  while (scanf(" %c", &c) == 1) {
    if (c == '<' || c == '(' || c == '{' || c == '[') {
      stack_push(c, s);
    } else if (c == '>' || c == ')' || c == '}' || c == ']') {
      int i = stack_pop(s);
      if ((c - i) > 4) {
        printf("unbalanced\n");
        return;
      }
    }
  }
  if (stack_is_empty(s)) {
    printf("balanced\n");
  } else {
    printf("unbalanced\n");
  }
  stack_destroy(s);
}

int main(void) {
  is_balance();
}

