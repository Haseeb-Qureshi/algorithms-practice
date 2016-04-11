# @param {String} s
# @param {String} t
# @return {Boolean}
def is_one_edit_distance(str1, str2)
  l1 = str1.length
  l2 = str2.length
  return is_one_edit_distance(str2, str1) if l2 > l1

  return false if l1 - l2 > 1 || str1 == str2

  str1.length.times do |i|
    if str1[i] != str2[i]
      return str1[i + 1..-1] == str2[i + 1..-1] || str1[i + 1..-1] == str2[i..-1]
    end
  end
  true
end
