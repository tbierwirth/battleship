require 'pry'
require './lib/board'

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


end
