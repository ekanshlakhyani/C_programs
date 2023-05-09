#include <stdio.h>
#include "lame-robot.h"

// print_line() prints dashed lines and a line return
// effects: produces output
void print_line(void) {
  printf("---------------------------------------------\n");
}


// scanner(void) reads the input and calls the appropriate function and prints
// the status after the changes.
// effects: reads input and prints to the screen.
void scanner(void) {
  char c;
  while (scanf(" %c", &c) == 1) {
    if (c == 'f') {
      int i;
      if (scanf("%d", &i) == 1) {
        robot_forward(i);
      } else {
        break;
      }
    } else if (c == 'l') {
      robot_left();
    } else if (c == 'r') {
      robot_right();
    } else if (c == 'd') {
      robot_drop();
    } else if (c == 'p') {
      robot_pickup();
    } else if (c == 't') {
      robot_reset();      
    } else if (c == 's') {
    } else {
      break;
    } 
    robot_status();
    print_line();
  }
}


int main(void) {
  scanner();
}
