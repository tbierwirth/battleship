require './lib/cell.rb'

class Board
  attr_reader :cells

  def initialize
    # look at .zip and [a, b, c, d] with [1..4]
    # hsh = {}
    # ["A1, A2, ... "D4].map do |coord|
    #   hsh << "A1" => Cell.new("A1")
    #   hsh << coord => Cell.new(coord)
    # ("A".."D").to_a +> [A, B, C, D]
    # end
    @cells = {
     "A1" => Cell.new("A1"),
     "A2" => Cell.new("A2"),
     "A3" => Cell.new("A3"),
     "A4" => Cell.new("A4"),
     "B1" => Cell.new("B1"),
     "B2" => Cell.new("B2"),
     "B3" => Cell.new("B3"),
     "B4" => Cell.new("B4"),
     "C1" => Cell.new("C1"),
     "C2" => Cell.new("C2"),
     "C3" => Cell.new("C3"),
     "C4" => Cell.new("C4"),
     "D1" => Cell.new("D1"),
     "D2" => Cell.new("D2"),
     "D3" => Cell.new("D3"),
     "D4" => Cell.new("D4")
    }

  end

  def valid_coordinate?(cell)
    coordinate_list = cells.keys
    coordinate_list.include?(cell)
  end

  def valid_placement?(ship, coordinates)
    coordinates.length == ship.length
  end

  def letters_same?(coordinates)
    letters = []
    coordinates.each do |coordinate|
      letters.push(coordinate[0])
    end
    letters.uniq.count == 1
  end

  def numbers_same?(coordinates)
    numbers = []
    coordinates.each do |coordinate|
      numbers.push(coordinate[1])
    end
    numbers.uniq.count == 1
  end
end
