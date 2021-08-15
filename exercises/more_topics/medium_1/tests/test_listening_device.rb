require 'minitest/autorun'

require_relative '../listening_device'

class ListeningDevice < Minitest::Test
  def test_listen
    listener = Device.new
    listener.listen { "Hello World!" }
    listener.listen
    assert_equal("Hello World!", listener.play)
  end
end