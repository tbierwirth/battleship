class Cell

  attr_reader :coordinate, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @fired_upon = false
    @ship = nil
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

  def render(hidden = false)
    if fired_upon? && empty?
      "M"
    elsif empty? == false && @ship.sunk?
      "X"
    elsif fired_upon? && empty? == false
      "H"
    elsif empty? == false && hidden
      "S"
    else
      "."
    end
  end
end
