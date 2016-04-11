# require 'byebug'
def full_justify(words, max_width)
  TextJustifier.new(words, max_width).justify_lines
end

class TextJustifier
  def initialize(words, max_width)
    @words = words
    @width = max_width
  end

  def justify_lines
    chunks = word_chunks
    chunks.map.with_index { |chunk, i| justify(chunk, i == chunks.length - 1 ) }
  end

  private

  def justify(chunk, last_line)
    num_spaces_needed = @width - chunk.map(&:length).inject(:+)
    word_spaces = chunk.length - 1
    return chunk.join if num_spaces_needed == 0
    return chunk.join.ljust(@width) if word_spaces.zero?

    if last_line
      chunk.join(" ").ljust(@width)
    else
      space_delimiter = ' ' * (num_spaces_needed / word_spaces)
      leftovers = num_spaces_needed % word_spaces
      chunk[0] << " " * leftovers
      chunk.join(space_delimiter).ljust(@width)
    end
  end

  def word_chunks
    chunks = []
    this_chunk = []
    this_chunk_length = 0
    @words.each do |word|
      extra_space = this_chunk_length.zero? ? 0 : 1
      if this_chunk_length + word.length + extra_space  > @width
        chunks << this_chunk
        this_chunk = []
        this_chunk_length = 0
        extra_space = 0
      end
      this_chunk << word
      this_chunk_length += extra_space
      this_chunk_length += word.length
    end
    chunks << this_chunk unless this_chunk.empty?
    chunks
  end
end

t = TextJustifier.new(["Here","is","an","example","of","text","justification."],
14)
p t.justify_lines
