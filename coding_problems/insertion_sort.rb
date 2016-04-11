require '../data_structures/arr'

class Array
  def insertion_sort!(start = 0, len = length)
    return if len < 2
    len = length - start if start + len > length

    sorted_up_to = start
    while sorted_up_to < start + len - 1
      next_el = sorted_up_to + 1
      while next_el > start && self[next_el] < self[next_el - 1]
        swap!(next_el, next_el - 1)
        next_el -= 1
      end
      sorted_up_to += 1
    end
    self
  end
end
