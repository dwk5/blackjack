class Card
  PICTURE = [:K, :Q, :J].freeze
  ACE = :A
  attr_reader :face, :suit
  def initialize(face, suit)
    @face = face
    @suit = suit
    @rank = rank
  end

  def rank
    return 11 if @face == ACE
    return 10 if PICTURE.include?(@face)
    @face
  end
end
