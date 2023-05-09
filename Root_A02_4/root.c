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
#include "equal.h"

// absolute(n) produces the absolute value of n.
double absolute(double n) {
  if (n < 0) {
    return -n;
  } 
  return n;
}

// positive_expt(x, y) produces x race to power y.
double positive_expt(double x, int y) {
  int j = 1;
  while(y > 0) {
    j = j * x;
    --y;
  }
  return j;
}

// expt(x, y) produces x race to power y
double expt(double x, int y) {
  if (y == 0) {
    return 1;
  } else if (y > 0) {
    return positive_expt(x, y);
  }
  return 1 / positive_expt(x, y);
}
 
// nth_root(a, n) returns the nth root of a.
// requires: n > 0
//           a has a real nth root (i.e. a cannot be negative if n is even)

double nth_root(const double a, const int n) {
  trace_msg("2");
  double x = a / n;
  while(is_almost_equal(expt(x, n), a) != 1) {
    trace_msg("1");
    x = 1.0 / n * (((n - 1.0) * x) + (a / (expt(x, n-1))));
  }
  trace_msg("3");
  return x; 
}

int main (void) {
  trace_double(expt(3.0,3));
  trace_double(expt(3.077,3));
  trace_double(nth_root(27.0, 3));
  
  double result = nth_root(27.0, 3);
  assert(is_almost_equal(result, 3.0));
  // my tests:
}
