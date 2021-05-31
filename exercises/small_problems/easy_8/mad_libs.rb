STORY = "Today while I was %s %sing, I saw a(n) %s %s. Amazing!"
WORDS = {one: 'adverb', two: 'verb', three: 'adjective', four: 'noun'}

def prompt(msg)
  puts "--> #{msg}"
end

def get_word(word_type)
  article = word_type.start_with?('a') ? 'an' : 'a'
  prompt "Enter #{article} #{word_type}: "
  word = gets.chomp.downcase
  word
end

story_words = WORDS.map do |place, type|
                get_word(type)
              end

prompt STORY % story_words