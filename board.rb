require_relative 'pieces'
require_relative 'display'
class InvalidError < ArgumentError
end

class Board
  def self.default_grid
    Array.new(8) {Array.new(8)}
  end

  attr_reader :grid

  def initialize(grid = self.class.default_grid)
    @grid = grid
  end

  def place_pieces
    @grid.length.times do |i|
      @grid.length.times do |j|
         color = color_for_row(i)
         @grid[i][j] =
            case i
            when 1, 6
               Pawn.new(self, [i, j], color)
            when 2, 3, 4, 5
               EmptyPiece.new(self, [i, j], color)
            else
               case j
               when 0, 7
                  Rook.new(self, [i, j], color)
               when 1, 6
                  Knight.new(self, [i, j], color)
               when 2, 5
                  Bishop.new(self, [i, j], color)
               when 3
                  King.new(self, [i, j], color)
               when 4
                  Queen.new(self, [i, j], color)
               end
            end
         end
      end
  end

  def color_for_row(row)
     case row
     when 0, 1
        :black
     when 6, 7
        :white
     end
  end

  def move(start, end_pos, color) #
    raise InvalidError, "Invalid. Not your pieces." unless self[start].color == color
    raise InvalidError, "Invalid. Position is empty" if self[start].is_a? EmptyPiece

    valid_moves = self[start].moves #ok we also need to update the pos of piece on board

    raise InvalidError, "Invalid." unless valid_moves.include?(end_pos) #also see checkmate
    self[start].update_pos(end_pos)
    self[end_pos].update_pos(start)
    self[start], self[end_pos] = self[end_pos], self[start]
  end

  # def is_valid?(pos)
  #   pos.all? { |point| point.between?(0, 7) } &&
  #   !self[pos].is_a?(EmptyPiece) #I don't think we need this...
  # end

  def dup
    new_grid = []
    @grid.each_index do |i|
      row = []
      @grid[i].each_index do |j|
        row.push(@grid[i][j].dup)
      end
      new_grid.push(row)
    end

    Board.new(new_grid)
  end

  def checkmate(color)
     find_king(color)
     false
   #   kingly_moves(color).each do |moves|
   #     new_array = self.dup
   #     test_board = Board.new(new_array)
   #     test_board.move(moves)
   #   end
  end



  # def checkmate
  #   a = []
  #   kingly_moves.each do |position|
  #     @grid.each_with_index do |v,x|
  #       @grid.each_with_index do |v,y|
  #         a << [x,y] if @grid[x][y].color == different &&  @grid[x][y].moves.include? position
  #       end
  #     end
  #  end
  #     a.uniq.length == kingly_moves.length
  # end

  def kingly_moves(color)
    king_pos = find_king(color)
    self[king_pos].moves
  end


  def [](pos)
    x,y = pos
    @grid[x][y]
  end

  def []=(pos,value)
    x,y = pos
    @grid[x][y] = value
  end


  def in_check?(color)
    king_pos = find_king(color)
    @grid.each_with_index do |v,x|
      @grid.each_with_index do |v,y|
        return true if @grid[x][y].moves.include? king_pos
      end
    end
    false
  end

  def find_king(color)
    @grid.each_with_index do |v,i|
      @grid.each_with_index do |v2,j|
        return [i, j] if self[[i, j]].is_a?(King) && self[[i, j]].color == color
      end
    end
  end

  def in_bounds?(pos)
     pos.all? { |point| point.between?(0, 7)}
  end
end
