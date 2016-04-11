def longest_substring_with_two_uniq_chars(str)
  last_chars = []
  longest_sub = 0
  current_sub = 0
  str.chars.each_with_index do |char, i|
    previously_seen_char = last_chars.find { |char2, last_idx| char == char2 }
    if previously_seen_char
      previously_seen_char[1] = i
      current_sub += 1
    elsif last_chars.length < 2
      last_chars << [char, i]
      current_sub += 1
    else
      all_since = last_chars.min_by(&:last)
      last_chars.delete(all_since)
      last_chars << [char, i]
      longest_sub = [longest_sub, current_sub].max
      current_sub = i - all_since.last
    end
    longest_sub = [longest_sub, current_sub].max
  end
  longest_sub
end

def l(str)
  longest_substring_with_two_uniq_chars(str)
end

def l2(str)
  substrings(str).select { |sub| sub.chars.uniq.size == 2 }.max_by(&:length)
end

def substrings(str, l = str.length)
  indices = ([*(0...l)]).combination(2).to_a.uniq + (0...l).zip((0...l))
  indices.map { |start_idx, end_idx| str[start_idx..end_idx] }
end

"abcbbbbcccbdddadacb"
