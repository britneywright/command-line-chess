require_relative 'chess/chessman'
require_relative 'chess/pawn'
require_relative 'chess/rook'

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
          Chess::Chessman.new("empty","space")
        end
      end
      board[0] = [
        Chess::Rook.new("black"),
        Chess::Chessman.new("black","knight"),
        Chess::Chessman.new("black","bishop"),
        Chess::Chessman.new("black","queen"),
        Chess::Chessman.new("black","king"),
        Chess::Chessman.new("black","bishop"),
        Chess::Chessman.new("black","knight"),
        Chess::Rook.new("black")
      ]
      board[1] = 8.times.map {Chess::Pawn.new("black")}
      board[-2] = 8.times.map {Chess::Pawn.new("white")}
      board[-1] = [
        Chess::Rook.new("white"),
        Chess::Chessman.new("white","knight"),
        Chess::Chessman.new("white","bishop"),
        Chess::Chessman.new("white","queen"),
        Chess::Chessman.new("white","king"),
        Chess::Chessman.new("white","bishop"),
        Chess::Chessman.new("white","knight"),
        Chess::Rook.new("white")
      ]
      board
    end

    def possible_moves(origin)
      y = convert_y(origin)
      x = convert_x(origin)
      locations = board[y][x].moves(y,x)
      locations.map {|coor| chess_square(coor)}
    end

    def chess_square(coord)
      (coord[1] + 'A'.ord).chr.downcase + (coord[0] - 8).abs.to_s
    end

    def move(origin,destination)
      board[convert_y(destination)][convert_x(destination)] = board[convert_y(origin)][convert_x(origin)]
      board[convert_y(origin)][convert_x(origin)] = " "
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
