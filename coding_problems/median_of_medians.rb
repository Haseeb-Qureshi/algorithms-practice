require_relative '../data_structures/arr'
require_relative 'insertion_sort'

def median_of_medians(arr, n = 5)
  return median_of_slice(arr) if arr.length <= 5
  slice_start_points = (0...arr.length).step(5).to_a
  medians = slice_start_points.map { |start| median_of_slice(arr, start, 5) }
  median_of_medians(medians)
end

def median_of_slice(arr, start = 0, len = arr.length)
  len = arr.length - start if start + len > arr.length
  arr[start...start + len].insertion_sort![len / 2]
end
