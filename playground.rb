require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/helping'
require './lib/strings'
  string = String.new
  computer = Board.new
  player = Board.new
string.welcome
computer.render_board
string.computer_places_ships
player.render_board
coordinates = gets.chomp
  if coordinates.valid_placement?
    p string.is_valid_coordinate
  else
#   coordinates = gets.chomp
#    if coordinates.valid_placement?
#    p string.is_valid_coordinate
#    else
#       puts "Try again!" gets.chomp
#    end
#     player.render_board

# # > #user input
# #
# # #  1 2 3 4
# # # A S S S .
# # # B . . . .
# # # C . . . .
# # # D . . . ."

# > # user input

# turn methods will be needed to let the user guess what cell to fire upon on the computers board.

# get.chomp
# turn method should render board with each turn. only accept valid coordinates for coordinate choices.

###### system clear
#### sleep (2)
# these are two options to use they can be called on there own without the use of @ or .

# return the the main menu once the game has ended.
