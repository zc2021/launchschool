def reverse_sentence(string)
  words = string.split(' ')
  reversed = []

  while words[0]
    reversed << words.pop
  end
  reversed.join(' ')
end

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
