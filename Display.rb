require_relative 'Board.rb'

class Display
  attr_reader :board
  def initialize(board)
    @board = board
  end

  def show_options_main_menu
    p "WELCOME"
    p "Please select an option"
    p "1 New Game"
    p "2 Quit"
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




end
