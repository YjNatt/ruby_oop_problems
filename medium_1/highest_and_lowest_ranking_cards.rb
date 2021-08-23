class Card
  include Comparable
  attr_reader :rank, :suit

  CARDS_BY_RANK = [ 2, 3, 4, 5, 6, 7, 8, 9, 10, 
                   'Jack', 'Queen', 'King', 'Ace' ]

  SUIT_RANKING = ['Diamonds', 'Clubs', 'Hearts', 'Spades']

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{rank} of #{suit} "
  end

  def <=>(other)
    if rank != other.rank
      CARDS_BY_RANK.index(rank) <=> CARDS_BY_RANK.index(other.rank)
    else
      SUIT_RANKING.index(suit) <=> SUIT_RANKING.index(other.suit)
    end
  end

  def ==(other)
    rank == other.rank
  end
end

cards = [Card.new(8, 'Diamonds'),
         Card.new(8, 'Clubs'),
         Card.new(8, 'Spades')]
puts cards.min
puts cards.max