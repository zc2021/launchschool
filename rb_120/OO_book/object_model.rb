module Sing
  def caw(sound)
    puts "cra-#{sound}-awk"
  end

  def chirp
    puts "Chrrip!"
  end
end

class CanaryBird
  include Sing
end

class ParrotBird
  include Sing
end

polly = ParrotBird.new
tweety = CanaryBird.new

polly.caw('hello')
tweety.chirp