require_relative 'Board.rb'
require_relative 'Display.rb'
class Game
  attr_accessor :board, :player
  attr_reader :display
  def initialize
    @board = Board.new
    @display = Display.new(self)
    @player = 1
  end

  def switchPlayer()
   @player == 1 ? @player = 2 : @player = 1
  end

  def start_game
    display.welcome_message
    option = display.show_options_main_menu
    option == 1 ? play : display.end_game
  end

  def play
    while !@board.full?
      display.current_player
      option = display.show_options_ingame_menu
      case option
      when 1
        player_make_play
      end

    end
  end

  private 

  def is_valid_entry?(number)
    number < 3 && number >= 0
  end

  def player_make_play
    row = ask_for_row
    column = ask_for_column
    @board.insert_position_matrix(@player, row, column)
    switchPlayer
    display.print_board
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


  def ask_for_column
    while true do
      number = display.get_play_column
      if is_valid_entry?(number)
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
