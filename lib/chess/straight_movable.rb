module StraightMovable
  def straight_moves(y,x,board,directions,limit = nil)
    possibilities = []
    directions.each do |go|
      location = [y,x]
      until location.any? {|a| a >= 7 || a < 1}
        location = [location,go].transpose.map {|x| x.reduce(:+)}
        break if board[location[0]][location[1]].color == color 
        possibilities.push location
        break if !board[location[0]][location[1]].color.nil? 
        break if limit == 1
      end
    end
    possibilities
  end
end
