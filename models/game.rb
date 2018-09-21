require_relative 'deck'
require_relative 'hand'
require_relative 'interface'
require_relative 'card'
require_relative 'player'
require_relative 'gamer'
require_relative 'dealer'

class Game

  attr_reader :gamer_hand, :dealer_hand
  def initialize(name)
    @interface = Interface.new
    @gamer = Gamer.new(name)
    @dealer = Dealer.new
    @deck = Deck.new
    @gamer_hand = Hand.new
    @dealer_hand = Hand.new
    @bank = Bank.new
  end

  def set
    loop do
      start
      gamer_turn
      @interface.next_set_message
      break if @interface.next_round? == false
    end
  end

  protected

  def gamer_turn
    @interface.gamer_turn_choice
    loop do
      choice = @interface.get_choice
      case choice
      when 1
        dealer_turn
        break
      when 2
        @gamer_hand.add_card(@deck.take_card)
        @interface.gamer_take_message
        @interface.gamer_output
        @interface.show_hand(@gamer_hand, true)
        dealer_turn
        break
      when 3
        result
        break
      else
        @interface.error_message
      end
    end
  end

  def dealer_turn
    if @dealer_hand.score < 17 && @gamer_hand.size == 3
      @dealer_hand.add_card(@deck.take_card)
      @interface.dealer_take_message
      result
    elsif @dealer_hand.score < 17 && @gamer_hand.size < 3
      @dealer_hand.add_card(@deck.take_card)
      @interface.dealer_take_message
      gamer_turn
    elsif  @dealer_hand.score > 17 && @gamer_hand.size < 3
      @interface.dealer_pass_message
      gamer_turn
    elsif  @dealer_hand.score > 17 && @gamer_hand.size == 3
      @interface.dealer_pass_message
      result
    end
  end

  def start
    bet_set
    2.times do
      @gamer_hand.add_card(@deck.take_card)
      @dealer_hand.add_card(@deck.take_card)
    end
    @interface.gamer_output
    @interface.show_hand(@gamer_hand, true)
    @interface.dealer_output
    @interface.show_hand(@dealer_hand, false)
  end

  def result
    @interface.result_message
    @interface.gamer_output
    @interface.show_hand(@gamer_hand, true)
    @interface.dealer_output
    @interface.show_hand(@dealer_hand, true)
    if  @gamer_hand.score == @dealer_hand.score
      result_draw
    elsif @gamer_hand.score == 21
      result_gamer_blackjack
    elsif @dealer_hand.score == 21
      result_dealer_blackjack
    elsif @gamer_hand.score < 21 && @dealer_hand.score < 21
      @gamer_hand.score > @dealer_hand.score ? gamer_win : dealer_win
    elsif  @gamer_hand.score < 21 && @dealer_hand.score > 21
      gamer_win
    else
      dealer_win
    end
    hand_clear
  end

  def hand_clear
    @gamer_hand.clear
    @dealer_hand.clear
  end

  def result_draw
    @bank.draw(@gamer, @dealer)
    @interface.draw_message(@gamer.bank)
  end

  def result_gamer_blackjack
    @bank.win_gamer(@gamer)
    @interface.gamer_blackjack_message(@gamer.bank)
  end

  def result_dealer_blackjack
    @bank.win_dealer(@dealer)
    @interface.dealer_blackjack_message(@gamer.bank)
  end

  def gamer_win
    @bank.win_gamer(@gamer)
    @interface.win_message(@gamer.bank)
  end

  def dealer_win
    @bank.win_dealer(@dealer)
    @interface.dealer_win_message(@gamer.bank)
  end

  def bet_set
    if @gamer.bank.zero?
      @interface.gamer_empty_bank
    elsif @dealer.bank.zero?
      @interface.dealer_empty_bank
    else
      @bank.bet_round(@gamer, @dealer)
    end
  end
end
