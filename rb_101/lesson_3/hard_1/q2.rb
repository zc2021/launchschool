greetings = { a: 'hi' }
informal_greeting = greetings[:a] # <= crucially this is a reference to the dictionary value
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings

# expect to print { a: 'hi' } <= WRONG greetings[:a] is mutated (wtf?)
