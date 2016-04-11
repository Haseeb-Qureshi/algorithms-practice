###### Trailing 0s in Factorial
--------
# Write an algorithm that computes the number of trailing 0s in N!

* 0s are produced by multiples of 5s and 2s. So you want to know how many 5s and
  10s are less than N. The number of 5s will be equal to the number of 10s plus
  one if the least significant digit of N is >= 5.

###### Sparse max
--------
# Write a function that computes the max of two numbers without using any
# comparators or any if-else logic.

* Look at the sign of a - b. This can be done by right-shifting a - b by 63, and
  inspecting the left-most bit (& with 1). If it's 0, a is bigger, if it's 1
  b is bigger. You can then return flip(lbit) * a + lbit * b

  Can implement flip with an XOR with 1.

###### Best sub-sorting indices
--------
# Given an array of integers, find the best N and M such that if you sorted
# all of the numbers between N and M, the entire array would be sorted. Find the
# smallest such difference between N and M.

* [3, 4, 7, 12, 11, 16, 18, 23, 27]

* The structure of the array must be: left-<out of order>-right, where left
  and right are both ascending and in sorted order.

* Grow the left and right sides of this one element at a time until they can
  grow no further.

  Then, shrink the sides until it's true that the max and min of the middle
  obey the rules: max must be less than right[0] and min must be greater than
  left[-1]. Keep shrinking until you can no longer shrink on either side, then
  return N and M.

###### Largest contiguous subsum
--------
# Find the largest contiguous subsum—return the sum.

* Kadane's algorithm. Go from left to right and start summing positive numbers.
  Only need to look at sum_so_far and best_sum. If the subsum so far is positive,
  it should always greedily include any previous subsum. One scan from left to right,
  and return the best sum.

###### rand7 from rand5
--------
# Given a function rand5 (which outputs a random number between 0-4), implement
# a rand7 function.

* Implement rand2 by taking rand5 and checking if it's {0, 1} or {2, 3}. Else,
  re-sample.

  Using rand2, you can implement rand8 by setting 3 bits with a rand2.
  I.e.,
        ```ruby
        num = rand2
        2.times do
          num << 1
          num | rand2
        end
        ```
  Implement rand7 by randomly sampling from rand8 unless it's 7.
