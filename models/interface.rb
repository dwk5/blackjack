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
    puts "Let's play, #{name}!"
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

  def next_set_choice
    puts "Play next? ('y' - yes, 'n' - no)"
  end
end
