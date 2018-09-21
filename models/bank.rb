class Bank
  BET_VALUE = 10.freeze

  def initialize
    @prize = 0
  end

  def bet_round(gamer, dealer)
    gamer.bet(BET_VALUE)
    dealer.bet(BET_VALUE)
    @prize = BET_VALUE * 2
  end

  def win_gamer(gamer)
    gamer.add_prize(@prize)
    clear_bank
  end

  def win_dealer(dealer)
    dealer.add_prize(@prize)
    clear_bank
  end

  def draw(gamer, dealer)
    gamer.add_prize(@prize / 2)
    dealer.add_prize(@prize / 2)
    clear_bank
  end

  def clear_bank
    @prize = 0
  end
end
