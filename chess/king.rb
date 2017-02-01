require_relative 'piece.rb'
# require_relative 'stepping_piece.rb'


class King < Piece
  # include SteppingPiece

  def initialize(board, pos, color)
    super(board, pos, color)
  end

  def to_s
    @color == :b ? "♚" : "♔"
  end

end
