require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/setup'

class ComputerTest < MiniTest::Test

  def setup
    @setup = Setup.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  def test_randomize_coordinates
    assert_equal [], @setup.random_coordinate
  end

  def test_randomize_placement_coordinates
    assert_equal [], @setup.random_placement(@cruiser)
  end

  # def test_player_choose_coordinates
  #   assert_equal [], @setup.player_choose_coordinates
  # end

end
