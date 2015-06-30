require 'chess'
class Chess
  class CLI
    attr_reader :game

    def initialize(stdin,stdout)
      @stdin, @stdout = stdin, stdout
      @game = Chess::Game.new
    end

    def call
     #player turn sequence:
      @stdout.puts current_player_turn
      @stdout.puts prompt_player_for_origin
      @stdout.puts possible_moves_from_location
      @stdout.puts prompt_player_for_destination
      piece_in_destination_location
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
      "moves for #{game.current_player} pawn #{@origin}: #{possible_moves.shift.join(', ')}"
    end

    def possible_moves
      predetermined = [
        ["f3","f4"],
        ["e5","e6"],
        ["g3","g4"],
        ["e7","f6","g5","h4"]
      ]
      predetermined
    end
  end
end
