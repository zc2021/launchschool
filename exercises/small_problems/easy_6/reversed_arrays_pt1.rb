def reverse!(array)
  arr_len = array.length
  return array if arr_len <= 1
  
  mid = arr_len / 2

  (0...mid).each do |num|
    left_idx = num
    right_idx = arr_len - 1 - num
    array[left_idx], array[right_idx] = array[right_idx], array[left_idx]
  end

  array
end

list = [1, 2, 3, 4]
result = reverse!(list)
p result == [4, 3, 2, 1] # true
p list == [4, 3, 2, 1] # true
p list.object_id == result.object_id # true

list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"] # true
p list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
p reverse!(list) == ["abc"] # true
p list == ["abc"] # true

list = []
p reverse!(list) == [] # true
p list == [] # true