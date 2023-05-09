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
