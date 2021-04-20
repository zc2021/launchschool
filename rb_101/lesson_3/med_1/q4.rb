def rolling_buffer1(buffer, max_buffer_size, new_element) # definition indicates buffer itself is being modified [buffer passed as argument]
  buffer << new_element # buffer is directly mutated
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element) # note input and buffer are separated in method definition
  buffer = input_array + [new_element] # buffer initialization does not mutate passed array
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

buff1 = [1,2,3,4]
buff2 = [1,2,3,4]
max_sz = 4
new_element = 5

p rolling_buffer1(buff1, max_sz, new_element)
p rolling_buffer2(buff2, max_sz, new_element)
