def count(*items)
  counter = 0
  items.each { |item| counter += 1 if yield item }
  counter
end