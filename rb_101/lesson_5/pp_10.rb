arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

inc_arr = arr.map do |hsh|
  hsh.each do |key, _|
    hsh[key] += 1
  end
end

p inc_arr