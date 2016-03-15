require_relative 'board'
require_relative 'humanplayer'
class Game
  def initialize(board = Board.new)
    @board = board
    @player1 = HumanPlayer.new(:white, board)
    @current_player = @player1
    @player2 = HumanPlayer.new(:black, board)
  end

  def play
    @board.place_pieces
    until over?
       play_turn
       switch_player!
    end
  end

  def play_turn
     start_pos, end_pos = @current_player.play_turn
     @board.move(start_pos, end_pos, @current_player.color)
  rescue InvalidError => e
     puts "#{e}. Try Again."
     retry
  end

  def switch_player!
    @current_player = @current_player == @player1 ? @player2 : @player1
   end

  def over?
    @board.checkmate?(@current_player.color)
  end

end

g = Game.new
g.play
