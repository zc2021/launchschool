def print_age(name="Teddy")
  age = rand(20..200)
  puts "#{name} is #{age} years old!"
end

print_age
print_age("Alice")
