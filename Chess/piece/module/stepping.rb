module Stepping
  KNIGHT = [[1, 2], [-1, -2], [-1, 2], [1, -2], [2, 1], [-2, -1], [-2, 1], [2, -1]]
  KING = [[0, 1], [1, 0], [0, -1], [-1, 0], [1, 1], [-1, -1], [-1, 1], [1, -1]]

  def moves
    valid_moves = []
    start_x, start_y = @pos
    @move_dirs.each do |row, col|
      new_pos = start_x + row, start_y + col
        valid_moves << new_pos if @board.valid?(new_pos)
    end
    valid_moves
  end

  def dup
    self.class.new(@board, @pos, @color)
  end

end
