def center_of(string)
  midpoint = string.length / 2
  return string.chars[midpoint] if string.length.odd?
  string[(midpoint - 1)..midpoint]
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'