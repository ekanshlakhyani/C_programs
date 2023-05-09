#include "cs136.h"
  
// count_producer() prints out the number of lines, words and characters.
// effects: prints to the screen and reads from the file.
void count_producer() {
  const int space = 32;
  const int new_line = 10; 
  int lines = 0;
  int words = 0;
  int characters = 0;
  char input = read_char(0);
  bool last_new_line = false;
  if (input == READ_CHAR_FAIL) {
  }
  else {
    bool last_space = true;
    while (input != READ_CHAR_FAIL) {
      if (input == space && last_space == false){
        words += 1;
        last_space = true;
      } else if (input == new_line) {
        lines += 1;
        last_new_line = true;
        if (last_space == false) {
          words += 1;
        }
        last_space = true;
      }
      characters += 1;
      if (input != space && input != new_line) {
        last_space = false;
      } if (input != new_line) {
        last_new_line = false;
      }
      input = read_char(0);
    } if (last_new_line == false) {
      ++ lines;
    } if (last_new_line == false && last_space == false) {
      ++ words;
    }
  }
  printf("Lines: ");
  printf("%d\n", lines);
  printf("Words: ");
  printf("%d\n", words);
  printf("Characters: ");
  printf("%d\n", characters);
}    

int main(void){
  count_producer();
}
