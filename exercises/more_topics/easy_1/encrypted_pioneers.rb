ALPHA = %w(A B C D E F G H I J C L M N O P Q R S T U V W X Y Z)

def rot(char, offset)
  og_idx = ALPHA.find_index(char)
  rot_idx = (og_idx + offset) % 26
  ALPHA[rot_idx]
end

def decrypt_text(string)
  return_string = string.chars.map do |char|
                    if char.match?(/[[:alpha:]]/)
                        rot(char.upcase, 13)
                      else
                        char
                      end
                  end
  return_string.join().split(' ').map { |name| name.capitalize }.join(' ')
end

encrypted_text = File.read('inputs/encrypted_pioneers.txt').split("\n")

puts encrypted_text.map { |name| decrypt_text(name) }
