require_relative 'tree_node'
require 'byebug'

class KnightPathFinder

  MOVES = [
    [2, 1], [-2, -1], [-2, 1], [2, -1], [1, 2], [-1, -2], [1, -2], [-1, 2]
  ]

  def self.valid_moves(pos)
    MOVES.map do |x, y|
      pos = [pos[0] + x, pos[1] + y ]
      pos
    end.select{ |pos| pos[0].between?(0,8) && pos[1].between?(0,8) }
  end

  def initialize(starting_pos)
    @starting_pos = starting_pos
    @visited_positions = [starting_pos]
    @move_tree = build_move_tree(starting_pos)
  end

  def new_move_positions(pos)
    new_moves = self.class.valid_moves(pos) - @visited_positions
    @visited_positions.concat(new_moves)
    new_moves
  end

  def build_move_tree(starting_pos)
    root = PolyTreeNode.new(starting_pos)
    queue = [root]

    until queue.empty?
      node = queue.shift
      new_move_positions(node.value).each do |position|
        child = PolyTreeNode.new(position)
        node.add_child(child)
        queue << child
      end
    end
    root
  end

  def find_path(end_pos)
    node = @move_tree.bfs(end_pos)
    trace_path_back(node)
  end

  def trace_path_back(node)
    path = []
    until node.parent == nil
      path.unshift(node.value)
      node = node.parent
    end
    path.unshift(node.value)
  end

end
