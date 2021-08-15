require 'minitest/autorun'

class Exception < Minitest::Test
  def test_exception_assertion
    assert_raises(NoExperienceError) { employee.hire }
  end
end
