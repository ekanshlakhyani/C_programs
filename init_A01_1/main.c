#include "cs136.h"

// max(a, b) calculates the maximumum of a and b.
int max(int a, int b) {
  if (b > a) {
    return b;
  } else {
    return a;
  }
}

// expt(b, n) calculates the value of b race to the power n.
// requires: n >= 0
int expt(int b, int n) {
  if (n == 0) {
    return 1;
  } else if (n == 1) {
    return b;
  }
  return b * expt(b, n - 1);
}

// sqrt_int(n, x) calculates the square root of n(rounding down).
// requires: n >= 0
int sqrt_int(int n, int x) {
  if ((x * x) <= n) {
    if (((x + 1) * (x + 1)) > n) {
      return x;
    } else {
      return sqrt_int(n, x + 1);
    }
  } else {
    return sqrt_int(n, x + 1);
  }
}

// log_2(n, x) calculates the log to the base 2 for n (rounding up).
// requires: n > 0
int log_2(int n, int x) {
  if (expt(2, x - 1) < n) {
    if (expt (2, x) >= n) {
      return x;
    } else {
      return log_2(n, x + 1);
    }
  } else {
    return log_2(n, x + 1);
  }
}

// cs136_grade(participation, assignments, midterm, final,
// midterm_in_person, final_in_person)
// calculates the grade for a cs136 student given the grades for
// participation, assignments, midterm, final, midterm_in_person,
// and final_in_person.
int cs136_grade(int participation, int assignments, int midterm, int final,
                bool midterm_in_person, bool final_in_person) {
  if (midterm_in_person == 1) {
    if (final_in_person == 1) {
      return (participation + assignments * 5 + midterm * 4 + final * 10) / 20;
    } else {
      return (participation + assignments * 10 + midterm * 4 +\
              final * 5) / 20;  
    }
  } else if (final_in_person == 1) {
    return (participation + assignments * 7 + midterm * 2 + final * 10) / 20;
  } else {
    return (participation + assignments * 12 + midterm * 2 + final * 5) / 20;
  }
}
  
// away_div(num, denom) calcualtes divides the num by the denom and
// rounds away from zero.
int away_div(int num, int denom) {
  if (num % denom == 0) {
    return num / denom;
  } else if ((num / denom) >= 0) {
    return num / denom + 1;
  } else {
    return num / denom - 1;
  }
}

// chocolate boxes counts the number of boxes needed to the store the
// given caramel, almond, mint, nut_free choclates and the box_size.
int chocolate_boxes(int caramel, int almond, int mint, int nut_free, 
                    int box_size) {
  return away_div(nut_free, box_size) + away_div(away_div(almond,\
                box_size / 2) + away_div(caramel, box_size / 2) + \
                  away_div(mint,box_size / 2), 2);
}

int main(void) {
  assert(max(4, 4) == 4);
  assert(expt(2, 2) == 4);
  assert(sqrt_int(16, 1) == 4);
  assert(log_2(16, 1) == 4);
  assert(cs136_grade(4, 4, 4, 4, true, true) == 4);
  assert(away_div(16, 4) == 4);
  assert(chocolate_boxes(2, 2, 2, 2, 2) == 4);
  assert(max(-2, -4) == -2);
  assert(max(3, 9) == 9);
  assert(expt(2, 3) == 8);
  assert(expt(3, 2) == 9);
  assert(expt(9, 0) == 1);
  assert(expt(0, 0) == 1);
  assert(sqrt_int(91, 1) == 9);
  assert(sqrt_int(1, 1) == 1);
  assert(cs136_grade(100, 50, 25, 5, 1, 1) == 25);
  assert(cs136_grade(100, 100, 100, 100, 0, 0) == 100);
  assert(cs136_grade(28, 66, 77, 50, 0, 1) == 57);
  assert(cs136_grade(88, 60, 70, 50, 1, 0) == 60);
  assert(away_div(2, 1) == 2);
  assert(away_div(1, 8) == 1);
  assert(away_div(-8 ,3) == -3);
  assert(chocolate_boxes(9, 0, 0, 0, 8) == 2);
  assert(chocolate_boxes(0, 4, 4, 0, 8) == 1);
  assert(chocolate_boxes(0, 0, 1, 1, 8) == 2);
}