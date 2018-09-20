require_relative 'models/game'
require_relative 'models/interface'
require_relative 'models/deck'
require_relative 'models/hand'
require_relative 'models/player'
require_relative 'models/validation'

class Main
  @interface = Interface.new
  @interface.welcome_message
  name = gets.chomp
  @interface.play_message(name)
  Game.new(name).set
end
