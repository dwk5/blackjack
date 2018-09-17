class Card
HIDDEN_FACE = '**'
PICTURE = [:K, :Q, :J]
ACE = :A

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

  def display_cards
    "#{@face}-#{@suit}"
  end

  def hidden
    HIDDEN_FACE
  end
end
