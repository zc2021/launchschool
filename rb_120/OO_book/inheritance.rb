module Hitchable
  attr_accessor :cargo

  def hitch(trailer)
    self.cargo = trailer
  end
end

class Vehicle
  attr_accessor :color, :speed
  attr_reader :year, :model

  @@count_of_vehicles = 0

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @speed = 0
    @@count_of_vehicles += 1
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

  def tell_age
    puts "Vehicle is #{self.age} years old."
  end

  def self.gas_mileage(tank_gallons, miles_per_fill)
    miles_per_fill / tank_gallons
  end

  def self.display_vehicle_count
    puts "There are #{@@count_of_vehicles} vehicles on the road."
  end

  private

  def age
    Time.now.year - year.to_i
  end

end

class MyCar < Vehicle
  PLATE = "ABC-123"
end

class MyTruck < Vehicle
  include Hitchable
  PLATE = "XYZF8H9"
end

class Student
  attr_reader :name

  def initialize(name, grade)
    @name = name
    self.grade = grade
  end

  def better_grade_than?(other_student)
    self.grade > other_student.grade
  end

  protected
  
  attr_accessor :grade
end

def spray_paint(car, new_color)
  car.color = new_color
end

test_car = MyCar.new('2002', 'blue', 'prius')
Vehicle.display_vehicle_count
test_truck = MyTruck.new('1984', 'red', 'ford')
Vehicle.display_vehicle_count
test_truck.hitch('test')
test_car.tell_age
puts test_truck.cargo
puts "--Vehicle Method Lookup--"
puts Vehicle.ancestors
puts "--MyCar Method Lookup--"
puts MyCar.ancestors
puts "--MyTruck Method Lookup--"
puts MyTruck.ancestors

joe = Student.new('Joe', 96)
bob = Student.new('Bob', 80)
puts joe.better_grade_than?(bob)
