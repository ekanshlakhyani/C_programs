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
