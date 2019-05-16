class Setup
  attr_reader :player, :computer

  def initialize()
    @player = Board.new
    @computer = Board.new
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
    puts "Please place your #{ship.name}."
    raw_coordinates = gets.chomp.upcase
    coordinates = raw_coordinates.split(" ")
    until @player.place(ship, coordinates) != nil
      raw_coordinates = gets.chomp.upcase
      coordinates = raw_coordinates.split(" ")
    end

  end

end
