def greet first, last
  "Hello, #{first} #{last}"
end

puts "What is your first name? "
f_name = gets.chomp
puts "What is your last name? "
l_name = gets.chomp
puts greet f_name, l_name
10.times {puts "#{f_name} #{l_name}"}
