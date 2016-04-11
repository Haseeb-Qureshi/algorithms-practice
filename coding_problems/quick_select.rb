require_relative '../data_structures/arr'

def quick_select!(arr, k, start = 0, len = arr.length)
  raise ArgumentError unless k.between?(1, arr.length)
  pivot_idx = partition!(arr, start, len)
  return arr[pivot_idx] if pivot_idx == k - 1

  left_start = start
  left_len = pivot_idx - start
  right_start = pivot_idx + 1
  right_len = len - left_len - 1

  if pivot_idx >= k
    quick_select!(arr, k, left_start, left_len)
  else
    quick_select!(arr, k, right_start, right_len)
  end
end

def partition!(arr, start, len)
  pivot = start
  arr.swap!(start, rand(start...start + len))
  (start...start + len).each do |i|
    if arr[i] < arr[pivot]
      arr.swap!(pivot + 1, i)
      arr.swap!(pivot, pivot + 1)
      pivot += 1
    end
  end
  pivot
end

arg = ARGV[0].to_i if ARGV[0]
p quick_select!((1..100).to_a.shuffle, ARGV[0] ? ARGV[0].to_i : 50 )
