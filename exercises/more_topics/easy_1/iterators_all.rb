def all?(enum)
  return true if enum.is_empty?
  enum.each { |item| return false unless yield item }
  true
end