SCREEN_WIDTH = 40

CARD_SUITS = %w(H D C S)
CARD_VALUES = %w(02 03 04 05 06 07 08 09 10 J* Q* K* A*)

CARD_BACK = '|XX|'

DEF_RNDS = 7

WIN_VALUE = 21
AI_BREAKPOINT = 17

# housekeeping

def prompt(msg)
  width = SCREEN_WIDTH - 10
  puts "~*~> #{msg.center(width)} <~*~"
end

def pretty_name(sym)
  str = sym.to_s
  str.split('_').join(' ').capitalize.ljust(8)
end

def yn_question?(msg)
  prompt msg.to_s
  prompt "[Y] / [N]"
  answer = gets.chomp.downcase
  answer.start_with? 'y'
end

# setup

def make_table(guest_count=1)
  all_players = { dealer: {} }
  guest_count.times do |guest|
    guest_name = "player_#{guest + 1}".to_sym
    all_players[guest_name] = {}
  end
  all_players
end

def create_deck
  cards = {}
  CARD_VALUES.each do |value|
    points = case value
             when 'J*', 'Q*', 'K*' then [10]
             when 'A*' then [1, 11]
             else [value.to_i]
             end
    CARD_SUITS.each do |suit|
      card_face = "#{value} #{suit}"
      cards[card_face] = points
    end
  end
  cards
end

def seat_players(all_p)
  seat_order = all_p.keys.reject { |k| k == :dealer }.shuffle
  players_sitting = {}
  seat_order.each { |name| players_sitting[name] = all_p[name] }
  players_sitting[:dealer] = all_p[:dealer]
  players_sitting
end

# shuffle & deal

def shuffle_deck(deck)
  shuffled_deck = {}
  cards = deck.keys.shuffle
  cards.each do |card|
    shuffled_deck[card] = deck[card]
  end
  shuffled_deck
end

def deal_card(deck, hand)
  card = deck.keys.pop
  hand[card] = deck[card]
  deck[card] = nil
  deck.compact!
end

def deal_hands(deck, players)
  players.keys.each do |player_hand|
    2.times { |_| deal_card(deck, players[player_hand]) }
  end
end

# turn methods

def input_action
  action = nil
  loop do
    prompt "[H]it or [S]tay?"
    action = gets.chomp.downcase
    break if ['h', 's'].include? action[0]
    prompt "I'm sorry, what was that?"
  end
  action
end

def human_turn(hand, deck)
  choice = input_action
  unless choice == 's'
    deal_card(deck, hand)
  end
  choice
end

def computer_turn(hand, deck)
  choice = 's'
  points = score_hand(hand)
  if points[0] < AI_BREAKPOINT
    deal_card(deck, hand)
    choice = 'h'
  end
  choice
end

def take_turn(hand, chair, deck, own_id=:player_1)
  if chair == own_id
    human_turn(hand, deck)
  else
    computer_turn(hand, deck)
  end
end

# scoring methods

def score_hand(hand)
  points = hand.reduce(0) do |sum, card|
    face = card[0]
    value = card[1]
    if face[0] == 'A'
      if sum < 11
        sum + value[1]
      else
        sum + value[0]
      end
    else
      sum + value[0]
    end
  end
  [points, points <=> WIN_VALUE]
end

def bust?(score)
  score[1] == 1
end

def twenty_one?(score)
  score[1] == 0
end

def win?(score, dlr_p=0)
  twenty_one?(score) || score[0] > dlr_p && score[1] == -1
end

def lose?(score, dlr_p=0)
  bust?(score) || score[0] < dlr_p && score[1] == -1
end

def score_table(table)
  scored_table = {}
  table.each do |player, hand|
    scored_table[player] = score_hand(hand)
  end
  scored_table
end

def table_winners(scored_tbl)
  dlr_points = bust?(scored_tbl[:dealer]) ? 0 : scored_tbl[:dealer][0]

  winner_sym = {}

  scored_tbl.reject { |player, _| player == :dealer }.each do |player, p_score|
    winner_sym[player] = if lose?(p_score, dlr_points)
                           :dealer
                         elsif win?(p_score, dlr_points)
                           player
                         else
                           :draw
                         end
  end

  winner_sym
end

def tally_rounds!(round_winners, prev_wins)
  round_winners.each do |_, name|
    unless name == :dealer || name == :draw
      prev_wins[name] += 1
    end
  end
end

def game_winners(round_wins)
  if round_wins.values.any? { |num| num > DEF_RNDS / 2 }
    round_wins.select { |_, num| num > DEF_RNDS / 2 }
  end
end

# display methods

def visible_cards(hand, player_id, own_id=:player_1)
  case player_id
  when own_id
    hand
  when :dealer
    hand.map do |card|
      if hand.index(card) == 0
        CARD_BACK
      else
        card
      end
    end
  else
    hand.map { |_| CARD_BACK }
  end
end

def win_strings(names)
  winner_str = {}
  names.each do |name, match_winner|
    winner_str[name] = case match_winner
                       when :dealer
                         "HOUSE WIN"
                       when name
                         "#{pretty_name(name.upcase)} WIN"
                       else
                         "DRAW"
                       end
  end
  winner_str
end

def display_score(name, scr)
  name_str = pretty_name(name)
  prompt "#{name_str}: #{scr[0]}"
  if twenty_one?(scr)
    prompt "#{name_str.upcase} HAS #{WIN_VALUE} - WINNER"
  elsif bust?(scr)
    prompt "#{name_str.upcase} BUSTS - OUT"
  end
end

def display_cards(player_hands, round_over=false)
  system 'clear'
  puts "+--------------------------------------+"
  player_hands.keys.each do |player_name|
    name = pretty_name(player_name)
    cards = player_hands[player_name].keys
    if round_over
      puts "| #{name}: #{cards.join(', ')}"
    else
      cards_seen = visible_cards(cards, player_name)
      puts "| #{name}: #{cards_seen.join(', ')}"
    end
  end
  puts "+--------------------------------------+"
end

def display_round_over(players, tbl_scores, rnd_wins, rnd_cnt)
  display_cards(players, true)
  tbl_scores.each do |chair, scores|
    display_score(chair, scores)
  end
  puts "+--------------------------------------+"
  pretty_winners = win_strings(rnd_wins)
  pretty_winners.each do |player, win_str|
    hand_str = pretty_name(player)
    prompt "#{hand_str}: #{win_str}"
  end
  puts "+--------------------------------------+"
  prompt "ROUND #{rnd_cnt} / #{DEF_RNDS}"
  puts "+--------------------------------------+"
end

def display_leaderboard(round_wins)
  pretty_players = round_wins.map { |name, score| [pretty_name(name), score] }
  pretty_players.each do |player, win_count|
    prompt "#{player.upcase} WON #{win_count} / #{DEF_RNDS}"
  end
  puts "+--------------------------------------+"
end

def display_game_over(round_wins)
  system 'clear'
  puts "+--------------------------------------+"
  display_leaderboard(round_wins)
  grand_winners = game_winners(round_wins)
  if grand_winners
    grand_winners.each do |winner, rnds_won|
      name = pretty_name(winner)
      prompt "#{name} won with #{rnds_won} of #{DEF_RNDS}!"
    end
  else
    prompt "The house ALWAYS wins."
  end
  puts "+--------------------------------------+"
end

# let's play

loop do
  system 'clear'
  own_id = :player_1
  prompt "Welcome to #{WIN_VALUE} - Baby Blackjack"
  break unless yn_question?("Play a game?")

  prompt "Have a seat at the table."

  loop do
    player_count = 1
    additional_players = 0

    if yn_question?("Invite more players?")
      loop do
        prompt "Okay, how many players?"
        additional_players = gets.chomp.to_i
        break if (1..4).include? additional_players
        if additional_players >= 5
          prompt "Let's try a smaller game first."
        elsif additional_players.to_i.to_s != additional_players
          prompt "Pardon?"
        end
      end

      player_count += additional_players

      break unless yn_question?("Game for #{player_count}, plus dealer?")
    end

    round_count = 1
    won_rounds = Hash.new(0)

    until round_count > DEF_RNDS
      round_deck = shuffle_deck(create_deck)
      players = make_table(player_count)

      round_hands = seat_players(players)

      deal_hands(round_deck, round_hands)
      starting_scores = score_table(round_hands)

      round_hands.each do |chair, _|
        display_cards(round_hands)
        score = starting_scores[chair]

        loop do
          prompt "#{pretty_name(chair)} turn"
          display_score(chair, score) if chair == own_id
          break if bust?(score)
          break if twenty_one?(score)

          sleep(0.5) unless chair == own_id

          action = take_turn(round_hands[chair], chair, round_deck)
          display_cards(round_hands)

          score = score_hand(round_hands[chair])

          sleep(0.5) unless chair == own_id

          break if action == 's'
        end
      end

      round_scores = score_table(round_hands)
      round_winners = table_winners(round_scores)
      tally_rounds!(round_winners, won_rounds)

      display_round_over(round_hands, round_scores, round_winners, round_count)
      display_leaderboard(won_rounds)
      round_count += 1

      break unless yn_question?("Continue?")
    end

    display_game_over(won_rounds)

    break unless yn_question?("Play again?")
  end
end

prompt "Goodbye!"
