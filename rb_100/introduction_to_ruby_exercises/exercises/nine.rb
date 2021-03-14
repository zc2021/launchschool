hash = {a: 1, b: 2, c: 3, d: 4}

#1. Get the value of key ':b'
puts hash[:b]

#2. Add to this hash the key:value pair '{e:5}'
hash[:e] = 5
puts hash[:e]

#3. Remove all key:value pairs whose value is less than 3.5
hash = hash.select {|k,v| v < 3.5}
puts hash
