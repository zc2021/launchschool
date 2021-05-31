def group_anagrams(list)
  groups = {}
  list.each do |word|
    letters = word.chars.sort
    if groups.keys.include?(letters)
      groups[letters] << word
    else
      groups[letters.freeze] = [word]
    end
  end
  groups.values
end

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
  'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
  'flow', 'neon']

p group_anagrams(words)