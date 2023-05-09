sequence I/O Command Guide:
==========================

SYNTAX:
------

<sequence id> - A character between 'a' and 'z', which specifies a sequence

<number> - A single integer number

<list of numbers> - A space separated list of integer numbers

<fname> - A function name 
          added by one of: add_map_fn, add_filter_fn, add_foldl_fn
          (e.g., in test-seqtools.c)

COMMANDS:
--------

read <sequence id> <list of numbers> end
Resets the specified sequence to contain the list of numbers in the order they are listed.

print <sequence id>
Calls sequence_print on the specified sequence
[<number>] <list of numbers>

addone <sequence id>
Calls sequence_add_one on the specified sequence

build <sequence id> <number>
Replaces the specified sequence with sequence_build(n)

map <sequence id> <fname>
Calls sequence_map on the specified sequence using the specified function

equal <sequence id> <sequence id>
Prints true/false, the result of sequence_equal on the specified sequences

addsum <sequence id>
Calls sequence_add_sum on the specified sequence

avgvar <sequence id>
Prints the results from sequence_avg_and_variance on the specified sequence

filter <sequence id> <fname>
Calls sequence_filter on the specified sequence using the specified function

foldl <sequence id> <fname> <number>
Calls sequence_foldl on the specified sequence using the specified function 
  using the supplied function and initial value
