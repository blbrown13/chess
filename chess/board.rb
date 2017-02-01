require_relative 'pieces.rb'
# require_relative 'pieces.rb'

class Board
  attr_reader :grid

  def initialize
    @grid = populate
  end

  def populate
    blank = Array.new(8)
    blank.map.with_index do |row, idx|
      if idx == 0
        row = place_pieces(idx, :b)
      elsif idx == 1
        row = place_pawns(idx, :b)
      elsif idx.between?(2, 5)
        row = Array.new(8) { |el| el = NullPiece.new(self) }
      elsif idx == 6
        row = place_pawns(idx, :w)
      elsif idx == 7
        row = place_pieces(idx, :w)
      end
    end
  end

  def place_pawns(row, color)
    pawns = []
    (0..7).each {|idx| pawns << Pawn.new(self, [row, idx], color)}
    pawns
  end

  def place_pieces(row, color)
    pieces = []
    (0..7).each do |col|
      case col
      when 0, 7
        pieces << Rook.new(self, [row, col], color)
      when 1, 6
        pieces << Knight.new(self, [row, col], color)
      when 2, 5
        pieces << Bishop.new(self, [row, col], color)
      when 3
        pieces << (color == :b ?
          King.new(self, [row, col], color) :
          Queen.new(self, [row, col], color))
      when 4
        pieces << (color == :w ?
          King.new(self, [row, col], color) :
          Queen.new(self, [row, col], color))
      end
    end
    pieces
  end



  def move_piece(start_pos, end_pos)
    #TODO revise end_pos logic to support taking opposing pieces
    #TODO revise end_pos to check if piece can get to end_pos
    raise ArgumentError if self[start_pos].nil?
    raise StandardError unless self[end_pos].nil?
    self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
  end

  def in_bounds?(pos)
    pos.all? {|cord| cord.between?(0, 7)}
  end

  def [](pos)
    row, col = pos
    grid[row][col]
  end

  def []=(pos, piece)
    row, col = pos
    grid[row][col] = piece
  end
end

# board = Board.new
# p board.grid
