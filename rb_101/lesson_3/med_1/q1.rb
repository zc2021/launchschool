message = "The Flintstones Rock!"

10.times do |i|
  puts message
  message = message.insert(0, ' ')
end
