def any?(enum)
  return false if enum.is_empty?
  enum.each { |item| return true if yield item }
  false
end