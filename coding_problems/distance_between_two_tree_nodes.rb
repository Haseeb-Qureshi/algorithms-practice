require_relative '../data_structures/bst'
# distance between two nodes in a binary tree

def distance(node1, node2)
  return -1 if [node1, node2].any?(&:nil)
  return 0 if node1 == node2
  first_path = path_to_root(node1).reverse!
  second_path = path_to_root(node2).reverse!
  shorter_path = [first_path, second_path].min_by(&:length)
  shorter_path.each_index do |i|
    return first_path.length + second_path.length - i * 2 if first_path[i] != second_path[i]
  end
end

def path_to_root(node)
  path = []
  while node.parent
    node = node.parent
    path << node
  end
  path
end

# what if you have no parent pointers?

def distance2(root, node1, node2)
  return nil if [node1, node2, root].any?(&:nil?)

  paths_hash = {}
  dfs!(root, node1, node2, paths_hash)
  first_path, second_path = paths_hash.values
  shorter_path = [first_path, second_path].min_by(&:length)

  shorter_path.each_index do |i|
    return first_path.length + second_path.length - i * 2 if first_path[i] != second_path[i]
  end
  nil
end

def dfs!(root, node1, node2, paths, path = [root])
  return path.pop if root.nil?

  if [node1, node2].include?(root)
    paths[root] = path.dup
  else
    dfs!(root.left, node1, node2, paths, path << root.left)
    dfs!(root.right, node1, node2, paths, path << root.right)
  end
  path.pop
end

bt = BINARY_TREE
p distance2(bt, bt.left.right, bt.right.left)
