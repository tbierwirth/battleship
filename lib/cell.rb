class Cell

  attr_reader :coordinate, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @fired_upon = false
    @ship = nil
  end

  def empty?
    @ship.nil?
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

  def render(player = false)
    if fired_upon? && empty?
      "M"
    elsif fired_upon? && empty? == false && ship.sunk? == false
      "H"
    elsif fired_upon? == false && empty? == false && player
      "S"
    elsif fired_upon? && empty? == false && @ship.sunk?
      "X"
    else
      "."
    end
  end
end
