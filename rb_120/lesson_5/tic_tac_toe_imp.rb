require_relative 'pretty_shell.rb'

class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
                   [1, 4, 7], [2, 5, 8], [3, 6, 9],
                   [1, 5, 9], [3, 5, 7]]

  attr_accessor :squares

  def initialize
    @squares = {}
    reset
  end

  def reset
    (1..9).each { |key| squares[key] = Square.new }
  end

  def []=(key, marker)
    squares[key].marker = marker
  end

  def [](key)
    squares[key]
  end

  def unmarked_keys
    squares.keys.select { |key| squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def get_square_markers(sqs)
    squares.values_at(*sqs).reject(&:unmarked?).collect(&:marker)
  end

  def danger_squares(other_player)
    risk_rows = WINNING_LINES.select do |line|
      get_square_markers(line).count(other_player) == 2
    end
    risk_rows.flatten!
    risk_rows.select { |key| squares[key].unmarked? }
  end

  def winning_marker
    WINNING_LINES.each do |line|
      line_markers = get_square_markers(line)
      if line_markers.length == line.length && line_markers.uniq.length == 1
        return line_markers[0]
      end
    end
    nil
  end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def draw_board
    puts "       |       |"
    puts "   #{squares[1]}   |   #{squares[2]}   |   #{squares[3]}"
    puts "       |       |"
    puts "-------+-------+-------"
    puts "       |       |"
    puts "   #{squares[4]}   |   #{squares[5]}   |   #{squares[6]}"
    puts "       |       |"
    puts "-------+-------+-------"
    puts "       |       |"
    puts "   #{squares[7]}   |   #{squares[8]}   |   #{squares[9]}"
    puts "       |       |"
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength
end

class Square
  INITIAL_MARKER = ' '

  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def to_s
    marker
  end
end

class Player
  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end
end

class TTTGame
  include PrettyShell

  HUMAN_MARKER = 'X'
  COMPUTER_MARKER = 'O'
  PTS_TO_WIN = 5

  def play
    display_welcome_message
    main_game
    display_goodbye_message
  end

  private

  attr_accessor :current_player, :scores
  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
    @current_player = human
    @scores = { human: 0, computer: 0 }
  end

  def clear
    system 'clear'
  end

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts ""
  end

  def display_goodbye_message
    puts "Thanks for playing, goodbye!"
    puts ""
  end

  def clear_screen_display_board
    clear
    display_board
  end

  def display_board
    puts "You're #{human.marker} - Computer is #{computer.marker}"
    puts ""
    board.draw_board
    puts ""
  end

  def display_result
    clear_screen_display_board
    case board.winning_marker
    when human.marker
      puts "You won!"
    when computer.marker
      puts "Computer won!"
    else
      puts "It's a tie!"
    end
    display_scores
  end

  def display_scores
    puts "You have #{scores[:human]} points"
    puts "Computer has #{scores[:computer]} points"
    sleep(1)
  end

  def display_play_again_msg
    puts "Let's play again!"
    puts ""
  end

  def main_game
    loop do
      until someone_won_round?
        display_board
        player_moves
        display_result
        reset_game
      end
      break unless play_again?
      display_play_again_msg
    end
  end

  def someone_won_round?
    scores[:human] >= PTS_TO_WIN || scores[:computer] >= PTS_TO_WIN
  end

  def player_moves
    loop do
      current_player_moves
      break if board.someone_won? || board.full?
      clear_screen_display_board if current_player == human
    end
    case board.winning_marker
    when HUMAN_MARKER then scores[:human] += 1
    when COMPUTER_MARKER then scores[:computer] += 1
    end
  end

  def current_player_moves
    if current_player == human
      place_piece(human, human_move)
      self.current_player = computer
    elsif current_player == computer
      place_piece(computer, computer_move)
      self.current_player = human
    end
  end

  def place_piece(player, square)
    board[square] = player.marker
  end

  def human_move
    square = nil
    puts "Choose #{or_join(board.unmarked_keys, ', ')}: "
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, not a valid choice"
    end
    square
  end

  def computer_move
    off_moves = board.danger_squares(COMPUTER_MARKER)
    def_moves = board.danger_squares(HUMAN_MARKER)
    if off_moves.size >= 1
      off_moves.sample
    elsif def_moves.size >= 1
      def_moves.sample
    elsif board[5].unmarked?
      5
    else
      board.unmarked_keys.sample
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y / n)"
      answer = gets.chomp.downcase[0]
      break if %w(y n).include? answer
      puts "Sorry, invalid input."
    end
    answer == 'y'
  end

  def reset_game
    board.reset
    clear
  end
end

TTTGame.new.play
