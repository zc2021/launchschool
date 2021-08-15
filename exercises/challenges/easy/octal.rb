class Octal
  attr_reader :base_eight

  def initialize(str)
    @base_eight = str
  end

  def to_decimal
    return 0 unless valid?
    base_ten = 0
    digits = base_eight.chars.reverse.map { |d| d.to_i }
    digits.each_with_index { |d, idx| base_ten += d * (8 ** idx) }
    base_ten
  end

  private

  def valid?
    base_eight.chars.all? { |c| c.to_i.to_s == c && c.to_i < 8 }
  end
end