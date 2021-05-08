arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

even_arr = arr.select do |hsh|
  hsh.all? { |_, sub_arr| sub_arr.all? { |int| int % 2 == 0 } }
end

p even_arr