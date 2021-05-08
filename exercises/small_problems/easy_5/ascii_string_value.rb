def ascii_value(string)
  return 0 if string.empty?
  ascii_chars = string.chars.map { |char| char.ord }
  ascii_chars.reduce(:+)
end

puts(ascii_value('Four score') == 984)
puts(ascii_value('Launch School') == 1251)
puts(ascii_value('a') == 97)
puts(ascii_value('') == 0)
