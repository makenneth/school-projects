class Knight < Piece
  include Stepping
  attr_reader :color
  def initialize(board, pos, color)
    @move_dirs = Stepping::KNIGHT
    super
  end

  def to_s
    @color == :white ? "\u{2658} " : "\u{265E} "
  end

end
