###### Hamming distance
--------
# Write a function that determines the number of changes that would have to be made
# to two binary numbers to transform one into the other.

* Fairly simple—just requires figuring out which bits are different! How do you
  know that? Well, just take their XOR—this contains a 1 for each bit that's \
  different. Then just count the number of 1s. The easiest way to do this is to
  increment a counter each time &'ing with 1 == 1, and then rightshift by 1.

* Can also calculate Hamming distance much faster (if not using built-in popcount
  hardware to count it), you can clear the least significant bit in a number by
  doing b & b - 1. Each iteration will clear the least significant bit; just count
  the number of times that &'ing needs to be done until the number == 0.

###### n & n-1 == 0
--------
# What does this code indicate?

* That n is a power of 2. This is because n & n - 1 clears the least significant
  bit. If there's only one significant bit, then the number must be of the form
  1000..., meaning it's a power of 2.

###### Egg Dropping
--------
# If you have two eggs, how do you decide from where and how to drop them, given
# a building with 100 floors?

* You want to load balance between drops(egg1) and drops(egg2) as much as possible,
  so as to reduce the worst case.

  Thus, each time you drop egg1, you want egg2 to be dropped one time fewer.

  For egg2, you must always linear scan between previous_valid_egg1 and the break_floor.

  So for egg1, your chosen points are x + (x - 1) + (x - 2) ... + 1 = 100

  That sums to x * (x + 1) / 2 = 100

  X^2 / 2 + x/2 - 100 = 0
  x^2 + x - 200 = 0
  ~14

  So 14, 28, 42... and then a linear scan of the interim.


###### Lines intersect?
--------
# Given two lines on the Cartesian plane, determine whether they intersect.

* Two lines intersect IFF their slopes are different (or they are the same line).

* All lines thus intersect unless their slopes are the same AND their y-coordinates
  differ. In other words, dont_intersect if slope1 == slope2 && y1 != y2.

  However, because these can be floats, you want to check whether they're equivalent
  up to an epsilon value. You don't want to use pure equality for floating point values...!

###### Line that passes through the most points
--------
# What line passes through the most points within a plane of points?

* Take all pairs of points and draw lines, then create a counts hash of lines.
  (May have to take care if you have float values; round to the nearest epsilon).

  Return the max line. Takes O(n^2) time, O(n^2) space.

###### Todos
----------
# Re-read the puzzle piece thing, and re-do LCA.
