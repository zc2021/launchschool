puts 'Please write one or more words: '
input_string = gets.chomp

ttl_chars = 0

input_string.split(' ').each { |word| ttl_chars += word.length }

puts "There are #{ttl_chars} in \"#{input_string}\""
