###### Single array for three stacks
--------
# Describe how you'd use a single array to implement 3 stacks.

* Could have the index * 3 + stack_id to index into the 3 stacks. Takes
  max(a, b, c) space * 3. Would not be able to support nils, or use some kind of dummy value
  (randomly generated symbol) to represent nils.
* Could reverse the first stack and just put them all back to back, keeping
  track of indices. That allows you O(1) push and pop for the last stack, O(1)
  shift and unshift for the first stack (from the beginning), and O(a + b + c)
  for pushing and popping from the third stack.
* Otherwise, if you want to just statically generate the stack sizes, could have
  the entire set of stacks grow and increase organically. Lots of ways to do this.


###### MinStack
--------
# Write a stack that can pop, push, and access the min in O(1) time.

* Easiest way to do this is to have tuples on the stack: the value, and the min
  (which is calculated as [value, prev_min].min).
* Could save space by having a min_dynasty stack that only pushes new mins
  (with counts for repeats). When a new min arrives, it gets pushed onto the min
  stack with a count of 1. Thus, the min_dynasty stack will take asymptotically
  much less space given random input.


###### Queue w/ Two Stacks
--------
# Implement a queue using two stacks.

* In-stack, out-stack. Push to in-stack, when you want to pop, flip the in-stack
  to become the out-stack. Then dequeue by popping from the out-stack. O(1) enqueue,
  O(1) amortized dequeue.


###### Sort a stack
--------
# Sort a stack using only one auxiliary stack. No other data structures allowed.

* Assume my master stack is sorted. When I get a new item, I push it onto
  the working stack. If the item is greater than the last item on the master stack,
  push it onto the master stack and return.

  Otherwise, I store the new item in a variable and keep popping off the master stack
  and pushing onto the working stack until the last element on the master stack is less
  than my new item. Then I push on the item, and push on everything from the worker stack.

  This will take O(n) time per insertion in the worst case. It effectively becomes an
  insertion sort.
