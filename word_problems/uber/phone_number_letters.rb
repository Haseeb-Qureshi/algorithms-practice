# @param {String} digits
# @return {String[]}
DIGIT_MAP = {
  '1' => '',
  '2' => 'abc',
  '3' => 'def',
  '4' => 'ghi',
  '5' => 'jkl',
  '6' => 'mno',
  '7' => 'pqrs',
  '8' => 'tuv',
  '9' => 'wxyz',
  '0' => ''
}

def letter_combinations(digits, cache = { '' => [] })
  return DIGIT_MAP[digits].chars if digits.length == 1
  return cache[digits] if cache[digits]
  first_digit = digits[0]
  letter_combos = []
  DIGIT_MAP[first_digit].chars.each do |char|
    post_combos = letter_combinations(digits[1..-1], cache).map { |word| char + word }
    letter_combos.concat(post_combos)
  end
  cache[digits] = letter_combos
end
