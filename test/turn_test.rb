require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/board'
require './lib/cell'
require './lib/ship'
require '.lib/helping'
class TurnTest < MiniTest::Test

  def setup
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  def test_it_exists
    turn = Turn.new(guess, cell)
    assert_instance_of Turn, turn
  end

  def test_correct_response
      @board.render_board
      @board.place(@cruiser, ["A1", "A2", "A3"])
      player.guess
      @board.render_board
      player.guess
      @board.render_board
  end

end
