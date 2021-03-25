# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

# answer = Kernel.gets()
# Kernel.puts(answer)

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num) # integer validation
  num.to_i() != 0 || num.match?(/0*\.0*/) 
end

def number?(num) # float assignment
  num.to_f().to_s() == num || num.to_i().to_s == num
end

def op_to_msg(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
  op
end

prompt("Welcome to Calculator! Enter your name:")

name = ''
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt("What should I call you?")
  else
    break
  end
end

prompt("Hi #{name}!")

loop do # main loop
  number1 = ''
  number2 = ''

  loop do
    prompt("What's the first number?")
    number1 = Kernel.gets().chomp()

    if number?(number1)
      break
    else
      prompt("Hmm... that doesn't look like a valid number.")
    end
  end

  loop do
    prompt("What's the second number?")
    number2 = Kernel.gets().chomp()

    if number?(number2)
      break
    else
      prompt("Hmm... that doesn't look like a valid number.")
    end
  end

  operator_prompt = <<-MSG
What operation would you like to perform?
  1) add
  2) subtract 
  3) multiply 
  4) divide
  MSG
  prompt(operator_prompt)

  operator = ''

  loop do
    operator = Kernel.gets.chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Must choose 1, 2, 3, or 4")
    end
  end

  prompt("#{op_to_msg(operator)} the two numbers...")

  result = case operator
           when '1'
             number1.to_f() + number2.to_f()
           when '2'
             number1.to_f() - number2.to_f()
           when '3'
             number1.to_f() * number2.to_f()
           when '4'
             number1.to_f() / number2.to_f()
           else
             "an error"
           end

  prompt("The result is #{result}")
  prompt("Do you want to perform another calculation? (Y/other)")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for using the calculator. Goodbye!")
