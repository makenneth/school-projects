require_relative './piece'
class Bishop < Piece
  include Sliding
  attr_reader :color

  def initialize(board, pos, color)
    @move_dirs = Sliding::DIAGONAL
    super
  end

  def to_s
    @color == :white ? "\u{2657} " : "\u{265D} "
  end
end
