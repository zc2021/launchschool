class RomanNumeral
  DIGITS = ['I', 'V', 'X', 'L', 'C', 'D', 'M']

  attr_reader :value

  def initialize(int)
    @value = int
  end

  def to_roman
    remainder = value

    thousands = RomanNumeral.reduce('M' * (remainder / 1000))
    remainder %= 1000

    hundreds = RomanNumeral.reduce('C' * (remainder / 100))
    remainder %= 100

    tens = RomanNumeral.reduce('X' * (remainder / 10))
    remainder %= 10

    ones = RomanNumeral.reduce('I' * remainder)
    
    thousands + hundreds + tens + ones
  end

  class << self
    def reduce(num_string)
      digit = num_string.chars.uniq[0]
      idx = DIGITS.find_index(digit)
      case num_string.length
      when 0 then ''
      when 1..3 then num_string
      when 4 then digit + DIGITS[idx + 1]
      when 9 then digit + DIGITS[idx + 2]
      else DIGITS[idx + 1] + (digit * (num_string.length - 5))
      end
    end
  end
end