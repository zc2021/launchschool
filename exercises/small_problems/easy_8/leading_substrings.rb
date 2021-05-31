def leading_substrings(string)
  substrings = []
  0.upto(string.length - 1) do |idx|
    substr = string[0..idx]
    substrings[idx] = substr
  end
  substrings
end

p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']