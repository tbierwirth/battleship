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
  end

end
