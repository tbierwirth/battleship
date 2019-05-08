class Cell

  attr_reader :coordinate, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @fired_upon = false
  end

  def empty?
    @ship == nil
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    @fired_upon = true
    unless empty?
      @ship.hit
    end
  end

  def render
    if fire_upon? == true && empty? == true
      "M"
    elsif fire_upon? == false && empty? == true
      "H"
    elsif @ship
      "S"
    elsif @ship.sunk?
      "X"
    else
      "."
    end
  end
end
