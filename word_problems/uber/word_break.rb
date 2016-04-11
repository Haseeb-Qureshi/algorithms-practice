# Given a string s and a dictionary of words dict, add spaces in s to construct a sentence where each word is a valid dictionary word.
#
# Return all such possible sentences.
#
# For example, given
# s = "catsanddog",
# dict = ["cat", "cats", "and", "sand", "dog"].
#
# A solution is ["cats and dog", "cat sand dog"].

# @param {String} s
# @param {Set<String>} word_dict
# @return {String[]}
require 'set'
def word_break(str, dict, orig_length = str.length, cache = {})
  return cache[str] if cache[str]
  output = []
  str.chars.each_index do |i|
    next unless dict.include?(str[0..i])
    if i == str.length - 1
      output << str
      break
    end

    remaining_words = word_break(str[i + 1..-1], dict, orig_length, cache)
    if remaining_words.any?
      output.concat(remaining_words.map { |sentence| sentence.dup.prepend(str[0..i] + ' ') })
    end
  end
  cache[str] = output
end
