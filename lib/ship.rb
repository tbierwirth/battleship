<<<<<<< HEAD
require "/cell"

=======
>>>>>>> 201f5ca3ea25a1ac0472dfbc87392ae5fb449446
class Ship

  attr_reader :name, :length, :health, :guess, :cell_choice, :location

  def initialize(name, length)
    @name = name
    @length = length
    #@guess = gets.chomp
    @location = location
    @health = length
    @hit_counter = 0
  end

  def hit
    @health -= 1
    @hit_counter += 1
  end

  def sunk?
    @health == 0
  end

end
