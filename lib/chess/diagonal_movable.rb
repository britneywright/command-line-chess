module DiagonalMovable
  def diagonal_moves(y,x,board)
    right_down(y,x,board) + left_down(y,x,board) + left_up(y,x,board) + right_up(y,x,board)
  end

  def right_down(y,x,board)
    possibilities = []
    counter = 1 
    until (y + counter >= 8 || x + counter >= 8)
      if board[y+counter][x+counter].color == color 
        break
      else
        possibilities << [y+counter,x+counter]
        break if board[y+counter][x+counter].color != nil 
        counter += 1
      end
    end
    possibilities
  end

  def left_down(y,x,board)
    possibilities = []
    counter = 1 
    until (y + counter >= 8 || x - counter < 0)
      if board[y+counter][x-counter].color == color 
        break
      else
        possibilities << [y+counter,x-counter]
        break if board[y+counter][x-counter].color != nil 
        counter += 1
      end
    end
    possibilities
  end

  def right_up(y,x,board)
    possibilities = []
    counter = 1 
    until (x + counter >= 8 || y - counter < 0)
      if board[y-counter][x+counter].color == color 
        break
      else
        possibilities << [y-counter,x+counter]
        break if board[y-counter][x+counter].color != nil 
        counter += 1
      end
    end
    possibilities
  end

  def left_up(y,x,board)
    possibilities = []
    counter = 1 
    until (y - counter < 0 || x - counter < 0)
      if board[y-counter][x-counter].color == color 
        break
      else
        possibilities << [y-counter,x-counter]
        break if board[y-counter][x-counter].color != nil 
        counter += 1
      end
    end
    possibilities
  end
end
