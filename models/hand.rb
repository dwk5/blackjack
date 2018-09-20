class Hand
attr_reader :hand

  def initialize
    @hand = []
    @hand_value = 0
  end

  def add_card(card)
    @hand.push(card)
  end

  def score
    ace_count = @hand.count { |card| card.rank == 11 }
    @hand_value = @hand.inject(0) { |sum, card| sum + card.rank}
    while @hand_value > 21 && ace_count > 0
      @hand_value -= 10
    end
    @hand_value
  end

  def size
    @hand.length
  end

  def clear
    @hand.clear
  end
end
