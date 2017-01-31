require_relative 'piece.rb'

class Pawn < Piece

  def initialize(board, pos, color)
    super(board, pos, color)
    @sym = color == :b ? "♟" : "♙"
  end

end
