require 'minitest/autorun'

require_relative '../each_with_object'

class EachObject < Minitest::Test
  def test_array
    result = each_with_object([1, 3, 5], []) do |value, list|
      list << value**2
    end
    assert_equal([1, 9, 25], result)
  end

  def test_nested_arrays
    result = each_with_object([1, 3, 5], []) do |value, list|
      list << (1..value).to_a
    end
    assert_equal([[1], [1, 2, 3], [1, 2, 3, 4, 5]], result)
  end

  def test_hash
    result = each_with_object([1, 3, 5], {}) do |value, hash|
      hash[value] = value**2
    end
    assert_equal({ 1 => 1, 3 => 9, 5 => 25 }, result)
  end

  def test_empty_argument
    result = each_with_object([], {}) do |value, hash|
      hash[value] = value * 2
    end
    assert_equal({}, result)
  end
end