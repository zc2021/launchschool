def none?(enum)
  enum.each { |item| return false if yield item }
  true
end