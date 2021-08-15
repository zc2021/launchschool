require 'minitest/autorun'

require_relative '../iterators_none.rb'

class NoneIterator < Minitest::Test
  def test_even_false
    assert_equal(false, none?([1, 3, 5, 6]) { |value| value.even? })
  end

  def test_even_true
    assert_equal(true, none?([1, 3, 5, 7]) { |value| value.even? })
  end

  def test_odd_true
    assert_equal(true, none?([2, 4, 6, 8]) { |value| value.odd? })
  end

  def test_modulo
    assert_equal(false, none?([1, 3, 5, 7]) { |value| value % 5 == 0 })
  end

  def test_true_block
    assert_equal(false, none?([1, 3, 5, 7]) { |value| true })
  end

  def test_false_block
    assert_equal(true, none?([1, 3, 5, 7]) { |value| false } == true)
  end

  def test_empty_argument
    assert_equal(true, none?([]) { |value| true })
  end
end

none?([1, 3, 5, 6]) { |value| value.even? } == false
none?([1, 3, 5, 7]) { |value| value.even? } == true
none?([2, 4, 6, 8]) { |value| value.odd? } == true
none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
none?([1, 3, 5, 7]) { |value| true } == false
none?([1, 3, 5, 7]) { |value| false } == true
none?([]) { |value| true } == true