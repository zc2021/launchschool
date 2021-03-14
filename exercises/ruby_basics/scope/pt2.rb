a = 7

def my_value(a)
  a += 10
end

my_value(a)
puts a

#output 7 - value of a is not changed in method call; 'a' in my_value method definition is a different variable (initialized (?) in scope of method definition) 
