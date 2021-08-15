class Machine
  attr_reader :switch

  def initialize
    @switch = :off
  end

  def start
    self.flip_switch(:on)
  end
  
  def stop
    self.flip_switch(:off)
  end

  def to_s
    switch.to_s
  end
  
  private

  attr_writer :switch
  
  def flip_switch(desired_state)
    self.switch = desired_state
  end
end

switch = Machine.new
puts switch.start
puts switch.stop