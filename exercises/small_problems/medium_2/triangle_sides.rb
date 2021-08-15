def triangle(a, b, c)
  sides = [a.to_f, b.to_f, c.to_f].sort
  return :invalid if sides[0] + sides[1] < sides[2] || sides.any? { |s| s == 0 }
  return :equilateral if sides.sum / 3 == sides[0]
  return :isosceles if (sides[0] + sides [1]) / 2 == sides[0] || (sides[1] + sides [2]) / 2 == sides[1]
  :scalene
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid