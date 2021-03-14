state = 'tExAs'
state = state[0].upcase + state[1..state.length].downcase

puts state

#less clever
state_2 = 'tExAs'
state_2.capitalize!
puts state_2
