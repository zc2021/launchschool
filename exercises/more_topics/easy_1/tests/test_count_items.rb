require 'minitest/autorun'

require_relative '../count_items.rb'

class CountItems < Minitest::Test
  def test_odd_items
    assert_equal(3, count([1,2,3,4,5]) { |value| value.odd? })
  end

  def test_modulo
    assert_equal(2, count([1,2,3,4,5]) { |value| value % 3 == 1 })
  end

  def test_true_block
    assert_equal(5, count([1,2,3,4,5]) { |value| true })
  end

  def test_false_block
    assert_equal(0, count([1,2,3,4,5]) { |value| false })
  end

  def test_empty_argument
    assert_equal(0, count([]) { |value| value.even? })
  end

  def test_string_array
    assert_equal(2, count(%w(Four score and seven)) { |value| value.size == 5 })
  end
end
