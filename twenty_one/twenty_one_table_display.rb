# table display module for CLI card game 21 - intended for use with PrettyShell terminal display module

module TableDisplay
  def display_welcome_message
    msg_screen 'Welcome to Twenty-One!'
    sleep(0.75)
  end

  def display_rules
    clear_screen
    msg_screen(
      '  How to Play:',
      '  1. Each player is dealt two cards.',
      '  2. Players proceed in turn, ending with the dealer.',
      '  3. On their turn, a player may hit (get a card) or stay (end turn).',
      '  4. Closest to 21 without going over wins.', align: :ljust
    )
  end

  def display_scoring
    clear_screen
    msg_screen(
      'Card Values:', '-' * 21,
      '|  2 - 10 :  face   |',
      '-' * 21,
      '| J, Q, K :   10    |',
      '-' * 21,
      '|   Ace   : 1 or 11 |',
      '-' * 21, 'Ties go to the house.'
    )
  end

  def display_table(players, see_all: false)
    name_align = players.map(&:name).map(&:length).max
    clear_screen
    print_line
    players.each do |plyr|
      display_hand(plyr, name_align, see_all: see_all)
    end
    print_line
  end

  def display_hand(player, pad, see_all: false)
    nice_name = player.name.ljust(pad)
    puts "#{nice_name}: #{card_string(player, see_all)}"
  end

  def display_results(players)
    box_h = height / 2
    box_w = width
    display_table(players, see_all: true)
    msg_box(
      box_w, box_h, *collected_results_messages(players),
      align: :center, clear: false
    )
  end

  def collected_results_messages(players)
    dlr = players.select { |p| p.class == Dealer }[0]
    results = [score_msg(dlr)]
    players.reject { |p| p.class == Dealer }.each do |plyr|
      results << '-' * (width - 2)
      results << score_msg(plyr) unless won?(plyr)
      results << results_message(plyr)
    end
    results
  end

  def results_message(player)
    if player.busted?
      bust_msg(player)
    elsif player.twenty_one?
      twenty_one_msg(player)
    else
      won?(player) ? win_msg(player) : win_msg(dealer)
    end
  end

  def display_score(player)
    puts score_msg(player)
  end

  def score_msg(player)
    "#{player.name} has #{player.hand.score}."
  end

  def win_msg(player)
    "#{player.name} wins with #{player.hand.score}!"
  end

  def bust_msg(player)
    "#{player.name} busted with #{player.hand.score}."
  end

  def twenty_one_msg(player)
    "#{player.name} has 21! They win!"
  end

  def card_string(player, all_visible)
    return player.hand.to_s if all_visible
    case player
    when Human then player.hand.to_s
    when Computer then Card.card_back * player.hand.size
    when Dealer then "#{Card.card_back}#{player.hand[1..-1]}"
    end
  end
end
