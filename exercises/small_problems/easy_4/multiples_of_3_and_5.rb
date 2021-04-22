def multisum(ceiling)
  counter = 1
  multiples = []
  until counter > ceiling
    multiples << counter if counter % 3 == 0 || counter % 5 == 0
    counter += 1
  end
  multiples.reduce(:+)
end

puts(multisum(3) == 3)
puts(multisum(5) == 8)
puts(multisum(10) == 33)
puts(multisum(1000) == 234168)