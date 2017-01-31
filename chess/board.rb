class Board
  attr_reader :grid

  def initialize
    @grid = populate

  end

  def populate
    blank = Array.new(8) { Array.new(8) { |el| el = Piece.new } }
    blank[2..5].map!{ |row| row.map! {|el| el = nil} }
    blank
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
