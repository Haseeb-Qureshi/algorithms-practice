require_relative '../data_structures/bst'

def lca_with_parents(node1, node2)
  return nil if [node1, node2].any?(&:nil?)
  node1_parents = get_parent_path(node1)
  node2_parents = get_parent_path(node2)
  [node1_parents, node2_parents].min_by(&:length).each_index do |i|
    return node1_parents[i] if node1_parents[i] == node2_parents[i] && node1_parents[i + 1] != node2_parents[i + 1]
  end
  nil
end

def get_parent_path(node)
  current = node
  path = []
  until current.nil?
    path << current
    current = current.parent
  end
  path.reverse
end


def lca(root, node1, node2)
  return root if node1 == root || node2 == root

  one_on_left = contains?(root.left, node1)
  two_on_left = contains?(root.left, node2)

  return root if one_on_left != two_on_left
  both_side = one_on_left ? root.left : root.right
  lca(both_side, node1, node2)
end

def contains?(root, node)
  return false if root.nil?
  return true if root == node
  contains?(root.left, node) || contains?(root.right, node)
end

# diff sides
# same sides
# root and subtree

bt = BINARY_TREE
node1 = bt.right.right
node2 = bt.left.right
node3 = bt.right.left
root = bt

p lca_with_parents(node1, node2) == root
p lca_with_parents(node1, node3) == root.right
p lca_with_parents(node1, root) == root

p lca(root, node1, node2) == root
p lca(root, node1, node3) == root.right
p lca(root, node1, root) == root
