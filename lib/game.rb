require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/strings'
require './lib/setup'
# sticky file to glue things together

class Game

  def initialize
    @string = String.new
    @setup = Setup.new
  end
  def run

    @string.welcome
    answer = gets.chomp
    until answer == "p"
      @string.not_valid_choice
    end
  if answer == "q"
    put "Bye!"
  else answer == "p"
      @setup.computer.random_placement
      @string.computer_places_ships
      @setup.computer.render_board
      @string.line_break
      @setup.player.render_board
      until @setup.player.valid_placement
        @setup.player.player_choose_coordinates
        @setup.player.place
        if @setup.player.valid_placement?
          @string.is_valid_coordinate
        else
          @string.not_valid_coordinate
        end
      end
        @setup.computer.render_board
        @string.line_break
        @setup.player.render_board
    end
  end
end
