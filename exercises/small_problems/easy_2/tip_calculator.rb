puts "Enter bill total: "
bill_total = gets.chomp.to_f

puts "Enter tip percentage: "
tip_rate = gets.chomp.to_f / 100

tip = (bill_total * tip_rate).round(2)

puts "The tip is $#{tip}."
puts "Bill with tip is $#{tip + bill_total}"