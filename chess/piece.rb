require_relative 'sliding_piece.rb'

class Piece
  include SlidingPiece

  def initialize(board)
    @board = board

  end



end
