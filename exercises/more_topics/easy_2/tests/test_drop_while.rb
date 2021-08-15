require 'minitest/autorun'

require_relative '../drop_while'

class DropWhile < Minitest::Test
  def test_odd
    assert_equal([6], drop_while([1, 3, 5, 6]) { |value| value.odd? })
  end

  def test_first_false
    assert_equal([1, 3, 5, 6], drop_while([1, 3, 5, 6]) { |value| value.even? })\
  end

  def test_true_block
    assert_equal([], drop_while([1, 3, 5, 6]) { |value| true })
  end

  def test_false_block
    assert_equal([1, 3, 5, 6], drop_while([1, 3, 5, 6]) { |value| false })
  end

  def test_comparison
    assert_equal([5, 6], drop_while([1, 3, 5, 6]) { |value| value < 5 })
  end

  def test_true_block_empty
    assert_equal([], drop_while([]) { |value| true })
  end
end
