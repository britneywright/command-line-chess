require_relative '../chess'
class Chess
  class Rook < Chessman
    attr_reader :color

    def initialize(color,type="rook")
      super
    end
    
    def moves(y,x)
      horizontal_moves(x) + vertical_moves(y)
    end

    def horizontal_moves(y)
      possibilities = []
      counter = 0
      until counter >= 8
        possibilities << [y,counter]
        counter += 1
      end
      possibilities
    end

    def vertical_moves(x)
      possibilities = []
      counter = 0
      until counter >= 8
        possibilities << [counter,x]
        counter += 1
      end
      possibilities
    end
  end
end
