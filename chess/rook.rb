require_relative 'piece.rb'
require_relative 'sliding_piece.rb'

class Rook < Piece
  include SlidingPiece

  def initialize(board, pos, color)
    @move_dirs = [:h, :v]
    super(board, pos, color)
  end

  def to_s
    @color == :b ? "♜" : "♖"
  end

end
