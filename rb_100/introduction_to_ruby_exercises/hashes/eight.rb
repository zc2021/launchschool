# anagram finder

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

anagrams = words.map do |word| 
  words.select {|w| w if w.chars.sort == word.chars.sort}
end

anagrams = anagrams.uniq

anagrams.each {|a| p a}
