def titleize(string)
  words = string.split(' ')
  words.each do |word|
    word.capitalize!
  end
  words.join(' ')
end

test_words = "the flintstones rock"

puts titleize(test_words)
