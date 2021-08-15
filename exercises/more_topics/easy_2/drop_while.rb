def drop_while(arr)
  idx = 0
  while idx < arr.length
    unless yield arr[idx]
      return arr[idx..-1]
    end
    idx += 1
    next
  end
  []
end