require "pry"
require "pry-byebug"

class NewGame
  attr_accessor :game_board
  def initialize ()

                  @game_board = [
                    "a1", "b1", "c1",
                    "a2", "b2", "c2",
                    "a3", "b3", "c3"
                  ]
  end

  def print_board ()
      puts "The game board is now:"
      loop_counter = 0
      game_board.each do |position|
        if (loop_counter == 2) || (loop_counter == 5) || (loop_counter == 8)
           puts " #{position} "
        else
          print " #{position} "
        end
        loop_counter += 1
      end
  end


  def eval_game (player)
    if ((game_board[0]==player.choice && game_board[1]==player.choice && game_board[2]==player.choice)) ||
       ((game_board[3]==player.choice && game_board[4]==player.choice && game_board[5]==player.choice)) ||
       ((game_board[6]==player.choice && game_board[7]==player.choice && game_board[8]==player.choice)) ||
       ((game_board[0]==player.choice && game_board[3]==player.choice && game_board[6]==player.choice)) ||
       ((game_board[1]==player.choice && game_board[4]==player.choice && game_board[7]==player.choice)) ||
       ((game_board[2]==player.choice && game_board[5]==player.choice && game_board[8]==player.choice)) ||
       ((game_board[0]==player.choice && game_board[4]==player.choice && game_board[8]==player.choice)) ||
       ((game_board[2]==player.choice && game_board[4]==player.choice && game_board[6]==player.choice)) 

        puts "#{player.name} wins this round!"
        player.score += 1
        inner_loop_counter = 1
    else
      inner_loop_counter = 0
    end
    return inner_loop_counter
  end


  def game_rounds (player_one, player_two)
    for round in 0..8
      inner_loop_counter = 0
      if round.even?
        print_board()
        puts " "
        loop_counter = 0
        until loop_counter == 1 do
          puts "#{player_one.name} please choose a position in the board to put 'X'"
          choice_position = gets
          choice_position.downcase!
          choice_position.gsub!(/\s+/, '')
          if self.game_board.include?(choice_position)
            loop_counter = 1
            choice_index = game_board.find_index(choice_position)
            game_board[choice_index] = player_one.choice
            inner_loop_counter = eval_game(player_one)
          else
            puts "Invalid input! Please select a position in the gameboard shown below"
          end
        end
      end
      if inner_loop_counter == 1
        break
      end
    end
  end
end


class GamePlayer < NewGame
  attr_accessor :score, :choice_position
  attr_reader :name, :choice 
  def initialize (name, score, choice)
    @name = name
    @score = score
    @choice = choice
    @choice_position = choice_positionosition = choice_position
  end
end


#Start of game

puts " "
puts "Let's play Tic Tac Toe!"
puts " "
print "Please enter player one's name: "

player_one_name = gets
puts " " 
player_one = GamePlayer.new("#{player_one_name}",0, "X")

puts "Player one is #{player_one.name} and gets to use 'X'!"
puts " "

print "Please enter player two's name: "

player_two_name = gets
puts " " 
player_two = GamePlayer.new("#{player_two_name}",0, "O")

puts "Player two is #{player_two.name} and gets to use 'O'!"
puts " "

print "How many game rounds (maximum of 10): "
game_rounds = gets
game_rounds = game_rounds.to_i

loop_counter = 0

until loop_counter == 1 do
if (game_rounds.is_a? Integer)!=true
  print "Invalid input! Please input a number from 1-10: "
  game_rounds = gets
  game_rounds = game_rounds.to_i
  puts " "
elsif game_rounds <= 0
  print "Invalid input! Please input a number from 1-10: "
  game_rounds = gets
  game_rounds = game_rounds.to_i
  puts " "
elsif game_rounds > 10
  print "Too many rounds! Please input a number from 1-10: "
  game_rounds = gets
  game_rounds = game_rounds.to_i
  puts " "
else
  loop_counter = 1
end
end

test = NewGame.new
test.game_rounds(player_one, player_two)
