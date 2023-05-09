#include "cs136.h"



// no_comments(void) reads input and prints it excluding the comments.
// as in the c programm.
void no_comments(void) {
  bool line_comm = false;
  bool multi_comm = false;
  bool last_star = false;
  bool last_slash = false;
  bool string = false;
  char c;
  while (scanf("%c", &c) == 1) {
    if (!line_comm && !multi_comm && c == '"') {
      last_slash = false;
      string = true;
      printf("%c", c);
    } else if (string) {
      if (c == '"') {
        string = false;
      } 
      printf("%c", c);
    } else if (line_comm) {
      if (c == '\n') {
        line_comm = false;
        printf("%c", '\n');
      }
    } else if (multi_comm) {
      if (c == '*') {
        last_star = true;
      } else if (last_star && c == '/') {
        multi_comm = false;
        last_star = false;
      } else {
        last_star = false;
      }
    } else if (last_slash) {
      if (c == '/') {
        line_comm = true;
        last_slash = false;
      } else if (c == '*') {
        multi_comm = true;
        last_slash = false;
      } else {
        last_slash = false;
        printf("%c", '/');
        printf("%c", c);
      }
    } else if (c == '/') {
      last_slash = true;
    } else {
      printf("%c", c);
    }
  }
}

int main(void) {
  no_comments();
}
