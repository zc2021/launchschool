require 'minitest/autorun'

class Nil < Minitest::Test
  def test_nil
    assert_nil value
  end
end
