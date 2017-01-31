require_relative 'piece.rb'
# delete later
require_relative 'display.rb'

class Board
  attr_reader :grid

  def initialize
    @grid = populate
  end

  def populate
    blank = Array.new(8) { Array.new(8) { |el| el = Piece.new(self) } }
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

# board = Board.new
# display = Display.new(board)
# display.render

# board.move_piece([0,1],[5,4])
# board.move_piece([0,0],[3,4])
# rook = Piece.new(board)
# pos = [3,4]
#
# p pos
# p board[[0,4]]
# p board[[1,4]]
# p board[[5,4]]
# p rook.generate_horizontal_moves(pos)
