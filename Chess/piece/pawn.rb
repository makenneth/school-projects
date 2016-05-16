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
