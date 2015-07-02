require 'chess'
class Chess
  class CLI
    attr_reader :game

    def initialize(stdin,stdout)
      @stdin, @stdout = stdin, stdout
      @game = Chess::Game.new
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
      if !possible_moves_from_location.include?(@destination)
        puts "That's nota legal move, try again."
        @destination = @stdin.gets.chomp
      end
    end

    def possible_moves_from_location
      "moves for #{game.current_player} #{game.piece(@origin)} #{@origin}: #{game.possible_moves(@origin).join(', ')}"
    end

    def prompt_player_for_destination
      "#{game.current_player}, move #{@origin} where? "
    end

    def piece_in_destination_location
      "Ok, #{game.current_player}'s #{game.piece(@origin)} #{@origin} to #{@destination}."
    end
  end
end
