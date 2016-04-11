require 'rbtree'
INPUT = [[6, 1, 3], [1, 3, 1], [2, 7, 3], [0, 8, 9], [5, 9, 1],
         [5, 0, 2], [3, 2, 6], [7, 2, 9], [6, 7, 5], [1, 2, 0], [3, 1, 1]]


# nlogn
def closest_k_points(points, k, origin = [0, 0, 0])
  tuples = points.map do |point| # linear time in points
    [dist(origin, point), point] # constant per point
  end
  tuples.sort_by(&:first).map(&:last).first(k) # sort all points, takes O(nlgn) time
end

#nlogk
def closest_k_points_faster(points, k, origin = [0, 0, 0])
  rbtree = MultiRBTree.new
  points.each do |point| # iterate n times
    rbtree[dist(origin, point)] = point # insert into a BST of at most size k ==> O(log k)
    rbtree.delete(rbtree.last[0]) if rbtree.size > k # also deleting from a BST bounded at size k ==> O(log k)
  end
  rbtree.values # in-order traversal of tree in O(k); total time = O(nlogk)
end

def dist(p1, p2)
  (p1[0] - p2[0]) ** 2 + (p1[1] - p2[1]) ** 2 + (p1[2] - p2[2]) ** 2
end

p closest_k_points(INPUT, 4)
p closest_k_points_faster(INPUT, 4)
