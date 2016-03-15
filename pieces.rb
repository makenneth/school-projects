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

  def moves_into_check?(start, end_pos)
    new_board = @board.dup

    new_board.move(pos)
    new_board.in_check?(@opposite)
  end

end

class Pawn < Piece
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

  def moves
    super(@move_dirs)
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

  def moves
    super(@move_dirs)
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

  def moves
    super(@move_dirs)
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

  def moves
    super(@move_dirs)
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

  def moves
    super(@move_dirs)
  end
end
