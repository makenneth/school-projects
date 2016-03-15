module Stepping
  KNIGHT = [[1, 2], [-1, -2], [-1, 2], [1, -2], [2, 1], [-2, -1], [-2, 1], [2, -1]]
  KING = [[0, 1], [1, 0], [0, -1], [-1, 0], [1, 1], [-1, -1], [-1, 1], [1, -1]]

  def moves
    valid_moves = []
    start_x, start_y = @pos
    @move_dirs.each do |row, col|
      new_x, new_y = start_x + row, start_y + col
        valid_moves << [new_x, new_y] if @board.in_bounds?([new_x, new_y]) && @board[[new_x,new_y]].is_a?(EmptyPiece)
    end
    valid_moves
  end
  
  def dup
    self.class.new(@board, @pos, @color)
  end

end
