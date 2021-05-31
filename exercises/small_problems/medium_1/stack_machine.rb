def minilang(program_string)
  program_array = program_string.split(' ')
  memory = { stack: [], register: 0 }
  pointer = 0
  until pointer >= program_array.length
    if program_array[pointer].to_i.to_s == program_array[pointer]
      memory[:register] = program_array[pointer].to_i
    else
      case program_array[pointer]
      when "PUSH"
        memory[:stack] << memory[:register]
      when "ADD"
        memory[:register] += memory[:stack].pop
      when "SUB"
        memory[:register] -= memory[:stack].pop
      when "DIV"
        memory[:register] /= memory[:stack].pop
      when "MULT"
        memory[:register] *= memory[:stack].pop
      when "MOD"
        memory[:register] %= memory[:stack].pop
      when "POP"
        memory[:register] = memory[:stack].pop
      when "PRINT"
        puts memory[:register]
      end
    end
    pointer += 1
  end
  puts "------"
end

minilang('PRINT')
# 0

minilang('5 PUSH 3 MULT PRINT')
# 15

minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8

minilang('5 PUSH POP PRINT')
# 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6

minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12

minilang('-3 PUSH 5 SUB PRINT')
# 8

minilang('6 PUSH')
# (nothing printed; no PRINT commands)