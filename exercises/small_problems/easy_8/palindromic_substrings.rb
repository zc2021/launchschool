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

def palindromes(string)
  all_substrings = substrings(string)
  all_substrings.select { |substr| substr == substr.reverse && substr.length > 1 }
end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]