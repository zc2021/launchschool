def oddities(array)
  counter = 0
  odd_array = []
  while counter < array.length
    odd_array << array[counter]
    counter += 2
  end
  odd_array
end

puts oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
puts oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
puts oddities(['abc', 'def']) == ['abc']
puts oddities([123]) == [123]
puts oddities([]) == []
