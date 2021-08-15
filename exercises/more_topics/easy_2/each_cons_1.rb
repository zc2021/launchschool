def each_cons(array)
  idx = 1
  while idx < array.length
    yield array[idx - 1], array[idx]
    idx += 1
  end
end