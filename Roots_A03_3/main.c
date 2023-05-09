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


// double_abs(x) gives the absolute value for the given double value x,
// in double form.
double double_abs(double x) {
  if (x < 0) {
    return -x;
  } 
  return x;
}


// bisection(f, lo, hi, tolerance) uses the bisection method to find a root
//   of f that exists between lo and hi such that |f(root)| <= tolerance
// requires: tolerance > 0
//           lo < hi
//           f(lo) * f(hi) < 0
//           f is "continuous" between lo and hi
double bisection(double (*f)(double), double lo, double hi, double tolerance) {
  double mid = (lo + hi) / 2;
  while ((double_abs(f(mid)) <= tolerance) == false) {
    if (f(mid) < 0) {
      lo = mid;
    } else {
      hi = mid;
    } 
    mid = (lo + hi) / 2;
  }
  return mid;
//  return 1.4142;
}


// poly_with_root_sqrt2(x) calculates x^2 - 2
double poly_with_root_sqrt2(double x) {
  return x * x - 2;
}


int main(void) {
  double root = bisection(poly_with_root_sqrt2, 1, 2, 0.00001);
  assert(root >= 1.41400 && root <= 1.41499);
}
