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
         " " => " "
       }
    end

    def moves
      "No moves available"
    end

    def to_s
      avatar
    end
  end
end
