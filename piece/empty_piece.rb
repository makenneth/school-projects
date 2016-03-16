class EmptyPiece
   attr_reader :pos
  def initialize(_, pos, _)
     @pos = pos
  end

  def pos=(pos)
  end

  def update_pos(_)
  end
  def to_s
    "  "
  end

  def moves
    []
  end

end
