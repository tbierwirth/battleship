require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/setup'

@setup = Setup.new
@computer_cruiser = Ship.new("Cruiser", 3)
@player_cruiser = Ship.new("Cruiser", 3)
@computer_submarine = Ship.new("Submarine", 2)
@player_submarine = Ship.new("Submarine", 2)



puts "Welcome to Battleship"
puts "Enter p to Play or q to Quit"
input = gets.chomp
  if input == 'p'
    # Create board for computer and place ships randomly
    # @setup.render_boards
    @setup.random_placement(@computer_cruiser)
    @setup.random_placement(@comuter_submarine)
    # Create board for player and ask for coordinates to place their ships
    # Start the game/initialize the Turn
  elsif input == 'q'
    # Stop the game
  end
