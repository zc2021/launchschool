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

deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
p drawn.count { |card| card.rank == 5 } == 4
p drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
p drawn != drawn2 # Almost always.