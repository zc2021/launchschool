def count(enum)
  counter = 0
  enum.each { |item| counter += 1 if yield item }
  counter
end