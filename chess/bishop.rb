require_relative 'sliding_piece.rb'


class Bishop < Piece
  include SlidingPiece

  def initialize(board, pos, color)
    @move_dirs = [:d]
    super(board, pos, color)
  end

  def to_s
    @color == :b ? "♝" : "♗"
  end
end
