require_relative 'validation'

class Player
  include Validation
  attr_reader :name, :bank
  validate :name, :presence
  validate :name, :format, /^[a-zA-Z]+$/i

  def initialize(name = "Dealer")
    @name = name
    @bank = 100
    validate!
  end

  def bet(value)
    @bank -= value
  end

  def add_prize(amount)
    @bank += amount
  end

end
