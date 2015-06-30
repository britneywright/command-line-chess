require 'pry'
require 'chess'
class Chess
  class CLI
    attr_reader :game

    def initialize(stdin,stdout)
      @stdin, @stdout = stdin, stdout
      @game = Chess::Game.new
      @predetermined = possible_moves 
    end

    def call
      until game.over?
        #player turn sequence:
        @stdout.puts game
        @stdout.puts current_player_turn
        @stdout.puts prompt_player_for_origin
        @stdout.puts possible_moves_from_location
        @stdout.puts prompt_player_for_destination
        @stdout.puts piece_in_destination_location
        game.rotate_players
      end
      0
    end
    
    def current_player_turn
      "#{game.current_player}'s turn."
    end

    def prompt_player_for_origin
      "#{game.current_player}, your move?"
    end

    def possible_moves_from_location
      @origin = gets.chomp
      "moves for #{game.current_player} pawn #{@origin}: #{@predetermined.shift.join(', ')}"
    end

    def possible_moves
      [
        ["f3","f4"],
        ["e5","e6"],
        ["g3","g4"],
        ["e7","f6","g5","h4"]
      ]
    end
    
    def prompt_player_for_destination
      "#{game.current_player}, move #{@origin} where?"
    end

    def piece_in_destination_location
      destination = gets.chomp
      "Ok, #{game.current_player}'s pawn #{@origin} to #{destination}."
    end
  end
end
