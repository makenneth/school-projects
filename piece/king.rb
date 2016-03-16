class King < Piece
  include Stepping
  attr_reader :color
  def initialize(board, pos, color)
    @move_dirs = Stepping::KING
    super
  end

  def to_s
    @color == :white ? "\u{2654} " : "\u{265A} "
  end

end
