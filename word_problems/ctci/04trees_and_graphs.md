###### Is balanced tree?
--------
# Write a function that given a tree, checks whether it's balanced (the height of
# the left subtree differs from the height of the right subtree <= 1).

* Could write a #depth function that recursively computes the depths. However,
  this would lead to O(n^2) behavior in a degenerate tree: each successive call
  would create n, n - 1, n - 2, n - 3 work that would be repeated at each level.

  Can improve this using a cache? For each node, in a depth-first manner, set the
  depth in a cache after it's calculated. This would then take O(n) time and O(n)
  space.

  We could also write a function that just checks the balance of a BST at the same
  time as it computes the relative depths, and then returns early if it ever gets
  an imbalance.  This takes O(n) time and O(d) space, where d is the depth of the
  tree.

###### Path between nodes?
--------
# Given a directed graph, write an algorithm that determines whether there exists
# a path between two nodes.

* Easiest way to do this is via a basic search algorithm, say BFS. Find everything
  reachable in successive waves, using a cache of stuff you've already seen so as to
  ignore cycles. If you find the second node, then there is a pass. Takes linear time
  and linear space.

###### Perfect BST
--------
# Given a sorted array, write an algorithm that constructs an optimal BST (that is,
# with the shortest depth).

* Take the middle element of the range within the array and construct a BST out of
  it. Then recursively set the left and right subparts to have BSTs constructed
  out of them (without creating new arrays, so as to minimize space; just use indices).

* The middle element is the root, and the left is the root of the left subarray and the
  right is the root of the right subarray.

  Takes O(n) time and O(n) space if you use indices.

###### BST => Linked List by Depth
--------
# Given a BST, construct a linked list out of all of the nodes in the tree, one
# layer of depth at a time.

* Sounds like a job for a BFS! Start with the root, and put each of its children
  in the queue. For each node, shovel its children into the queue. Construct a LL
  out of the contents. This takes O(n) time and O(n) space.

###### Next successor
--------
# Write an algorithm that given a node in a BST, finds its successor in an
# in-order traversal.

      left, root, right
    L | R   L | R   L | R

* Return the left-most node in the right subtree. If there is no right subtree, then
  need to trace back all the way up and see if there's any place where we're the left
  child and we can go right.

  If we're the right child all the way up, then there's no successor. But if there's
  another right child, then take the left-most node in that right subtree.

  Takes O(d) time, O(1) space.

###### LCA
--------
# Find the lowest common ancestor of a node.

* First, ensure that the two nodes are contained somewhere in the tree. (O(n)).
  Else, return nil.

* Return the root if one of the elements is the root (assuming a node itself counts
  as an ancestor). Else, see if they're both contained on the same side. If they're
  both on different sides, return the root (it's the splitting element and hence the
  LCA). Else, recurse on the side they both live on.

* Takes O(n) time and O(lg(n)) space.

###### T1 subtree of T2?
--------
# Write an efficient algorithm that, given T1 with millions of nodes, and T2
# with hundreds of nodes, determines whether T2 is a subtree of T1.

* DFS through T1 looking for the root of T2? If you find it, then check if the
  subtrees are isomorphic using a 1-1 DFS and check for values.

  This takes O(n + k * m) where n is the size of T1, m is the size of T2, and k
  is the number of matches with the root.

  Space is logarithmic: O(log(n) + log(m)).

  Worst case is O(n * m), so quadratic.

* Linear algorithm is to produce the in-order and pre-order traversals of the
  tree. Each of these can be produced in linear time. You can then check if
  the in-order traversal of the second string is a substring of the first in-order,
  and the pre-order traversal of the second string is a substring of the first pre-order.

  (Note: you must augment the traversals by padding them with values for NULL pointers,
  to distinguish between left-right symmetric trees.)

  Using suffix trees or KNP/BMH, you can do this substring query in linear time.
  Thus, overall time complexity is O(n + m), but also O(n + m) memory.


###### All Paths which Sum to N
--------
# Given a binary tree, write an algorithm that prints all paths (not necessarily
# ending at the root or at a leaf) that sum to a value N.

* Potentially cubic time and space (say a bunch of nodes with value 0 which
  sum to 0). This is because we have n many DFSes, and each DFS can trigger
  a print of the path. The total size of paths could be then, in the worst case,
  O(n^3)

* You need to DFS from each node and return each path if it sums up to that
  point, along with the sum thus far. You're going to want to pass the path and sum
  through the DFS. If the path sums up to N at that point, copy the path and shovel
  it into a shared paths object.

  At the end of each recursion, pop from the path to maintain the proper paths
  through the stack.
