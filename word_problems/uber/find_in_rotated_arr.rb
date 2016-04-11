# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}

def search(nums, target)
  if nums.length < 10
    nums.index(target) || -1
  else
    RotatedArray.new(nums).bsearch(target)
  end
end

class RotatedArray
  def initialize(arr)
    @arr = arr
    @start_idx = rotation_idx
  end

  def bsearch(target, lower_bound = 0, upper_bound = @arr.length - 1)
    middle = (lower_bound + upper_bound) / 2
    middle_el = self[middle]
    return true_index(middle) if middle_el == target
    return -1 if lower_bound >= upper_bound
    if target < middle_el
      bsearch(target, lower_bound, middle - 1)
    else
      bsearch(target, middle + 1, upper_bound)
    end
  end

  def true_index(i)
    (@start_idx + i) % @arr.length
  end

  def [](i)
    @arr[true_index(i)]
  end

  private

  def rotation_idx(lower_bound = 0, upper_bound = @arr.length - 1)
    return lower_bound if @arr[lower_bound] < @arr[upper_bound]
    middle = (lower_bound + upper_bound) / 2
    return middle if @arr[middle] < @arr[middle - 1]
    # recurse left if middle is less than beginning
    if @arr[middle] < @arr[lower_bound]
      rotation_idx(lower_bound, middle - 1)
    else
      rotation_idx(middle + 1, upper_bound)
    end
  end
end
