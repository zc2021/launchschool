# Include Card and Deck classes from the last two exercises.
class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    @cards = []
    set_deck
  end

  def draw
    set_deck if cards.empty?
    cards.pop
  end

  private
  
  attr_accessor :cards

  def set_deck
    SUITS.each do |s|
      RANKS.each do |r|
        cards << Card.new(r, s)
      end
    end
    cards.shuffle!
  end
end

class Card
  include Comparable

  attr_reader :rank, :suit

  FACES = {
    'Jack' => 11,
    'Queen' => 12,
    'King' => 13,
    'Ace' => 14
  }

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def score
    if self.is_num?
      rank
    else
      FACES[rank]
    end
  end

  def <=>(other_card)
    self.score <=> other_card.score
  end

  def ==(other_card)
    rank == other_card.rank && suit == other_card.suit
  end

  def to_s
    "#{rank} of #{suit}"
  end

  protected

  def is_num?
    rank.to_s.to_i == rank
  end

  def is_face?
    !!self.is_num?
  end
end

class PokerHand
  def initialize(deck)
    @cards_held = []
    draw_cards(deck)
  end

  def print
    cards_held.each { |c| puts c }
  end

  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end

  private

  attr_accessor :cards_held

  def royal_flush?
    straight_flush? && held_scores[0] == 10
  end

  def straight_flush?
    straight? && flush?
  end

  def four_of_a_kind?
    count_ranks.values.include? 4
  end

  def full_house?
    count_ranks.values.sort == [2, 3]
  end

  def flush?
    held_suits.uniq.length == 1
  end

  def straight?
    min = held_scores[0]
    max = held_scores[-1]
    held_scores == (min..max).to_a
  end

  def three_of_a_kind?
    count_ranks.values.include? 3
  end

  def two_pair?
    count_ranks.values.count(2) == 2
  end

  def pair?
    count_ranks.values.include? 2
  end

  def draw_cards(deck)
    5.times do |_|
      cards_held << deck.draw
    end
  end

  def held_suits
    cards_held.map(&:suit)
  end

  def held_scores
    cards_held.sort.map(&:score)
  end

  def count_ranks
    counts = Hash.new(0)
    held_scores.each do |score|
      counts[score] += 1
    end
    counts
  end
end

hand = PokerHand.new(Deck.new)
hand.print
puts hand.evaluate

# Danger danger danger: monkey
# patching for testing purposes.
class Array
  alias_method :draw, :pop
end

# Test that we can identify each PokerHand type.
hand = PokerHand.new([
  Card.new(10,      'Hearts'),
  Card.new('Ace',   'Hearts'),
  Card.new('Queen', 'Hearts'),
  Card.new('King',  'Hearts'),
  Card.new('Jack',  'Hearts')
])
puts hand.evaluate == 'Royal flush'

hand = PokerHand.new([
  Card.new(8,       'Clubs'),
  Card.new(9,       'Clubs'),
  Card.new('Queen', 'Clubs'),
  Card.new(10,      'Clubs'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight flush'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Four of a kind'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Full house'

hand = PokerHand.new([
  Card.new(10, 'Hearts'),
  Card.new('Ace', 'Hearts'),
  Card.new(2, 'Hearts'),
  Card.new('King', 'Hearts'),
  Card.new(3, 'Hearts')
])
puts hand.evaluate == 'Flush'

hand = PokerHand.new([
  Card.new(8,      'Clubs'),
  Card.new(9,      'Diamonds'),
  Card.new(10,     'Clubs'),
  Card.new(7,      'Hearts'),
  Card.new('Jack', 'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new('Queen', 'Clubs'),
  Card.new('King',  'Diamonds'),
  Card.new(10,      'Clubs'),
  Card.new('Ace',   'Hearts'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(6, 'Diamonds')
])
puts hand.evaluate == 'Three of a kind'

hand = PokerHand.new([
  Card.new(9, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(8, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Two pair'

hand = PokerHand.new([
  Card.new(2, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(9, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Pair'

hand = PokerHand.new([
  Card.new(2,      'Hearts'),
  Card.new('King', 'Clubs'),
  Card.new(5,      'Diamonds'),
  Card.new(9,      'Spades'),
  Card.new(3,      'Diamonds')
])
puts hand.evaluate == 'High card'
