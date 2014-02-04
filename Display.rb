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
   p "|-----|-----|-----|     Position"
   p "|  #{fill_nil(matrix[0][0])}  |  #{fill_nil(matrix[0][1])}  |  #{fill_nil(matrix[0][2])}  |     |1|2|3|"
   p "|-----|-----|-----|            "
   p "|  #{fill_nil(matrix[1][0])}  |  #{fill_nil(matrix[1][1])}  |  #{fill_nil(matrix[1][2])}  |     |4|5|6|"
   p "|-----|-----|-----|            "
   p "|  #{fill_nil(matrix[2][0])}  |  #{fill_nil(matrix[2][1])}  |  #{fill_nil(matrix[2][2])}  |     |7|8|9|"
   p "|-----|-----|-----|            "
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


  def fill_nil(element)
    element.nil? ? " " : element
  end
end
