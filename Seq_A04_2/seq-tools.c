/////////////////////////////////////////////////////////////////////////////
// INTEGRITY INSTRUCTIONS (v2)

// Explicitly state the level of collaboration on this question
// Examples:
//   * I discussed ideas with classmate(s) [include name(s)]
//   * I worked together with classmate(s) in the lab [include name(s)]
//   * Classmate [include name] helped me debug my code
//   * I consulted website [include url]
//   * None
//
// A "None" indicates you completed this question entirely by yourself
// (or with assistance from course staff, which you do not have to mention)
/////////////////////////////////////////////////////////////////////////////
// INTEGRITY STATEMENT:
// I received help from and/or collaborated with:

// None

// Name: Ekansh Lakhyani
// login ID: elakhyan - 20945086
/////////////////////////////////////////////////////////////////////////////

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

/******************************************************************************
// DO NOT REMOVE THIS COMMENT BLOCK

These two geese are named "Black" and "Gold".
They are here to ensure your black & gold code is sufficiently separated
to avoid any "contamination" if you give/receive help on a black question.



                                       ___
                                   ,-""   `.
                                 ,'  _   e )`-._
                                /  ,' `-._<.===-'
                               /  /
                              /  ;
                  _          /   ;
     (`._    _.-"" ""--..__,'    |
     <_  `-""                     \
      <`-                          :
       (__   <__.                  ;
         `-.   '-.__.      _.'    /
            \      `-.__,-'    _,'
             `._    ,    /__,-'
                ""._\__,'< <____
                     | |  `----.`.
                     | |        \ `.
                     ; |___      \-``
                     \   --<
                      `.`.<
                 hjw    `-'


    
    

                                                            _...--.
                                            _____......----'     .'
                                      _..-''                   .'
                                    .'                       ./
                            _.--._.'                       .' |
                         .-'                           .-.'  /
                       .'   _.-.                     .  \   '
                     .'  .'   .'    _    .-.        / `./  :
                   .'  .'   .'  .--' `.  |  \  |`. |     .'
                _.'  .'   .' `.'       `-'   \ / |.'   .'
             _.'  .-'   .'     `-.            `      .'
           .'   .'    .'          `-.._ _ _ _ .-.    :
          /    /o _.-'     LGB       .--'   .'   \   |
        .'-.__..-'                  /..    .`    / .'
      .'   . '                       /.'/.'     /  |
     `---'                                   _.'   '
                                           /.'    .'
                                            /.'/.'


    
    
source: https://ascii.co.uk/art/goose    
******************************************************************************/


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

