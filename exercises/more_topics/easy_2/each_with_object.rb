def each_with_object(enum, obj)
  enum.each { |item| yield item, obj }
  obj
end