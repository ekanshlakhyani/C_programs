/////////////////////////////////////////////////////////////////////////////
// INTEGRITY STATEMENT (v3)
//
// By signing your name and ID below you are stating that you have agreed
// to the online academic integrity statement:
// https://student.cs.uwaterloo.ca/~cs136/current/assignments/integrity.shtml
/////////////////////////////////////////////////////////////////////////////
// I received help from and/or collaborated with:

// no one
//
// Name: Ekansh Lakhyani
// login ID: 20945086
/////////////////////////////////////////////////////////////////////////////

#include "cs136.h"

// reader reads in all integers from input and prints them out in their
// in reverse order excluding any integers that lie outside of the range
// between the very first number and the last number (inclusive).
// effects: reads input and prints to the screen.
void reader(int first, int last, int n) {
  int input = read_int();
  if (n == 0) {
    int f = input;
  } else if (input == READ_INT_FAIL) {
    return;
  } else {
    reader();
    printf("%d" , input);
    printf("\n");
  }
}

int main(void) {
  reader(0, 0, 0);
}
