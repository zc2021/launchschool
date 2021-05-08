def crunch(double_string)
  single_string = ''
  prev_char = nil
  double_string.each_char do |char|
    if prev_char
      single_string << char unless prev_char == char
    else
      single_string << char
    end
    prev_char = char
  end
  single_string
end

puts(crunch('ddaaiillyy ddoouubbllee') == 'daily double')
puts(crunch('4444abcabccba') == '4abcabcba')
puts(crunch('ggggggggggggggg') == 'g')
puts(crunch('a') == 'a')
puts(crunch('') == '')