class AngryCat
  def initialize(age, name)
    @age  = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end

tom = AngryCat.new(3, 'Tom')
randall = AngryCat.new(5, 'Randall')