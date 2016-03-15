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

  def move(start, end_pos, color)
    raise InvalidError, "Invalid. Not your pieces." unless self[start].color == color
    raise InvalidError, "Invalid. Position is empty" if self[start].is_a? EmptyPiece

    valid_moves = self[start].moves

    raise InvalidError, "Invalid." unless valid_moves.include?(end_pos)
    self[start].update_pos(end_pos)
    self[end_pos].update_pos(start)
    self[start], self[end_pos] = self[end_pos], self[start]
  end

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

  def checkmate?(color)
     return false unless in_check?(color)
     pieces
      .select { |piece| piece.color == color }
      .all? { |piece| piece.valid_moves.empty? }
  end


  def king_moves(color)
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

  def pieces
     @grid.flatten.select{ |cell| cell.is_a?(Piece) }
  end

  def in_check?(color)
     pieces.any? do |piece|
        piece.color != color && piece.moves.include?(find_king(color))
     end
  end

  def find_king(color) #can actually use piece and find it and return the pos
    @grid.each_index do |i|
      @grid[i].each_index do |j|
        return [i, j] if self[[i, j]].is_a?(King) && self[[i, j]].color == color
      end
    end
  end

  def in_bounds?(pos)
     pos.all? { |point| point.between?(0, 7)}
  end
end
