# The thief has found himself a new place for his thievery again. There is only one entrance to this area, called the "root." Besides the root, each house has one and only one parent house. After a tour, the smart thief realized that "all houses in this place forms a binary tree". It will automatically contact the police if two directly-linked houses were broken into on the same night.
#
# Determine the maximum amount of money the thief can rob tonight without alerting the police.
#
# Example 1:
#      3
#     / \
#    2   3
#     \   \
#      3   1
# Maximum amount of money the thief can rob = 3 + 3 + 1 = 7.
# Example 2:
#      3
#     / \
#    4   5
#   / \   \
#  1   3   1
# Maximum amount of money the thief can rob = 4 + 5 = 9.

def rob(root)
  rob_here(root).max
end

def rob_here(root)
  return [0, 0] if root.nil?

  # if you rob this side
  left = rob_here(root.left)
  right = rob_here(root.right)

  rob_this_house = root.val + left.last + right.last # are forced to skip the next layer
  dont_rob_this_house = left.max + right.max # take the better choice of choosing to loot or not loot the house
  [rob_this_house, dont_rob_this_house]
end
