class Person
  attr_accessor :first_name, :last_name

  def initialize(first, last='')
    @first_name = first
    @last_name = last
  end

  def name
    @last_name.length > 0 ? "#{@first_name} #{@last_name}" : @first_name
  end

  def name=(new_name)
    @first_name, @last_name = new_name.split
  end

  def to_s
    name
  end

end

bob = Person.new('Robert')
p bob.name                  # => 'Robert'
p bob.first_name            # => 'Robert'
p bob.last_name             # => ''
bob.last_name = 'Smith'
p bob.name                  # => 'Robert Smith'

bob.name = "John Adams"
p bob.first_name            # => 'John'
p bob.last_name             # => 'Adams'

puts "The person's name is #{bob}"