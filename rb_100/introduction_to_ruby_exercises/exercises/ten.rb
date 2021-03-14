hash_of_arrays = {first: [0, 1, 2, 3, 4, 5], odds: [1, 3, 5], evens: [2, 4]}
array_of_hashes = [{test: "hi!", two: ["even", "more"]}, {again: "test"}]

puts hash_of_arrays
puts array_of_hashes

hash_of_arrays[:first].each {|i| puts i}
