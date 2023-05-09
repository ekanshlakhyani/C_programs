#include "q1a-rtnl.h"



struct point_3d {
  struct rtnl *x;
  struct rtnl *y;
  struct rtnl *z;
};


// rtnl_square(rtnl *r) produces the square of the rtnl r in the form of
// const struct rtnl.
const struct rtnl rtnl_square(const struct rtnl *r) {
  return rtnl_mul(r, r);
}


// point_3d_dist_squared(point_3d *p, point_3d *q)
// produces the square of the Euclidean distance
// between two points, p and q, and returns it as a struct rtnl. 
struct rtnl point_3d_dist_squared(const struct point_3d *p, const struct point_3d *q) {
  const struct rtnl a = rtnl_sub(p->x, q->x);
  const struct rtnl b = rtnl_sub(p->y, q->y);
  const struct rtnl c = rtnl_sub(p->z, q->z);
  const struct rtnl a_sq = rtnl_square(&a);
  const struct rtnl b_sq = rtnl_square(&b);
  const struct rtnl c_sq = rtnl_square(&c);
  const struct rtnl first_sum = rtnl_add(&a_sq, &b_sq);
  struct rtnl final_sum = rtnl_add(&first_sum, &c_sq);
  return final_sum;
}





int main(void) {
  struct rtnl x1 = rtnl_init(57, -81);
  struct rtnl y1 = rtnl_init(3, 1);
  struct rtnl z1 = rtnl_init(0, -7);
  struct point_3d p = {&x1, &y1, &z1};
  
  struct rtnl x2 = rtnl_init(-18, -12);
  struct rtnl y2 = rtnl_init(84, -882);
  struct rtnl z2 = rtnl_init(-12, 12);
  struct point_3d q = {&x2, &y2, &z2};
  
  struct rtnl dist_squared = point_3d_dist_squared(&p, &q);
  assert(dist_squared.num == 2205673);
  assert(dist_squared.den == 142884);
  
  // ADD YOUR OWN TESTS BELOW:
  struct rtnl x3 = rtnl_init(1, 1);
  struct rtnl y3 = rtnl_init(1, 1);
  struct rtnl z3 = rtnl_init(1, 1);
  struct point_3d m = {&x3, &y3, &z3};
  
  struct rtnl x4 = rtnl_init(0, 1);
  struct rtnl y4 = rtnl_init(0, 1);
  struct rtnl z4 = rtnl_init(0, 1);
  struct point_3d n = {&x4, &y4, &z4};
  
  struct rtnl dist_squared2 = point_3d_dist_squared(&m, &n);
  assert(dist_squared2.num == 3);
  assert(dist_squared2.den == 1);
}
