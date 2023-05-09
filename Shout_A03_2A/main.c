#include "cs136.h"


// shout_case(void) prints the read input into shout case, i.e.
// all capital lettres or symbols.
void shout_case(void) {
  char c;
  while (scanf("%c", &c) == 1) {
    if (c >= 'a' && c <= 'z') {
      printf("%c", c - 32);
    } else {
      printf("%c", c);
    }
  }
}


int main(void) {
  shout_case();
}
