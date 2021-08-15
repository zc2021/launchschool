require 'minitest/autorun'

class Refutations < Minitests::Test
  def test_refutation
    refute_includes 'xyz', list
  end
end
