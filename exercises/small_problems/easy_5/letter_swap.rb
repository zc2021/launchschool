def swap(string)
  swapped_word_collection = []
  words = string.split(' ')
  words.each do |word|
    swapped_word = word.size > 1 ? word[-1] + word[1..-2] + word[0] : word
    swapped_word_collection << swapped_word
  end
  swapped_word_collection.join(' ')
end

puts(swap('Oh what a wonderful day it is'))

puts(swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si')
puts(swap('Abcde') == 'ebcdA')
puts(swap('a') == 'a')