require_relative 'pretty_shell.rb'

# player classes

class Participant
  attr_accessor :hand

  def initialize
    @hand = Hand.new
  end

  def busted?
    hand.score > 21
  end

  def twenty_one?
    hand.score == 21
  end
end

class Dealer < Participant
  attr_reader :deck

  def initialize
    super
    @deck = Deck.new
  end

  def deal_card(player)
    player.hand.add_card(deck.top_card)
  end

  def hit?
    hand.score < 17
  end

  def shuffle_cards
    self.deck = Deck.new
  end

  private

  attr_writer :deck
end

class Player < Participant
  attr_reader :name

  def initialize(name)
    super()
    @name = name
  end

  def hit?
    choice = nil
    loop do
      choice = gets.chomp.downcase[0]
      break if %w(h s).include? choice
      puts 'Sorry, invalid choice'
    end
    choice == 'h'
  end
end

class Hand
  attr_accessor :cards

  def initialize
    @cards = []
  end

  def add_card(card)
    cards << card
  end

  def score
    cards.reduce(0) do |sum, card|
      if card.value[0] == 'A' && sum < 10
        sum + card.points[1]
      else
        sum + card.points[0]
      end
    end
  end

  def to_s
    cards.join(', ')
  end
end

class Deck
  SUITS = %w(H D S C)
  VALUES = %w(02 03 04 05 06 07 08 09 10 J* Q* K* A*)

  attr_accessor :cards

  def initialize
    @cards = []
    make_cards
    cards.shuffle!
  end

  def make_cards
    SUITS.each do |s|
      VALUES.each do |v|
        cards << Card.new(s, v)
      end
    end
  end

  def top_card
    cards.pop
  end

  def to_s
    cards.length.to_s
  end
end

class Card
  BACK = "|XX|"

  attr_reader :suit, :value, :points

  def initialize(suit, value)
    @suit = suit
    @value = value
    set_points
  end

  def set_points
    @points = case value
              when 'A*' then [1, 11]
              when 'K*', 'Q*', 'J*' then [10]
              else [value.to_i]
              end
  end

  def to_s
    "#{value} #{suit}"
  end
end

class TwentyOneGame
  include PrettyShell

  attr_accessor :players, :dealer

  def initialize
    @dealer = Dealer.new
    @players = [Player.new('Player')]
    display_welcome_message
  end

  def initial_deal
    2.times do |_|
      players.each do |plyr|
        dealer.deal_card(plyr)
      end
      dealer.deal_card(dealer)
    end
  end

  def reset
    players.each do |plyr|
      plyr.hand = Hand.new
    end
    dealer.hand = Hand.new
    dealer.shuffle_cards
  end

  def player_turn(player)
    loop do
      display_table
      puts '[H]it or [s]tay?'
      break unless player.hit?
      dealer.deal_card(player)
      break if player.busted? || player.twenty_one?
    end
  end

  def dealer_turn
    loop do
      display_table
      break unless dealer.hit?
      dealer.deal_card(dealer)
    end
  end

  def won?(player)
    return false if player.busted?
    return true if player.twenty_one? || dealer.busted?
    player.hand.score > dealer.hand.score
  end

  def play_again?
    puts 'Another hand? [y / n]'
    choice = nil
    loop do
      choice = gets.chomp.downcase[0]
      break if %w(y n).include? choice
      puts 'Sorry, invalid choice'
    end
    choice == 'y'
  end

  def play
    loop do
      initial_deal
      players.each { |p| player_turn(p) }
      dealer_turn
      display_results
      break unless play_again?
      reset
    end
  end

  def display_welcome_message
    msg_screen 'Welcome to Twenty-One!'
    sleep(0.75)
  end

  def display_table
    clear_screen
    draw_line
    puts "Dealer has #{dealer.hand}"
    players.each do |plyr|
      puts "#{plyr.name} has #{plyr.hand}"
    end
    draw_line
  end

  def display_results
    puts "Dealer scored #{dealer.hand.score}"
    players.each do |plyr|
      puts "#{plyr.name} scored #{plyr.hand.score}"
      winner = won?(plyr) ? plyr.name : "Dealer"
      puts "#{winner} won!"
    end
  end
end

TwentyOneGame.new.play
