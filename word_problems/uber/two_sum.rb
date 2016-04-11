def two_sum(nums, target)
  complements = {}

  nums.each_with_index do |num, i|
    j = complements[target - num]
    return [i, j].sort! if j

    complements[num] = i
  end

  nil
end

def three_sum(nums, target)
  complements = {}

  nums.each_with_index do |num, i|
    complements[num] = i
  end

  (0...nums.length).each do |i|
    (i...nums.length).each do |j|
      el1 = nums[i]
      el2 = nums[j]
      partial_sum = el1 + el2
      k = complements[target - partial_sum]
      return [i, j, k].sort! unless [i, j, k].uniq.compact.size < 3
    end
  end
  nil
end
