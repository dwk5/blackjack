require_relative 'card'

class Deck
  SUITS = ["\u2665", "\u2666", "\u2663", "\u2660"].freeze
  FACES  = [2, 3, 4, 5, 6, 7, 8, 9, 10, :J, :Q, :K, :A].freeze

  def initialize
    @deck = []
    create_deck
    @deck.shuffle!
  end

  def create_deck
    SUITS.each do |suit|
      FACES.each do |face|
        @deck << Card.new(face, suit)
      end
    end
  end

  def take_card
    @deck.pop
  end

end
