struct rtnl {
  int num;
  int den;
};

void rtnl_simplify(struct rtnl *r);

struct rtnl rtnl_init(int num, int den);

struct rtnl rtnl_add(const struct rtnl *r, const struct rtnl *s);

struct rtnl rtnl_sub(const struct rtnl *r, const struct rtnl *s);

struct rtnl rtnl_mul(const struct rtnl *r, const struct rtnl *s);

bool rtnl_equal(const struct rtnl *r, const struct rtnl *s);
