require "/cell"

class Ship

  attr_reader :name, :length, :health, :guess, :cell_choice, :location

  def initialize(name, length)
    @name = name
    @length = length
    #@guess = gets.chomp
    @location = location
    @hits = 0
    @health = length
  end

  def hit
      @health -= 1
  end

  def sunk?
    @health == 0
  end

end
