require_relative '../data_structures/arr'

def rotate!(matrix)
  (0...matrix.length / 2).each do |layer|
    first = layer
    last = matrix.length - 1 - layer
    (first...last).each do |i|
      middle = last - (i - first)

      top = matrix[first][i]

      matrix[first][i] = matrix[middle][first] # top <- left
      matrix[middle][first] = matrix[last][middle] # left <- bottom
      matrix[last][middle] = matrix[i][last] # bottom <- right
      matrix[i][last] = top # right <- top
    end
  end
  matrix
end

MATRIX.each { |line| p line }
puts "------------"
rotate!(MATRIX).each { |line| p line }
