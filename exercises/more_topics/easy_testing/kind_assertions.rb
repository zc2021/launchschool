require 'minitest/autorun'

class Kind < Minitest::Test
  def test_kind
    assert_kind_of Numeric, value
  end
end
