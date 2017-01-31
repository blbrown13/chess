require_relative 'piece.rb'

class NullPiece < Piece
  def initialize(board, pos)
    super(board)
    @sym =  "▢"
    @color = nil

  end

end
