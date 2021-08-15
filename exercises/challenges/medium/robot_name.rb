class Robot
  @@names_in_use = []

  def initialize
    @name = nil
  end

  def name
    @name ? @name : set_name
  end

  def reset
    self.name = nil
  end

  private

  attr_writer :name

  def set_name
    name = Robot.make_name
    loop do
      break unless @@names_in_use.include? name
      name = Robot.make_name
    end
    @@names_in_use << name
    self.name = name
  end

  class << self
    def make_name
      letter_1 = ('A'..'Z').to_a[rand(0..25)]
      letter_2 = ('A'..'Z').to_a[rand(0..25)]
      num = "%03d" % rand(0..100)
      letter_1 + letter_2 + num
    end
  end
end