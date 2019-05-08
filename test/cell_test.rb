require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/ship.rb'
require './lib/cell.rb'

class CellTest < MiniTest::Test

  def setup
    @cell = Cell.new("B4")
    @ship = Ship.new("Submarine", 2)
    @cell_1 = Cell.new("B4")
    @cell_2 = Cell.new("C3")
  end

  def test_it_exists
    assert_instance_of Cell, @cell
  end

  def test_it_has_attributes
    assert_equal "B4", @cell.coordinate
  end

  def test_does_cell_have_a_ship
    assert_nil @cell.ship
  end

  def test_place_ship
    @cell.place_ship(@ship)
    assert_equal @ship, @cell.ship
  end

  def test_is_cell_empty
    @cell.place_ship(@ship)
    assert_equal false, @cell.empty?
  end

  def test_is_cell_fired_upon
    @cell.place_ship(@ship)

    assert_equal false, @cell.fired_upon?
  end

  def test_fire_upon
    @cell.place_ship(@ship)
    @cell.fire_upon
    assert_equal 1, @ship.health
  end

  def test_if_ship_has_been_fired_upon
    @cell.place_ship(@ship)
    @cell.fire_upon

    assert_equal true, @cell.fired_upon?
    assert_equal 1, @cell.ship.health
  end

  def test_if_it_renders
    assert_equal ".", @cell_1.render
  end

  def test_if_cell_renders_miss_when_fired_upon
    @cell_1.fire_upon
    @cell_2.place_ship(@ship)

    assert_equal "M", @cell_1.render
    assert_equal ".", @cell_2.render
  end
end
