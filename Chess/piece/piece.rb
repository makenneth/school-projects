require_relative 'module/sliding'
require_relative 'module/stepping'
require_relative 'empty_piece'

class Piece
   attr_reader :pos, :color
  def initialize(board, pos, color)
    @board = board
    @pos = pos
    @color = color
    @opposite = @color == :black ? :white : :black
  end

  def move_into_check?(end_pos)
    new_board = @board.dup
    new_board.move!(@pos, end_pos)
    new_board.in_check?(@color)
  end

  def pos=(coord)
     @pos = coord
  end

  def valid_moves
     moves.reject { |move| move_into_check?(move) }
  end

end

class King < Piece
  include Stepping
  def initialize(board, pos, color)
    @move_dirs = Stepping::KING
    super
  end

  def to_s
    @color == :white ? "\u{2654} " : "\u{265A} "
  end
end
class Knight < Piece
  include Stepping
  def initialize(board, pos, color)
    @move_dirs = Stepping::KNIGHT
    super
  end

  def to_s
    @color == :white ? "\u{2658} " : "\u{265E} "
  end

end
class Pawn < Piece
   def initialize(board, pos, color)
      @move_dirs = [[1, 0], [-1, 0]]
      super
   end

   def moves
      moves = []
      row, col = @pos
      moves << (@color == :white ? [row - 1, col] : [row + 1, col])

      if (@color == :white && row == 6) || (@color == :black && row == 1)
         moves << (@color == :white ? [row - 2, col] : [row + 2, col])
      end
      moves
   end

   def to_s
      @color == :white ? "\u{2659} " : "\u{265F} "
   end
end

class Bishop < Piece
  include Sliding

  def initialize(board, pos, color)
    @move_dirs = Sliding::DIAGONAL
    super
  end

  def to_s
    @color == :white ? "\u{2657} " : "\u{265D} "
  end
end

class Queen < Piece
  include Sliding

  def initialize(board, pos, color)
    @move_dirs = Sliding::LINEAR + Sliding::DIAGONAL
    super
  end

  def to_s
    @color == :white ? "\u{2655} " : "\u{265B} "
  end

end

class Bishop < Piece
  include Sliding

  def initialize(board, pos, color)
    @move_dirs = Sliding::DIAGONAL
    super
  end

  def to_s
    @color == :white ? "\u{2657} " : "\u{265D} "
  end
end

class Rook < Piece
  include Sliding

  def initialize(board, pos, color)
    @move_dirs = Sliding::LINEAR
    super
  end

  def to_s
    @color == :white ? "\u{2656} " : "\u{265C} "
  end

end
