class Device
  def initialize
    @recordings = []
  end

  def listen
    record(yield) if block_given?
  end

  def play
    recordings[-1]
  end

  private

  attr_accessor :recordings

  def record(recording)
    recordings << recording
  end
end
