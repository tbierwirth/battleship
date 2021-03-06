require './lib/board'
require 'pry'

class Turn

  def initialize(computer, player)
    #boards
    @computer = computer
    @player = player
  end

  def render_boards
    system 'clear'
    print "=============COMPUTER BOARD=============\n"
    print @computer.render_board
    print "==============PLAYER BOARD==============\n"
    print @player.render_board(true)
  end

  def display_results
    if @shoot_player_cell.empty?
      puts "The computer missed you."
    elsif @shoot_player_cell.empty? == false && @shoot_player_cell.ship.sunk? == false
      puts "The computer hit you on #{@shoot_player_cell.coordinate}!"
    else
      puts "The computer sunk your #{@shoot_player_cell.ship.name}."
    end

    if @shoot_computer_cell.empty?
      puts "You missed the computer."
    elsif @shoot_computer_cell.empty? == false && @shoot_computer_cell.ship.sunk? == false
      puts "You hit the computer on #{@shoot_computer_cell.coordinate}!"
    else
      puts "You sunk the computer's #{@shoot_computer_cell.ship.name}."
    end
  end

  def computer_take_shot
    @shoot_player_cell = @player.cells.values.sample
    until @shoot_player_cell.fired_upon? == false
      @shoot_player_cell = @player.cells.values.sample
    end
    @shoot_player_cell.fire_upon
  end

  def player_pick_shot
    @shoot_computer_cell = gets.chomp.upcase
    until @computer.cells.keys.include?(@shoot_computer_cell)
      puts "Please pick a valid coordinate."
      @shoot_computer_cell = gets.chomp.upcase
    end
    @shoot_computer_cell = @computer.cells[@shoot_computer_cell]
  end

  def player_take_shot
    puts "Please choose a coordinate to fire on."
    player_pick_shot
    until @shoot_computer_cell.fired_upon? == false
      puts "Please pick a coordinate a new coordinate."
      player_pick_shot
    end
    @shoot_computer_cell.fire_upon
  end
end
