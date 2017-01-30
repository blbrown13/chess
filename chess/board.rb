class Board
  attr_reader :grid

  def initialize
    @grid = populate

  end

  def populate
    blank = Array.new(8) { Array.new(8) { |el| el = Piece.new } }
    blank[2..5].map do |row|
      row.map {|el| el = nil}
    end
  end

  def move_piece(start_pos, end_pos)
    raise ArgumentError if grid[start_pos].nil?
    raise StandardError if grid[end_pos].nil?
    start_pos, end_pos = end_pos, start_pos
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
