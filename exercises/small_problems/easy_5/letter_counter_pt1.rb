def word_sizes(string)
  words = string.split(' ')
  size_hash = Hash.new(0)
  words.each { |word| size_hash[word.size] += 1 }
  size_hash
end

puts(word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 })
puts(word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 })
puts(word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 })
puts(word_sizes('') == {})