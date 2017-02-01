require 'colorize'
require_relative 'cursor.rb'
# TODO only requiring board to run during test
#      remove before completion
require_relative 'board.rb'
require_relative 'pieces.rb'


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
      row.each_with_index do |piece, col_idx|
        if (row_idx.odd? && col_idx.even?) || (row_idx.even? && col_idx.odd?)
          if @cursor.cursor_pos == [row_idx, col_idx]
            print " #{piece} ".on_light_green.blink
          else
            print " #{piece} ".on_light_black
          end
        else
          if @cursor.cursor_pos == [row_idx, col_idx]
            print " #{piece} ".on_light_green.blink
          else
            print " #{piece} ".on_white
          end
        end
      end
      puts ""
    end
  end
end


if __FILE__ == $PROGRAM_NAME
  board = Board.new
  display = Display.new(board)
  display.cursor_test
end
