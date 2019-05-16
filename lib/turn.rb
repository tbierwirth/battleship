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

end
