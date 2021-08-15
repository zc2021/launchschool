require 'minitest/autorun'

class Type < Minitest::Test
  assert_instance_of Numeric, value
end
