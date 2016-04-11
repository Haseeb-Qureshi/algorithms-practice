# Definition for a point.
class Point
  attr_accessor :x, :y
  def initialize(x = 0, y = 0)
    @x = x
    @y = y
  end

  def inspect
    "{#{x}, #{y}}"
  end
end

require 'set'
class Line
  ROUND_AMOUNT = 4
  attr_accessor :slope, :y_intercept, :x_intercept
  def initialize(p1, p2)
    @slope = calc_slope(p1, p2)
    @y_intercept = calc_intercept(p1)
    @points = Set.new([p1, p2])
  end

  def num_points
    @points.size
  end

  def insert_point(point)
    @points << point
  end

  def calc_slope(p1, p2)
    y = p1.y - p2.y
    x = p1.x - p2.x
    x.zero? ? Float::INFINITY : Rational(y, x)
  end

  def calc_intercept(point)
    if @slope == Float::INFINITY
      @x_intercept = point.x
      nil
    else
      point.y - @slope * point.x
    end
  end

  def hash
    [@slope, @y_intercept, @x_intercept].hash
  end

  def inspect
    [@slope, @y_intercept].inspect
  end

  def ==(other_line)
    other_line.is_a?(Line) && ivars == other_line.ivars
  end
end

def uniq(points)
  points.map { |point| [point.x, point.y] }.uniq
end

def max_points(points)
  return points.size if uniq(points).size <= 1

  lines = {}
  (0...points.length).each do |i|
    (i + 1...points.length).each do |j|
      new_line = Line.new(points[i], points[j])

      lines[new_line.hash] ||= new_line
      lines[new_line.hash].insert_point(points[i])
      lines[new_line.hash].insert_point(points[j])
    end
  end

  max_line = lines.values.map(&:num_points).max || 0
end
