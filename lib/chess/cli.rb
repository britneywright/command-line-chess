require 'chess'
class Chess
  class CLI
    attr_reader :game

    def initialize(stdin,stdout)
      @stdin, @stdout = stdin, stdout
      @game = Chess::Game.new
      @predetermined = possible_moves #REMOVE THIS 
    end

    def call
      until game.over?
        #player turn sequence:
        @stdout.puts game
        @stdout.puts current_player_turn
        @stdout.puts prompt_player_for_origin
        chessman_origin
        @stdout.puts possible_moves_from_location
        @stdout.puts prompt_player_for_destination
        chessman_destination
        @stdout.puts piece_in_destination_location
        game.move(@origin,@destination)
        game.rotate_players
        @stdout.puts "\n"
      end
      game.rotate_players
      @stdout.puts "Checkmate. #{game.current_player.capitalize} wins." #NEED TO FIX THIS

      @stdout.puts game
      0
    end
    
    def current_player_turn
      "#{game.current_player}'s turn."
    end

    def prompt_player_for_origin
      "#{game.current_player}, your move? "
    end

    def chessman_origin
      @origin = @stdin.gets.chomp
    end

    def chessman_destination
      @destination = @stdin.gets.chomp
    end

    def possible_moves_from_location
      # CHANGE @predetermined
      "moves for #{game.current_player} #{game.piece(@origin)} #{@origin}: #{@predetermined.shift.join(', ')}"
    end

    #NEED TO REMOVE THIS
    def possible_moves
      [
        ["f3","f4"],
        ["e5","e6"],
        ["g3","g4"],
        ["e7","f6","g5","h4"]
      ]
    end
    
    def prompt_player_for_destination
      "#{game.current_player}, move #{@origin} where? "
    end

    def piece_in_destination_location
      "Ok, #{game.current_player}'s #{game.piece(@origin)} #{@origin} to #{@destination}."
    end
  end
end
