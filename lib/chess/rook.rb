require_relative 'straight_movable'
require_relative '../chess'
class Chess
  class Rook < Chessman
    include StraightMovable
    attr_reader :color

    def initialize(color,type="rook")
      super
    end
    
    def moves(y,x)
      horizontal_moves(y,x) + vertical_moves(y,x)
    end
  end
end
