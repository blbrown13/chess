module SlidingPiece
  def moves(pos)
    moves = []
  end

  def horizontal_dirs(pos)
    hor_moves = []
    (0..7).each do |x|
      hor_moves << [x,pos[1]] unless x == pos[0]
    end
  end

  def vertical_dirs(pos)
    vert_moves = []
    (0..7).each do |y|
      vert_moves << [pos[0],y] unless y == pos[1]
    end
  end




end
