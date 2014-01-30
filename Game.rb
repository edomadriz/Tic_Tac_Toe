require_relative 'Board.rb'
require_relative 'Display.rb'
class Game
  attr_accessor :board, :player
  attr_reader :display
  def initialize
    @board = Board.new
    @display = Display.new(@board)
    @player = 1
  end

  def switchPlayer()
   if @player == 1
     @player = 2
   else
     @player = 1
   end
  end

  def start_game
    display.welcome_message
    option = display.show_options_main_menu
    if option == 1
      play
    else
      display.end_game
    end
  end

  def play

  end

  def is_valid_entry?(number)
    number < 3 && number >= 0
  end

  def ask_for_row
    while true do
      number = display.get_play_row
      if is_valid_entry?(number)
        return number
      else
        display.invalid_number
      end
    end
  end


  def ask_for_col
    while true do
      number = display.get_play_column
      if isValidEntry?(number)
        return number
      else
        display.invalid_number
      end
    end
  end

  def newGame?
    entry = display.show_options_main_menu
    entry == 1
  end


end
