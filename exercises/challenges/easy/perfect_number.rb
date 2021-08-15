class PerfectNumber
  class << self
    def classify(num)
      raise StandardError if num < 0
      a_sum = aliquot_sum(num)
      case a_sum <=> num
      when -1 then 'deficient'
      when 0 then 'perfect'
      when 1 then 'abundant'
      end
    end

    private

    def aliquot_sum(num)
      sum = 0
      1.upto(num - 1) do |i|
        sum += i if num % i == 0
      end
      sum
    end
  end
end