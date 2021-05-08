def letter_swap(word)
  word[0], word[-1] = word[-1], word[0]
  word
end

def swap(string)
  swapped_word_collection = string.split.map { |word| letter_swap(word) }
  swapped_word_collection.join(' ')
end

puts(swap('Oh what a wonderful day it is'))

puts(swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si')
puts(swap('Abcde') == 'ebcdA')
puts(swap('a') == 'a')