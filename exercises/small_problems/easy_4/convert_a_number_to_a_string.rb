DIGIT_REF = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def integer_to_string(int)
  int_digits = []
  int.digits.each { |dig| int_digits << DIGIT_REF[dig] }
  int_digits.reverse.join('')
end

puts(integer_to_string(4321) == '4321')
puts(integer_to_string(0) == '0')
puts(integer_to_string(5000) == '5000')