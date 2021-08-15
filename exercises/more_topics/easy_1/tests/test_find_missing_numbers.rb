require 'minitest/autorun'

require_relative '../find_missing_numbers'

class MissingTest < MiniTest::Test
  def test_passing_negative_numbers
    assert_equal([-1, 0, 2, 3, 4], missing([-3, -2, 1, 5]))
  end

  def test_passing_whole_array
    assert_equal([], missing([1, 2, 3, 4]))
  end

  def test_passing_positive_numbers
    assert_equal([2, 3, 4], missing([1, 5]))
  end

  def test_passing_singleton
    assert_equal([], missing([6]))
  end
end
