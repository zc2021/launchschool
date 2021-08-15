class Clock
  attr_reader :hour, :min

  def initialize(hour, min)
    set_time(hour, min)
  end

  def to_s
    "%02d:%02d" % [hour, min]
  end

  def -(int)
    set_time(hour, min - int)
    self
  end

  def +(int)
    set_time(hour, min + int)
    self
  end

  def ==(other_clock)
    hour == other_clock.hour && min == other_clock.min
  end

  private

  attr_writer :hour, :min

  def set_time(hour, min)
    carry = min / 60
    min %= 60
    hour += carry
    hour %= 24
    self.hour = hour
    self.min = min
  end

  class << self
    def at(hour, min=0)
      Clock.new(hour, min)
    end
  end
end