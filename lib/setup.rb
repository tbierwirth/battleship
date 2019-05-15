require 'pry'

class Setup

  def initialize()
    @player = Board.new
    @computer = Board.new
    # @cruiser_placement = []
    # @sub_placement = []
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
