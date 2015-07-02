require_relative '../chess'
class Chess
  class Bishop < Chessman
    attr_reader :color

    def initialize(color,type="bishop")
      super
    end
    
    def moves(y,x)
      diagonal_moves(y,x)
    end

    def diagonal_moves(y,x)
      right_down(y,x) + left_down(y,x) + left_up(y,x) + right_up(y,x)
    end

    def right_down(y,x)
      possibilities = []
      counter = 1 
      until (y + counter >= 8 || x + counter >= 8)
        possibilities << [y+counter,x+counter]
        counter += 1
      end
      possibilities
    end

    def left_down(y,x)
      possibilities = []
      counter = 1 
      until (y + counter >= 8 || x - counter < 0)
        possibilities << [y+counter,x-counter]
        counter += 1
      end
      possibilities
    end

    def right_up(y,x)
      possibilities = []
      counter = 1 
      until (x + counter >= 8 || y - counter < 0)
        possibilities << [y-counter,x+counter]
        counter += 1
      end
      possibilities
    end

    def left_up(y,x)
      possibilities = []
      counter = 1 
      until (y - counter < 0 || x - counter < 0)
        possibilities << [y-counter,x-counter]
        counter += 1
      end
      possibilities
    end

  end
end
