require_relative '../data_structures/arr'

def max_windowed_range(arr, window_size)
  arr.each_cons(window_size).map { |window| window.max - window.min }.max
end

def max_windowed_range2(arr, window_size)
  queue = MinMaxQueue.new(arr.first(window_size))
  max_range = queue.max - queue.min

  arr[window_size..-1].each do |el|
    queue.shift
    queue.push(el)
    max_range = [max_range, queue.max - queue.min].max
  end

  max_range
end

class MinMaxQueue
  def initialize(initial_vals = [])
    @queue = []
    @min_dynasties = []
    @max_dynasties = []
    initial_vals.each { |val| push(val) }
  end

  def push(el)
    @min_dynasties.pop while @min_dynasties.any? && el < @min_dynasties.last
    @max_dynasties.pop while @max_dynasties.any? && el > @max_dynasties.last
    [@queue, @min_dynasties, @max_dynasties].each { |store| store.push(el) }
  end

  def min
    @min_dynasties.first
  end

  def max
    @max_dynasties.first
  end

  def shift
    @min_dynasties.shift if @min_dynasties.first == @queue.first
    @max_dynasties.shift if @max_dynasties.first == @queue.first
    @queue.shift
  end
end
#
# (n - k) * k
# nk - k^2

p max_windowed_range([4, 6, 12, 2, 0, 5, 20, 18, 30, 13], 2)
p max_windowed_range2([4, 6, 12, 2, 0, 5, 20, 18, 30, 13], 2)
