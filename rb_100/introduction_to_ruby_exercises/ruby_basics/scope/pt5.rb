a = "Xyzzy"

def my_value(b)
  b = 'yzzyX'
end

my_value(a)
puts a

#output "Xyzzy" - my_value method re-assigns local variable b, does not mutate argument
