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

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917