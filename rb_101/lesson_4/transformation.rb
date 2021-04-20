def double_numbers(numbers)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    doubled_numbers << current_number * 2

    counter += 1
  end

  doubled_numbers
end

def double_numbers!(numbers)
  counter = 0
  loop do
    break if counter >= numbers.size
    num = numbers[counter]
    numbers[counter] = num * 2
    counter += 1
  end
end

my_numbers = [1, 4, 3, 7, 2, 6]
p my_numbers

first_dble = double_numbers(my_numbers) # => [2, 8, 6, 14, 4, 12]
double_numbers!(my_numbers)

p first_dble
p my_numbers
