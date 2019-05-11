require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/board'
require './lib/cell'
require './lib/ship'
@board = Board.new
@board.cells.keys.each do |key|
  p @board.cells[key].render
end
