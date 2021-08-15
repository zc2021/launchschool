require 'minitest/autorun'

class Empty < Minitest::Test
  def test_empty_object
    assert_empty list
  end
end
