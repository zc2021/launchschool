=begin
def equal_to_four(x)
  if x == 4
    puts "yup"
  else
    puts "nope"
end

SyntaxError -> missing "end" of method definition, fixed below
=end
def equal_to_four(x)
  if x == 4
    puts "yup"
  else
    puts "nope"
  end
end

puts equal_to_four(4)
puts equal_to_four(5)
