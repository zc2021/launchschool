require 'minitest/autorun'

require_relative '../each_cons_2'

class EachConsOne < Minitest::Test
  def test_single_elements
    hash = {}
    each_cons([1, 3, 6, 10], 1) do |value|
      hash[value] = true
    end
    assert_equal({ 1 => true, 3 => true, 6 => true, 10 => true }, hash)
  end

  def test_two_elements
    hash = {}
    each_cons([1, 3, 6, 10], 2) do |value1, value2|
      hash[value1] = value2
    end
    assert_equal({ 1 => 3, 3 => 6, 6 => 10 }, hash)
  end
 
  def test_three_elements
    hash = {}
    each_cons([1, 3, 6, 10], 3) do |value1, *values|
      hash[value1] = values
    end
    assert_equal({ 1 => [3, 6], 3 => [6, 10] }, hash)
  end

  def test_four_elements
    hash = {}
    each_cons([1, 3, 6, 10], 4) do |value1, *values|
      hash[value1] = values
    end
    assert_equal({ 1 => [3, 6, 10] }, hash)
  end

  def test_overload
    hash = {}
    each_cons([1, 3, 6, 10], 5) do |value1, *values|
      hash[value1] = values
    end
    assert_equal({}, hash)
  end
end
