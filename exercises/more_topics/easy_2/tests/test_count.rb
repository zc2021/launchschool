require 'minitest/autorun'

require_relative '../count'

class Count < Minitest::Test
  def test_odd
    assert_equal(2, count(1, 3, 6) { |value| value.odd? })
  end

  def test_even
    assert_equal(1, count(1, 3, 6) { |value| value.even? })
  end

  def test_comparison
    assert_equal(0, count(1, 3, 6) { |value| value > 6 })
  end

  def test_true_block
    assert_equal(3, count(1, 3, 6) { |value| true })
  end

  def test_empty_argument
    assert_equal(0, count() { |value| true })
  end

  def test_math
    assert_equal(3, count(1, 3, 6) { |value| value - 6 })
  end
end
