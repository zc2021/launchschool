require 'minitest/autorun'

class IncludedObject < Minitest::Test
  def test_inclusion
    assert_includes 'xyz', list
  end
end
