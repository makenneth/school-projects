require 'board'
class Game

  def initialize(board,player1,player2)
    @board = board
    @player1 = player1
    @current_player = player1
    @player2 = player2
  end

  def play
    until over?
    start_pos, end_pos = current_player.play_turn
    board.move(start_pos,end_pos)
    switch_player!
    end
  end

  def switch_player
    @current_player = @current_player == @player1 ? (@player2):(@player1)
  end

  def over?
    board.checkmate
  end





end
