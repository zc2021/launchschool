def letter_percentages(string)
  ttl = string.length.to_f
  lower_char = 0
  upper_char = 0
  neither_char = 0
  string.chars.each do |char|
    if /[a-z]/.match?(char)
      lower_char += 1
    elsif /[A-Z]/.match?(char)
      upper_char += 1
    else 
      neither_char += 1
    end
  end
  case_pct = { lowercase: ((lower_char/ttl) * 100),
               upppercase: ((upper_char/ttl) * 100),
               neither: ((neither_char/ttl) * 100)}
end

p letter_percentages('abCdef 123') #== { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') #== { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') #== { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }