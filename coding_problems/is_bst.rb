require_relative '../data_structures/bst'

def is_bst?(root, lower_bound = -Float::INFINITY, upper_bound = Float::INFINITY)
  return true if root.nil?
  return false unless root.val >= lower_bound && root.val < upper_bound
  is_bst?(root.left, lower_bound, root.val) && is_bst?(root.right, root.val, upper_bound)
end

p is_bst?(BINARY_SEARCH_TREE) == true
p is_bst?(BINARY_TREE) == false
