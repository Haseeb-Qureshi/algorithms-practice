require_relative '../data_structures/linked_list'

def has_cycle?(list)
  tortoise = list.first
  hare = list.first
  loop do
    tortoise = tortoise.next
    hare = hare.next
    return false if hare.nil?
    hare = hare.next
    return false if hare.nil?
    return true if hare == tortoise
  end
end

def start_of_cycle(list)
  return nil unless has_cycle?(list)
  tortoise = list.first
  hare = list.first
  loop do
    tortoise = tortoise.next
    hare = hare.next.next
    break if tortoise == hare
  end

  walk = list.first
  loop do
    walk = walk.next
    tortoise = tortoise.next
    return walk if walk == tortoise
  end
end

def length_of_cycle(list)
  return nil unless has_cycle?(list)
  start = start_of_cycle(list)
  current = start.next
  i = 1
  until current == start
    i += 1
    current = current.next
  end
  i
end

p has_cycle?(LIST) == false
p has_cycle?(CYCLIC_LIST) == true
p start_of_cycle(LIST)
p start_of_cycle(CYCLIC_LIST)
p length_of_cycle(CYCLIC_LIST)
