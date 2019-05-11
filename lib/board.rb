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

  def valid_placement(ship, coordinates)
    if valid_coordinate? && coordinates.length == ship.length
      p "yes"
    else
      p "try again"
      if "yes" && 
    end

  def letters_same?(coordinates)
    letters = []
    coordinates.each do |coordinate|
      letters.push(coordinate[0])
    end
    letters.uniq.count == 1
  end

  def numbers_consecutive


  end
  # def valid_array_index_placement
  #     arr = [65, 49, 65, 50, 65, 51]
  #     p arr[0]
  #     p arr[2]
  #     p arr[4]
  #     if arr[0] && arr[2] == arr[4]
  #       p 'Yay'
  #     end
  #     # def example_m
  #     #   arr = [65, 49, 65, 50, 65, 51]
  #     #   arr[1], arr[3], arr[5]
  #     # end
  # def index_comp
  #     arr = [65, 49, 65, 50, 65, 51]
  #     if (arr[5] - arr[1]) > 1
  #       p "boo"
  #     else
  #       p "yay"
  #     end
  # end
end
