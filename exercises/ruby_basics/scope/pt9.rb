a = 7
array = [1, 2, 3]

array.each do |a|
  a += 1
end

puts a

#output 7 - 'a' variable name is shadowed in each block
