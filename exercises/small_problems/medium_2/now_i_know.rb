BLOCKS = [['B', 'O'], ['X', 'K'], ['D', 'Q'], ['C', 'P'], ['N', 'A'],
          ['G', 'T'], ['R', 'E'], ['F', 'S'], ['J', 'W'], ['H', 'U'],
          ['V', 'I'], ['L', 'Y'], ['Z', 'M']]

def block_check?(word)
  BLOCKS.all? do |block|
    !(word.upcase.include?(block[0]) && word.upcase.include?(block[1]))
  end
end
      
def block_word?(word)
  word.chars.uniq == word.chars && block_check?(word)
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true