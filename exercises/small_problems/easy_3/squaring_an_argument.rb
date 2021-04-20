def multiply(a, b)
  a * b
end

def square(a)
  multiply(a, a)
end

puts(square(5) == 25)
puts(square(-8) == 64)
