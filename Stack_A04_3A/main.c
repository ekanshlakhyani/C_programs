/////////////////////////////////////////////////////////////////////////////
// INTEGRITY INSTRUCTIONS (v2)

// Explicitly state the level of collaboration on this question
// Examples:
//   * I discussed ideas with classmate(s) [include name(s)]
//   * I worked together with classmate(s) in the lab [include name(s)]
//   * Classmate [include name] helped me debug my code
//   * I consulted website [include url]
//   * None
//
// A "None" indicates you completed this question entirely by yourself
// (or with assistance from course staff, which you do not have to mention)
/////////////////////////////////////////////////////////////////////////////
// INTEGRITY STATEMENT:
// I received help from and/or collaborated with:

// None

// Name: Ekansh Lakhyani
// login ID: elakhyan - 20945086
/////////////////////////////////////////////////////////////////////////////


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
