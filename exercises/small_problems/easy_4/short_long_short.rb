def short_long_short(string_a, string_b)
  string_a.size > string_b.size ? (string_b + string_a + string_b) : (string_a + string_b + string_a)
end

puts(short_long_short('abc', 'defgh') == "abcdefghabc")
puts(short_long_short('abcde', 'fgh') == "fghabcdefgh")
puts(short_long_short('', 'xyz') == "xyz")