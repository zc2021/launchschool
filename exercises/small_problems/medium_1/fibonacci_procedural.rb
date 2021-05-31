def next_num(n1, n2)
  n1 + n2
end

def fibonacci(n)
  n1 = 1
  n2 = 1
  (n-2).times do |num|
    n3 = next_num(n1, n2)
    n1 = n2
    n2 = n3
  end
  n2
end

p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
p fibonacci(100_001) # => 4202692702.....8285979669707537501