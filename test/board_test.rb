require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

require './lib/board'
require './lib/cell'
require './lib/ship'

class BoardTest < MiniTest::Test

  def setup
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  def test_board_exists
    assert_instance_of Board, @board
  end

  def test_board_has_cells
    # check all values are instances of cells
    # check keys (A1) -
    # check that .cells returns a Hash -
    assert_instance_of Hash, @board.cells
  end

  def test_first_element_of_hash
    assert_instance_of Cell, @board.cells["A1"]
  end

  def test_valid_cell_coordinates
    assert @board.valid_coordinate?("A1")
    assert_equal true, @board.valid_coordinate?("D4")
    assert_equal false, @board.valid_coordinate?("A5")
    assert_equal false, @board.valid_coordinate?("E1")
    assert_equal false, @board.valid_coordinate?("A22")
  end

  def test_ship_length_to_valid_placements
    refute @board.valid_placement?(@cruiser, ["A1", "A2"])
    refute @board.valid_placement?(@submarine, ["A2", "A3", "A4"])
  end

  def test_coordinate_split
    assert_equal ["A", "1", "A", "2"], @board.split_coordinate("A1", "A2")
  end

  def test_convert_to_ordinals
    ord_coordinates = @board.split_coordinate("A1", "A2", "A3")
    assert_equal [65, 49, 65, 50, 65, 51], @board.convert_to_ords(ord_coordinates)
  end


  # def test_convert_split_coordinates_and_letters_to_ordinals
  #   assert_equal [65, 65], @board.convert_letters("A1", "A2")
  # end

  # # Make a test for a horizontal placement (Matching letters but consecutive numbers)
  # def test_horizontal_placement_consecutive
  # end

  # def test_coordinates_are_consecutive
  #   refute @board.valid_placement?(@cruiser, ["A1", "A2", "A4"])
  # end

end
