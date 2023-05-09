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

// none

// Name: Ekansh Lakhyani 
// login ID: elakhyan - 20945086
/////////////////////////////////////////////////////////////////////////////

#include "cs136-trace.h"
#include <stdio.h>

// is_balance reads input and prints balanced if the brackets are balanced.
// effects: reads input and prints to the screen.
void is_balance() {
  char c;
  int open_no = 0;
  while (scanf(" %c", &c) == 1) {
    if (open_no < 0) {
      printf("unbalanced\n");
      return;
    } else if (c == '(') {
      open_no += 1;
    } else if (c == ')') {
      open_no -= 1;
    } else {
    }
  }
  if (open_no == 0) {
    printf("balanced\n");
  } else {
    printf("unbalanced\n");
  }
}

int main(void) {
  is_balance();
}
