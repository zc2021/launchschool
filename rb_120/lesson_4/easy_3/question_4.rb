class Cat
  attr_reader :type

  def initialize(type)
    @type = type
  end

  def to_s
    "I am a #{type} cat."
  end
end

roger = Cat.new('tabby')

puts roger