def map(array)
  return_array = []
  unless array.empty?
    array.each { |item| return_array << yield(item) }
  end
  return_array
end