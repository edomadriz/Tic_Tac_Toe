require_relative 'Board.rb'

class Display
  attr_reader :board
  def initialize(board)
    @board = board
  end

  def welcome_message
    p "Welcome to Tic_Tac_Toe"
    p "Enjoy playing"
  end

  def show_options_main_menu
    p "Please select an option"
    p "1 New Game"
    p "2 Quit"
    gets.to_i
  end

  def show_options_ingame_menu
    p "Please select an option"
    p "1 Next move"
    p "2 Restart game"
    p "3 Quit"
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
    board.matrix.each {|vector| p vector}
  end

  def invalid_number
    p "Invalid number, try again"
  end

  def end_game
    p "Thank you for playing"
    p "See you later"
  end

end
