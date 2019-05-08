class Ship
  attr_reader :name, :length, :health

  def initialize(name, length)
    @name = name
    @length = length
    @health = 3
    @hit_counter = 0
  end

  def sunk?
    @health == 0
  end

  def hit
    @health -= 1
    @hit_counter += 1
  end

end
