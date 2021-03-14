a = "Xyzzy"

def my_value(b)
  b[2] = '-'
end

my_value(a)
puts a

#output 'Xy-zzy' - strings are mutable and []= operator mutates the caller
#my_value method then mutates string passed
