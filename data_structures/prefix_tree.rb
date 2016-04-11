class PrefixNode
  attr_accessor :parent, :children, :terminator
  def initialize(parent = nil, children = {}, terminator = false)
    @parent = parent
    @children = children
    @terminator = terminator
  end

  def has_string?(str, i = 0)
    raise ArgumentError if i > str.length
    return @terminator if i == str.length

    @children[str[i]] ? children[str[i]].has_string?(str, i + 1) : false
  end

  def inspect
    @children.to_s
  end
end

class PrefixTree
  attr_reader :root
  def initialize(root = PrefixNode.new)
    @root = root
  end

  def add_str(str)
    current = @root
    str.each_char do |char|
      current.children[char] ||= PrefixNode.new(current)
      current = current.children[char]
    end
    current.terminator = true
  end

  def has_string?(str)
    @root.has_string?(str)
  end
end

# Can check in O(L) time whether a string matches any string in a set,
# can also do auto-complete and see words that are one letter away
