require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/ship.rb'
require './lib/cell.rb'

class ShipTest < MiniTest::Test

  def setup
    @submarine = Ship.new("Submarine", 2)
    @cruiser = Ship.new("Cruiser", 3)
  end

  def test_ships_exists
    assert_instance_of Ship, @submarine
    assert_instance_of Ship, @cruiser
  end

  def test_it_has_attributes
    assert_equal "Submarine", @submarine.name
    assert_equal 2, @submarine.health
    assert_equal "Cruiser", @cruiser.name
    assert_equal 3, @cruiser.health
  end

  def test_if_it_is_sunk
    refute @submarine.sunk?
    refute @cruiser.sunk?
  end

  def test_health_when_hit
    @submarine.hit
    assert_equal 1, @submarine.health
    @cruiser.hit
    assert_equal 2, @cruiser.health
  end

  def test_it_is_sunk
    @submarine.hit
    @submarine.hit
    assert @submarine.sunk?
  end

end
