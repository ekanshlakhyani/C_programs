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
