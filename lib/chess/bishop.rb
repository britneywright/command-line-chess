require_relative 'diagonal_movable'
require_relative '../chess'
class Chess
  class Bishop < Chessman
    include DiagonalMovable
    attr_reader :color

    def initialize(color,type="bishop")
      super
    end
    
    def moves(y,x)
      diagonal_moves(y,x)
    end
  end
end
