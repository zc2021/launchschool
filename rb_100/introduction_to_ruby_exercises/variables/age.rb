def find_ages age
  "In 10 years: #{age + 10}\nIn 20 years: #{age + 20}\nIn 30 years: #{age + 30}\nIn 40 years: #{age + 40}"
end

puts "How old are you? "
age = gets.chomp.to_i
puts find_ages age
