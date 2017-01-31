require 'colorize'
require_relative 'cursor.rb'
# TODO only requiring board to run during test
#      remove before completion
require_relative 'board.rb'
require_relative 'rook.rb'


class Display
  attr_reader :board

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def cursor_test
    while true
      render
      @cursor.get_input
    end
  end

  def render
    system('clear')
    board.grid.each_with_index do |row, row_idx|
      row.each_with_index do |col, col_idx|
        if @cursor.cursor_pos == [row_idx, col_idx]
          print (col.is_a?(Piece) ? " ♙ " : " ▢ ").red.on_black.blink
        else
          print (col.is_a?(Piece) ? " ♙ " : " ▢ ").white.on_black
        end
      end
      puts ""
    end
    ''
  end
end


if __FILE__ == $PROGRAM_NAME
  board = Board.new
  display = Display.new(board)
  # board.move_piece([0,1],[5,4])
  display.render
  rook = Rook.new(board, :r, [0,0], :b)
  # p "h_moves: #{rook.generate_xy_moves([3,3], :h)}"
  # p "v_moves: #{rook.generate_xy_moves([3,3], :v)}"
  # p "d_moves: #{rook.generate_diag_moves([3,3])}"
  # display.cursor_test
end
