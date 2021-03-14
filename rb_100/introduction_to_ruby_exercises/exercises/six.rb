num_array = (1..10).to_a
num_array << 11
num_array.unshift 0
num_array.pop 
num_array.push 3
num_array = num_array.uniq
puts num_array
