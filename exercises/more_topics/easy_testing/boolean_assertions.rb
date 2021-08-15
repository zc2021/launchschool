require 'minitest/autorun'

class BooleanExercise < Minitest::Test
  def test_boolean
    assert value.odd?, 'value is not odd'
  end
end
