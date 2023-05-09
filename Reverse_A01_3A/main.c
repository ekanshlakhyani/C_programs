/////////////////////////////////////////////////////////////////////////////
// INTEGRITY STATEMENT (v3)
//
// By signing your name and ID below you are stating that you have agreed
// to the online academic integrity statement:
// https://student.cs.uwaterloo.ca/~cs136/current/assignments/integrity.shtml
/////////////////////////////////////////////////////////////////////////////
// I received help from and/or collaborated with:

// https://www.youtube.com/watch?v=iWQ5rGWmkXw to understand the reversing part.
//
// Name: Ekansh Lakhyani
// login ID: 20945086
/////////////////////////////////////////////////////////////////////////////

#include "cs136.h"

// reader reads in all integers from input and prints them out in their
// original order and then in reverse order.
// effects: prints to the screen.
void reader(void) {
  int input = read_int();
  if (input == READ_INT_FAIL) {
    return;
  } else {
    printf("%d" , input);
    printf("\n");
    reader();
    printf("%d" , input);
    printf("\n");
  }
}

int main(void) {
  reader();
}
