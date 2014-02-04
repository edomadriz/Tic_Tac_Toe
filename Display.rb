require_relative 'Board.rb'
require_relative 'Game.rb'

class Display

  def start_game_message(board)
    system 'clear'
    p "Welcome to Tic_Tac_Toe"
    p "Enjoy playing         "
    p "----------------------"
    print_board(board)
  end

  def show_options_main_menu
    p "Please select an option"
    p "1 New Game             "
    p "2 Quit                 "
    gets.to_i
  end

  def show_options_ingame_menu
    p "Please select an option"
    p "1 Next move            "
    p "2 Restart game         "
    p "3 Quit                 "
    gets.to_i
  end

  def get_play_row
    p "Type the row number starting from 0"
    gets.to_i
  end

  def get_play_column
    p "Type the column number starting from 0"
    gets.to_i
  end

  def print_board(matrix)
   p "            Column      "
   p "      |  0  |  1  |  2  "
   p "    --|-----|-----|-----"
   p "    0 |  #{matrix[0][0]}  |  #{matrix[0][1]}  |  #{matrix[0][2]}  "
   p "    --|-----|-----|-----"
   p "Row 1 |  #{matrix[1][0]}  |  #{matrix[1][1]}  |  #{matrix[1][2]}  "
   p "    --|-----|-----|-----"
   p "    2 |  #{matrix[2][0]}  |  #{matrix[2][1]}  |  #{matrix[2][2]}  "
   p "    --|-----|-----|-----"
  end

  def invalid_number
    p "Invalid number, try again"
  end

  def end_game
    system 'clear'
    p "---------------------"
    p "Thank you for playing"
    p "See you later        "
    p "---------------------"
  end

  def current_player(player)
    p "------------------------------------"
    p "Current player is #{player}"
    p "------------------------------------"
  end

  def game_tied
    p "------------------"
    p "Game Tied         "
    p "There is no winner"
    p "------------------"
  end

  def invalid_position
    p "Position is not valid"
    p "Try Again            "
  end

  def winner(player)
    p "------------------"
    p "CONGRATULATIONS!!!"
    p "Winner is Player #{player}"
    p "------------------"
  end
end
