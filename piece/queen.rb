class Queen < Piece
  include Sliding

  attr_reader :color
  def initialize(board, pos, color)
    @move_dirs = Sliding::LINEAR + Sliding::DIAGONAL
    super
  end

  def to_s
    @color == :white ? "\u{2655} " : "\u{265B} "
  end

end
