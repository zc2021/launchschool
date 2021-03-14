count = 1

puts "loops: "
stop_val = gets.chomp.to_i

loop do
  count.odd? ? puts("#{count} is odd!") : puts("#{count} is even!")
  count += 1
  break if count > stop_val
end
