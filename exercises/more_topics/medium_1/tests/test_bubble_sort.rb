require 'minitest/autorun'

require_relative '../bubble_sort'

class BubbleSort < Minitest::Test
  def test_array_argument
    array = [5, 3]
    bubble_sort!(array)
    assert_equal([3, 5], array)
  end

  def test_array_with_block
    array = [5, 3, 7]
    bubble_sort!(array) { |first, second| first >= second }
    assert_equal([7, 5, 3], array)
  end

  def test_longer_array
    array = [6, 2, 7, 1, 4]
    bubble_sort!(array)
    assert_equal([1, 2, 4, 6, 7], array)
  end

  def test_longer_array_with_block
    array = [6, 12, 27, 22, 14]
    bubble_sort!(array) { |first, second| (first % 7) <= (second % 7) }
    assert_equal([14, 22, 12, 6, 27], array)
  end

  def test_string_array
    array = %w(sue Pete alice Tyler rachel Kim bonnie)
    bubble_sort!(array)
    assert_equal(%w(Kim Pete Tyler alice bonnie rachel sue), array)
  end

  def test_string_array_with_block
    array = %w(sue Pete alice Tyler rachel Kim bonnie)
    bubble_sort!(array) { |first, second| first.downcase <= second.downcase }
    assert_equal(%w(alice bonnie Kim Pete rachel sue Tyler), array)
  end
end