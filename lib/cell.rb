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
    if empty? == false
      @ship.hit
    end
  end

  def render(player = false)
    if fired_upon? == true && empty? == true
      "M"
    elsif fired_upon? == true && empty? == false
      "H"
    elsif fired_upon? == false && empty? == false  && player == true
      "S"
    # elsif @ship.sunk? == true
    #   "X"
    else
      "."
    end
  end

end
