require 'minitest/autorun'

require_relative '../swap_letters'

class SwapLetters < Minitest::Test
  attr_accessor :text_file, :text_object

  def setup
    self.text_file = File.read('input/swap.txt')
    self.text_object = Text.new(text_file)
  end

  def test_swap
    assert_equal(text_file.gsub('a', 'e'), text_object.swap('a', 'e'))
  end

  def test_word_count
    assert_equal(text_file.split.count, text_object.word_count)
  end

  def test_word_count_twice
    assert_equal(text_file.split.count, text_object.word_count)
  end
end