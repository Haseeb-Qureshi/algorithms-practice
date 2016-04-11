###### Magic Indices
--------
# A magic index in an array is an index such that arr[i] == i.
# Write a function to find a magic index in a sorted array, if one exists.
# (Assume distinct values.)

* Obvious O(n) dumb way to do this.

* But better way is to do a binary search, which will take O(lg n) time and O(1)
  space if done with tail recursion (or iteratively).

  First, look at arr[length / 2], and see whether the value is less than or equal to
  length / 2. If it's less than length / 2, by the pigeonhole principle,
  a magic index can only live on the right side (in the best case, the numbers
  only decrement or increment by 1).

* If there can be repeats, then you still get worst-case O(n), but you can do
  some stuff to restrict the search space on each side. That is, you know that certain
  indices cannot be be possible magic indices.

###### All permutations of a string
--------
# Given a string, generate all of its permutations.

* Take all of the permutations of str[0..-2], and for each index in the string,
  insert the last letter. Return the empty string for an empty string.

* Takes O(n * n!) time, which is optimal since the number of permutations is
  equal to n!, and it takes linear time to produce each of them.

###### Print all valid sequences of parens
--------
# Given an input N, print all valid orderings of parentheses (opening and closing).

* Think of it recursively—for n = 1, there's only one valid ordering: "()".

* For every unordered pair of indices within the string, you could place a new
  open-paren in the first index, and a close-paren in the second index. This gives
  you (2n)^2 / 2 = 4n^2 / 2 = 2n^2 many ways to add parens. You build this up
  n many times, and that leads to cubically many possibilities. I'd argue there are
  O(n^3) many of these parens, and the algorithm would take quartic time and quartic space.

* This is extremely inefficient though, because we'd build up the same strings repeatedly.

* Instead, let's build the sequences bottom-up.

* We start with n many left parens, and n many right parens. We can only spend a right paren
  if we have open left parens. Basically we decrement the number of left and right parens left
  and recurse repeatedly. If we have no left parens open, we just add a left paren,
  and if we only have right parens left then we just add the remaining right parens.

* Otherwise we recurse on both sides. Eventually we add all strings (all unique) to
  a global bag.

###### How many ways to compute change?
--------
# Given an infinite set of coins (25c, 10c, 5c, 1c), count the number of ways
# to make change for an amount N.

* Use bottom-up dynamic programming: compute all of the ways we can make change
  for 1c, then 2c, then 3c, then 4c, then 5c. By looking back by the number of
  cents for each coin we have available, we can simply add together the previous
  indices for each coin.

  Takes O(N * num_coins) time, which is pseudopolynomial time. Technically exponential.
  Takes O(N) space, also exponential.
