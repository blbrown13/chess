class Piece
  def initialize(board, pos, color)
    @board = board
    @pos = pos
    @color = color
  end

  def sym
    @sym
  end

  def to_s
    "_"
  end

end
