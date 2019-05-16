class String

  def welcome
    puts "Welcome to BATTLESHIP!!"
    puts "Do you want to play? (play/quit):"
    puts "To play type 'p', to quit type 'q'"
  end

  def computer_places_ships
    puts "I have laid out my ships on the grid."
    puts "You now need to lay out your two ships."
    puts"The Cruiser is two units long and the Submarine is three units long."
    puts"Enter the squares for the Cruiser (3 spaces):"
  end

  def not_valid_choice
    puts "Oops! That wasnt a 'p' or a 'q'. Try again!"
  end

  def not_valid_coordinate
    puts "That wasn't a valid coordinate, try again!"
  end

  def valid_choice
    puts "Great! Lets begin!"
  end

  def is_valid_coordinate
    "Thats a great choice!"
  end

  def place_submarine
    puts "Enter the squares for the Submarine (2 spaces)"
  end

  def choose_coordinate
    puts "Choose a coordinate to hit!"
  end

  def computer_line
    puts '================COMPUTER BOARD=================='
  end

  def player_line
    puts '=================PLAYER BOARD=================='
  end

  def example_board
    puts "This is what your board looks like!"
    puts "  1 2 3 4"
    puts "A . . . ."
    puts "B . . . ."
    puts "C . . . ."
    puts "D . . . ."

  end

  def end_message
    if player.ship.sunk? == true
      puts "I won!"
    elsif computer.ship.sunk? == true
      puts "You won!"
    end
  end
end
