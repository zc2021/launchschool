def next_fib_num_pair(sequence=[1,1])
  num_1 = sequence[0]
  num_2 = sequence[1]
  next_num = num_1 + num_2
  [num_2, next_num]
end

def num_digits(int)
  int.to_s.length
end

def find_fibonacci_index_by_length(len)
  fib_pair = next_fib_num_pair
  ret_idx = 3
  loop do 
    fib_pair = next_fib_num_pair(fib_pair)
    ret_idx += 1
    break if num_digits(fib_pair[-1]) == len
  end
  ret_idx
end

p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847
