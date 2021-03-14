def greeting name
  "Howdy, #{name}"
end

puts "What is your name? "
username = gets.chomp
puts greeting(username)
