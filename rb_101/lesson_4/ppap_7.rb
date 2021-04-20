statement = "The Flintstones Rock"

char_freq = statement.chars.each_with_object({}) do |char, hash|
  if hash.has_key?(char)
    hash[char] += 1
  else
    hash[char] = 1
  end
end

p char_freq
