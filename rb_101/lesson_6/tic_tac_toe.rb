require 'pry'

GAME_LENGTH = 5
START_CHOICES = { 'p' => 'Player', 'c' => 'Computer', 'r' => 'Random' }

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

WINNING_ROWS = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
WINNING_COLS = [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
WINNING_DIAG = [[1, 5, 9], [3, 5, 7]]
WINNING_LINES = WINNING_COLS + WINNING_ROWS + WINNING_DIAG

def prompt(msg)
  puts "=> #{msg}"
end

def joinor(arr, sep=', ', lst='or')
  case arr.length
  when 0 then return ''
  when 1 then return arr[0].to_s
  when 2 then return "#{arr[0]} #{lst} #{arr[1]}"
  else
    str = arr[0..(arr.length - 2)].join(sep)
    str << " #{lst} #{arr[-1]}"
  end
  str
end

# rubocop:disable Metrics/MethodLength,Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
  puts "~ PLAYER:   #{PLAYER_MARKER} ~"
  puts "~ COMPUTER: #{COMPUTER_MARKER} ~"
  puts ""
end
# rubocop:enable Metrics/MethodLength,Metrics/AbcSize

def initalize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def board_full?(brd)
  empty_squares(brd) == []
end

def danger_squares(brd)
  open_plays = empty_squares(brd)
  danger_rows = WINNING_LINES.select do |line|
    brd.values_at(*line).count(PLAYER_MARKER) == 2
  end

  danger_squares = danger_rows.map do |d_line|
    d_line.select { |sq| open_plays.include? sq }
  end

  danger_squares.flatten
end

def find_danger?(brd)
  danger_squares(brd).length > 0
end

def opp_squares(brd)
  open_plays = empty_squares(brd)
  opp_rows = WINNING_LINES.select do |line|
    brd.values_at(*line).count(COMPUTER_MARKER) == 2
  end

  opp_squares = opp_rows.map do |o_line|
    o_line.select { |sq| open_plays.include? sq }
  end

  opp_squares.flatten
end

def find_opportunity?(brd)
  opp_squares(brd).length > 0
end

def player_move!(brd)
  square = ''
  loop do
    prompt "Choose an empty square (#{joinor(empty_squares(brd), ', ', 'or')}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

def computer_move!(brd)
  square = if find_opportunity?(brd)
             opp_squares(brd).sample
           elsif find_danger?(brd)
             danger_squares(brd).sample
           else
             empty_squares(brd).include?(5) ? 5 : empty_squares(brd).sample
           end
  brd[square] = COMPUTER_MARKER
end

def move!(brd, crt_ply)
  case crt_ply
  when 'Player' then player_move!(brd)
  when 'Computer' then computer_move!(brd)
  end
end

def switch_player(crt_ply)
  case crt_ply
  when 'Player' then 'Computer'
  when 'Computer' then 'Player'
  end
end

def detect_round_winner(brd)
  WINNING_LINES.each do |line|
    return 'Player' if brd.values_at(*line).count(PLAYER_MARKER) == 3
    return 'Computer' if brd.values_at(*line).count(COMPUTER_MARKER) == 3
  end
  nil
end

def someone_won_round?(brd)
  !!detect_round_winner(brd)
end

def display_scoreboard(p_w, c_w, t)
  system 'clear'
  puts "+------------------------------+"
  puts "|  Player: #{p_w}    | Computer: #{c_w}  |"
  puts "|            TIES: #{t}           |"
  puts "+------------------------------+"
end

def detect_game_winner(p_w, c_w)
  return ' Player ' if p_w > c_w && p_w >= GAME_LENGTH
  return 'Computer' if c_w > p_w && c_w >= GAME_LENGTH
  nil
end

def game_stats(p_w, c_w, t)
  ttl_rnds = p_w + c_w + t
  p_win_pct = ((p_w * 100) / (ttl_rnds * 100)) / (100)
  c_win_pct = ((c_w * 100) / (ttl_rnds * 100)) / (100)
  [ttl_rnds, p_win_pct, c_win_pct]
end

def display_round_results(p_w, c_w, t)
  winner = detect_game_winner(p_w, c_w)
  display_scoreboard(p_w, c_w, t)
  if winner
    puts "|       WINNER: #{winner.upcase}       |"
  elsif p_w < 5 && c_w < 5
    puts "|          INCOMPLETE          |"
  else
    puts "|          GAME  TIED          |"
  end
  puts "+------------------------------+"
end

loop do
  p_wins = 0
  c_wins = 0
  ties = 0

  answer = nil

  loop do
    prompt "Who should start? [P]layer / [C]omputer / [R]andom"
    answer = gets.chomp.downcase
    break if START_CHOICES.keys.include?(answer[0])
    prompt "Sorry, that's not a valid choice."
  end

  current_player = if answer[0] == 'r'
                     START_CHOICES.select { |key, _| key != 'r' }.values.sample
                   else
                     START_CHOICES[answer[0]]
                   end

  loop do
    board = initalize_board
    display_board(board)

    loop do
      display_board(board)
      move!(board, current_player)
      current_player = switch_player(current_player)
      break if someone_won_round?(board) || board_full?(board)
    end

    display_board(board)

    if someone_won_round?(board)
      winner = detect_round_winner(board)
      p_wins += winner == 'Player' ? 1 : 0
      c_wins += winner == 'Computer' ? 1 : 0
      prompt "#{winner} won!"
    else
      prompt "It's a tie!"
      ties += 1
    end

    display_scoreboard(p_wins, c_wins, ties)

    break if detect_game_winner(p_wins, c_wins)

    prompt "Keep going? [Y] / [N]"
    answer = gets.chomp
    break unless answer.downcase.start_with?('y')
  end

  display_round_results(p_wins, c_wins, ties)

  prompt "Another round? [Y] / [N]"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing Tic Tac Toe. Goodbye!"
