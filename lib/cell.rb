class Cell

  attr_reader :coordinate, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = ship
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
    if empty?
    else
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
  #   elsif @ship.sunk?
  #     "X"
  #   else
  #     "."
  #   end
  # end
# Hey this render method might by in the right order. We can talk about it tomorrow.
# The tests are solid enough for a good grade for the purposes of the project. 

end
