def cleanup(string)
  string.gsub(/[^a-z]+/,' ')
end

puts(cleanup("---what's my +*& line?") == ' what s my line ')