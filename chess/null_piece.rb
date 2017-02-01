require_relative 'piece.rb'

class NullPiece < Piece
  def initialize(board, pos = nil, color = nil)
    super(board, pos, color)
  end

  def to_s
    ' '
  end

end
