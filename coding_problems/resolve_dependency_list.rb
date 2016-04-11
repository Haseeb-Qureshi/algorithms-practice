DEP_LIST = {
  A: [:B],
  B: [:E, :F],
  D: [:C],
  E: [:G],
}
    # G =>  E
    #       |
    #       v
    # F =>  B => A
    #
    # C => D

def topo_sort(dependencies) # tarjan's algorithm
  dependencies.default = [] # no need for #default_proc because array never gets mutated
  seen = {}
  ordering = []
  dependencies.keys.each do |vertex|
    resolve!(vertex, dependencies, ordering, seen) unless seen[vertex]
  end
  ordering
end

def resolve!(vertex, dependencies, ordering, seen, previously_visited = {})
  dependencies[vertex].each do |dependency|
    raise "Cycle detected" if previously_visited[dependency]
    next if seen[dependency]
    seen[dependency] = true
    previously_visited[dependency] = true
    resolve!(dependency, dependencies, ordering, seen, previously_visited)
  end
  seen[vertex] = true
  ordering.unshift(vertex)
end

p topo_sort(DEP_LIST)
