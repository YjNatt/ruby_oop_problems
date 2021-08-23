class Card
  include Comparable
  attr_reader :rank, :suit

  CARDS_BY_RANK = [ 2, 3, 4, 5, 6, 7, 8, 9, 10, 
                   'Jack', 'Queen', 'King', 'Ace' ]

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{rank} of #{suit} "
  end

  def <=>(other)
    CARDS_BY_RANK.index(rank) <=> CARDS_BY_RANK.index(other.rank)
  end

  def ==(other)
    rank == other.rank
  end
end

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  attr_reader :cards
  
  def initialize
    new_deck
  end

  def draw
    new_deck if cards.empty?
    @cards.pop
  end

  private

  def new_deck
    @cards = RANKS.product(SUITS).map do |rank, suit|
      Card.new(rank, suit)
    end

    @cards.shuffle!
  end
end
