#include <stdio.h>
#include <assert.h>
#include "sequence.h"
#include "seq-tools.h"


int add_one(int x) {
  return x + 1;
}


void sequence_add_one(struct sequence *seq) {
  int length = sequence_length(seq);
  int pos = 0;
  while (length > pos) {
    int i = sequence_item_at(seq, pos);
    int new_i = i + 1;
    sequence_remove_at(seq, pos);
    sequence_insert_at(seq, pos, new_i);
    pos += 1;
  }
}


struct sequence *sequence_build(int n) {
  struct sequence *s = sequence_create();
  int pos = 0;
  while (pos < n) {
    sequence_insert_at(s, pos, pos);
    pos += 1;
  } 
  return s;
}


void sequence_map(int (*fp)(int), struct sequence *seq) {
  int length = sequence_length(seq);
  int pos = 0;
  while (length > pos) {
    int i = sequence_item_at(seq, pos);
    int new_i = fp(i);
    sequence_remove_at(seq, pos);
    sequence_insert_at(seq, pos, new_i);
    pos += 1;
  }
}



bool sequence_equal(const struct sequence *seq1, const struct sequence *seq2) {
  int length_1 = sequence_length(seq1);
  int length_2 = sequence_length(seq2);
  if (length_1 != length_2) {
    return false;
  }
  int pos = 0;
  while (length_1 > pos) {
    int i1 = sequence_item_at(seq1, pos);
    int i2 = sequence_item_at(seq2, pos);
    if (i1 != i2) {
      return false;
    }
    pos += 1;
  }
  return true;
}


void sequence_add_sum(struct sequence *seq) {
  int length = sequence_length(seq);
  int pos = 0;
  int last_i = 0;
  while (length > pos) {
    int i = sequence_item_at(seq, pos);
    int new_i = i + last_i;
    last_i = new_i;
    sequence_remove_at(seq, pos);
    sequence_insert_at(seq, pos, new_i);
    pos += 1;
  }
}


void sequence_avg_and_variance(const struct sequence *seq, 
                               int *avg, int *var) {
  int length = sequence_length(seq);
  int pos = 0;
  int sum = 0;
  while (length > pos) {
    int i = sequence_item_at(seq, pos);
    sum += i;
    pos += 1;
  }
  *avg = (sum / length);
  int vary_term = 0;
  while (length > pos) {
    int i = sequence_item_at(seq, pos);
    vary_term += (i - *avg) * (i - *avg);
    pos += 1;
  }
  *var = vary_term / length;
}


void sequence_filter(bool (*fp)(int), struct sequence *seq) {
  int length = sequence_length(seq);
  int pos = 0;
  while (length > pos) {
    int i = sequence_item_at(seq, pos);
    if (fp(i)) {
      pos += 1;
    } else {
      sequence_remove_at(seq, pos);
      length -= 1;
    }
  }
}


int sequence_foldl(int (*fp)(int, int), int base, 
                   const struct sequence *seq) {
  int length = sequence_length(seq);
  int pos = 0;
  int val;
  if (length == 0) {
    return base;
  }
  while (length > pos) {
    int i = sequence_item_at(seq, pos);
    val = fp(i, base);
    base = val;
  }
  return val;
}

