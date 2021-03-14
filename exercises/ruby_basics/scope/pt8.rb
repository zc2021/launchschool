array = [1, 2, 3]

array.each do |element|
  a = element
end

puts a

#output error - a is initialized inside each block, not visible outside of block scope
