def rotate_array(arr)
  arr[1..-1] + [arr[0]]
end

def rotate_rightmost_digits(int, digits)
  num_chars = int.to_s.chars
  num_length = num_chars.size
  static_digits = num_chars[0...(num_length - digits)]
  rotated_digits = rotate_array(num_chars[-digits..-1])
  (static_digits + rotated_digits).join('').to_i
end

def max_rotation(int)
  i = 0
  length = int.to_s.size
  num = int
  until i >= length
    num = rotate_rightmost_digits(num, length - i)
    i += 1
  end
  num
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845