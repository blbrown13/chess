module SlidingPiece

  def moves(pos, mov_dirs)
    moves = []
    mov_dirs.each { |dir| moves.concat(get_moves(pos, dir)) }
    moves
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
    #d0 = left_down; d1 = left_up, d2 = right_up, d3 = right_down
    when 0
      [pos[0] + 1, pos[1] - 1]
    when 1
      [pos[0] - 1, pos[1] - 1]
    when 2
      [pos[0] - 1, pos[1] + 1]
    when 3
      [pos[0] + 1, pos[1] + 1]
    end
  end

  def get_moves(pos, dir)
    case dir
    when :h || :v
      generate_xy_moves(pos, dir)
    when :d
      generate_diag_moves(pos, dir)
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

  def generate_diag_moves(pos)
    moves = []
    4.times do |d|
      new_pos = pos
      until out_of_bounds?(new_pos)
        new_pos = diag_move(new_pos, d)
        @board[new_pos].nil? ? moves << new_pos : break
      end
    end
    moves
  end

  def out_of_bounds?(pos)
    pos[0] < 1 || pos[0] > 6 || pos[1] < 1 || pos[1] > 6
  end

end
