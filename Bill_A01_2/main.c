#include "cs136.h"

// print_money(amount) prints amount with commas before group of 3,
// and with a dollar notation.
// requires: -999999999 =< amount <= 999999999
// effects: prints to the screen
void print_money(int amount) {
  int a = abs(amount);
  int dollars = a / 100;
  int ones = dollars % 1000;
  int millions = dollars / 1000000;
  int thousands = (dollars - millions * 1000000 - ones) / 1000;
  int cents = a % 100;
  if (amount < 0) {
    printf("-");
  } 
  printf("$");
  if (dollars > 999999) {
    printf("%d", millions);
    printf(",");
    if (thousands < 100) {
      printf("0");
    } if (thousands < 10) {
      printf("0");
    } 
    printf("%d", thousands);
    printf(",");
    if (ones < 100) {
      printf("0");
    } if (ones < 10) {
      printf("0");
    }
    printf("%d", ones);
  } else if (dollars > 999) {
    printf("%d", thousands);
    printf(",");
    if (ones < 100) {
      printf("0");
    } if (ones < 10) {
      printf("0");
    }
    printf("%d", ones);
  } else {
    printf("%d", dollars);
  }    
  printf(".");
  if (cents < 10) {
    printf("0");
  }
  printf("%d", cents);
  printf("\n");
}

// print_bill(amount, tax_rate, tip_rate) prints the bill
// transforming the given amount, tax_rate and tip_rate into
// the desired values for the bill.
// effects: prints to the screen.
void print_bill(int amount, int tax_rate, int tip_rate) {
  printf("bill:  ");
  print_money(amount);
  int tax_amount = (tax_rate * amount) / 100;
  printf("tax:   ");
  print_money(tax_amount);
  int tip_amount = (tip_rate * (amount + tax_amount)) / 100;
  printf("tip:   ");
  print_money(tip_amount);
  int total = amount + tax_amount + tip_amount;
  printf("total: ");
  print_money(total);
}

///////////////////////////////////////////////////////
// You do not need to modify the rest of the program //
///////////////////////////////////////////////////////

// test_print_bill() tests the print_bill function by passing it values
//   read from input, stopping only when a failure occurs
// note: prints an extra "======\n" after each call to print_bill
//       to make the test cases easier to separate
// effects: reads input
//          produces output
void test_print_bill(void) {
  int amount = read_int();
  int tax_rate = read_int();
  int tip_rate = read_int();
  if (tip_rate != READ_INT_FAIL) {
    print_bill(amount, tax_rate, tip_rate);
    printf("======\n");
    test_print_bill();
  }
}

int main(void) {
  test_print_bill();
}