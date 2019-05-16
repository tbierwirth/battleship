require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/setup'
require './lib/turn'
require 'pry'
require './lib/strings'

@setup = Setup.new
@player = @setup.player
@computer = @setup.computer
@computer_cruiser = Ship.new("Cruiser", 3)
@player_cruiser = Ship.new("Cruiser", 3)
@computer_submarine = Ship.new("Submarine", 2)
@player_submarine = Ship.new("Submarine", 2)
@string = String.new

def game
  loop do
  @string.welcome
  input = gets.chomp
    if input == 'p'

      @setup.random_placement(@computer_cruiser)
      @setup.random_placement(@computer_submarine)
      @string.computer_places_ships
      @string.example_board
      @setup.player_choose_coordinates(@player_cruiser)
      
      @string.place_submarine
      @setup.player_choose_coordinates(@player_submarine)
      until @computer_cruiser.sunk? && @computer_submarine.sunk? || @player_cruiser.sunk? && @player_submarine.sunk?
        new_turn = Turn.new(@computer, @player)
        new_turn.render_boards
        new_turn.player_take_shot
        new_turn.computer_take_shot
        new_turn.display_results
      end
      if @computer_cruiser.sunk? && @computer_submarine.sunk?
        puts "You won!"
      else
        puts "The computer won."
      end
    elsif input == 'q'
      break
    else
      @string.not_valid_choice
    end
  end
end
game
