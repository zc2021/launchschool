def multiply(numbers, factor)
  counter = 0
  return_array = []

  loop do
    break if counter >= numbers.length
    return_array << numbers[counter] * factor
    counter += 1
  end

  return_array
end

my_numbers = [1, 4, 3, 7, 2, 6]
p my_numbers
p multiply(my_numbers, 3) # => [3, 12, 9, 21, 6, 18]