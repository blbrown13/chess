require_relative 'piece.rb'

class NullPiece < Piece
  def initialize(board, pos = nil, color = nil)
    super(board, pos, color)
    @sym =  "▢"
  end

end
