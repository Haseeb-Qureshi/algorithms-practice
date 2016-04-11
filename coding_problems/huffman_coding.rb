class HuffmanCode < String
  attr_reader :encoding
  def initialize(str)
    super
    @str = str
    @encoded = false
  end

  def encode!
    preprocess!
    generate_code!
    encode_huffman_code!
    flip_state!
  end

  def decode!
    raise "Not encoded" unless @encoded
    decipher_huffman_code!
    flip_state!
  end

  private

  def preprocess!
    @counts = Hash.new(0)
    each_char { |char| @counts[char] += 1 }
    @encoding = Hash.new { |h, k| h[k] = "" }
  end

  def generate_code!
    until @counts.length == 1
      min_char1, count1 = @counts.min_by(&:last)
      @counts.delete(min_char1)
      min_char2, count2 = @counts.min_by(&:last)
      @counts.delete(min_char2)

      min_char1.each_char { |char| @encoding[char].prepend("0") }
      min_char2.each_char { |char| @encoding[char].prepend("1") }

      meta_symbol = min_char1 + min_char2
      @counts[meta_symbol] = count1 + count2
    end
  end

  def decipher_huffman_code!
    code = ""
    decoded = ""
    each_char do |char|
      code << char
      if @encoding.has_key?(code)
        decoded << @encoding[code]
        code.clear
      end
    end
    clear.concat(decoded)
  end

  def encode_huffman_code!
    gsub!(/./) { |char| @encoding[char] }
    @encoding = @encoding.invert
  end

  def flip_state!
    @encoded = !@encoded
    self
  end
end

h = HuffmanCode.new("hahaha ho hoho hohoho heheheeehEhEHHHH")
p h.encode!
p h.decode!
