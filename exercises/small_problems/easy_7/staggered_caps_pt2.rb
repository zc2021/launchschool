def staggered_case(string, start_case='up')
  new_string = ''
  char_case = start_case
  string.chars.each do |char|
    if /[A-Za-z]/.match? char
      if char_case == 'up'
        new_string << char.upcase
        char_case = 'down'
      elsif char_case == 'down'
        new_string << char.downcase
        char_case = 'up'
      else
        return 'Invalid case given'
      end
    else
      new_string << char
    end
  end
  new_string
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'