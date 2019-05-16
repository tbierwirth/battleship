require './lib/board'
require 'pry'

class Turn

  def initialize(computer, player)
    #boards
    @computer = computer
    @player = player
  end

  def render_boards
    print "=============COMPUTER BOARD=============\n"
    print @computer.render_board
    print "==============PLAYER BOARD==============\n"
    print @player.render_board(true)
  end

  def display_results
    if @shoot_player_cell.ship.sunk?
      puts "The computer sunk your #{@shoot_player_cell.ship}."
    elsif @shoot_player_cell.empty?
      puts "The computer missed you."
    else
      puts "The computer hit you on #{@shoot_player_cell.coordinate}!"
    end

    if @shoot_computer_cell.ship.sunk?
      puts "You sunk the computer's #{@shoot_computer_cell.ship}!"
    elsif @shoot_computer_cell.empty?
      puts "You missed!"
    else
      puts "You hit the computer on #{@shoot_computer_cell.coordinate}."
    end
  end

  def computer_take_shot
    @shoot_player_cell = @player.cells.values.sample
    until @shoot_player_cell.fired_upon? == false
      @shoot_player_cell = @player.cells.values.sample
    end
    @shoot_player_cell.fire_upon
  end

  def player_take_shot
    puts "Please choose a coordinate to fire on"
    @shoot_computer_cell = gets.chomp
    @shoot_computer_cell = @computer.cells[@shoot_computer_cell]
    until @shoot_computer_cell.fired_upon? == false
      print "Please pick a coordinate you haven't fired on"
      @shoot_computer_cell = gets.chomp
    end
    @shoot_computer_cell.fire_upon
  end

end
