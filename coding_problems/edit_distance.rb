def edit_distance(str1, str2)
  edit_dp_arr(str1, str2).last.last
end

def edit_dp_arr(str1, str2)
  dp_arr = Array.new(str1.length + 1) { Array.new(str2.length + 1) { 0 } }
  dp_arr.first.each_with_index { |el, i| dp_arr.first[i] = i }
  dp_arr.each_with_index { |arr, i| arr[0] = i }

  (1...dp_arr.length).each do |i|
    (1...dp_arr[0].length).each do |j|
      deletion = dp_arr[i - 1][j] + 1
      addition = dp_arr[i][j - 1] + 1

      substition = dp_arr[i - 1][j - 1]
      substitution += 1 unless str1[i - 1] == str2[j - 1]

      dp_arr[i][j] = [deletion, addition, substition].min
    end
  end

  dp_arr
end

p edit_distance("kitten", "sitting") == 3


# create a DP array of each char in str1, each char in str2
# traverse the DP array with each of the three steps: insert, delete, and replace

#   '' a c d c
# '' 0 1 2 3 4
# g  1 1
# c  2
# c  3
# d  4
