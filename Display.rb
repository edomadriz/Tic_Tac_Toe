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
    return gets.to_i
  end

end
