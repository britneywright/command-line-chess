class Chess
  class CLI
    def initialize(stdin,stdout)
      @stdin, @stdout = stdin, stdout
    end

    def call
     #player turn sequence:
      current_player_turn
      prompt_player_for_origin
      possible_moves_from_location
      prompt_player_for_destination
      piece_in_destination_location
      0
    end
    
  end
end
