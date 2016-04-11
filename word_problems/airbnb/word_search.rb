# @param {Character[][]} board
# @param {String[]} words
# @return {String[]}
require 'set'

def find_words(board, words)
  WordSearch.new(board, words).find_words
end

class WordSearch
  def initialize(board, words)
    @board = board
    @trie = PrefixTree.new
    words.each { |word| @trie.add_str(word) }
  end

  def find_words
    all_findable_words = Set.new

    (0...@board.length).each do |i|
      (0...@board[0].length).each do |j|
        words_here = words_at(i, j)
        all_findable_words.add(words_here) unless words_here.none?
      end
    end

    all_findable_words.to_a
  end

  private

  def words_at(i, j)
    findable_words = []
    dfs_from!(i, j, @trie.root, findable_words)
    findable_words
  end

  def dfs_from!(i, j, trie_root, findable_words, seen = Set.new, str_buffer = [])
    unseen_neighbors = valid_neighbors(i, j).reject { |neighbor| seen.include?(neighbor) }
    unseen_neighbors.each do |neighbor|
      x, y = neighbor
      char = @board[x][y]
      next unless trie_root.has_prefix?(char)

      str_buffer << char

      if trie_root.has_string?(char)
        findable_words << (str_buffer).join
        trie_root.children[char].terminator = false
      end

      seen << [x, y]
      dfs_from!(x, y, trie_root.children[char], findable_words, seen, str_buffer)
      str_buffer.pop
    end
    seen.delete([i, j])
  end

  def valid_neighbors(i, j)
    neighbors(i, j).select { |neighbor| in_range?(neighbor) }
  end

  def neighbors(i, j)
    [
      [i + 1, j],
      [i, j + 1],
      [i - 1, j],
      [i, j - 1]
    ]
  end

  def in_range?(pos)
    i, j = pos
    i.between?(0, @board.length - 1) && j.between?(0, @board[0].length - 1)
  end
end

class PrefixNode
  attr_accessor :parent, :children, :terminator
  def initialize(parent = nil, children = {}, terminator = false)
    @parent = parent
    @children = children
    @terminator = terminator
  end

  def has_string?(str, i = 0)
    fail ArgumentError if i > str.length
    return @terminator if i == str.length

    @children[str[i]] ? children[str[i]].has_string?(str, i + 1) : false
  end

  def has_prefix?(str, i = 0)
    fail ArgumentError if i > str.length
    return true if i == str.length

    @children[str[i]] ? children[str[i]].has_prefix?(str, i + 1) : false
  end

  def inspect
    @children.to_s
  end
end

class PrefixTree
  attr_reader :root
  def initialize(root = PrefixNode.new)
    @root = root
  end

  def add_str(str)
    current = @root
    str.each_char do |char|
      current.children[char] ||= PrefixNode.new(current)
      current = current.children[char]
    end
    current.terminator = true
  end

  def has_string?(str)
    @root.has_string?(str)
  end

  def has_prefix?(str)
    @root.has_prefix?(str)
  end
end

p find_words(
["baabab","abaaaa","abaaab","ababba","aabbab","aabbba","aabaab"],
["bbaabaabaaaaabaababaaaaababb","aabbaaabaaabaabaaaaaabbaaaba","babaababbbbbbbaabaababaabaaa","bbbaaabaabbaaababababbbbbaaa","babbabbbbaabbabaaaaaabbbaaab","bbbababbbbbbbababbabbbbbabaa","babababbababaabbbbabbbbabbba","abbbbbbaabaaabaaababaabbabba","aabaabababbbbbbababbbababbaa","aabbbbabbaababaaaabababbaaba","ababaababaaabbabbaabbaabbaba","abaabbbaaaaababbbaaaaabbbaab","aabbabaabaabbabababaaabbbaab","baaabaaaabbabaaabaabababaaaa","aaabbabaaaababbabbaabbaabbaa","aaabaaaaabaabbabaabbbbaabaaa","abbaabbaaaabbaababababbaabbb","baabaababbbbaaaabaaabbababbb","aabaababbaababbaaabaabababab","abbaaabbaabaabaabbbbaabbbbbb","aaababaabbaaabbbaaabbabbabab","bbababbbabbbbabbbbabbbbbabaa","abbbaabbbaaababbbababbababba","bbbbbbbabbbababbabaabababaab","aaaababaabbbbabaaaaabaaaaabb","bbaaabbbbabbaaabbaabbabbaaba","aabaabbbbaabaabbabaabababaaa","abbababbbaababaabbababababbb","aabbbabbaaaababbbbabbababbbb","babbbaabababbbbbbbbbaabbabaa"]
)
