class Scrabble
  LETTER_SCORES = {
    A: 1, B: 3, C: 3, D: 2, E: 1, F: 4, G: 2, H: 4, I: 1,
    J: 8, K: 5, L: 1, M: 3, N: 1, O: 1, P: 3, Q: 10, R: 1,
    S: 1, T: 1, U: 1, V: 4, W: 4, X: 8, Y: 4, Z: 10
  }

  attr_reader :word, :points

  def initialize(word)
    @word = word ? word.strip : ''
  end

  def score
    Scrabble.score(word)
  end

  private

  class << self
    def score(word)
      return 0 if word.empty?
      points = 0
      tiles = Scrabble.count_characters(word)
      tiles.each do |letter, count|
        value = LETTER_SCORES[letter]
        points += value * count
      end
      points
    end

    def count_characters(word)
      char_counts = Hash.new(0)
      word.chars.each_with_object(char_counts) do |char, counts|
        counts[char.upcase.to_sym] += 1
      end
      char_counts
    end
  end
end