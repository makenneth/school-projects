module Sliding
  DIAGONAL = [[-1, 1], [-1, -1], [1, 1], [1, -1]]
  LINEAR = [[1, 0], [-1, 0], [0, 1], [0, -1]]

  def moves(starting_pos)
    start_x, start_y = starting_pos
    valid_moves = []
    @move_dirs.each do |row, col|
      0.upto(7) do |i|
        break if is_valid?([start_x + (row * i), start_y + (col * i)])
        valid_moves << [start_x + (row * i), start_y + (col * i)]
      end
    end
    valid_moves
  end

  def dup
    self.class.new()
  end

end

# class Sliding < Piece
#   diagonal = [[-1,1],[-1,-1],[1,1],[1,-1]]
#   linear = [[1,0],[-1,0],[0,1],[0,-1]]
#   def moves(starting_pos, move_dirs)
#     start_x, start_y = starting_pos
#     valid_moves = []
#     move_dirs.each do |row, col|
#       0.upto(7) do |i|
#         break if is_valid?([start_x + (row * i), start_y + (col * i)])
#         valid_moves << [start_x + (row * i), start_y + (col * i)]
#       end
#     end
#     valid_moves
#   end
#
#   def moves_into_check?(pos)
#     new_board = board.dup
#
#   end
#
#
#
# end
