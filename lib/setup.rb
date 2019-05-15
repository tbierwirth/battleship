require 'pry'

class Setup

  def initialize()
    @player = Board.new
    @computer = Board.new
    @cruiser_placement = []
    @sub_placement = []
  end

  def random_coordinate
    "#{rand(65..68).chr}#{rand(1..4)}"
    # "#{rand(65..Board_Size).chr}#{rand(1..Board_Size)}"
  end

end
