require "io/console"

module Cursorable
  KEYMAP = {
    " " => :space,
    "h" => :left,
    "j" => :down,
    "k" => :up,
    "l" => :right,
    "w" => :up,
    "a" => :left,
    "s" => :down,
    "d" => :right,
    "\t" => :tab,
    "\r" => :return,
    "\n" => :newline,
    "\e" => :escape,
    "\e[A" => :up,
    "\e[B" => :down,
    "\e[C" => :right,
    "\e[D" => :left,
    "\177" => :backspace,
    "\004" => :delete,
    "\u0003" => :ctrl_c,
  }

  MOVES = {
    left: [0, -1],
    right: [0, 1],
    up: [-1, 0],
    down: [1, 0]
  }

  def get_input(color)
    key = KEYMAP[read_char]
    handle_key(key, color)
  end

  def handle_key(key, color)
    case key
    when :ctrl_c
      exit 0
    when :return, :space
      @selected_piece = @cursor_pos #somehow we have to check the color, if not right, we have to raise an error
                                    #you cannot move the piece
      @cursor_pos
    when :left, :right, :up, :down
      update_pos(MOVES[key])
      nil
    else
      puts key
    end
  end

  def read_char
    STDIN.echo = false
    STDIN.raw!

    input = STDIN.getc.chr
    if input == "\e" then
      input << STDIN.read_nonblock(3) rescue nil
      input << STDIN.read_nonblock(2) rescue nil
    end
  ensure
    STDIN.echo = true
    STDIN.cooked!

    return input
  end

  def update_pos(diff)
    new_pos = [@cursor_pos[0] + diff[0], @cursor_pos[1] + diff[1]]
    @cursor_pos = new_pos if @board.in_bounds?(new_pos)
  end

  def can_move(color)
     #this is the only thing that use should search for...
     #whether a person can move the piece.
     #since if it is invalid otherwise, we could have the board raise the error
     #and let the user retry
     #and we also need a mthod to undo
  end
end
