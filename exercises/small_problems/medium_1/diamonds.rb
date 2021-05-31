# print a diamond n rows tall and, at most, n *s wide

def diamond(n)
  mid = n / 2
  n.times do |i|
    side = ' ' * (i - mid).abs
    puts "#{side.ljust(mid, '*')}*#{side.rjust(mid, '*')}"
  end
end

diamond(1)
diamond(3)
diamond(9)
