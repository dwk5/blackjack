class Hand
attr_reader :cards

  def initialize
    @cards = []
    @hand_value = 0
  end

  def add_card(card)
    @cards.push(card)
  end

  def score
    ace_count = @cards.count { |card| card.rank == 11 }
    @hand_value = @cards.inject(0) { |sum, card| sum + card.rank}
    while @hand_value > 21 && ace_count > 0
      @hand_value -= 10
    end
    @hand_value
  end

  def size
    @cards.length
  end

  def clear
    @cards.clear
  end
end
