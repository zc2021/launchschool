def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end

int_a = nil
int_b = nil

loop do
  puts "Please enter a positive or negative integer: "
  int_a = gets.chomp
  unless valid_number? int_a
    puts "Oops. Try again."
    next
  end
  puts "Another, please: "
  int_b = gets.chomp
  unless valid_number? int_b
    puts "Let's give that another try."
    next
  end
  int_a = int_a.to_i
  int_b = int_b.to_i
  break if (int_a < 0 && int_b > 0) || (int_a > 0 && int_b < 0)
  puts "Sorry, one must be positive, one negative. Try again."
end

int_sum = int_a.to_i + int_b.to_i

puts "#{int_a} + #{int_b} = #{int_sum}"
