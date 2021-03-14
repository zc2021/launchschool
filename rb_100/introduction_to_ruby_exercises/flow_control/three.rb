def find_range num
  return "#{num} < 0" unless num > 0
  return "0 <= #{num} <= 50" unless num > 50
  return "51 <= #{num} <= 100" unless num > 100
  "100 < #{num}"
end

puts "Input number: "
user_num = gets.chomp.to_i
puts find_range(user_num)
