module SlidingPiece

  def moves(pos)
    moves = []
  end

  def horiz_move(pos, dx)
    # dx: 0 = left / dx: 1 = right
    dx == 0 ? [pos[0], pos[1] - 1] : [pos[0], pos[1] + 1]
  end

  def vert_move(pos, dy)
    # dy: 0 = up / dy: 1 = down
    dy == 0 ? [pos[0] + 1, pos[1]] : [pos[0] - 1, pos[1]]
  end

  def diag_move(pos, dir)
    case dir
    when :left_down
      [pos[0] + 1, pos[1] - 1]
    when :left_up
      [pos[0] - 1, pos[1] - 1]
    when :right_up
      [pos[0] - 1, pos[1] + 1]
    when :right_down
      [pos[0] + 1, pos[1] + 1]
    end
  end

  def add_move(pos, dir)
    dir_moves = []
    if dir == :h
      generate_horizontal_moves
    end
  end


  def generate_xy_moves(pos, dir)
    moves = []
    2.times do |d|
      new_pos = pos
      until out_of_bounds?(new_pos)
        new_pos = (dir == :h ? horiz_move(new_pos, d) : vert_move(new_pos, d))
        @board[new_pos].nil? ? moves << new_pos : break
      end
    end
    moves
  end






  def out_of_bounds?(pos)
    pos[0] < 1 || pos[0] > 6 || pos[1] < 1 || pos[1] > 6
  end

end
