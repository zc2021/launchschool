def recursive_countdown num
  puts num
  if num == 0
    num
  else
    recursive_countdown(num - 1)
  end
end

puts "Set countdown: "
number = gets.chomp.to_i
recursive_countdown(number)
