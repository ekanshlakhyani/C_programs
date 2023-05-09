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
// login ID: elakhyan - 20945086
/////////////////////////////////////////////////////////////////////////////

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
