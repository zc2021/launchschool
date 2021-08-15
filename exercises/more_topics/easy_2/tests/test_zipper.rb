require 'minitest/autorun'

require_relative '../zipper.rb'

class Zipper < Minitest::Test
  def test_zipper
    assert_equal([[1, 4], [2, 5], [3, 6]], zip([1, 2, 3], [4, 5, 6]))
  end
end