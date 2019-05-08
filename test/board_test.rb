require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

require './lib/board'

class BoardTest < MiniTest::Test

  def setup
    @board = Board.new
  end

  def test_board_exists
    assert_instance_of Board, @board
  end

end
