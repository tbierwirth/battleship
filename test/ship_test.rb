require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/ship.rb'
require './lib/cell.rb'

class ShipTest < MiniTest::Test

  def test_it_exists
    ship = Ship.new("Submarine", 2)

    assert_instance_of Ship, ship
  end

  def test_it_has_attributes
    submarine = Ship.new("Submarine", 2)
    ship = ([submarine]) #change to hash it will eliminate the ship.first.whatever
    assert_equal "Submarine", ship.first.name
    assert_equal 2, ship.first.length
  end

  def test_what_name_it_has
    submarine = Ship.new("Submarine", 2)
    ship = ([submarine]) #change to hash it will eliminate the ship.first.whatever
    assert_equal "Submarine", ship.first.name
  end

  def test_what_health_it_has
    submarine = Ship.new("Submarine", 2)
    ship = ([submarine]) # change to hash it will eliminate the ship.first.whatever
    assert_equal 2, ship.first.health
  end
  #( ship.length.to_f / ship.first.hit ) this is for health percentage test
  # def test_what_length_it_has
  #
  #   ship.number_of_cells #or some kind of attribute call.
  #
  #   assert_equal 2
  # end
  #
  def test_if_it_is_sunk
    submarine = Ship.new("Submarine", 2)
    ship = ([submarine])
    assert_equal false, ship.first.sunk?
  end

  def test_health_when_hit
    submarine = Ship.new("Submarine", 2)
    ship = ([submarine])
    assert_equal 1, ship.first.hit
  end
end
  # def test_its_cell_placement
  #
  #   assert_equal ["A1", "A2"], ship.location
  # end
