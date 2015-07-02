require_relative 'diagonal_movable'
require_relative 'straight_movable'
require_relative '../chess'
class Chess
  class Queen < Chessman
    include DiagonalMovable, StraightMovable

    def initialize(color,type="queen")
      super
    end

    def moves(y,x)
      diagonal_moves(y,x) + horizontal_moves(y,x) + vertical_moves(y,x)
    end
  end
end
