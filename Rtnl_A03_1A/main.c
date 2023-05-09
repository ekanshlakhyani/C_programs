#include "cs136.h"

struct rtnl {
  int num;
  int den;
};
// requires: den != 0

// is_positive(rtnl *r) produces true if the rtnl r is a positive rational
// number and fale otherwise.
bool is_positive(struct rtnl *r) {
  if (r->num > 0 && r->den > 0) {
    return true;
  } else if (r->num < 0 && r->den < 0) {
    return true;
  } else {
    return false;
  }
}

// rtnl_simplify(rtnl *r) mutates rtnl r to the lowest rational form.
// effects: mutates rtnl r
void rtnl_simplify(struct rtnl *r) {
  bool sign = is_positive(r);
  int n = abs(r->num);
  int d = abs(r->den);
  int small = n;
  int big = d;
  if (small > big) {
    small = d;
    big = n;
  }
  int div = small;
  int i = 1;
  while (small % div != 0 || big % div != 0) {
    if (small % i == 0) {
      div = small / i;
    }
    ++i;
  }
  if (sign) {
    r->num = n/div;
  } else {
    r->num = -n/div;
  }
  r->den = d/div;
}


// rtnl_init(num, den) produces a struct rtnl which is the simplified version
// of the given numerator and denominator.
struct rtnl rtnl_init(int num, int den) {
  struct rtnl r;
  r.num = num;
  r.den = den;
  rtnl_simplify(&r);
  return r;
}


// rtnl_add(rtnl *r, rtnl *s) produces a struct rtnl which is the simplified
// version of the sum of the two rationals r and s.
struct rtnl rtnl_add(const struct rtnl *r, const struct rtnl *s) {
  struct rtnl a;
  a.den = r->den * s->den;
  a.num = r->num * s->den + s->num * r->den;
  rtnl_simplify(&a);
  return a;
}


// rtnl_sub(rtnl *r, rtnl *s) produces a struct rtnl which is the simplified
// version of the difference of the two rationals r and s.
struct rtnl rtnl_sub(const struct rtnl *r, const struct rtnl *s) {
  struct rtnl a;
  a.den = r->den * s->den;
  a.num = r->num * s->den - s->num * r->den;
  rtnl_simplify(&a);
  return a;
}


// rtnl_mul(rtnl *r, rtnl *s) produces a struct rtnl which is the simplified
// version of the product of the two rationals r and s.
struct rtnl rtnl_mul(const struct rtnl *r, const struct rtnl *s) {
  struct rtnl a;
  a.den = r->den * s->den;
  a.num = r->num * s->num;
  rtnl_simplify(&a);
  return a;
}


// rtnl_equal(rtnl *r, rtnl *s) produces true if the given rational numbers
// r and s are equivalent and false otherwise.
bool rtnl_equal(const struct rtnl *r, const struct rtnl *s) {
  struct rtnl simp_r;
  simp_r.num = r->num;
  simp_r.den = r->den;
  rtnl_simplify(&simp_r);
  struct rtnl simp_s;
  simp_s.num = s->num;
  simp_s.den = s->den;
  rtnl_simplify(&simp_s);
  return (simp_r.num == simp_s.num) && (simp_r.den == simp_s.den);
}


              
int main(void) {
  struct rtnl r = rtnl_init(57, -81);
  assert(r.num == -19);
  assert(r.den == 27);
  
  struct rtnl s = rtnl_init(-18, -12);
  assert(s.num == 3);
  assert(s.den == 2);
  
  struct rtnl sum = rtnl_add(&r, &s);
  assert(sum.num == 43);
  assert(sum.den == 54);
  
  struct rtnl diff = rtnl_sub(&r, &s);
  assert(diff.num == -119);
  assert(diff.den == 54);  
  
  struct rtnl prod = rtnl_mul(&r, &s);
  assert(prod.num == -19);
  assert(prod.den == 18);
  
  assert(!rtnl_equal(&r, &s));
  
  // ADD YOUR OWN TESTS BELOW:
  struct rtnl x = rtnl_init(42, 12);
  assert(x.num == 7);
  assert(x.den == 2);
  
  struct rtnl y = rtnl_init(65, -17);
  assert(y.num == -65);
  assert(y.den =  17);
  
  struct rtnl z = rtnl_init(-99, -6);
  assert(z.num == 33);
  assert(z.den == 2);
  
  struct rtnl sum2 = rtnl_add(&x, &y);
  assert(sum2.num == -11);
  assert(sum2.den == 34);
  
  struct rtnl diff2 = rtnl_sub(&x, &y);
  assert(diff2.num == 249);
  assert(diff2.den == 34);
  
  struct rtnl pro2 = rtnl_mul(&x, &y);
  assert(pro2.num == -455);
  assert(pro2.den == 34);
  
  struct rtnl z2 = rtnl_init(66, 4);
  
  assert(rtnl_equal(&z, &z2));
}
