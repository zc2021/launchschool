class GuessingGameError < StandardError; end
class GuessRangeError < GuessingGameError; end

class GuessingGame
  MAX_GUESSES = 7
  MAX_VAL = 100
  MIN_VAL = 1

  def play
    self.guesses = MAX_GUESSES
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
      when -1 
        puts "Your guess is too low."
      when 0
        puts "That's the number!"
        won = true
        break
      when 1
        puts "Your guess is too high."
      end
      self.guesses -= 1
      break if guesses <= 0
    end
    won ? puts("You won!") : puts("You have no more guesses. You lost!")
    puts "It was #{num}!"
  end

  def get_guess
    puts "You have #{guesses} guesses remaining."
    puts "Enter a number between #{MIN_VAL} and #{MAX_VAL}: "
    self.current_guess = gets.chomp.to_i
  end

  private

  attr_accessor :num, :guesses, :current_guess

  def set_num
    self.num = Random.rand(MAX_VAL) + MIN_VAL
  end

  def valid_guess?
    raise GuessRangeError, "Invalid guess." if current_guess < MIN_VAL || current_guess > MAX_VAL
    true
  end
end

game = GuessingGame.new
game.play

game.play
