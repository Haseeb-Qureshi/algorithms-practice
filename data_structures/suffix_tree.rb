class SuffixNode
  attr_accessor :parent, :children, :terminator
  def initialize(parent = nil, children = {}, terminator = false)
    @parent = parent
    @children = children
    @terminator = terminator
  end

  def has_str?(str, i = 0)
    raise ArgumentError if i > str.length
    return true if i == str.length

    @children[str[i]] ? children[str[i]].has_str?(str, i + 1) : false
  end
end

class SuffixTree
  def initialize(root = SuffixNode.new)
    @root = root
  end

  def build_tree!(str)
    str.length.times { |i| insert(str[i..-1]) }
  end

  def has_str?(str)
    @root.has_str?(str)
  end

  private

  def insert(str)
    current = @root
    str.each_char do |char|
      current.children[char] ||= SuffixNode.new(current)
      current = current.children[char]
    end
    current.terminator = true
  end
end

# Substring query in O(L) time
# Find first occurrence of substring in O(L) time
# Find all n occurrences of substring in O(L + n) time
# Find longest common substring of two strings in O(n1 + n2) time
# Find longest repeated substring in O(n) time
