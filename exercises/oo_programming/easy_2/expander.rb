class Expander
  def initialize(string)
    @string = string
  end

  def to_s
    self.expand(3) # legal as of Ruby 2.7.0
  end

  private

  def expand(n)
    @string * n
  end
end

expander = Expander.new('xyz')
puts expander