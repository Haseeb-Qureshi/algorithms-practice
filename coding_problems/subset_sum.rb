require_relative '../data_structures/arr'
require 'set'

def subset_sum_dp_arr(arr, n)
  return [] if n == 0
  dp_arr = Array.new(arr.length + 1) { Array.new(n + 1, false) }
  dp_arr.each { |arr| arr[0] = true }

  1.upto(dp_arr.length - 1) do |i|
    1.upto(dp_arr[0].length - 1) do |j|
      if arr[i - 1] > j
        dp_arr[i][j] = dp_arr[i - 1][j]
      else
        dp_arr[i][j] = dp_arr[i - 1][j] || dp_arr[i - 1][j - arr[i - 1]]
      end
    end
  end
  dp_arr
end

def subset_sum(arr, n)
  dp_arr = subset_sum_dp_arr(arr, n)
  return nil unless dp_arr.last.last

  i, j = dp_arr.length - 1, dp_arr[0].length - 1

  subset_elems = []
  while i > 0 || j > 0
    i -= 1 until !dp_arr[i - 1][j] || i == 0
    break if [i, j].all?(&:zero?)
    j -= arr[i - 1]
    subset_elems << arr[i - 1]
  end
  "#{subset_elems}: #{n}, #{subset_elems.inject(:+)}"
end


p subset_sum([4, 7, 12, 8, 20, 3, 14]*15, 627)
