require './lib/board'

class Turn

  def initialize(computer, player)
    #boards
    @computer = computer
    @player = player
  end

  def render_boards
    print @computer.render_board
    print @player.render_board(true)
  end

  def computer_take_shot
    random_cell = @player.cells.values.sample
    until random_cell.fired_upon? == false
      random_cell = @player.cells.values.sample
    end
    random_cell.fire_upon
    if random_cell.empty?
      puts "The computer missed you."
    else
      puts "The computer hit you!"
    end
  end


end
