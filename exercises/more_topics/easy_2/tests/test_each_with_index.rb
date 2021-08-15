require 'minitest/autorun'

require_relative '../each_with_index'

class EachWithIndex < Minitest::Test
  def test_puts_block
    assert_equal([1, 3, 6], each_with_index([1, 3, 6]) { |value, index| puts "#{index} -> #{value**index}" })
  end
end