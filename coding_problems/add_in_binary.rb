def add(x, y)
  return x if y == 0
  carry = (x & y) << 1
  sum = x ^ y
  add(sum, carry)
end
