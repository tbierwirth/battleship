require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/setup'
require './lib/turn'

class TurnTest < MiniTest::Test

  def setup
    @new_turn = Turn.new(@computer, @player)
    @computer = Board.new
    @player = Board.new
  end

  def test_instance
    assert_instance_of Turn, @new_turn
    assert_instance_of Board, @computer
    assert_instance_of Board, @player
  end

  def test_render_boards
    player = "  1 2 3 4 \n" +
              "A . . . . \n" +
              "B . . . . \n" +
              "C . . . . \n" +
              "D . . . . \n"
    computer = "  1 2 3 4 \n" +
              "A . . . . \n" +
              "B . . . . \n" +
              "C . . . . \n" +
              "D . . . . \n"

    assert_equal player, @player.render_board(true)
    assert_equal computer, @player.render_board
  end

end
