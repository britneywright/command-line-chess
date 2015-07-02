require_relative 'straight_movable'
require_relative '../chess'
class Chess
  class Bishop < Chessman
    include StraightMovable
    def initialize(color,type="bishop")
      @directions = [[1,1],[-1,1],[-1,-1],[1,-1]]
      super
    end
    
    def moves(y,x,board)
      straight_moves(y,x,board,@directions)
    end
  end
end
