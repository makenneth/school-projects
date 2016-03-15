require_relative "cursorable.rb"
require 'colorize'

class Display

  def initialize(board)
    @board = board
    @cursor_pos = [0, 0]
  end

  def show
    @board.grid.each_with_index do |row, i|
      row_depiction = []
      row.each_with_index do |cell, j|
        if (i + j).odd?
          row_depiction << cell.to_s.colorize({background: :black})
        else
          row_depiction << cell.to_s.colorize({background: :white})
        end
      end
      puts row_depiction.join("")
    end
  end


end
