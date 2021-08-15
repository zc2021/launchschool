class MinilangError < StandardError; end
class TokenError < MinilangError; end
class EmptystackError < MinilangError; end

class Minilang
  COMMANDS = ['PUSH', 'ADD', 'SUB', 'MULT', 'DIV', 'MOD', 'POP', 'PRINT']

  def initialize(prog_string)
    @register = 0
    @memory_stack = []
    @command_stack = prog_string.split(' ')
  end

  def eval
    puts "---"
    command_stack.each do |cmd|
      read_command(cmd)
    end
  rescue MinilangError => e
    puts e.message
  end

  private

  attr_accessor :register, :memory_stack
  attr_reader :command_stack

  def read_command cmd
    unless valid_token? cmd
      raise TokenError, "Invalid token: #{cmd}"
    end
    if is_n? cmd
      self.register = cmd.to_i
    else
      self.send(cmd.downcase)
    end
  end

  def valid_token? cmd
    is_n?(cmd) || COMMANDS.include?(cmd)
  end

  def is_n? cmd
    cmd.to_i.to_s == cmd
  end

  def push
    memory_stack.push register
  end

  def add
    self.register = register + memory_stack.pop
  end

  def sub
    self.register = register - memory_stack.pop
  end

  def mult
    self.register = register * memory_stack.pop
  end

  def div
    self.register = register / memory_stack.pop
  end

  def mod
    self.register = register % memory_stack.pop
  end

  def pop
    raise EmptystackError, "Empty stack!" if memory_stack.empty?
    self.register = memory_stack.pop
  end
  
  def print
    puts register
  end
end

Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)