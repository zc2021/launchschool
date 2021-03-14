min = 3
lines = 0

loop do
  puts "How many output lines do you want? Enter a number >= #{min}: "
  lines = gets.chomp.to_i
  break if lines >= min
  puts "That's not enough lines."
end

while lines > 0
  puts "Launch School is the best!"
  lines -= 1
end
