def upcase_long str
  return str unless str.length > 10
  str.upcase
end

puts upcase_long('short')
puts upcase_long('longer test string')
