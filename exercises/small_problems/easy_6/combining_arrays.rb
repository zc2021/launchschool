def merge(arr_1, arr_2)
  merged_arr = []
  max_idx = [arr_1.length, arr_2.length].max() - 1
  (0..max_idx).each do |idx|
    item_1, item_2 = arr_1[idx], arr_2[idx]
    merged_arr.append(item_1) unless merged_arr.include? item_1
    merged_arr.append(item_2) unless merged_arr.include? item_2
  end
  merged_arr.compact!
  merged_arr.sort
end

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]