factorial = Enumerator.new do |y|
  y << 1
  n = 1
  loop do
    val = 1
    n.downto(1) do |x|
      val = val * x
    end
    y << val
    n += 1
  end
end

p factorial.take(7)
p factorial.take(3)
factorial.rewind
p factorial.take(7)

# [1, 1, 2, 6, 24, 125 ...]