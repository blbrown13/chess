require_relative 'piece.rb'

class Pawn < Piece

  def initialize(board, pos, color)
    super(board, pos, color)
  end

  def to_s
    @color == :b ? "♟" : "♙"
  end

end
