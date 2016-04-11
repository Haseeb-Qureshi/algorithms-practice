require_relative '../data_structures/bst'

# Diameter of a tree is the longest path between two nodes in the tree

def height(root)
  return 0 if root.nil?
  left_height = height(root.left)
  right_height = height(root.right)
  [left_height, right_height].max + 1
end
# becomes O(n^2) if you compute diameter using separate height function, because
# recomputes heights repeatedly for the entire tree; becomes n^2 / 2 calculations

def diameter_and_height(root)
  return [0, 0] if root.nil?
  left_diameter, left_height = diameter_and_height(root.left)
  right_diameter, right_height = diameter_and_height(root.right)
  current_height = [left_height, right_height].max + 1
  max_diameter = [left_diameter, right_diameter, left_height + right_height + 1].max
  [max_diameter, current_height]
end
# compute both in the same function for O(n) diameter!
# the diameter is the max of the [best diameter in the left and right subtrees,
# and diameter rooted here: left.height + right.height + 1]

def max_diameter(root)
  diameter_and_height(root).first
end
