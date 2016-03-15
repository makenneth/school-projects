require_relative 'pieces'
require_relative 'display'
class Board
  def self.default_grid
    array = Array.new(8) {Array.new(8)}
    self.place_pieces(array)
  end

  def self.place_pieces(array)
    array.length.times do |i|
      array.length.times do |j|
         color = self.color_for_row(i)
         array[i][j] =
            case i
            when 1, 6
               Pawn.new(@board, [i, j], color)
            when 2, 3, 4, 5
               EmptyPiece.new([i, j])
            else
               case j
               when 0, 7
                  Rook.new(@board, [i, j], color)
               when 1, 6
                  Knight.new(@board, [i, j], color)
               when 2, 5
                  Bishop.new(@board, [i, j], color)
               when 3
                  King.new(@board, [i, j], color)
               when 4
                  Queen.new(@board, [i, j], color)
               end
            end
         end
      end
    array
  end

  def self.color_for_row(row)
     case row
     when 0, 1
        :black
     when 6, 7
        :white
     end
  end

  attr_reader :grid

  def initialize(grid = self.class.default_grid)
    @grid = grid
  end

  def move(start, end_pos)
    raise "invalid move, positon is empty" if self[start].is_a? EmptyPiece
    raise "invalid move, position is occupeid" if !self[end_pos].is_a? EmptyPiece

    self[start], self[end_pos] = self[end_pos], self[start]
  end

  def is_valid?(pos)
    pos.all? { |point| point.between?(0, 7) } &&
    !self[pos].is_a?(EmptyPiece)
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

  # def checkmate
  #    find_king(color)
  #    kingly_moves(color).each do |moves|
  #      new_array = self.dup
  #      test_board = Board.new(new_array)
  #      test_board.move(moves)
  #    end
  # end



  def checkmate
    a = []
    kingly_moves.each do |position|
      @grid.each_with_index do |v,x|
        @grid.each_with_index do |v,y|
          a << [x,y] if @grid[x][y].color == different &&  @grid[x][y].moves.include? position
        end
      end
   end
      a.uniq.length == kingly_moves.length
  end

  def kingly_moves(color)
    king_pos = find_king(color)
    self[king_pos].valid_moves
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
      @grid.each_with_index do |v2,i2|
        return [i,i2] if self[i][i2].is_a? King && self[i][j].color == color
      end
    end
  end

end






b = Board.new
d = Display.new(b)
d.show
