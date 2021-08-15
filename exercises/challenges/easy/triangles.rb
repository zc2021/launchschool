class Triangle
  attr_reader :sides, :kind

  def initialize(a, b, c)
    @sides = [a, b, c]
    unless sides_valid?()
      raise ArgumentError
    end
    @kind = set_kind
  end

  private

  def sides_valid?
    a, b, c = sides[0], sides[1], sides[2]
    return false if a < 0 || (b < 0 || c < 0)
    (a + b > c) && ((b + c > a) && (a + c > b))
  end

  def set_kind
    case sides.uniq.size
    when 1 then return 'equilateral'
    when 2 then return 'isosceles'
    when 3 then return 'scalene'
    end
  end
end