require_relative 'Board.rb'
require_relative 'Game.rb'

class Display

  def start_game_message
    system 'clear'
    p "Welcome to Tic_Tac_Toe"
    p "Enjoy playing         "
    p "----------------------"
  end

  def get_player_move(player, matrix)
    print_board(matrix)
    p "Player #{player}"
    p "Please type the position you want to play"
    gets.to_i
  end

  def print_board(matrix)
   p "|-----|-----|-----|     Position"
   p "|  #{matrix[0][0]}  |  #{matrix[0][1]}  |  #{matrix[0][2]}  |     |1|2|3|"
   p "|-----|-----|-----|            "
   p "|  #{matrix[1][0]}  |  #{matrix[1][1]}  |  #{matrix[1][2]}  |     |4|5|6|"
   p "|-----|-----|-----|            "
   p "|  #{matrix[2][0]}  |  #{matrix[2][1]}  |  #{matrix[2][2]}  |     |7|8|9|"
   p "|-----|-----|-----|            "
  end

  def invalid_number
    p "Invalid number, try again"
  end

  def end_game(matrix)
    system 'clear'
    print_board(matrix)
    p "---------------------"
    p "Thank you for playing"
    p "See you later        "
    p "---------------------"
  end

  def game_tied(matrix)
    system 'clear'
    print_board(matrix)
    p "------------------"
    p "Game Tied         "
    p "There is no winner"
    p "------------------"
  end

  def invalid_position
    system 'clear'
    p "Position is not valid, try again"
  end

  def winner(player, matrix)
    system 'clear'
    print_board(matrix)
    p "------------------"
    p "CONGRATULATIONS!!!"
    p "Winner is Player #{player}"
    p "------------------"
  end

  private
end
