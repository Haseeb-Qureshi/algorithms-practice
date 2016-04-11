###### Add in binary
--------
# Implement addition without the addition operator.
* Add the sum (without carrying) and the carry (without summing).
* Carry can be computed by &'ing (1 + 1 = 2), and left-shifting one (where it
  carries from). The sum itself, sans carries, is just an XOR. Then recursively
  add the sum to the carry.
    ```ruby
      def add(x, y)
        return x if y == 0
        carry = (x & y) << 1
        sum = x ^ y
        add(sum, carry)
      end
    ```
###### Sample(n)
--------
# Write a function that generates a sample of K integers from an array of size
# N in linear time.

* Reservoir sampling: initialize an array wherein you copy each element from the
  beginning of the array. Then, iterate from K to N (i) and generate a random number
  j between 0 and i inclusive. If j < K, then swap the random element with arr[i].

###### Shortest distance in file
--------
# You have a large text file containing words. What's the shortest distance between
# words N and M anywhere in the file? What if we wanted to query repeatedly?

* First, just scan through the file and have last_pos_n, and last_pos_m. As soon
  as you see a new minimum distance between the two, update it.

* For repeated queries, create an array of indices for each word (should be sorted),
  in a hash map. Then, merge the two arrays, but marking each with which array it
  came from. Then iterate and check side-by-side pairs. Those pairs should be the
  the closest elements.

###### Smallest N elements
--------
# Find all of the smallest M elements from an array of size N.

* Two approaches: one, a maxheap, which will take Nlog(M) time.

* We insert into the maxheap, and delete the max element repeatedly once it
  reaches size M. This will delete all of the N - M biggest elements, leaving
  only the M smallest.

* Second approach is quickselect. Quickselect over the array, and find the Mth
  element in the array. Once it's partitioned, just choose the left side.
  Linear time, O(1) space.

###### Longest word made of other words
--------
# Given a list of words, find the longest word made of other words in the list.

* For each word, call subwords on it, which looks up to see if it's in your list
  (or in your cache). If not, recurse on it to see if it's made of subwords. If
  so, mark it as being so and so long.
