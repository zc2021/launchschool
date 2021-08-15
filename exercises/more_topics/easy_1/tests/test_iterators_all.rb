require 'minitest/autorun'

require_relative '../iterators_all'

class IterateAll < Minitest::Test
  def test_odd_false
    assert_equal(false, all?([1, 3, 5, 6]) { |value| value.odd? })
  end

  def test_odd_true
    assert_equal(true, all?([1, 3, 5, 7]) { |value| value.odd? })
  end

  def test_even_true
    assert_equal(true, all?([2, 4, 6, 8]) { |value| value.even? })
  end

  def test_modulo
    assert_equal(false, all?([1, 3, 5, 7]) { |value| value % 5 == 0 })
  end

  def test_true_block
    assert_equal(true, all?([1, 3, 5, 7]) { |value| true })
  end

  def test_false_block
    assert_equal(false, all?([1, 3, 5, 7]) { |value| false })
  end

  def test_empty_argument
    assert_equal(false, all?([]) { |value| false })
  end
end
