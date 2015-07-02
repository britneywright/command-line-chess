require_relative 'straight_movable'
require_relative '../chess'
class Chess
  class King < Chessman
    include StraightMovable

    def initialize(color,type="king")
      @directions = [[0,1],[1,0],[0,-1],[-1,0],[1,1],[-1,1],[-1,-1],[1,-1]]
      super
    end

    def moves(y,x,board)
      straight_moves(y,x,board,@directions,1)
    end
  end
end
