arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

odd_sorted_arr = arr.sort_by do |sub_arr|
  sub_arr.map do |int|
    int if int % 2 == 1
  end
end

p odd_sorted_arr
puts odd_sorted_arr == [[1, 8, 3], [1, 6, 7], [1, 4, 9]]