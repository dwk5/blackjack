require_relative 'validation'

class Player
  include Validation
  attr_reader :name, :bank
  validate :name, :presence
  validate :name, :format, /^[a-zA-Z]+$/i
  def initialize(name)
    @name = name
    @bank = 100
    validate!
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
