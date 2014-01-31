require_relative 'Display.rb'
require_relative 'Board.rb'
class Game

  attr_accessor :board, :player
  attr_reader :display
  def initialize
    @board = Board.new
    @display = Display.new(self)
    @player = 1
  end
  def start_game
    display.welcome_message
    option = display.show_options_main_menu
    case option 
    when 1 
      system 'clear'
      display.print_board
      play
    when 2 
      display.end_game
    end
  end

  def play
    while !@board.full?
      display.current_player
      option = display.show_options_ingame_menu
      case option
      when 1
        player_make_play
      when 2
       start_game
      when 3
        display.end_game
        exit
      end
    end
    display.game_tied
    @board.clear_matrix
    @player = 1
    gets
    start_game
  end

  private 

  def switchPlayer()
   @player == 1 ? @player = 2 : @player = 1
  end

  def is_valid_entry?(number)
    number < 3 && number >= 0
  end

  def player_make_play
    row = ask_for_row
    column = ask_for_column
    if board.matrix_position_clear?(row, column)
      @board.insert_position_matrix(@player, row, column)
      system 'clear'
      display.print_board
      if @board.check_winner?(@player)
        display.winner
        @board.clear_matrix
        @player = 1
        gets
        start_game
      end
      switchPlayer
    else
      system 'clear'
      display.print_board
      display.invalid_position
    end

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
