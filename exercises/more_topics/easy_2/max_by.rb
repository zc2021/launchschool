def max_by(array)
  max_val = array[0]
  array.each do |item|
    max_val = yield(max_val) > yield(item) ? max_val : item
  end
  max_val
end