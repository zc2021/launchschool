def halvsies(array)
  mid = array.length.even? ? array.length / 2 : (array.length / 2) + 1
  left_half = array.slice(0, mid)
  right_half = array.slice(mid, mid)
  [left_half, right_half]
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]