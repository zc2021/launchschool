def leading_substrings(string)
  substrings = []
  0.upto(string.length - 1) do |idx|
    substr = string[0..idx]
    substrings[idx] = substr
  end
  substrings
end

def substrings(string)
  all_substrings = []
  0.upto(string.length - 1) do |idx|
    all_substrings << leading_substrings(string[idx..(string.length - 1)])
  end
  all_substrings.flatten
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]