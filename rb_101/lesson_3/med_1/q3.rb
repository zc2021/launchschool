def factors(number)
  divisor = number
  factors = []

  while divisor > 0 do
    factors << number / divisor if number % divisor == 0 # checks if number divides evenly by divisor (divisor is a factor)
    divisor -= 1
  end
  factors # method returns factors of integer passed as argument
end

puts factors(10)
