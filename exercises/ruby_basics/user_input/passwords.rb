PASSWORD = "class"
input = ""

loop do
  puts "Please enter your password: "
  input = gets.chomp
  break if input == PASSWORD
  puts "Invalid password!"
end

puts "SecreT"
