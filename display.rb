require_relative "module/cursorable"
require 'colorize'

class Display
   include Cursorable

  def initialize(board)
    @board = board
    @cursor_pos = [0, 0]
    @selected_piece = [] #have to check if they are valid
    @color = :white
  end

  def show
     system('clear')
    @board.grid.each_with_index do |row, i|
      row_depiction = []
      row.each_with_index do |cell, j|
        if @cursor_pos == [i, j]
           row_depiction << cell.to_s.colorize({background: :light_black})
        elsif (i + j).odd?
          row_depiction << cell.to_s.colorize({background: :black})
        else
          row_depiction << cell.to_s.colorize({background: :light_white})
        end
      end
      puts row_depiction.join("")
    end
  end

end
