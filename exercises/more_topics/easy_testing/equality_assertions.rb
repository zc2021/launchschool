require 'minitest/autorun'

class Equality < Minitest::Test
  assert_equal('xyz', value.downcase)
end
