def palindrome?(string)
  mid_point = (string.size / 2) -1 
  (0..mid_point).each { |idx| return false unless string[idx] == string[-(idx + 1)] }
  true
end

puts(palindrome?('madam') == true)
puts(palindrome?('Madam') == false)          # (case matters)
puts(palindrome?("madam i'm adam") == false) # (all characters matter)
puts(palindrome?('356653') == true)
