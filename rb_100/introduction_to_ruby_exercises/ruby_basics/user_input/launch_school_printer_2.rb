min = 3
lines = nil

loop do
  loop do
    puts "How many output lines do you want? Enter a number >= #{min} (Q to quit): "
    inpt = gets.chomp
    return if inpt.downcase == "q"
    lines = inpt.to_i
    break if lines >= min
    puts "That's not enough lines."
  end

  while lines > 0
    puts "Launch School is the best!"
    lines -= 1
  end
end
