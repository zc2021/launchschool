def each_cons(array, num)
  array.each_index do |idx|
    break if (idx + num - 1) > array.length
    yield *array[idx..(idx + num)]
  end
  nil
end