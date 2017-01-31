require_relative 'sliding_piece.rb'

class Piece
  include SlidingPiece

  def initialize(board, sym, pos, color)
    @board = board
    @sym = sym
    @pos = pos
    @color = color
  end

end
