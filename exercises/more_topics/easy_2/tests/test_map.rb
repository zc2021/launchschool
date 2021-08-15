require 'minitest/autorun'

require_relative '../map.rb'

class Map < Minitest::Test
  def test_squares
    assert_equal([1, 9, 36], map([1, 3, 6]) { |value| value**2 })
  end

  def test_empty_argument
    assert_equal([], map([]) { |value| true })
  end

  def test_false_block
    assert_equal([false, false, false, false], map(['a', 'b', 'c', 'd']) { |value| false })
  end

  def test_capitalize
    assert_equal(['A', 'B', 'C', 'D'], map(['a', 'b', 'c', 'd']) { |value| value.upcase })
  end

  def test_flatten
    assert_equal([[1], [1, 2, 3], [1, 2, 3, 4]], map([1, 3, 4]) { |value| (1..value).to_a }) 
  end
end
