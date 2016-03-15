class HumanPlayer
  def initialize(name)
    @name = name
  end

  def play_turn
    puts "plese enter your starting_pos"
    start_pos  = gets.chomp
    puts "please enter your ending_move"
    end_ps  = gets.chomp
    puts "Thanks a bunch"
    return start_pos, end_pos
  end
end
