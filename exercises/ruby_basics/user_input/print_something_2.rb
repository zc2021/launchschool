choice = ""
choices = ["y", "n"]

loop do
  puts "Do you want to print something? (y/n)"
  choice = gets.chomp
  break if choices.include? choice.downcase
  puts "Try again" 
 end

puts "something" unless choice == "n"
