class Anagram
  attr_reader :word, :word_char_counts

  def initialize(word)
    @word = word
    @word_char_counts = Anagram.count_characters(word)
  end

  def match(words)
    matches = []
    words.reject { |w| w.downcase == word.downcase }.each do |test_word|
      next unless word.size == test_word.size
      test_char_counts = Anagram.count_characters(test_word)
      matches << test_word if word_char_counts.all? do |char, count|
        test_char_counts[char] == count
      end
    end
    matches
  end

  class << self
    def count_characters(word)
      char_counts = Hash.new(0)
      word.chars.each_with_object(char_counts) do |char, counts|
        counts[char.downcase] += 1
      end
    end
  end
end