require_relative 'deck'
require_relative 'hand'
require_relative 'interface'

class Game

  BET_VALUE = 10

  def initialize(name)
    @gamer = Player.new(name)
    @dealer = Dealer.new
    @deck = Deck.new
    @gamer_hand = Hand.new
    @dealer_hand = Hand.new
    @interface = Interface.new
  end

  def set
    loop do
      @bank_set = @gamer.bet(BET_VALUE) + @dealer.bet(BET_VALUE)
      start
      print_info
      gamer_turn
      @interface.next_set_choice
      choice = gets.chomp
      break unless choice == 'y'
    end
  end

  protected

  def print_info(show_dealer = false)
    puts "You: #{@gamer_hand.show_cards(:visible)}, #{@gamer_hand.score} points"
    puts "Dealer : #{@dealer_hand.show_cards(show_dealer)},\
    #{show_dealer ? @dealer_hand.score : '**'} points"
  end

  def gamer_turn
      @interface.gamer_turn_choice
      loop do
        choice = gets.to_i
        case choice
        when 1
          dealer_turn
          break
        when 2
          if @gamer_hand.size == 3 || @dealer_hand.size == 3
            result
          else
            @gamer_hand.add_card(@deck.take_card)
            dealer_turn
          end
          break
        when 3
          break
        else
          @interface.error_message
        end
      end
      result
  end

  def dealer_turn
    if @dealer_hand.score < 17
      @dealer_hand.add_card(@deck.take_card)
    else
      gamer_turn
    end
  end

  def start
    2.times do
      @gamer_hand.add_card(@deck.take_card)
      @dealer_hand.add_card(@deck.take_card)
    end
  end

  def result
    show_score
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

  def show_score
    print_info(:show_dealer)
    @gamer_hand.score
    @dealer_hand.score
  end

  def hand_clear
    @gamer_hand.clear
    @dealer_hand.clear
  end

  def result_draw
    @gamer.add_prize(BET_VALUE)
    @dealer.add_prize(BET_VALUE)
    @interface.draw_message(@gamer.bank)
  end

  def result_gamer_blackjack
    @gamer.add_prize(BET_VALUE*2)
    @interface.gamer_blackjack_message(@gamer.bank)
  end

  def result_dealer_blackjack
    @dealer.add_prize(BET_VALUE*2)
    @interface.dealer_blackjack_message(@gamer.bank)
  end

  def gamer_win
    @gamer.add_prize(BET_VALUE*2)
    @interface.win_message(@gamer.bank)
  end

  def dealer_win
    @dealer.add_prize(BET_VALUE*2)
    @interface.dealer_win_message(@gamer.bank)
  end
end
