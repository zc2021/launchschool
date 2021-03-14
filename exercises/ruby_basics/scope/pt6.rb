a = 7

def my_value(b)
  b = a + a
end

my_value(a)
puts a

#output error - a not defined in method scope
