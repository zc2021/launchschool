require 'minitest/autorun'

require_relative '../max_by.rb'

class MaxBy < Minitest::Test
  def test_add
    assert_equal(5, max_by([1, 5, 3]) { |value| value + 2 })
  end

  def test_subtract
    assert_equal(1, max_by([1, 5, 3]) { |value| 9 - value })
  end

  def test_chr
    assert_equal(1, max_by([1, 5, 3]) { |value| (96 - value).chr })
  end

  def test_size
    assert_equal([3, 4, 5], max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size })
  end

  def test_multiply
    assert_equal(-7, max_by([-7]) { |value| value * 3 })
  end

  def test_empty_argument
    assert_equal(nil, max_by([]) { |value| value + 5 })
  end
end