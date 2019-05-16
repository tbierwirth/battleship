class Turn
attr_reader
@string = String.new
@player = Board.new
@computer = Board.new

@string.welcome
@computer.render_board
@computer.random_placement
@string.computer_places_ships

player.render_board

if @coordinates.valid_placement?
 p @string.is_valid_coordinate
else

if coordinates.valid_placement?
p @string.is_valid_coordinate
else
   puts "Try again!" gets.chomp
end
 @player.render_board
end

##### system clear
### sleep (2)
these are two options to use they can be called on there own without the use of @ or .

return the the main menu once the game has ended.
