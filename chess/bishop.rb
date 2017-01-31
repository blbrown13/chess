require_relative 'sliding_piece.rb'

class Bishop < Piece
  include SlidingPiece

  def initialize(board, pos, color)
    super(board, pos, color)
    @sym = color == :b ? "♝" : "♗"
    @move_dirs = [:d]
  end

end
