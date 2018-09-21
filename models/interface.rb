class Interface

  def gamer_turn_choice
    puts 'You turn: '
    puts '1: Pass'
    puts '2: Hit'
    puts '3: Open cards'
  end

  def error_message
    puts "Error! Enter another value!"
  end

  def gamer_blackjack_message(bank)
    puts "BlackJack! You win! You have $#{bank}"
  end

  def dealer_blackjack_message(bank)
    puts "BlackJack! Dealer win! You have $#{bank}"
  end

  def welcome_message
    puts "Welcome to BlackJack game!!!"
    puts "Enter your name:"
  end

  def play_message(name)
    puts "Let's play, #{name.capitalize}!"
  end

  def game_next_message
    puts "Play next? ('y' - yes, 'n' - no)"
  end

  def win_message(bank)
    puts "You win! You have $#{bank}"
  end

  def dealer_win_message(bank)
    puts "You lose! You have $#{bank}"
  end

  def draw_message(bank)
    puts "Draw! You have $#{bank}"
  end

  def next_set_message
    puts "Play next? ('y' - yes, 'n' - no)"
  end

  def next_round?
    choice = gets.chomp
    if choice == 'y'
      true
    elsif choice == 'n'
      false
    else
      puts "Error! You must enter 'y' or 'n'!"
    end
  end

  def gamer_empty_bank
    puts "Your bank is empty!"
  end

  def dealer_empty_bank
    puts "Dealer bank is empty!"
  end

  def dealer_pass_message
    puts "Dealer pass!"
  end

  def dealer_take_message
    puts "Dealer take card!"
  end

  def gamer_take_message
    puts "You take card!"
  end

  def result_message
    puts "Result:"
  end

  def show_hand(hand, visible = false)
      if visible
        hand.cards.each { |card| print "#{card.face}-#{card.suit}, " }
        print "#{hand.score} points\n"
      else
        print "'**', '**' points\n"
      end
  end

  def dealer_output
    print "Dealer: "
  end

  def gamer_output
    print "You: "
  end

  def get_name_from_user
    gets.chomp
  end

  def get_choice
    gets.to_i
  end
end
