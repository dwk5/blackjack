require_relative 'models/game'
require_relative 'models/interface'
require_relative 'models/deck'
require_relative 'models/hand'
require_relative 'models/player'
require_relative 'models/validation'
require_relative 'models/dealer'
require_relative 'models/bank'

class Main
  @interface = Interface.new
  @interface.welcome_message
  name = @interface.get_name_from_user
  @interface.play_message(name)
  Game.new(name).set
end
