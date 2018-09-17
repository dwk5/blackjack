class Dealer
  attr_reader :bank

  def initialize
    @bank = 100
  end

  def bet(value)
    if @bank.zero?
      puts "No money in your bank!"
    else
      @bank -= value
    end
  end

  def add_prize(amount)
    @bank += amount
  end
end
