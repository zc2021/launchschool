def clean_text(file)
  File.read(file).gsub(/\s/,' ').split(/[\.\?\!]/)
end

def word_count(sentence)
  sentence.split(' ').length
end

def longest_sentence(file)
  text = clean_text(file)
  max_length = 0
  text.each do |sentence|
    s_length = word_count(sentence)
    max_length = s_length if s_length > max_length
  end
  max_length
end

puts longest_sentence('input_text.txt')
puts longest_sentence('input_text_2.txt')