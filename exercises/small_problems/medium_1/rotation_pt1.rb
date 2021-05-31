def rotate_array(arr)
  shifted_array = []
  arr.each_index do |idx|
    idx - 1 < 0 ? shifted_array[arr.length - 1] = arr[idx] : shifted_array[idx - 1] = arr[idx]
  end
  shifted_array
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true