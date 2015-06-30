class Chess
  class Game

    attr_reader :board, :status
    attr_accessor :players, :current_player

    def initialize
      @players = ["white","black"]
      @current_player = players.first 
      @board = board
      @status = predefined
    end

    def predefined
      [false,false,false,false,true]
    end

    def rotate_players
      @current_player = players.rotate!.first
    end

    def over?
      status.shift
    end

    def board
      board = (0...8).map do |row|
        (0...8).map do |column|
          " "
        end
      end
      board[0] = ["♜","♞","♝","♛","♚","♝","♞","♜"] 
      board[1] = 8.times.map {"♟"}
      board[-2] = 8.times.map {"♙"}
      board[-1] = ["♖","♘","♗","♕","♔","♗","♘","♖"]
      board
    end

    def to_s
      printed_board = board.map.each_with_index do |row,i|
        (8 - i).to_s + "\s\s" + row.join("  ")
      end.join("\n") + "\n   a  b  c  d  e  f  g  h"
    end
  end
end
