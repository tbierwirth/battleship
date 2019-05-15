require './lib/ship'
require './lib/cell'
require './lib/board'

setup = Setup.new
@player_cruiser = Ship.new

puts "Welcome to Battleship"
puts "Enter p to Play or q to Quit"
input = gets.chomp
if input == 'p'
  # Create board for computer and place ships randomly
  # Create bordd for player and ask for coordinates to place their ships
  # Start the game/initialize the Turn
elsif input == 'q'
  # Stop the game
end
