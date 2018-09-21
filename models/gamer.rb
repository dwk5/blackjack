require_relative 'validation'

class Gamer < Player

  include Validation
  validate :name, :presence
  validate :name, :format, /^[a-zA-Z]+$/i

  def initialize(name)
    super
    validate!
  end
end
