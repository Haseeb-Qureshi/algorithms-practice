require_relative '../data_structures/linked_list'

def add_reversed_ll_numbers(list1, list2)
  num1 = num_from_reversed_list(list1)
  num2 = num_from_reversed_list(list2)
  list_from_num(num1 + num2)
end

def num_from_reversed_list(list)
  list.each_with_index.inject(0) do |acc, (link, i)|
    acc += link.val * (10 ** i)
  end
end

def list_from_num(num)
  prev_link = nil
  head = nil
  current_pow = Math.log10(num).floor
  while current_pow >= 0
    this_digit = num / (10 ** current_pow)
    link = Link.new(this_digit)
    prev_link.next = link if prev_link
    head = link if prev_link.nil?
    prev_link = link

    num %= 10 ** current_pow
    current_pow -= 1
  end
  head
end

def reverse_list(head)
  return head if head.nil? || head.next.nil?
  reversed_remainder = reverse_list(head.next)
  reversed_remainder.next = head
  head.next = nil
  head
end

list1 = LinkedList.new([3, 2, 1])
list2 = LinkedList.new([6, 5, 4])
p add_reversed_ll_numbers(list1, list2)
p 123 + 456
