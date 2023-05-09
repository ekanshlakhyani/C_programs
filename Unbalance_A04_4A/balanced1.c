void is_balance() {
  char c;
  int open_no = 0;
  while (scanf(" %c", &c) == 1) {
    if (open_no < 0) {
      printf("unbalanced\n");
      return;
    } else if (c == '(') {
      open_no += 1;
    } else if (c == ')') {
      open_no -= 1;
    } else {
    }
  }
  if (open_no == 0) {
    printf("balanced\n");
  } else {
    printf("unbalanced\n");
  }
}

int main(void) {
  is_balance();
}
