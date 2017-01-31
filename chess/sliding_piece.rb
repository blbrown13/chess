module SlidingPiece

  def moves(pos)
    moves = []
  end

  def horizontal_move(pos, dx)
    # dx: 0 = left / dx: 1 = right
    dx == 0 ? [pos[0] - 1, pos[1]] : [pos[0] + 1, pos[1]]
  end

  def vertical_move(pos, dy)
    # dy: 0 = up / dy: 1 = down
    dy == 0 ? [pos[0], pos[1] + 1] : [pos[0], pos[1] - 1]
  end

  def diagonal_move(pos, dir)
    case dir
    when :left_down
      [pos[0] - 1, pos[1] - 1]
    when :left_up
      [pos[0] - 1, pos[1] + 1]
    when :right_up
      [pos[0] + 1, pos[1] + 1]
    when :right_down
      [pos[0] + 1, pos[1] - 1]
    end
  end

  def add_move(pos, dir)
    dir_moves = []
    if dir == :horiz
      generate_horizontal_moves
    end
  end


  def generate_horizontal_moves(pos)
    moves = []
    2.times do |d|
      curr_pos = pos
      until out_of_bounds?(curr_pos)
        curr_pos = horizontal_move(curr_pos, d)
        if @board[curr_pos].nil?
          moves << curr_pos
        else
          break
        end
      end
    end
    moves
  end




  def out_of_bounds?(pos)
    pos[0] < 1 || pos[0] > 6 || pos[1] < 1 || pos[1] > 6
  end

end
