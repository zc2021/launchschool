def prompt(message)
  puts "==> #{message}"
end

def sum_num(number)
  ttl = 0
  while number > 0
    ttl += number
    number -= 1
  end
  ttl
end

def prod_num(number)
  ttl = 1
  while number > 0
    ttl *= number
    number -= 1
  end
  ttl
end

prompt('Please enter an integer greater than 0:')
num = gets.chomp.to_i

prompt('Please choose [s]um or [p]roduct.')
choice = gets.chomp.downcase

if choice == 's'
  result = sum_num(num)
  prompt("The sum of the integers between 1 and #{num} is #{result}.")
elsif choice == 'p'
  result = prod_num(num)
  prompt("The product of the integers between 1 and #{num} is #{result}.")
else
  result = nil
end

prompt('Invalid choice.') unless result

