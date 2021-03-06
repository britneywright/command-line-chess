require_relative 'chess/chessman'
require_relative 'chess/pawn'
require_relative 'chess/rook'
require_relative 'chess/bishop'
require_relative 'chess/queen'
require_relative 'chess/king'
require_relative 'chess/knight'

class Chess
  class Game

    attr_reader :status
    attr_accessor :board, :players, :current_player

    def initialize
      @board = make_board
      @players = ["white","black"]
      @current_player = players.first 
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

    def make_board
      board = (0...8).map do |row|
        (0...8).map do |column|
          Chess::Chessman.new(nil,nil)
        end
      end
      board[0] = [
        Chess::Rook.new("black"),
        Chess::Knight.new("black"),
        Chess::Bishop.new("black"),
        Chess::Queen.new("black"),
        Chess::King.new("black"),
        Chess::Bishop.new("black"),
        Chess::Knight.new("black"),
        Chess::Rook.new("black")
      ]
      board[1] = 8.times.map {Chess::Pawn.new("black")}
      board[-2] = 8.times.map {Chess::Pawn.new("white")}
      board[-1] = [
        Chess::Rook.new("white"),
        Chess::Knight.new("white"),
        Chess::Bishop.new("white"),
        Chess::Queen.new("white"),
        Chess::King.new("white"),
        Chess::Bishop.new("white"),
        Chess::Knight.new("white"),
        Chess::Rook.new("white")
      ]
      board
    end

    def possible_moves(origin)
      y = convert_y(origin)
      x = convert_x(origin)
      locations = board[y][x].moves(y,x,board)
      locations.map {|coor| chess_square(coor)}
    end

    def chess_square(coord)
      (coord[1] + 'A'.ord).chr.downcase + (coord[0] - 8).abs.to_s
    end

    def move(origin,destination)
      board[convert_y(destination)][convert_x(destination)] = board[convert_y(origin)][convert_x(origin)]
      board[convert_y(origin)][convert_x(origin)] = Chess::Chessman.new(nil,nil)
      board[convert_y(destination)][convert_x(destination)].moved + 1
      board
    end

    def convert_x(chess_coord)
      chess_coord[0].to_s.ord - 'a'.ord 
    end

    def convert_y(chess_coord)
      8 - (chess_coord[1].to_i)
    end 

    def piece(location)
      board[convert_y(location)][convert_x(location)].type 
    end

    def to_s
      printed_board = board.dup.map.each_with_index do |row,i|
        (8 - i).to_s + "\s\s" + row.join("  ")
      end.join("\n") + "\n   a  b  c  d  e  f  g  h"
    end
  end
end
