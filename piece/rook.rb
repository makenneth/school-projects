class Rook < Piece
  include Sliding

  attr_reader :color
  def initialize(board, pos, color)
    @move_dirs = Sliding::LINEAR
    super
  end

  def to_s
    @color == :white ? "\u{2656} " : "\u{265C} "
  end

end
