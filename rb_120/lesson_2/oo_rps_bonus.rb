require_relative 'pretty_shell.rb'

PAUSE = 0.75

class Player
  attr_accessor :move, :name, :score
  attr_reader :history

  def initialize
    set_name
    @score = { wins: 0, losses: 0, ties: 0 }
    @history = {}
    @num_games = 0
  end

  def won!
    score[:wins] += 1
  end

  def lost!
    score[:losses] += 1
  end

  def tied!
    score[:ties] += 1
  end

  def reset_scores!
    score[:wins], score[:losses], score[:ties] = 0, 0, 0
    self.num_games += 1
  end

  private
  attr_accessor :num_games
  
  def save_move
    if history[num_games]
      history[num_games] << move
    else
      history[num_games] = [move]
    end
  end
end

class Human < Player
  include PrettyShell
  
  def set_name
    n = ''
    loop do
      msg_screen "What's your name?"
      n = gets.chomp
      break unless n.empty?
      pretty_print "Sorry, must enter a value."
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      msg_screen "Please choose #{pretty_choice_syms(Move::MOVES)}:"
      choice = gets.chomp.to_sym
      break if Move::MOVES.include? choice
      msg_screen "Sorry, invalid choice."
      sleep(PAUSE)
    end
    self.move = Move.make(choice)
    save_move
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Wall-E', 'Sonny', 'No. 5'].sample
  end

  def choose
    self.move = Move.make(Move::MOVES.sample)
    save_move
  end
end

class Move
  attr_reader :value, :wins_against

  MOVES = [:rock, :paper, :scissors, :lizard, :spock]

  def self.make(choice)
    case choice
    when :rock then Rock.new
    when :paper then Paper.new
    when :scissors then Scissors.new
    when :lizard then Lizard.new
    when :spock then Spock.new
    end
  end

  def to_s
    value
  end

  def beats? other_move
    wins_against.include? other_move.value
  end
end

class Rock < Move
  def initialize
    @value = 'rock'
    @wins_against = ['scissors', 'lizard']
  end

  def make
    self.initialize
  end
end

class Paper < Move
  def initialize
    @value = 'paper'
    @wins_against = ['rock', 'spock']
  end

  def make
    self.initialize
  end
end

class Scissors < Move
  def initialize
    @value = 'scissors'
    @wins_against = ['paper', 'lizard']
  end

  def make
    self.initialize
  end
end

class Lizard < Move
  def initialize
    @value = 'lizard'
    @wins_against = ['paper', 'spock']
  end

  def make
    self.initialize
  end
end

class Spock < Move
  def initialize
    @value = 'spock'
    @wins_against = ['scissors', 'rock']
  end

  def make
    self.initialize
  end
end

class RPSGame
  include PrettyShell

  MAX_POINTS = 5

  attr_accessor :human, :computer, :num_wins

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    msg_screen "Welcome to Rock, Paper, Scissors!"
    sleep(PAUSE * 2)
  end

  def display_goodbye_message
    msg_screen "Thanks for playing, goodbye!"
  end

  def valid_game_length?(n)
    n.to_i.to_s == n && (1..MAX_POINTS).include?(n.to_i)
  end

  def set_game_length
    answer = nil
    loop do
      msg_screen "How many points to win?"
      pretty_print "Please enter a number [1 - #{MAX_POINTS}]"
      answer = gets.chomp
      break unless !valid_game_length?(answer)
      msg_screen "Sorry, invalid input."
      sleep(PAUSE)
    end
    self.num_wins = answer.to_i
  end

  def display_moves
    h_move =  "#{human.name} chose #{human.move}."
    c_move =  "#{computer.name} chose #{computer.move}."
    msg_screen h_move, c_move
    sleep(PAUSE)
  end

  def display_winner
    if winner?(human)
      msg_screen "#{human.name} won!"
    elsif winner?(computer)
      msg_screen "#{computer.name} won!"
    else
      msg_screen "It's a tie!"
    end
    sleep(PAUSE)
  end

  def display_score
    h_score = "#{human.name} has #{human.score[:wins]} points."
    c_score = "#{computer.name} has #{computer.score[:wins]} points."
    msg_screen h_score, c_score
    sleep(PAUSE)
  end

  def find_winner
    return human if human.move.beats? computer.move
    return computer if computer.move.beats? human.move
    nil
  end

  def winner?(player)
    player == find_winner
  end

  def score_round
    if winner?(human)
      human.won!
      computer.lost!
    elsif winner?(computer)
      human.lost!
      computer.won!
    else
      human.tied!
      computer.tied!
    end
  end

  def play_again?
    answer = nil
    loop do
      msg_screen "Play again? Y / N"
      answer = gets.chomp
      break if ['y', 'n'].include? answer
      msg_screen "Sorry, invalid choice."
      sleep(PAUSE)
    end
    answer == 'y'
  end

  def play_rounds(n)
    loop do
      human.choose
      computer.choose
      display_moves
      score_round
      display_winner
      display_score
      break if human.score[:wins] >= n ||
               computer.score[:wins] >= n
    end
  end

  def play
    display_welcome_message
    loop do
      human.reset_scores!
      computer.reset_scores!
      set_game_length
      play_rounds(num_wins)
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play
