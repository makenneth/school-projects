# class Stepping < Piece
#   knight = [[1,2],[-1,-2],[-1,2],[1,-2],[2,1],[-2,-1],[-2,1],[2,-1]]
#   king = [[0,1],[1,0],[0,-1],[-1,0],[1,1],[-1,-1],[-1,1],[1,-1]]
#   def moves(starting_pos, move_dirs)
#     valid_moves = []
#     start_x, start_y = starting_pos
#     move_dirs.each do |row, col|
#         valid_moves << [start_x + row, start_y + col ] if is_valid?([start_x + row,start_y + col])
#     end
#     valid_moves
#   end
#
# end

module Stepping
  KNIGHT = [[1, 2], [-1, -2], [-1, 2], [1, -2], [2, 1], [-2, -1], [-2, 1], [2, -1]]
  KING = [[0, 1], [1, 0], [0, -1], [-1, 0], [1, 1], [-1, -1], [-1, 1], [1, -1]]

  def moves(starting_pos)
    valid_moves = []
    start_x, start_y = starting_pos
    @move_dirs.each do |row, col|
        valid_moves << [start_x + row, start_y + col] if is_valid?([start_x + row, start_y + col]) #if !moves_into_check(starting_pos, color)
    end

    valid_moves
  end
  def dup
    self.class.new()

  end

end
