require_relative 'sliding_piece.rb'

class Queen < Piece
  include SlidingPiece

  def initialize(board, pos, color)
    super(board, pos, color)
    @sym = color == :b ? "♛" : "♕"
    @move_dirs = [:h, :v, :d]
  end

end
