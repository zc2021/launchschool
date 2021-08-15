def divisors(n)
  results = []
  (1..(n/2)).each do |x|
    results << x if is_factor?(x, n)
  end
  results << n
  results
end

def is_factor?(div, num)
  num % div == 0
end