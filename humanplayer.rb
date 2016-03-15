require_relative 'display'
class HumanPlayer
   attr_reader :color

  def initialize(color, board)
    @display = Display.new(board)
    @color = color
  end

  # def play_turn
  #   puts "plese enter your starting_pos"
  #   start_pos  = gets.chomp
  #   puts "please enter your ending_move"
  #   end_pos  = gets.chomp
  #   puts "Thanks a bunch"
  #   return start_pos, end_pos
  # end

  def play_turn
     start_pos, end_pos = nil, nil

     until start_pos
        @display.show
        start_pos = @display.get_input(@color)
     end

     until end_pos
       @display.show
       end_pos = @display.get_input(@color)
     end

     return start_pos, end_pos
  end
end
