class Animal
  def run
    'running!'
  end

  def jump
    'jumping!'
  end
end

class Dog < Animal
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end

  def fetch
    'fetching!'
  end
end

class Bulldog < Dog
  def swim
    "can't swim!"
  end
end

class Cat < Animal
  def speak 
    'meow!'
  end
end

teddy = Dog.new
rob = Bulldog.new
sammy = Cat.new
puts teddy.speak           # => "bark!"
puts teddy.swim           # => "swimming!"
puts rob.speak           # => "bark!"
puts rob.swim           # => "can't swim!"
puts sammy.speak
puts sammy.jump
