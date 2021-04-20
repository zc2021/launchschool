# original code has error because integer value is never converted to string before concatenation

# puts "the value of 40 + 2 is " + (40 + 2)

puts "the value of 40 + 2 is #{(40 + 2)}"
puts "the value of 40 + 2 is " + (40 + 2).to_s
