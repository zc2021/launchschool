def prompt(message)
  puts "==> #{message}"
end

def display_results(a, b)
  prompt("#{a} + #{b} = #{a + b}")
  prompt("#{a} - #{b} = #{a - b}")
  prompt("#{a} * #{b} = #{a * b}")
  prompt("#{a} / #{b} = #{a / b}")
  prompt("#{a} % #{b} = #{a % b}")
  prompt("#{a} ** #{b} = #{a ** b}")
end

prompt('Enter the first positive integer: ')
a_num = gets.chomp.to_i

prompt('Enter the second positive integer: ')
b_num = gets.chomp.to_i

display_results(a_num, b_num)