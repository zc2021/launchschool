def one?(enum)
  return false if enum.empty?
  found = false
  enum.each do |item|
    next unless yield item
    return false if found
    found = true
  end
  found
end