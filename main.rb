require_relative 'models/game'
require_relative 'models/interface'
require_relative 'models/deck'
require_relative 'models/hand'
require_relative 'models/dealer'
require_relative 'models/player'
require_relative 'models/validation'

puts "Welcome to BlackJack game!!!"
puts "Enter your name:"
name = gets.chomp
puts "Let's play, #{name.capitalize!}!"
Game.new(name).set
