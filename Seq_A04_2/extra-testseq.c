#include <assert.h>
#include "sequence.h"

// this is an extra simple test client for the sequence module

// most of you will want to use test-seqtools

// This is only here to provide extra examples of how a sequence can be used
// and to provide alternative ideas for your own testing.

int main(void) {
  struct sequence *s = sequence_create();
  assert (sequence_length(s) == 0);
  for (int i=0; i < 10; ++i) {
    sequence_insert_at(s, i, i*i);
  }
  assert(sequence_item_at(s, 4) == 16);
  sequence_remove_at(s, 2);
  assert(sequence_item_at(s, 3) == 16);
  sequence_clear(s);
}
