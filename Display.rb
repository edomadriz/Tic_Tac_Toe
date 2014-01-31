require_relative 'Board.rb'
require_relative 'Game.rb'

class Display
  attr_reader :board, :game
  def initialize(game)
    @board = game.board
    @game = game

  end

  def welcome_message
    system 'clear'
    p "----------------------"
    p "Welcome to Tic_Tac_Toe"
    p "Enjoy playing         "
    p "----------------------"
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

  def print_board
   p "            Column      "
   p "      |  0  |  1  |  2  "
   p "    --|-----|-----|-----"
   p "    0 |  #{change_value(board.matrix[0][0])}  |  #{change_value(board.matrix[0][1])}  |  #{change_value(board.matrix[0][2])}  "
   p "    --|-----|-----|-----"
   p "Row 1 |  #{change_value(board.matrix[1][0])}  |  #{change_value(board.matrix[1][1])}  |  #{change_value(board.matrix[1][2])}  "
   p "    --|-----|-----|-----"
   p "    2 |  #{change_value(board.matrix[2][0])}  |  #{change_value(board.matrix[2][1])}  |  #{change_value(board.matrix[2][2])}  "
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

  def current_player
    p "------------------------------------"
    p "Current player is #{@game.player} represented as #{change_value(@game.player)}"
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

  def winner
    p "------------------"
    p "CONGRATULATIONS!!!"
    p "Winner is Player #{@game.player}"
    p "------------------"
  end

  private

  def change_value(value)
    case value
    when 0 
      return " "
    when 1
      return "X"
    when 2
      return "O"
    end
  end
end
