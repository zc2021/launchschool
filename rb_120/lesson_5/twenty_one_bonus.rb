# display modules

require_relative 'twenty_one_shell.rb'
require_relative 'twenty_one_table_display.rb'

include TableDisplay
include PrettyShell

# exceptions
class TwentyOneError < StandardError; end
class InvalidChoiceError < TwentyOneError; end

# participants

class Participant
  attr_reader :name, :strategy
  attr_accessor :hand

  @@ai_breakpoints = {
    house: 17,
    aggressive: 15,
    safe: 10
  }

  def self.ai_breakpoints
    @@ai_breakpoints
  end

  def initialize(name)
    @hand = Hand.new
    @name = name
  end

  def busted?
    hand.score > 21
  end

  def twenty_one?
    hand.score == 21
  end

  def hit?
    hand.score < Participant.ai_breakpoints[strategy]
  end

  def reset_hand
    self.hand = Hand.new
  end
end

class Dealer < Participant
  attr_reader :deck

  def initialize(decks=1)
    super('Dealer')
    @strategy = :house
    @num_decks = decks
    @deck = Deck.new num_decks
  end

  def deal_card(player)
    player.hand.add_card(deck.top_card)
  end

  def shuffle_decks
    self.deck = Deck.new num_decks
  end

  private

  attr_reader :num_decks
  attr_writer :deck
end

class Player < Participant; end

class Human < Player
  attr_reader :interface

  def initialize
    @interface = UserInterface.new
    name = UserInterface.human_name || interface.set_human_name
    super(name)
  end

  def hit?
    interface.hit_or_stay? == 'h'
  end
end

class Computer < Player
  def initialize(name)
    super(name)
    @strategy = Participant.ai_breakpoints.keys.sample
  end
end

# participant collabs

class UserInterface
  @@human_name = nil

  def self.human_name
    @@human_name
  end

  def self.human_name=(new_name)
    @@human_name = new_name
  end

  def see_rules?
    yes_no('Would you like to see the rules?') == 'y'
  end

  def see_points?
    yes_no('Would you like to see how cards are scored?') == 'y'
  end

  def hit_or_stay?
    question_answer('Hit or stay?', :string, 'h', 's')
  end

  def play_again?
    yes_no('Another hand?') == 'y'
  end

  def continue?
    yes_no('Continue?') == 'y'
  end

  def leave_game?
    yes_no('Exit game?') == 'y'
  end

  def number_of_players
    question_answer(
      'How many computer players?', :integer,
      *(0..TwentyOne.max_players)
    )
  end

  def set_human_name
    pretty_print 'What is your name?'
    name = gets.chomp
    UserInterface.human_name = name
    name
  end

  private

  def question_answer(phrase, type, *choices)
    pretty_print "#{phrase} : [#{or_join(choices, ', ')}]"
    answer = get_answer(choices, type)
    type == :integer ? answer.to_i : answer
  end

  def get_answer(choices, type)
    loop do
      begin
        answer = gets.chomp
        return answer if valid_choice?(answer, choices, type)
        raise InvalidChoiceError, 'Sorry, invalid choice'
      rescue TwentyOneError => e
        puts e.message
      end
    end
  end

  def yes_no(phrase)
    question_answer(phrase, :string, 'y', 'n')
  end

  def valid_choice?(choice, list, type)
    case type
    when :string then list.include?(choice)
    when :integer then choice.to_i.to_s == choice && list.include?(choice.to_i)
    end
  end
end

class Hand
  attr_reader :cards

  def initialize
    @cards = []
  end

  def add_card(card)
    cards << card
  end

  def score
    aces = 0
    score = 0
    cards.each do |card|
      score += card.points
      aces += 1 if card.value == 'A'
    end
    aces.times do |_|
      score += 10 if score <= 11
    end
    score
  end

  def to_s
    cards.join('')
  end

  def size
    cards.size
  end

  def [](range)
    sliced_hand = Hand.new
    cards[range].each { |card| sliced_hand.add_card card }
    sliced_hand
  end
end

# card classes

class Deck
  @@suits = ["\u2660", "\u2663", "\u2665", "\u2666"]
  @@values = %w(2 3 4 5 6 7 8 9 10 J Q K A)

  def self.suits
    @@suits
  end

  def self.values
    @@values
  end

  def initialize(count)
    @cards = []
    count.times { |_| make_cards }
    shuffle_cards
  end

  def shuffle_cards
    cards.shuffle!
  end

  def top_card
    cards.pop
  end

  def to_s
    cards.length.to_s
  end

  protected

  attr_accessor :cards

  private

  def make_cards
    Deck.suits.each do |s|
      Deck.values.each do |v|
        cards << Card.new(s, v)
      end
    end
  end
end

class Card
  attr_reader :suit, :value, :points

  @@card_back = "|~XX~|"

  def self.card_back
    @@card_back
  end

  def initialize(suit, value)
    @suit = suit
    @value = value
    set_points
  end

  def set_points
    @points = case value
              when 'A' then 1
              when 'K', 'Q', 'J' then 10
              else value.to_i
              end
  end

  def to_s
    "|#{value.rjust(2)}#{suit} |"
  end
end

# game system

class TwentyOne
  @@max_players = 5

  def self.max_players
    @@max_players
  end

  def play
    loop do
      welcome
      clear_screen
      game_loop
      exit if human.interface.leave_game?
    end
  end

  private

  attr_accessor :human, :players, :dealer, :play_order

  def welcome
    display_welcome_message
    self.human = Human.new
    loop do
      display_rules if human.interface.see_rules?
      display_scoring if human.interface.see_points?
      break if human.interface.continue?
    end
  end

  def game_loop
    loop do
      start_game
      play_order.each { |player| take_turn(player) }
      display_results(play_order)
      break unless human.interface.play_again?
    end
  end

  def start_game
    human.reset_hand
    seat_players
    initial_deal
    display_table(play_order)
  end

  def seat_players
    players = []
    num_players = human.interface.number_of_players
    num_decks = ((num_players + 1) / 2) + 1
    self.dealer = Dealer.new(num_decks)
    players[0] = human
    (1..num_players).each do |n|
      name = "Player #{n}"
      players[n] = Computer.new(name)
    end
    self.play_order = players.shuffle + [dealer]
  end

  def initial_deal
    2.times do |_|
      play_order.each do |plyr|
        dealer.deal_card(plyr)
      end
    end
  end

  def take_turn(player)
    loop do
      display_table(play_order)
      display_score(player) if human?(player)
      break if player.busted? || player.twenty_one?
      break unless player.hit?
      dealer.deal_card(player)
    end
  end

  def won?(player)
    return false if player.busted? || dealer.twenty_one?
    return true if player.twenty_one? || dealer.busted?
    player.hand.score > dealer.hand.score
  end

  def human?(player)
    player.class == Human
  end
end

# let's do this

TwentyOne.new.play
