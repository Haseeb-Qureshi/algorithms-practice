class Vertex
  attr_reader :val, :out_edges, :in_edges
  def initialize(val, out_edges = [], in_edges = [])
    @val = val
    @in_edges = in_edges
    @out_edges = out_edges
  end

  def inspect
    @val.to_s
  end

  def to_s
    inspect
  end

  def edges
    @in_edges + @out_edges
  end
end

class Edge
  attr_accessor :from, :to, :weight
  def initialize(from, to, weight = 1)
    @from, @to = from, to
    @from.out_edges << self
    @to.in_edges << self
    @weight = 1
  end

  def inspect
    "#{@from} => #{@to}"
  end

  def to_s
    inspect
  end

  alias_method :cost, :weight
end

a = Vertex.new(:a)
b = Vertex.new(:b)
c = Vertex.new(:c)
d = Vertex.new(:d)
e = Vertex.new(:e)
f = Vertex.new(:f)
g = Vertex.new(:g)
h = Vertex.new(:h)
j = Vertex.new(:j)
i = Vertex.new(:i)

Edge.new(a, b, 3)
Edge.new(a, j, 2)
Edge.new(a, c, 9)
Edge.new(c, h, 2)
Edge.new(b, f, 1)
Edge.new(b, e, 4)
Edge.new(e, f, 2)
Edge.new(d, e, 3)
Edge.new(d, g, 6)
Edge.new(i, d, 5)
Edge.new(h, i, 1)
Edge.new(c, d, 2)

#    j
#    ^
#  2 |  3
#    a -> b \
#    |  4 |  \ 1
#    |    v   v
#  9 |    e -> f
#    |    ^ 2
#    v    | 3
#    c -> d  --> g
#  2 | 2  ^   6
#    v    | 5
#    h -> i
#      1
GRAPH = [a, e, d, c, j, i, g, f, h, b]
