def stringy(num)
  counter = 0
  binary_string = ''
  while counter < num
    binary_string << '1' if counter % 2 == 0
    binary_string << '0' if counter % 2 == 1
    counter += 1
  end
  binary_string
end


puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
