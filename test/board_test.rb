require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

require './lib/board'
require './lib/cell'

class BoardTest < MiniTest::Test

  def setup
    @board = Board.new
  end

  def test_board_exists
    assert_instance_of Board, @board
  end

  def test_board_has_cells
    # check all values are instances of cells
    # check keys (A1)
    # check that .cells returns a Hash
    assert_instance_of Hash, @board.cells
  end

  def test_valid_cell_coordinates
    assert_equal true, @board.valid_coordinate?("A1")
    assert_equal true, @board.valid_coordinate?("D4")
    assert_equal false, @board.valid_coordinate?("A5")
    assert_equal false, @board.valid_coordinate?("E1")
    assert_equal false, @board.valid_coordinate?("A22")
  end

end
