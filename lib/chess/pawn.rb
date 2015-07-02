require_relative '../chess'
class Chess
  class Pawn < Chessman
    def initialize(color,type="pawn")
      super
    end

    def initial_moves(y,x)
      if color == "white"
        [[y-1,x],[y-2,x]]
      elsif color == "black"
        [[y+2,x],[y+1,x]]
      end
    end

    def moves(y,x,board)
      if @moved == 0
        initial_moves(y,x)
      else
        if color == "white"
          [[y-1,x]]
        elsif color == "black"
          [[y+1,x]]
        end
      end
    end

    def attack(y,x)
      if color == "white"
        [[y-1,x-1],[y-1,x+1]]
       elsif color == "black"
        [[y+1,x-1],[y+1,x+1]]
      end
    end
  end
end
