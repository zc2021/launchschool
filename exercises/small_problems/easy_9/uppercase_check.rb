def uppercase?(str)
  str.chars.all? do |char|
    /[^A-Za-z]/.match?(char) ? true : /[A-Z]/.match?(char)
  end
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true