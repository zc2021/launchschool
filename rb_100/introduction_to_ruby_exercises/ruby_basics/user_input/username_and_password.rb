USERNAME = "sally"
PASSWORD = "class"
inpt_pass = ""
inpt_name = ""

loop do
  puts "Please enter your name: "
  inpt_name = gets.chomp
  puts "Please enter your password: "
  inpt_pass = gets.chomp
  break if inpt_pass == PASSWORD && inpt_name == USERNAME
  puts "Authorization failed!"
end

puts "SecreT"
