# You have k lists of sorted integers. Find the smallest range that includes at least one number from each of the k lists.
#
# For example,
# List 1: [4, 10, 15, 24, 26]
# List 2: [0, 9, 12, 20]
# List 3: [5, 18, 22, 30]

The smallest range here would be [20, 24] as it contains 24 from list 1, 20 from list 2, and 22 from list 3.

Start by constructing a heap out of the first 3 elements (keep track of the min and max yourself). Assume no duplicates, otherwise counts

Pop and insert from the heap based on which list it came from, entirely process the list, then clear out the heap.

That should run in O(nlg(k)) time. Space should be O(k).
