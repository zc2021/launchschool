def fizzbuzz(first, last)
  first.upto(last) do |num|
    if num % 3 == 0 || num % 5 == 0
      str = ''
      str << 'Fizz' if num % 3 == 0
      str << 'Buzz' if num % 5 == 0
      puts str
    else
      puts num
    end
  end
end

fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz