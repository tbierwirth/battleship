# require 'minitest/autorun'
# require 'minitest/pride'
# require 'pry'
# require './lib/board'
# require './lib/cell'
# require './lib/ship'
# require './lib/strings'
# require './lib/setup'
# # sticky file to glue things together
#
# class Game
#
#   def initialize
#     @setup = Setup.new
#     @string = String.new
#     @player = Board.new
#     @computer = Board.new
#     @player_cruiser = Ship.new(cruiser, 3)
#     @player_submarine = Ship.new(submarine, 2)
#     @computer_cruiser = Ship.new(cruiser, 3)
#     @computer_submarine = Ship.new(submarine, 2)
#   end
#
#   def run
#
#     @string.welcome
#     answer = gets.chomp
#     until answer == "p"
#       @string.not_valid_choice
#     end
#   if answer == "q"
#     p "Bye!"
#   else answer == "p"
#     @computer.random_placement(@computer_cruiser)
#     @computer.random_placement(@submarine)
#     @string.computer_places_ships
#     @computer.render_board
#     @string.line_break
#     @player.render_board
#     until @player.valid_placement
#       @player.player_choose_coordinates(ship)
#       @player.place
#       if @player.valid_placement?
#         @string.is_valid_coordinate
#       else
#         @string.not_valid_coordinate
#       end
#     end
#       @computer.render_board
#       @string.line_break
#       @player.render_board
#     end
#   end
# end
