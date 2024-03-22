require "pry"
require "pry-byebug"

# defining classes for players and boards

class GameBoard
  attr_accessor :game_board
                :player_move

  def initialize ()

                  @game_board = [
                    "a1", "a2", "a3",
                    "b1", "b2", "b3",
                    "c1", "c2", "c3"
                  ]
                  @player_move
  end

  def set_board (player_move)
    if player_move.length < 2
      puts "Not enough input! Please provide 'grid_position, chosen symbol (x or o)' in the command line. i.e. 'a2, x'"
    elsif player_move.length > 2
      puts "Too many input! Please provide 'grid_position, chosen symbol (x or o)' in the command line. i.e. 'a2, x'"
    elsif player_move.lenght == 2
      
    end
  end

end


class GamePlayer
  attr_accessor :player_choice
  attr_reader :player_name

  def initialize (player_name)
    @player_name = player_name
    @player_choice = player_choice
  end
end


