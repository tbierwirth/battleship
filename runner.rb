require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/setup'
require './lib/turn'
require 'pry'

@setup = Setup.new
@player = @setup.player
@computer = @setup.computer
@computer_cruiser = Ship.new("Cruiser", 3)
@player_cruiser = Ship.new("Cruiser", 3)
@computer_submarine = Ship.new("Submarine", 2)
@player_submarine = Ship.new("Submarine", 2)

def game
  loop do
  puts "Welcome to Battleship"
  puts "Enter p to Play or q to Quit"
  input = gets.chomp
    if input == 'p'
      # Create board for computer and place ships randomly
      # @setup.render_boards
      @setup.random_placement(@computer_cruiser)
      @setup.random_placement(@computer_submarine)
      # Player places ship
      @setup.player_choose_coordinates(@player_cruiser)
      # Render board to show first ship
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
      # Create board for player and ask for coordinates to place their ships
      # Start the game/initialize the Turn
    elsif input == 'q'
      break
    end
  end
end
game
