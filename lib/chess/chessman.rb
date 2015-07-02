class Chess
  class Chessman
    attr_reader :color, :type, :avatar, :moved
    def initialize(color,type)
      @color = color
      @type = type
      @avatar = chessmen["#{color} #{type}"]
      @moved = 0
    end

    def chessmen
       {
         "black pawn" => "♟",
         "black rook" => "♜",
         "black knight" => "♞",
         "black bishop" => "♝",
         "black queen" => "♛",
         "black king" => "♚",
         "white pawn" => "♙",
         "white rook" => "♖",
         "white knight" => "♘",
         "white bishop" => "♗",
         "white queen" => "♕",
         "white king" => "♔",
         "empty space" => " "
       }
    end

    def moves
      "No moves available"
    end

    def to_s
      avatar
    end

#    def horizontal
#     board[convert_x(origin)]
#      [0,1],[0,-1]
#    end
#
#    def vertical
#      [1,0],[-1,0]
#    end
#
#    def diagonal
#      [1,1],[-1,-1],[1,-1],[-1,1]
#    end
#
#    def knight
#      [1,2],[1,-2],[2,1],[2,-1],[-1,-2],[-1,2],[-2,-1],[-2,1]
#    end
#
#    def pawn
#      [1,0],[2,0],[1,1],[1,-1]
#    end
  end
end
