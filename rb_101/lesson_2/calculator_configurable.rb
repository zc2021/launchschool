# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

require 'yaml'

MESSAGES = YAML.load_file('calc_messages.yml')
OPERATIONS = MESSAGES['ops']
ERRORS = MESSAGES['errors']

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num) # integer validation
  num.to_i() != 0 || num.match?(/0*\.0*/)
end

def number?(num) # float assignment
  num.to_f().to_s() == num || num.to_i().to_s == num
end

prompt(MESSAGES['welcome'])

name = ''
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt(ERRORS['name_error'])
  else
    break
  end
end

prompt("#{MESSAGES['greet']} #{name}!")

loop do # main loop
  number1 = ''
  number2 = ''

  loop do
    prompt(MESSAGES['num_a'])
    number1 = Kernel.gets().chomp()

    if number?(number1)
      break
    else
      prompt(ERRORS['num_error'])
    end
  end

  loop do
    prompt(MESSAGES['num_b'])
    number2 = Kernel.gets().chomp()

    if number?(number2)
      break
    else
      prompt(ERRORS['num_error'])
    end
  end

  prompt(MESSAGES['op_prompt'])

  operator = ''

  loop do
    operator = Kernel.gets.chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(ERRORS['op_error'])
    end
  end

  prompt("#{OPERATIONS[operator]} #{MESSAGES['op_perform']}")

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

  prompt("#{MESSAGES['op_result']} #{result}")
  prompt(MESSAGES['continue'])
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt(MESSAGES['goodbye'])
