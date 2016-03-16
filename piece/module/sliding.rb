module Sliding
  DIAGONAL = [[-1, 1], [-1, -1], [1, 1], [1, -1]]
  LINEAR = [[1, 0], [-1, 0], [0, 1], [0, -1]]

  def moves
    start_x, start_y = @pos
    valid_moves = []
    @move_dirs.each do |row, col|

      1.upto(7) do |i|
        new_pos = start_x + row * i, start_y + col * i
        break unless @board.valid?(new_pos)
        valid_moves << new_pos

      end
    end
    valid_moves
  end

  def dup
    self.class.new(@board, @pos, @color)
  end

end
