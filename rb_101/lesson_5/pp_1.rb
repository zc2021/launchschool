# Order array by descending numeric value

arr = ['10', '11', '9', '7', '8']

sorted_arr = arr.sort { |el_1, el_2| el_2.to_i <=> el_1.to_i }

p sorted_arr
