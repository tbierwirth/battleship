require 'pry'

class Board
  attr_reader :cells

  def initialize

    @cells = {
     "A1" => Cell.new("A1"),
     "A2" => Cell.new("A2"),
     "A3" => Cell.new("A3"),
     "A4" => Cell.new("A4"),
     "B1" => Cell.new("B1"),
     "B2" => Cell.new("B2"),
     "B3" => Cell.new("B3"),
     "B4" => Cell.new("B4"),
     "C1" => Cell.new("C1"),
     "C2" => Cell.new("C2"),
     "C3" => Cell.new("C3"),
     "C4" => Cell.new("C4"),
     "D1" => Cell.new("D1"),
     "D2" => Cell.new("D2"),
     "D3" => Cell.new("D3"),
     "D4" => Cell.new("D4")
    }

  end

  def valid_coordinate?(coordinates)
    coordinate_list = @cells.keys
    result = coordinates.flatten.select do |coordinate|
      coordinate_list.include?(coordinate) && @cells[coordinate].empty?
    end
    return false if result.empty?
    result.length == coordinates.length
  end

  def valid_placement?(ship, coordinates)
    if valid_coordinate?(coordinates) && coordinates.length == ship.length

       x = (letters_consecutive?(coordinates) && numbers_same?(coordinates)) ||
       (letters_same?(coordinates) && numbers_consecutive?(coordinates))
       x
    else
      false
    end
  end

  def letters_same?(coordinates)
    letters = []
    coordinates.each do |coordinate|
      letters.push(coordinate[0])
    end
    letters.uniq.count == 1
  end

  def numbers_same?(coordinates)
    numbers = []
    coordinates.each do |coordinate|
      numbers.push(coordinate[1])
    end
    numbers.uniq.count == 1
  end

  def letters_consecutive?(coordinates)
    letters = []
    coordinates.each do |coordinate|
      letters << coordinate[0].ord
    end
    letters.each_cons(2).all? { |x,y| y == x + 1 }
  end

  def numbers_consecutive?(coordinates)
    numbers = []
    coordinates.each do |coordinate|
      numbers << coordinate[1].to_i
    end
    numbers.each_cons(2).all? { |x,y| y == x + 1 }
  end

  def place(ship, coordinates)
    if valid_placement?(ship, coordinates)
        coordinates.each do |coordinate|
          @cells[coordinate].place_ship(ship)
      end
    else
      puts "Please pick valid coordinates."
    end
  end

  def render_board(reveal = false)
   board = "  1 2 3 4 \n"
   ("A".."D").each do |letter|
     board += "#{letter}"
     (1..4).each do |number|
       coordinate = "#{letter}#{number}"
       board += " #{@cells[coordinate].render(reveal)}"
     end
     board += " \n"
   end
   board
 end


   def random_coordinate
     "#{rand(65..68).chr}#{rand(1..4)}"
     # "#{rand(65..Board_Size).chr}#{rand(1..Board_Size)}"
   end

   def random_placement(ship)
     coordinates = []
     coordinates.push(random_coordinate)
     until @computer.valid_placement?(ship, coordinates) do
       coordinates.push(random_coordinate)
       coordinates = [] if coordinates.length > ship.length
     end
     @computer.place(ship, coordinates)
   end

   def player_choose_coordinates(ship)
     coordinates = gets.chomp
   end

end
