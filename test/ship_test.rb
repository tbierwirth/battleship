require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'

class ShipTest < Minitest::Test

  def setup
    @cruiser = Ship.new("Cruiser", 3)
  end

  def test_ship_exists
    assert_instance_of Ship, @cruiser
  end

  def test_ship_attributes
    assert_equal "Cruiser", @cruiser.name
    assert_equal 3, @cruiser.length
    assert_equal 3, @cruiser.health
  end

  def test_ship_not_sunk_at_full_health
    refute @cruiser.sunk?
  end

end
