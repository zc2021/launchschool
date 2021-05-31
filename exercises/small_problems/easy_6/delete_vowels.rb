VOWELS = %w(a e i o u)

def remove_vowels(array)
  consonant_strings = array.map do |word|
                        word.chars.reject { |char| VOWELS.include?(char.downcase) }.join('')
                      end
  consonant_strings
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']