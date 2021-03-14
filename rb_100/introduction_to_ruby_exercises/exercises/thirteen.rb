arr1 = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']
arr2 = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees'] 

arr1.delete_if {|w| w.start_with? 's'}

arr2.delete_if {|w| w.start_with?('s') || w.start_with?('w')}

puts arr1
puts '---'
puts arr2
