###### Anagram sort!
--------
# Write a function that sorts strings so that anagrams are next to each other.

* First, sort by length. (Anagrams must be the same length.) This takes nlogn time.

* Then, create a new version of the array with each of the strings sorted.
  (Takes n * k * lg(k) time where k is the average length of a string).

* Internally to the lengths, sort each of the lengths. Using this array of indices,
  reorder the original array. O(n) time here.

* Total time should be O(n * (lg(n) + k * lg(k))) time.

* Could also do this using hash tables for character counts to group together the
  sorted anagrams, then output each set of anagrams, and concatenate them into an
  array. This would take O(n * k * lg(k)) time.

###### Find element in rotated array
--------
# Given a sorted array that has been rotated by some amount, write an algorithm
# to find an element as quickly as possible.

* B-search to find where the array has been rotated from. Then create a wrapper
  around the array with that being the logical start index. Then simply b-search
  through the array.

* If the array is: [6, 0, 1, 2, 3, 4, 5] — look at the middle and see if the left-most
  element is greater. If it is, then you know the rotation origin must be on the left
  side; recurse. Otherwise, the rotation must take place on the right side.

* With duplicates, this breaks down to O(n) time.

###### Find among empty strings
--------
# Given a sorted array of strings that is interspersed with empty strings, write
# a function that finds a string quickly.

* Create an array of all of the actual string indices in the array. Then b-search
  through the secondary array, using strings from the original array for
  comparators. Takes O(n) space where n is the number of non-empty strings,
  and O(lg(n)) time.

* Could also just do a b-search that finds the first non-empty string from the
  middle. This is better because doesn't require an O(n) pre-processing step.
  Still O(n) time in the worst-case, however.

###### Find in sorted matrix
--------
# Given an N x M matrix where each row and each column is in sorted order,
# write a function that finds an element X.

* Can do a simple binary search algorithm to b-search through any row whose
  start and end could conceivably contain element X. Takes Mlog(N) in the
  worst case.

* Can use some simple inferences to write an algorithm here:
  * First, if a row starts with a number greater than X, X must be above it.
  * If a row ends with a number less than X, X must be below it.
  * If a column starts with a number greater than X, X must be to the left.
  * If a column ends with a number less than X, X must be to the right.

* Thus, you recursively narrow down rows and columns until you find the exact
  location of the element.

###### Circus tower
--------
# A circus is designing a tower of clowns standing on each other. A clown standing
# atop another must be both shorter and lighter than the one he's standing on.
# Write an algorithm that determines the largest possible number of people in a
# valid tower.

* We can transform this problem into this one: you have a list of tuples as inputs:
  [1, 2], [3, 2], [5, 4], [7, 2], [9, 1], [11, 8]

  Find the largest valid sequence that is continually increasing in both el[0] and el[1].

* This is a special case of the **longest increasing subsequence** problem.
  This can be solved using dynamic programming in one dimension, like so:
  Given the input array [1, 2, 4, 6, 3, 5, 9], you compute the largest increasing
  subsequence which *ends* at each index, and store each in a cache.

  So the largest increasing subsequence which ends at index 0, at index 1, at index 2,
  etc. This is done by looking at all of the previous optimal subsequences whose final
  element is less than or equal to the item you're looking at, and appending your
  element to it. This takes O(n^2) time and O(n) space.

* You can extend this to the problem by simply sorting by the first element,
  and then applying the longest increasing subsequence algorithm in the second
  element. This takes O(nlg(n)) + O(n^2) time, which simply reduces to O(n^2).
