require 'minitest/autorun'
require '../divisors'

class DivisorsTest < Minitest::Test
  def test_one
    assert_equal([1], divisors(1).sort)
  end

  def test_prime
    assert_equal([1, 7], divisors(7).sort)
  end

  def test_even
    assert_equal([1, 2, 3, 4, 6, 12], divisors(12).sort)
    assert_equal([1, 2, 7, 14, 49, 98], divisors(98).sort)
  end

  def test_large
    assert_equal([1, 9967, 9973, 99400891], divisors(99400891).sort)
  end
end
