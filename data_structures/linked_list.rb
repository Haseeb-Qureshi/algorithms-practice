class Link
  include Enumerable
  attr_accessor :val, :next, :prev
  def initialize(val = nil, next_val = nil, prev_val = nil)
    @val, @next, @prev = val, next_val, prev_val
  end

  def inspect
    "#{self.prev.val} #{self.val} #{self.next.val}"
  end

  def last
    current = self
    while current.next
      current = current.next
    end
    current
  end

  def each
    current = self
    while current
      yield current
      current = current.next
    end
    current
  end
end

class NilClass
  def val
    nil
  end
end

class LinkedList
  include Enumerable
  def initialize(vals = [])
    @head = Link.new
    @tail = Link.new(nil, nil, @head)
    @head.next = @tail
    vals.each { |val| push(val) }
  end

  def each
    current = @head.next
    while current != @tail
      yield current
      current = current.next
    end
  end

  def [](idx)
    each_with_index { |link, j| return link if j == idx }
    nil
  end

  def shift
    return nil if empty?
    first_link = @head.next
    @head.next = first_link.next
    first_link.next.prev = @head
    first_link
  end

  def pop
    return nil if empty?
    last_link = @tail.prev
    @tail.prev = last_link.prev
    last_link.prev.next = @tail
    last_link
  end

  def push(val)
    new_link = Link.new(val, @tail, @tail.prev)
    @tail.prev.next = new_link
    @tail.prev = new_link
    new_link
  end

  def unshift(val)
    new_link = Link.new(val, @head.next, @head)
    @head.next.prev = new_link
    @head.next = new_link
    new_link
  end

  def include?(val)
    any? { |link| link.val == val }
  end

  def empty?
    @head.next == @tail && @tail.prev == @head
  end

  def inspect
    to_a.inspect
  end

  def to_a
    inject([]) { |arr, el| arr << el.val }
  end

  def first
    self[0]
  end
end

LIST = LinkedList.new([1, 2, 4, 8, 16])
CYCLIC_LIST = LinkedList.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
CYCLIC_LIST[8].next = CYCLIC_LIST[3]

link2 = Link.new(2)
link3 = Link.new(1)
link2.next = link3
SLL1 = Link.new(3)
SLL1.next = link2

link2 = Link.new(5)
link3 = Link.new(4)
link2.next = link3
SLL2 = Link.new(6)
SLL2.next = link2
