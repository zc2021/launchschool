def cheap_check num, arr
  arr.include? num
end

def long_check num, arr
  arr.each {|i| return true if i == num}
  false
end

arr = [1, 3, 5, 7, 9, 11]
number = 3

puts long_check(number, arr)
puts cheap_check(number, arr)
