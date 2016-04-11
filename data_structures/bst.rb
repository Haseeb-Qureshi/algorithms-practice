class BST
  attr_accessor :parent, :val, :left, :right
  def initialize(val, parent = nil, left = nil, right = nil)
    @val = val
    @parent = parent
    @left = left
    @right = right
  end

  def include?(val)
    return true if val == @val

    if val > @val
      @right ? @right.include?(val) : false
    else
      @left ? @left.include?(val) : false
    end
  end

  def insert(val)
    if val.is_a?(Array)
      val.each { |v| insert(v) }
      return self
    end

    if val > @val
      @right ? @right.insert(val) : @right = BST.new(val, self)
    else
      @left ? @left.insert(val) : @left = BST.new(val, self)
    end
    self
  end

  def inspect
    in_order.join(" ")
  end

  alias_method :<<, :insert
  alias_method :push, :insert

  def min
    left_most.val
  end

  def max
    right_most.val
  end

  def in_order(level = 0)
    traversal = []
    traversal += @left.in_order(level + 1) if @left
    traversal << "#{'-' * level}#{@val}#{'-' * level}"
    traversal += @right.in_order(level + 1) if @right
    traversal
  end

  def pre_order
    traversal = []
    traversal << @val
    traversal += @left.in_order if @left
    traversal += @right.in_order if @right
    traversal
  end

  def post_order
    traversal = []
    traversal += @left.in_order if @left
    traversal += @right.in_order if @right
    traversal << @val
    traversal
  end

  private

  def right_most
    current = self
    current = current.right while current.right
    current
  end

  def left_most
    current = self
    current = current.left while current.left
    current
  end
end

class BT < BST
  def include?(val)
    return true if @val == val
    [@left, @right].compact.any? { |child| child.include?(val) }
  end
end

BINARY_SEARCH_TREE = BST.new(8).insert([4, 12, 6, 16, 2, 9])
       #  BST
    #      8
    #   4     12
    # 2   6  9  16

BINARY_TREE = BT.new(8)
bt = BINARY_TREE
bt.right = BT.new(4, bt)
bt.left = BT.new(2, bt)
bt.right.right = BT.new(6, bt.right)
bt.right.left = BT.new(1, bt.right)
bt.left.left = BT.new(12, bt.left)
bt.left.right = BT.new(9, bt.left)
      #  binary tree (not BST)
  #         8
  #     2       4
  #  12   9   1   6
