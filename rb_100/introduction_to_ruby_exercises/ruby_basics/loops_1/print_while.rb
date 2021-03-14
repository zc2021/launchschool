puts "loop count?: "

i = gets.chomp.to_i

puts "~*~*~*~*~*~*"

while i > 0 
  puts rand(99)
  i -= 1
end
