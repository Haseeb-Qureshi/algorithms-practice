class Array
  def swap!(i1, i2)
    self[i1], self[i2] = self[i2], self[i1]
  end
end

UNSORTED_ARR = (0...10).to_a.shuffle
SORTED_ARR = (0...10).to_a
MATRIX = [
  [1,   2,  3,  4],
  [5,   6,  7,  8],
  [9,  10, 11, 12],
  [13, 14, 15, 16]
]
