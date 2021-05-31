def double_consonants(str)
  doubled_str = ''
  str.chars.each do |char| 
    doubled_str << char
    unless %w(a e i o u).include?(char.downcase) || /[^a-z]/.match?(char.downcase)
      doubled_str << char 
    end
  end
  doubled_str
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""