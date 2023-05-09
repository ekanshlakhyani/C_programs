#include "cs136.h"

// Use these strings in your solutions:
// "Warning: positive overflow detected for a = %d, b = %d!\n"
// "Warning: negative overflow detected for a = %d, b = %d!\n"

// saturation_add(a, b) adds a and b, without integer overflow occuring.
// effects: may print to the screen.
int saturation_add(int a, int b) {
  if (a == INT_MAX && b > 0) {
    trace_msg("1");
    printf("Warning: positive overflow detected for a = %d, b = %d!\n", a, b);
    return INT_MAX;
  } else if (b == INT_MAX && a > 0) {
    trace_msg("2");
    printf("Warning: positive overflow detected for a = %d, b = %d!\n", a, b);
    return INT_MAX;
  } else if (a > 0 && b > 0 && a > (INT_MAX - b)) {
    trace_msg("3");
    printf("Warning: positive overflow detected for a = %d, b = %d!\n", a, b);
    return INT_MAX; 
  } else if (a == INT_MIN && b < 0) {
    trace_msg("4");
    printf("Warning: negative overflow detected for a = %d, b = %d!\n", a, b);
    return INT_MIN;
  } else if (b == INT_MIN && a < 0) {
    trace_msg("5");
    printf("Warning: negative overflow detected for a = %d, b = %d!\n", a, b);
    return INT_MIN;
  } else if (a < 0 && b < 0 && a < INT_MIN - b) {
    trace_msg("6");
    printf("Warning: negative overflow detected for a = %d, b = %d!\n", a, b);
    return INT_MIN;
  } else {
    trace_msg("7");
    return a + b;
  }
}

// saturation_sub(a, b) subtracts a and b, without integer overflow occuring.
// effects: may print to the screen.
int saturation_sub(int a, int b) {
  if (a == INT_MIN && b > 0) {
    trace_msg("a");
    printf("Warning: negative overflow detected for a = %d, b = %d!\n", a, b);
    return INT_MIN;
  } else if (b == INT_MIN && a >= 0) {
    trace_msg("b");
    printf("Warning: positive overflow detected for a = %d, b = %d!\n", a, b);
    return INT_MAX;
  } else if (b == INT_MIN) {
    trace_msg("c");
    return -(INT_MIN - a);
  } else if (a == INT_MAX && b < 0) {
    trace_msg("d");
    printf("Warning: positive overflow detected for a = %d, b = %d!\n", a, b);
    return INT_MAX;
  } else if (b == INT_MAX && a < -1) {
    trace_msg("e");
    printf("Warning: negative overflow detected for a = %d, b = %d!\n", a, b);
    return INT_MIN;
  } else if (a < 0 && b > 0 && a < INT_MIN + b) {
    trace_msg("f");
    printf("Warning: negative overflow detected for a = %d, b = %d!\n", a, b);
    return INT_MIN;
  } else if (a > 0 && b < 0 && a > INT_MAX + b) {
    trace_msg("g");
    printf("Warning: positive overflow detected for a = %d, b = %d!\n", a, b);
    return INT_MAX;
  } else {
    trace_msg("h");
    return a - b;
  }
}

// saturation_mult(a, b) multiplies a and b, without integer overflow occuring.
// effects: may print to the screen.
int saturation_mult(int a, int b) {
  if (a == INT_MAX || b == INT_MAX) {
    if (b > 1 && a > 1) {
      printf("Warning: positive overflow detected for a = %d, b = %d!\n", a, b);
      return INT_MAX;
    } else if (b < -1 || a < -1) {
      printf("Warning: negative overflow detected for a = %d, b = %d!\n", a, b);
      return INT_MIN;
    } else {
      return a * b;
    }
  } else if (a == INT_MIN || b == INT_MIN) {
    if (a < 0 && b < 0) {
      printf("Warning: positive overflow detected for a = %d, b = %d!\n", a, b);
      return INT_MAX;
    } else if (a > 1 || b > 1) {
      printf("Warning: negative overflow detected for a = %d, b = %d!\n", a, b);
      return INT_MIN;
    } else {
      return a * b;
    }   
  }else if (b > 0 && a > (INT_MAX / b)) {
    printf("Warning: positive overflow detected for a = %d, b = %d!\n", a, b);
    return INT_MAX;
  } else if (b < 0 && a < (INT_MAX / b)) {
    printf("Warning: positive overflow detected for a = %d, b = %d!\n", a, b);
    return INT_MAX;
  }else if (b > 0 && a < (INT_MIN / b)) {
    printf("Warning: negative overflow detected for a = %d, b = %d!\n", a, b);
    return INT_MIN;
  } else if (b < 0 && a > (INT_MIN / b)) {
    printf("Warning: negative overflow detected for a = %d, b = %d!\n", a, b);
    return INT_MIN;
  } else {
    return a * b;
  }
}



int main(void) {
  assert(saturation_add(2, 2) == 4);
  assert(saturation_add(INT_MAX, 1) == INT_MAX);
  assert(saturation_sub(5, 1) == 4);
  assert(saturation_mult(2, 2) == 4);
// my tests: 
  assert(saturation_add(2147483640, 2) == 2147483642);
  assert(saturation_add(2147483640, 10) == INT_MAX);
  assert(saturation_add(-2147483640, -10) == INT_MIN);
  assert(saturation_add(INT_MAX, -10) == 2147483637);
  assert(saturation_add(INT_MAX, 0) == INT_MAX);
  assert(saturation_add(INT_MIN, -1) == INT_MIN);
  assert(saturation_add(-2 ,INT_MIN) == INT_MIN);
  assert(saturation_add(1, INT_MAX) == INT_MAX);
  assert(saturation_add(1500000000, 1500000000) == INT_MAX);
  assert(saturation_sub(5, 1) == 4);
  assert(saturation_sub(INT_MIN, 1) == INT_MIN);
  assert(saturation_sub(5, INT_MIN) == INT_MAX);
  assert(saturation_sub(INT_MIN, INT_MAX) == INT_MIN);
  assert(saturation_sub(INT_MAX, INT_MIN) == INT_MAX);
  assert(saturation_sub(2, 4) == -2);
  assert(saturation_sub(-5, -10) == 5);
  assert(saturation_sub(4, -4) == 8);
  assert(saturation_sub(-56, 4) == -60);
  assert(saturation_sub(INT_MIN, INT_MAX) == INT_MIN);
  assert(saturation_sub(0, INT_MIN) == INT_MAX);
  assert(saturation_sub(1, INT_MIN) == INT_MAX);
  assert(saturation_sub(-1, INT_MIN) == INT_MAX);
  assert(saturation_sub(1500000000, -1500000000) == INT_MAX);
  assert(saturation_sub(-1500000000, 1500000000) == INT_MIN);
  assert(saturation_sub(1500000000, 1500000000) == 0);
  assert(saturation_sub(-1500000000, -1500000000) == 0);
  assert(saturation_sub(-10, INT_MIN) == 2147483638);
  assert(saturation_sub(INT_MAX, -1) == INT_MAX);
  assert(saturation_sub(-1 ,INT_MAX) == INT_MIN);
  assert(saturation_sub(-2 ,INT_MAX) == INT_MIN);
  assert(saturation_mult(2, 2) == 4);
  assert(saturation_mult(INT_MAX, 2) == INT_MAX);
  assert(saturation_mult(2, INT_MAX) == INT_MAX);
  assert(saturation_mult(15000000, 200) == INT_MAX);
  assert(saturation_mult(-100000, -2100000) == INT_MAX);
  assert(saturation_mult(90000, -9999999) == INT_MIN);
  assert(saturation_mult(-199038, 29293) == INT_MIN);
  assert(saturation_mult(INT_MIN, -1) == INT_MAX);
  assert(saturation_mult(-1, INT_MIN) == INT_MAX);
  assert(saturation_mult(0, INT_MIN) == 0);
  assert(saturation_mult(INT_MAX, -1) == -INT_MAX);
  assert(saturation_mult(1073741824, 2) == INT_MAX);
  assert(saturation_mult(126322567, 17) == 2147483639);
  assert(saturation_mult(126322568, 17) == INT_MAX);
}
