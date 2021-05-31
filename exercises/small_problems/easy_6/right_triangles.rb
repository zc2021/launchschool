def triangle(base)
  1.upto(base) { |n| puts ("*" * n).rjust(base) }
end

triangle(5)