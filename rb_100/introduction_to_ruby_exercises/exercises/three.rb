num_array = (1..10).to_a
odds = num_array.select {|num| num % 2 == 1}
puts odds
