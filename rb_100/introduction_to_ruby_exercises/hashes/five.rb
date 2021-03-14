west_coast = {wa: "washington", or: "oregon", ca: "california", bc: "british columbia", ak: "alaska"}

puts "Enter state abbrev. to check if on west coast: "
check_key = gets.chomp.downcase.to_sym
puts "#{check_key}: #{west_coast.has_key? check_key}"

puts "Enter state name to check if on west coast: "
check_val = gets.chomp.downcase
puts "#{check_val}: #{west_coast.has_value? check_val}"

puts "One more way to check... does west_coast include? #{west_coast.include? check_key}"
