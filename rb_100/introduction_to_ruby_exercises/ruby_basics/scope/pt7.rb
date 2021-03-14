a = 7
array = [1, 2, 3]

array.each do |element|
  a = element
end

puts a

#output 3 - a is re-assigned to value of each element in array in sequence, and final array value is 3
