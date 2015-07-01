class Chess
  class Chessman
    attr_reader :type, :avatar
    def initialize(color,type)
      @color = color
      @type = type
      @avatar = chessmen["#{color} #{type}"]
    end

    def chessmen
       avatars = {
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
       avatars
    end

    def to_s
      avatar
    end
  end
end
