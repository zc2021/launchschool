def multiply_list(arr_a, arr_b)
  prod_arr = []
  arr_a.each_with_index { |num, idx| prod_arr[idx] = arr_a[idx] * arr_b[idx] }
  prod_arr
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]