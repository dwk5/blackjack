require_relative 'card'

class Deck
  SUITS = [:Spades, :Clubs, :Hearts, :Dimonds]
  FACES  = [2, 3, 4, 5, 6, 7, 8, 9, 10, :J, :Q, :K, :A]

  def initialize
    @deck = []
    SUITS.each do |suit|
      FACES.each do |face|
        @deck << Card.new(face, suit)
      end
    end
    @deck.shuffle!
  end

  def take_card
    @deck.pop
  end

end
