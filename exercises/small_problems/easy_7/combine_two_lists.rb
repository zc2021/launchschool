def interleave(list_1, list_2)
  woven_list = []
  (0...list_1.length).each do |idx|
    woven_list << list_1[idx]
    woven_list << list_2[idx]
  end
  woven_list
end

puts interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']