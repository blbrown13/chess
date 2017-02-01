require_relative 'sliding_piece.rb'


class Queen < Piece
  include SlidingPiece

  def initialize(board, pos, color)
    @move_dirs = [:h, :v, :d]
    super(board, pos, color)
  end

  def to_s
    @color == :b ? "♛" : "♕"
  end

end
