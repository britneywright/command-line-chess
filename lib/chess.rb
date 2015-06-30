class Chess
  class Game
    def initialize
      @current_player = current_player
    end

    def current_player
      ["white","black"].first
    end
  end
end
