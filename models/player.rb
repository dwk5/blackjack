class Player
  attr_reader :name, :bank

  def initialize(name)
    @name = name
    @bank = 100
  end

  def bet(value)
    @bank -= value
  end

  def add_prize(amount)
    @bank += amount
  end
end
