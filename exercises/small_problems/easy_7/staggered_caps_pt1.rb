def staggered_case(string)
  new_chars = []
  string.chars.each_with_index do |char, idx|
    if idx == 0 || idx % 2 == 0
      new_chars[idx] = char.upcase
    elsif idx % 2 == 1
      new_chars[idx] = char.downcase
    end
  end
  new_chars.join('')
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'