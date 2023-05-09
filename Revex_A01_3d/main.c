/////////////////////////////////////////////////////////////////////////////
// INTEGRITY STATEMENT (v3)
//
// By signing your name and ID below you are stating that you have agreed
// to the online academic integrity statement:
// https://student.cs.uwaterloo.ca/~cs136/current/assignments/integrity.shtml
/////////////////////////////////////////////////////////////////////////////
// I received help from and/or collaborated with:

// No one
//
// Name: Ekansh Lakhyani
// login ID: 20945086
/////////////////////////////////////////////////////////////////////////////

#include "cs136.h"


// reader reads in all integers from input and prints them out in their
// in reverse order excluding any integers that excluding any integers
// that have a distance greater than 1 from the mean.
// effects: prints to the screen.
void reader(int total, int number_of_inputs) {
  int input = read_int();
  int t = total;
  int n = number_of_inputs;
  t += input;
  n += 1;
  if (input == READ_INT_FAIL) {
    return;
  } else {
    
    reader(t, n);
 /*   if ((input <= ((total / number_of_inputs) + 1))\
        && (input >= ((total / number_of_inputs) - 1))){*/ 
    printf("%d\n" , input);
    printf("%d\n", t);
    printf("%d\n", n);
    t += input;
    n += 1;
//    }
  }
}

int main(void) {
  reader(0, 0);
}