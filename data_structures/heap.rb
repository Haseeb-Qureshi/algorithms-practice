class Heap
  def initialize(vals = [], &prc)
    @store = []
    @prc = prc || proc { |a, b| a <=> b }
    vals.each { |val| insert(val) }
  end

  def size
    @store.size
  end

  alias_method :count, :size
  alias_method :length, :size

  def min
    @store.first
  end

  def insert(val)
    @store << val
    heapify_up!
    val
  end

  alias_method :<<, :insert
  alias_method :push, :insert

  def pop_min
    return @store.pop if @store.length <= 1
    min = @store.first
    @store[0] = @store.pop
    heapify_down!
    min
  end

  alias_method :pop, :pop_min

  def each_pop
    return enum_for(:each_pop) unless block_given?
    yield pop_min until size == 0
  end

  def empty?
    @store.empty?
  end

  private

  def heapify_up!
    current_idx = @store.length - 1
    while current_idx > 0
      if smaller_than?(@store[current_idx], @store[parent_idx(current_idx)])
        swap!(current_idx, parent_idx(current_idx))
        current_idx = parent_idx(current_idx)
      else
        break
      end
    end
  end

  def heapify_down!
    current_idx = 0
    while current_idx < @store.length - 1
      smallest_child = smaller_by_proc(children_idx(current_idx))
      if smallest_child && smaller_than?(@store[smallest_child], @store[current_idx])
        swap!(current_idx, smallest_child)
        current_idx = smallest_child
      else
        break
      end
    end
  end

  def smaller_than?(a, b)
    @prc.call(a, b) == -1
  end

  def smaller_by_proc(children)
    return children.first if children.size < 2
    c1, c2 = children
    smaller_than?(@store[c1], @store[c2]) ? c1 : c2
  end

  def parent_idx(i)
    i.zero? ? 0 : (i - 1) / 2
  end

  def children_idx(i)
    [(2 * i) + 1, (2 * i) + 2].select { |idx| idx < @store.length }
  end

  def swap!(i1, i2)
    @store[i1], @store[i2] = @store[i2], @store[i1]
  end
end
