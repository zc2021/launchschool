class MyCar
  attr_accessor :color, :speed
  attr_reader :year, :model

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @speed = 0
  end

  def to_s
    "#{year} #{model}: #{color}"
  end
  
  def speed_up
    self.speed += 1
  end
  
  def brake
    self.speed -= 1
  end
  
  def turn_off
    self.speed = 0
  end

  def self.gas_mileage(tank_gallons, miles_per_fill)
    miles_per_fill / tank_gallons
  end
end

def spray_paint(car, new_color)
  car.color = new_color
end

test_car = MyCar.new('2002', 'blue', 'prius')
puts test_car.year
puts test_car.color
puts test_car.model
spray_paint(test_car, 'green')
puts test_car.color
puts test_car