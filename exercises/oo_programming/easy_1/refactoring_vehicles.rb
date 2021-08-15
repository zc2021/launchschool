class Vehicle
  attr_reader :make, :model
  
  def initialize(make, model)
    @make = make
    @model = model
  end

  def to_s
    "#{make} #{model}"
  end
end

class Car < Vehicle
  def wheels
    4
  end
end

class Motorcycle < Vehicle
  def wheels
    2
  end
end

class Truck < Vehicle
  attr_reader :payload

  def initialize(make, model, payload)
    super(make, model)
    @payload = payload
  end

  def wheels
    6
  end
end

test_truck = Truck.new('ford', 'f150', 'bags of gas')
test_car = Car.new('toyota', 'prius')
test_motorcycle = Motorcycle.new('kawasaki', 'lolidk')

puts test_car
puts test_truck
puts test_motorcycle
puts test_truck.payload
puts test_motorcycle.wheels