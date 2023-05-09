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
