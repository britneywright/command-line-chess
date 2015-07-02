require_relative '../chess'
class Chess
  class Knight < Chessman
    def initialize(color,type="knight")
      super
    end

    def moves(y,x)
      [
        [y+1,x+2],
        [y+1,x-2],
        [y+2,x+1],
        [y+2,x-1],
        [y-1,x-2],
        [y-1,x-2],
        [y-2,x-1],
        [x-2,y+1]
      ].delete_if {|pos| pos[0] < 0 || pos[1] < 0 || pos[0] >= 8 || pos[1] >= 8}
    end
  end
end
