def string_to_integer(string)
  digit_strings = %w(0 1 2 3 4 5 6 7 8 9)
  ret_integer = 0

  num_array = string.chars.map { |char| digit_strings.index(char)}
  num_array.reverse!

  num_array.each_with_index do |num, idx|
    ret_integer += num * (10 ** idx)
  end
  
  ret_integer
end

def string_to_signed_integer(string)
  if string[0] == '-'
    0 - string_to_integer(string[1..-1])
  elsif string[0] == '+'
    string_to_integer(string[1..-1])
  else
    string_to_integer(string)
  end
end

puts(string_to_signed_integer('4321') == 4321)
puts(string_to_signed_integer('-570') == -570)
puts(string_to_signed_integer('+100') == 100)
