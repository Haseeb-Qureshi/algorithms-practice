# The night sky can be modeled as an infinite 2D plane. There are N stars at distinct positions on this plane, the ith of which is at coordinates (Xi, Yi).
#
# A boomerang constellation is a pair of distinct equal-length line segments which share a single endpoint, such that both endpoints of each segment coincide with a star's location.
#
# Two boomerang constellations are distinct if they're not made up of the same unordered pair of line segments. How many distinct boomerang constellations can you spot?
#
# Input
# Input begins with an integer T, the number of nights on which you look out at the sky. For each night, there is first a line containing the integer N. Then, N lines follow, the ith of which contains the space-separated integers Xi and Yi.
#
# Output
# For the ith night, print a line containing "Case #i: " followed by the number of boomerang constellations in the night sky.
#
# Constraints
# 1 ≤ T ≤ 50
# 1 ≤ N ≤ 2,000
# -10,000 ≤ Xi, Yi ≤ 10,000
# Explanation of Sample
# On the first night, every pair of stars is a unique distance apart, so there are no boomerang constellations. On the second night, there are 4 boomerang constellations. One of them consists of the line segments (0,0)-(0,2) and (0,2)-(0,4).

points = <<-STR
5
3
0 0
0 1
0 3
5
0 0
0 1
0 2
0 3
0 4
4
0 0
0 100
100 0
100 100
4
0 0
-3 4
0 5
-5 0
6
5 6
6 5
7 6
6 7
7 8
8 7
STR

def calc_dist(point1, point2)
  x1, y1 = point1
  x2, y2 = point2
  Math.sqrt((x1 - x2) ** 2 + (y1 - y2) ** 2)
end

all_points = all_points.lines.map(&:chomp).map(&:split).map { |arr| arr.length > 1 ? arr.map(&:to_i) : arr[0].to_i }
num_nights = all_points.shift
num_nights.times do |n|
  boomerangs = 0
  num_points = all_points.shift
  this_nights_points = all_points.take(num_points)
  all_points = all_points.drop(num_points)
  distances = Hash.new { |h, k| h[k] = Hash.new(0) }

  this_nights_points.each_with_index do |point, i|
    this_nights_points.each_with_index do |point2, j|
      dist = calc_dist(point, point2)
      distances[point][dist] += 1
    end
    distances[point].each do |distance, count|
      boomerangs += count * (count - 1) / 2
    end
  end
  p "Num boomerangs for #{n + 1}: #{boomerangs}"
end
