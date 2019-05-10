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
    assert @board.valid_coordinate?("D4")
    refute @board.valid_coordinate?("A5")
    refute @board.valid_coordinate?("E1")
    refute @board.valid_coordinate?("A22")
  end

  def test_ship_length_to_valid_placements
    refute @board.valid_placement?(@cruiser, ["A1", "A2"])
    refute @board.valid_placement?(@submarine, ["A2", "A3", "A4"])
  end

  def test_coordinate_split
    assert_equal ["A", "1", "A", "2"], @board.split_coordinate("A1", "A2")
  end

  def test_convert_letters_to_ordinals
    assert_equal [65, 65, 65], @board.convert_letters("A", "A", "A")
  end

  def test_convert_to_integers
    assert_equal [1, 2, 3], @board.convert_integers
  end
  
  # def test_horizontal_placement_consecutive
  #   assert_equal "yay", @valid_array_index_placement
  # end


end
