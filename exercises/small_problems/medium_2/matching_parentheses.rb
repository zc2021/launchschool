def balanced?(string)
  parens = string.gsub(/[^\(\)]/,'').chars
  left = 0
  parens.each do |bracket|
    if bracket == '('
      left += 1
    else
      left -= 1
      return false if left < 0
    end
  end
  left == 0
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false