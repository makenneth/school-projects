require_relative 'sliding'
require_relative 'stepping'
require_relative 'empty_piece'

class Piece

  def initialize(board, pos, color)
    @board = board
    @pos = pos
    @color = color
    @opposite = @color == :black ? :white : :black
  end

  def move_into_check?(end_pos)
    new_board = @board.dup
    new_board.move!(end_pos)
    new_board.in_check?(@color)
  end

  def update_pos(coord)
     @pos = coord
  end

  def valid_moves
     moves.reject { |move| moves_into_check?(move) }
  end

end

class Pawn < Piece
   attr_reader :color
   def initialize(board, pos, color)
      @move_dirs = [[1, 0], [-1, 0]]
      super
   end

   def moves
      moves = []
      row, col = @pos
      moves << (@color == :white ? [row - 1, col] : [row + 1, col])

      if row == 6 && row == 1
         moves << (@color == :white ? [row - 2, col] : [row + 2, col])
      end
   end

   def to_s
      @color == :white ? "\u{2659} " : "\u{265F} "
   end
end

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
