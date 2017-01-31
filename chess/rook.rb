require_relative 'piece.rb'
require_relative 'sliding_piece.rb'

class Rook < Piece
  include SlidingPiece

  def initialize(board, pos, color)
    super(board, pos, color)
    @sym = color == :b ? "♜" : "♖"
    @move_dirs = [:h, :v]
  end

end
