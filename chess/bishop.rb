require_relative 'sliding_piece.rb'

class Bishop < Piece
  include SlidingPiece

  def initialize(sym, pos, color)
    super(sym, pos, color)
    @move_dirs = [:d]
  end

end
