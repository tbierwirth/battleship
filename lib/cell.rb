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
  #
  # def render
  #   if fired_upon?
  #     "M"
  #   elsif fired_upon?
  #     "H"
  #   elsif @ship
  #     "S"
  # #  elsif @ship.sunk?
  #     "X"
  #   else
  #     "."
  #   end
  # end

end
