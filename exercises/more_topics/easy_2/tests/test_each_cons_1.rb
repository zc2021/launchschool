require 'minitest/autorun'

require_relative '../each_cons_1'

class EachConsOne < Minitest::Test
  def test_array_to_hash
    hash = {}
    result = each_cons([1, 3, 6, 10]) do |value1, value2|
      hash[value1] = value2
    end
    assert_nil(result)
    assert_equal({ 1 => 3, 3 => 6, 6 => 10 }, hash)
  end

  def test_empty_argument
    hash = {}
    result = each_cons([]) do |value1, value2|
      hash[value1] = value2
    end
    assert_equal({}, hash)
    assert_nil(result)
  end
 
  def test_string_array
    hash = {}
    result = each_cons(['a', 'b']) do |value1, value2|
      hash[value1] = value2
    end
    assert_equal({'a' => 'b'}, hash)
    assert_nil(result)
  end
end