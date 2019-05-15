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
    assert @board.valid_coordinate?(["A1"])
    assert @board.valid_coordinate?(["D4"])
    refute @board.valid_coordinate?(["A5"])
    refute @board.valid_coordinate?(["E1"])
    refute @board.valid_coordinate?(["A22"])
  end

  def test_ship_length_to_valid_placements
    refute @board.valid_placement?(@cruiser, ["A1", "A2"])
    refute @board.valid_placement?(@submarine, ["A2", "A3", "A4"])
  end

  def test_letters_same
    coordinates = ["A1", "A2", "A3"]
    assert @board.letters_same?(coordinates)
  end

  def test_letters_are_different
    coordinates = ["B2", "A3", "A4"]
    refute @board.letters_same?(coordinates)
  end

  def test_numbers_same
    coordinates = ["A1", "B1", "C1"]
    assert @board.numbers_same?(coordinates)
  end

  def test_numbers_are_different
    coordinates = ["A2", "B1", "C1"]
    refute @board.numbers_same?(coordinates)
  end

  def test_letters_consecutive
    coordinates = ["A1", "B1", "C1"]
    assert @board.letters_consecutive?(coordinates)
  end

  def test_numbers_consecutive
    coordinates = ["A1", "A2", "A3"]
    assert @board.numbers_consecutive?(coordinates)
  end

  def test_ship_valid_placement_consecutive
    refute @board.valid_placement?(@cruiser, ["A1", "A2", "A4"])
    refute @board.valid_placement?(@submarine, ["A1", "C1"])
    refute @board.valid_placement?(@cruiser, ["A3", "A2", "A1"])
    refute @board.valid_placement?(@submarine, ["C1", "B1"])
  end

  def test_ship_valid_placement_diagonal
    refute @board.valid_placement?(@cruiser, ["A1", "B2", "C3"])
    refute @board.valid_placement?(@submarine, ["C2", "D3"])
  end

  def test_ship_valid_placement
    assert true, @board.valid_placement?(@cruiser, ["B1", "C1", "D1"])
    assert true, @board.valid_placement?(@submarine, ["A1", "A2"])
    refute @board.valid_placement?(@submarine, ["E1", "E2"])
  end

  def test_place_ship
    @board.place(@cruiser, ["A1", "A2", "A3"])
    cell_1 = @board.cells["A1"]
    cell_2 = @board.cells["A2"]
    cell_3 = @board.cells["A3"]

    assert_equal @cruiser, cell_1.ship
    assert_equal @cruiser, cell_2.ship
    assert_equal @cruiser, cell_3.ship

    assert_equal cell_3.ship, cell_2.ship
  end

  def test_for_overlapping_ships
    @board.place(@cruiser, ["A1", "A2", "A3"])

    refute @board.valid_placement?(@submarine, ["A1", "B1"])
  end

  def test_board_renders

    expected = "  1 2 3 4 \n" +
              "A . . . . \n" +
              "B . . . . \n" +
              "C . . . . \n" +
              "D . . . . \n"

    assert_equal expected, @board.render_board
  end

  def test_board_renders_ship
    @board.place(@cruiser, ["A1", "A2", "A3"])

    expected = "  1 2 3 4 \n" +
              "A S S S . \n" +
              "B . . . . \n" +
              "C . . . . \n" +
              "D . . . . \n"

    assert_equal expected, @board.render_board(true)
  end

  def test_board_renders_ship
    @board.place(@cruiser, ["A1", "A2", "A3"])

    expected = "  1 2 3 4 \n" +
              "A S S S . \n" +
              "B . . . . \n" +
              "C . . . . \n" +
              "D . . . . \n"

    assert_equal expected, @board.render_board(true)
  end

  def test_board_renders_ship_and_fired_upon
    @board.place(@cruiser, ["A1", "A2", "A3"])
    @board.cells["A1"].fire_upon

    expected = "  1 2 3 4 \n" +
              "A H S S . \n" +
              "B . . . . \n" +
              "C . . . . \n" +
              "D . . . . \n"

    assert_equal expected, @board.render_board(true)
  end

  def test_board_renders_ship_and_fired_upon
    @board.place(@cruiser, ["A1", "A2", "A3"])
    @board.cells["A1"].fire_upon

    expected = "  1 2 3 4 \n" +
              "A H S S . \n" +
              "B . . . . \n" +
              "C . . . . \n" +
              "D . . . . \n"

    assert_equal expected, @board.render_board(true)
  end

  def test_board_changes_with_ships
    @board.place(@cruiser, ["A1", "A2", "A3"])
    expected = "  1 2 3 4 \n" +
              "A S S S . \n" +
              "B . . . . \n" +
              "C . . . . \n" +
              "D . . . . \n"
    assert_equal expected, @board.render_board(true)
  end

  def test_board_renders_missed_shots
    @board.place(@cruiser, ["A1", "A2", "A3"])
    @board.cells["B1"].fire_upon
    expected = "  1 2 3 4 \n" +
              "A S S S . \n" +
              "B M . . . \n" +
              "C . . . . \n" +
              "D . . . . \n"
    assert_equal expected, @board.render_board(true)
  end

  def test_board_renders_sunk_ship
    @board.place(@cruiser, ["A1", "A2", "A3"])
    @board.cells["A1"].fire_upon
    @board.cells["A2"].fire_upon
    @board.cells["A3"].fire_upon
    expected = "  1 2 3 4 \n" +
              "A X X X . \n" +
              "B . . . . \n" +
              "C . . . . \n" +
              "D . . . . \n"
    assert_equal expected, @board.render_board(true)
  end

  def test_board_renders_hit
    @board.place(@cruiser, ["A1", "A2", "A3"])
    @board.cells["A1"].fire_upon
    @board.cells["A2"].fire_upon
    expected = "  1 2 3 4 \n" +
              "A H H S . \n" +
              "B . . . . \n" +
              "C . . . . \n" +
              "D . . . . \n"
    assert_equal expected, @board.render_board(true)
  end

end
