class GuessingGameError < StandardError; end
class GuessRangeError < GuessingGameError; end

class GuessingGame
  attr_reader :min, :max, :max_guesses

  def initialize(min, max)
    @min = min
    @max = max
    @max_guesses = Math.log2(size_of_range).to_i + 1
  end

  def play
    self.guesses = max_guesses
    won = false
    set_num
    loop do
      loop do
        get_guess
        break if valid_guess?
      rescue GuessRangeError => e
        puts e.message
      end
      case current_guess <=> num
      when -1 then puts "Your guess is too low."
      when 0
        puts "That's the number!"
        won = true
        break
      when 1 then puts "Your guess is too high."
      end
      self.guesses -= 1
      break if guesses <= 0
    end
    won ? puts("You won!") : puts("You have no more guesses. You lost!")
    puts "It was #{num}!"
  end

  def get_guess
    puts "You have #{guesses} guesses remaining."
    puts "Enter a number between #{min} and #{max}: "
    self.current_guess = gets.chomp.to_i
  end

  private

  attr_accessor :num, :guesses, :current_guess

  def set_num
    self.num = Random.rand(min..max)
  end

  def valid_guess?
    raise GuessRangeError, "Invalid guess." if current_guess < min || current_guess > max
    true
  end

  def size_of_range
    max - min
  end
end

game = GuessingGame.new(5, 2000)
game.play

game.play
