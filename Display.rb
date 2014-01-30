require_relative 'Board.rb'

class Display
  attr_reader :board
  def initialize(board)
    @board = board
  end

  def show_options_main_menu
    p "1 New Game"
    p "2 Quit"
  end

end
