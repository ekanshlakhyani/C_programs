#include "cs136.h"

const int changer = 32;

// make_capital(c) produces the char c in its capital form if
// its not already capital.
// requires: c to be a letter.
char make_capital(char c) {
  if (c >= 'a' && c <= 'z') {
    return c - changer;
  } return c;
}

// make_small(c) produces the char c in its small(lower) form if
// its not already in lower caps.
// requires: c to be a letter.
char make_small(char c) {
  if (c >= 'a' && c <= 'z') {
    return c;
  } return c + changer;
}

// sarcasm_case(void) prints out the read input in sarcam case(alternating case)
// effects: reads input and prints to the screen. 
void sarcasm_case(void) {
  bool uppercase = false;
  char c;
  while (scanf("%c", &c) == 1) {
    if ((c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z')) {
      if (uppercase) {
        printf("%c", make_capital(c));
        uppercase = false;
      } else {
        printf("%c", make_small(c));
        uppercase = true;
      }
    } else {
      printf("%c", c);
    }
  }
}


int main(void) {
  sarcasm_case();
}
