###### Remove Duplicates
--------
# Remove duplicates from an unsorted linked list.

* Create a hash map, iterate over the linked list, and keep track of a count of
* each value. If the value is 2 or more, just leave it as 2.

* Then walk through the LL once more, deleting each link whose value appears
* twice in the hash map. This should take O(n) time and O(n) space.


###### Kth to last
--------
# Write an algorithm that finds the K-th to last element in a linked list.

* Assuming the LL is not doubly-linked (much easier), start from the beginning
* and count to the end. This will take O(n) time. Then, just iterate to count - k.
* This will take 2n - k steps, for a total of O(n) time, O(1) space.

* A better algorithm would be to wait until the first runner gets K steps forward,
* and then allocate a second runner at the first link. Then increment them both
* step-by-step until the later runner gets to the end. Then return whatever the
* first runner is on.


###### Delete a node
--------
# Write an algorithm that deletes a node in a SLL, given only access to that node.

* Copy the data of the next node into this node, and then delete the next node.
* I.e., our next becomes its next, and its data becomes our data. The next node
* then becomes deallocated.

* If the node is the last node in the list, then this cannot be done. Perhaps you
* can mark it as a dummy, however.


###### Partition around a value
--------
# Write an algorithm that partitions a linked list around a value x.

If DLL:
* Need two pointers: i and the value. Can imagine the value walking down the LL.
* Everything smaller than x (@ index i) needs to be re-wired to be immediately
  before the imaginary x. Once i reaches the end, the entire LL is partitioned.

If SLL:
* Construct two lists—everything less than x, and everything greater than x.
* Append the two lists to each other.


###### Add LL numbers
--------
# Write a function that given two linked lists storing two reversed numbers
# (123 => 3-2-1), add the numbers together and return the sum as a LL (forward).

* Write helper functions that parse a backwards LL into a number (just multiply
  each digit by successively larger powers of 10).
* Then add the numbers together, and construct a linked list going from
  largest digit down to smallest. This can be done by iterating down powers of 10,
  then modding by the power of 10 and decrementing the power of 10.


###### Is palindrome?
--------
# Implement a function to check if a linked list is a palindrome. Assume a SLL.

* Could turn it into an array and then check if the array is a palindrome.
  Fairly trivial, would take O(n) time and O(n) space.

* Actually, only need to reverse the first half and check if it's the same
  as the second half. Use a tortoise/hare and push everything the tortoise
  sees onto a stack (first half). Once the hare gets to the end, start popping
  from the stack and see if it matches every element the tortoise sees going
  forward. If so, it's a palindrome. O(n) time and space as well.
