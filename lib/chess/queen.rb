require_relative 'straight_movable'
require_relative '../chess'
class Chess
  class Queen < Chessman
    include StraightMovable
    attr_reader :directions

    def initialize(color,type="queen")
      @directions = [[0,1],[1,0],[0,-1],[-1,0],[1,1],[-1,1],[-1,-1],[1,-1]]
      super
    end

    def moves(y,x,board)
      straight_moves(y,x,board,@directions)
    end
  end
end
