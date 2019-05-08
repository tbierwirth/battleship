require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/ship.rb'
require './lib/cell.rb'

class CellTest < MiniTest::Test

  def setup
    @cell_1 = Cell.new("B4")
    @cell_2 = Cell.new("C3")

    @submarine = Ship.new("Submarine", 2)
    @cruiser = Ship.new("Cruiser", 3)
  end

  def test_it_exists
    assert_instance_of Cell, @cell_1
  end

  def test_it_has_attributes
    assert_equal "B4", @cell_1.coordinate
  end

  def test_does_cell_have_a_ship
    assert_nil @cell_1.ship
    assert @cell_1.empty?
  end

  def test_place_ship
    @cell_1.place_ship(@cruiser)
    assert_equal @cruiser, @cell_1.ship
    refute @cell_1.empty?
  end

  def test_cell_not_fired_upon
    @cell_1.place_ship(@cruiser)
    refute @cell_1.fired_upon?
  end

  def test_cell_is_fired_upon
    @cell_1.place_ship(@cruiser)
    @cell_1.fire_upon

    assert_equal 2, @cell_1.ship.health
    assert @cell_1.fired_upon?
  end

  # def test_if_ship_has_been_fired_upon
  #   @cell.place_ship(@ship)
  #   @cell.fire_upon
  #
  #   assert_equal true, @cell.fired_upon?
  #   assert_equal 1, @cell.ship.health
  # end
  #
  # def test_if_it_renders
  #   assert_equal ".", @cell_1.render
  # end
  #
  # def test_if_cell_renders_miss_when_fired_upon
  #   @cell_1.fire_upon
  #
  #   assert_equal "M", @cell_1.render
  # end


end
