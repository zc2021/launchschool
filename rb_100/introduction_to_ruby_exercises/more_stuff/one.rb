def print_lab? str
  puts(str) if /lab/.match?(str.downcase)
end

test_words = ["laboratory", "experiment", "Pans Labyrinth", "elaborate", "polar bear"]

test_words.each {|w| print_lab? w}
