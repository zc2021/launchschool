def repeater(str)
  doubled_str = ''
  str.chars.each { |char| 2.times { |_| doubled_str << char } }
  doubled_str
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''