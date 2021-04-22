DIGIT_REF = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def integer_to_string(int)
  int_digits = []
  int.digits.each { |dig| int_digits << DIGIT_REF[dig] }
  int_digits.reverse.join('')
end

def signed_integer_to_string(int)
  if int == 0
    '0'
  elsif int < 0
    '-' + integer_to_string(int.abs)
  else
    '+' + integer_to_string(int)
  end
end

puts(signed_integer_to_string(4321) == '+4321')
puts(signed_integer_to_string(-123) == '-123')
puts(signed_integer_to_string(0) == '0')