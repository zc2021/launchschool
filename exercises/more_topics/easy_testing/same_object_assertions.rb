require 'minitest/autorun'

class SameObject < Minitest::Test
  def test_same_object
    assert_same list, list.process
  end
end
