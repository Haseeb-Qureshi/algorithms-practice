require_relative '../data_structures/heap'
require_relative '../data_structures/graph'
require 'set'

def minimum_spanning_tree(graph)
  source = graph.shuffle!.pop
  tree = []
  spanned_over = Set.new([source])
  frontier = Heap.new do |a, b|
    a.first <=> b.first
  end
  source.edges.each { |edge| frontier << [edge.cost, edge] }

  until spanned_over.size == graph.size + 1
    cost, new_edge = frontier.pop_min
    next if [new_edge.to, new_edge.from].all? { |v| spanned_over.include?(v) }
    # p "Next edge: #{new_edge}"
    vertex = unspanned_vertex(new_edge, spanned_over)
    spanned_over << vertex
    tree << new_edge

    # p "Seen set: #{spanned_over.to_a}"
    # p "Unseen vertex: #{vertex}"
    vertex.edges.each do |edge|
      next_vertex = edge.to == vertex ? edge.from : edge.to
      next if spanned_over.include?(next_vertex)

      frontier << [edge.cost, edge] # decrease key here!
    end
    puts "--------------\n"
  end

  # p spanned_over
  # p tree.map(&:cost).inject(:+)
  # p [spanned_over.length, tree.length, frontier.length]
  tree
end

def unspanned_vertex(edge, spanned_over)
  spanned_over.include?(edge.to) ? edge.from : edge.to
end

def mst(graph)
  minimum_spanning_tree(graph)
end

p mst(GRAPH)
