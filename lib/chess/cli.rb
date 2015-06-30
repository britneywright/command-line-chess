require 'chess'
class Chess
  class CLI
    def initialize(stdin,stdout)
      @stdin, @stdout = stdin, stdout
      @game = Chess::Game.new
    end

    def call
     #player turn sequence:
      @stdout.puts current_player_turn
      prompt_player_for_origin
      possible_moves_from_location
      prompt_player_for_destination
      piece_in_destination_location
      0
    end
    
    def current_player_turn
      "{game.current_player}}'s turn"
    end
  end
end
