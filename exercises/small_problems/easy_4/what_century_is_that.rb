def century(year)
  century_num = year / 100
  century_num = year.digits[0] == 0 ? century_num : century_num + 1
  century_string = century_num.to_s
  return (century_string + 'th') if %w(11 12 13).include? century_string[-2,2]
  case century_string[-1]
  when '1'
    return century_string + 'st'
  when '2'
    return century_string + 'nd'
  when '3'
    return century_string + 'rd'
  end
  century_string + 'th'
end

puts(century(2000) == '20th')
puts(century(2001) == '21st')
puts(century(1965) == '20th')
puts(century(256) == '3rd')
puts(century(5) == '1st')
puts(century(10103) == '102nd')
puts(century(1052) == '11th')
puts(century(1127) == '12th')
puts(century(11201) == '113th')