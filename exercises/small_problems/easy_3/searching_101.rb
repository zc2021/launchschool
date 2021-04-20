def prompt(message)
  puts "==> #{message}"
end

input_array = []

5.times do |idx|
  place = idx + 1
  case place
  when 1 then msg_num = 'st'
  when 2 then msg_num = 'nd'
  when 3 then msg_num = 'rd'
  else msg_num = 'th'
  end
  prompt("Enter the #{place}#{msg_num} number: ")
  num = gets.chomp.to_i
  input_array << num
end

prompt("Enter the last number: ")
search_num = gets.chomp.to_i

input_array.include?(search_num) ? prompt("The number #{search_num} does appear in #{input_array}") :
                                  prompt("The number #{search_num} does not appear in #{input_array}")
