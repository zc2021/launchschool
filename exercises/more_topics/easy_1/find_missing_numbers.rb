def missing(sorted_array)
  missing_nums = []
  start = sorted_array[0]
  finish = sorted_array[-1]
  while start < finish
    missing_nums << start unless sorted_array.include?(start)
    start += 1
  end
  missing_nums
end