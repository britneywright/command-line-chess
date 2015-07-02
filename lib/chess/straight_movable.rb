module StraightMovable
  def horizontal_moves(y,x)
    possibilities = []
    counter = 0 
    until counter >= 8
      possibilities << [y,counter]
      counter += 1
    end
    possibilities.delete([y,x])
    possibilities
  end

  def vertical_moves(y,x)
    possibilities = []
    counter = 0 
    until counter >= 8
      possibilities << [counter,x]
      counter += 1
    end
    possibilities.delete([y,x])
    possibilities
  end
end
