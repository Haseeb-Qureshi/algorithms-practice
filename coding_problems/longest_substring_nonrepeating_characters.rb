# find the length of the longest substring of a string with no repeating characters

def longest_nonrepeating_substring_length(str)
  previous_repeat = {}
  best_run = 0
  start_idx = 0
  str.each_char.with_index do |char, end_idx|
    if previous_repeat[char]
      best_run = [best_run, end_idx - start_idx].max
      start_idx = previous_repeat[char] + 1
      previous_repeat[char] = end_idx
    else
      previous_repeat[char] = end_idx
    end
  end
  [best_run, str.length - start_idx].max # to check final run
end

def l(str)
  longest_nonrepeating_substring_length(str)
end

"abcdefadehgif"
"abcdef" + "fadehgi"

l("abcdefadehgi")
